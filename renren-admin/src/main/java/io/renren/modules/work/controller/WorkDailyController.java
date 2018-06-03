package io.renren.modules.work.controller;

import java.util.Arrays;
import java.util.Map;

import io.renren.common.validator.ValidatorUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.work.entity.WorkDailyEntity;
import io.renren.modules.work.service.WorkDailyService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 
 *
 * @author xujh
 * @email jhang_mail@163.com
 * @date 2018-05-29 11:15:36
 */
@RestController
@RequestMapping("work/workdaily")
@Api(tags="日报接口")
public class WorkDailyController {
    @Autowired
    private WorkDailyService workDailyService;

    /**
     * 列表
     */
    @RequestMapping(value = "list", method = RequestMethod.GET)
    @RequiresPermissions("work:workdaily:list")
    @ApiOperation("日报列表")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = workDailyService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 查找信息
     */
    @RequestMapping(value = "/info/{id}", method = RequestMethod.GET)
    @RequiresPermissions("work:workdaily:info")
    @ApiOperation("根据id查找日报信息")
    public R info(@PathVariable("id") Integer id){
        WorkDailyEntity workDaily = workDailyService.selectById(id);

        return R.ok().put("workDaily", workDaily);
    }

    /**
     * 保存
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @RequiresPermissions("work:workdaily:save")
    @ApiOperation("日报保存")
    public R save(@RequestBody WorkDailyEntity workDaily){
//        workDailyService.insert(workDaily);
    	
    	int save = workDailyService.save(workDaily);
    	if(save>0){
    		return R.ok();
    	}
    	return R.error();
    }

    /**
     * 修改
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @RequiresPermissions("work:workdaily:update")
    @ApiOperation("日报修改")
    public R update(@RequestBody WorkDailyEntity workDaily){
        ValidatorUtils.validateEntity(workDaily);
        workDailyService.updateAllColumnById(workDaily);//全部更新
        
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    @RequiresPermissions("work:workdaily:delete")
    @ApiOperation("日报删除")
    public R delete(@RequestBody Integer[] ids){
    	
        workDailyService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
