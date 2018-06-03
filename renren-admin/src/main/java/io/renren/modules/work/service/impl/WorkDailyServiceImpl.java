package io.renren.modules.work.service.impl;

import java.util.Date;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import io.renren.common.annotation.DataFilter;
import io.renren.common.utils.Constant;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.sys.entity.SysDeptEntity;
import io.renren.modules.sys.entity.SysRoleDeptEntity;
import io.renren.modules.sys.entity.SysUserEntity;
import io.renren.modules.sys.service.SysDeptService;
import io.renren.modules.sys.service.SysUserService;
import io.renren.modules.sys.shiro.ShiroUtils;
import io.renren.modules.work.dao.WorkDailyDao;
import io.renren.modules.work.entity.WorkDailyEntity;
import io.renren.modules.work.service.WorkDailyService;


@Service("workDailyService")
public class WorkDailyServiceImpl extends ServiceImpl<WorkDailyDao, WorkDailyEntity> implements WorkDailyService {

	@Autowired
	private WorkDailyDao workDailyDao;
	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysDeptService deptService;
    @Override
    @DataFilter(subDept = true, user = true )
    public PageUtils queryPage(Map<String, Object> params) {
    	
    	String username = (String)params.get("username");

		Page<WorkDailyEntity> page = this.selectPage(new Query<WorkDailyEntity>(params).getPage(),
				 new EntityWrapper<WorkDailyEntity>().like(StringUtils.isNotBlank(username),"username", username)
				.addFilterIfNeed(params.get(Constant.SQL_FILTER) != null, (String)params.get(Constant.SQL_FILTER))
		);
    	
    	
//        Page<WorkDailyEntity> page = this.selectPage(new Query<WorkDailyEntity>(params).getPage(),new EntityWrapper<WorkDailyEntity>());
        
        for(WorkDailyEntity workDailyEntity : page.getRecords()){
			SysUserEntity user = sysUserService.selectById(workDailyEntity.getUserId());
			if(user != null){
				workDailyEntity.setCreateName(user.getUsername());
				SysDeptEntity deptEntity = deptService.selectById(user.getDeptId());
				if(deptEntity!=null){
					workDailyEntity.setDeptName(deptEntity.getName());
				}
			}
		}
        
        return new PageUtils(page);
    }

	/* (non Javadoc) 
	 * @Title: save
	 * @Description: TODO
	 * @param workDaily
	 * @return 
	 * @see io.renren.modules.work.service.WorkDailyService#save(io.renren.modules.work.entity.WorkDailyEntity) 
	 */
	@Override
	public int save(WorkDailyEntity workDaily) {
		Long userId = ShiroUtils.getUserId();
		workDaily.setCreateTime(new Date());
		
		workDaily.setUserId(userId.intValue());
		
		int save = workDailyDao.save(workDaily);
		
		return save;
	}

}
