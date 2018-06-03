$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'work/workdaily/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'id', width: 50, key: true },
			{ label: '姓名', name: 'name', index: 'name', width: 80 }, 			
			{ label: '工作日期', name: 'workDate', index: 'work_date', width: 80 },
			{ label: '所属部门', name: 'deptName', sortable: false, width: 75 },
			/*{ label: '部门id', name: 'deptId', index: 'dept_id', width: 80 }, 			
			{ label: '计划任务', name: 'planTask', index: 'plan_task', width: 80 }, 			
			{ label: '实际任务', name: 'actualTask', index: 'actual_task', width: 80 }, 			
			{ label: '工作总结', name: 'workSummary', index: 'work_summary', width: 80 }, 			
			{ label: '问题', name: 'problem', index: 'problem', width: 80 }, 			
			{ label: '明天计划', name: 'tomorrowPlan', index: 'tomorrow_plan', width: 80 }, 			
			{ label: '工作建议', name: 'advise', index: 'advise', width: 80 }, 			
			{ label: '创建人id', name: 'userId', index: 'user_id', width: 80 },*/ 			
			{ label: '创建时间', name: 'createTime', index: 'create_time', width: 80 }, 			
			{ label: '创建者名字', name: 'createName', index: 'create_name', width: 80 }			
        ],
		viewrecords: true,
        height: 385,
        rowNum: 10,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader : {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames : {
            page:"page", 
            rows:"limit", 
            order: "order"
        },
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        }
    });
    //执行一个laydate实例
    laydate.render({
  	  elem: '#workDate',
  	  istime: true,
  	  choose: function(dates){ // 选择日期完毕的回调
  	  _this.start_time=dates;
  	  }
    });
    
    
});

var setting = {
	    data: {
	        simpleData: {
	            enable: true,
	            idKey: "deptId",
	            pIdKey: "parentId",
	            rootPId: -1
	        },
	        key: {
	            url:"nourl"
	        }
	    }
	};

var ztree;


var vm = new Vue({
	el:'#rrapp',
	data:{
		q:{
            username: null
        },
		showList: true,
		title: null,
		workDaily: {deptName:null, deptId:null}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.workDaily = {deptName:null, deptId:null};
			vm.getDept();
		},
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getDept();
            vm.getInfo(id);
		},
		getDept: function(){
			//加载部门树
			$.get(baseURL + "sys/dept/list", function(r){
				ztree = $.fn.zTree.init($("#deptTree"), setting, r);
				var node = ztree.getNodeByParam("deptId", vm.workDaily.deptId);
				if(node != null){
					ztree.selectNode(node);
					//修改时，不能回显.下边的解决了.
					//vm.workDaily.deptName = node.name;
					Vue.set(vm.workDaily, 'deptName', node.name)
				}
			})
		},
		saveOrUpdate: function (event) {
			var url = vm.workDaily.id == null ? "work/workdaily/save" : "work/workdaily/update";
			vm.workDaily.workDate= $("#workDate").val();
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.workDaily),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(index){
							vm.reload();
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "work/workdaily/delete",
                    contentType: "application/json",
				    data: JSON.stringify(ids),
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(index){
								$("#jqGrid").trigger("reloadGrid");
							});
						}else{
							alert(r.msg);
						}
					}
				});
			});
		},
		getInfo: function(id){
			$.get(baseURL + "work/workdaily/info/"+id, function(r){
                vm.workDaily = r.workDaily;
            });
		},
		deptTree: function(){
            layer.open({
                type: 1,
                offset: '50px',
                skin: 'layui-layer-molv',
                title: "选择部门",
                area: ['300px', '450px'],
                shade: 0,
                shadeClose: false,
                content: jQuery("#deptLayer"),
                btn: ['确定', '取消'],
                btn1: function (index) {
                    var node = ztree.getSelectedNodes();
                    //选择上级部门
                    vm.workDaily.deptId = node[0].deptId;
                    vm.workDaily.deptName = node[0].name;
                    
                    layer.close(index);
                }
            });
        },
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
				postData:{'username': vm.q.username},
                page:page
            }).trigger("reloadGrid");
		}
	}
});