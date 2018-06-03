package io.renren;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import io.renren.modules.sys.entity.SysDeptEntity;
import io.renren.modules.sys.service.SysDeptService;

@RunWith(SpringJUnit4ClassRunner.class)  
@SpringBootTest(classes=AdminApplication.class)// 指定spring-boot的启动类   
//@SpringApplicationConfiguration(classes = AdminApplication.class)// 1.4.0 前版本 
public class TestApp {
	
    @Autowired
    private SysDeptService sysDeptService;
    
    @Test
    public void test(){
    	SysDeptEntity dept=new SysDeptEntity();
    	int totle=2000;
//    	Long deptId = null;
//		dept.setDeptId(deptId);
    	int parentId=8;
    	dept.setParentId((long) parentId);
    	dept.setName("测试组名字");
    	dept.setOrderNum(0);
    	dept.setDelFlag(1);
    	for (int i = 0; i < totle; i++) {
    		sysDeptService.insert(dept);
    		System.out.println("成功插入第"+i+"条数据");
		}
    }

}
