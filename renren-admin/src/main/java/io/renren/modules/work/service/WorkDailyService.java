package io.renren.modules.work.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.work.entity.WorkDailyEntity;
import java.util.Map;

/**
 * 
 *
 * @author xujh
 * @email jhang_mail@163.com
 * @date 2018-05-29 11:15:36
 */
public interface WorkDailyService extends IService<WorkDailyEntity> {

    PageUtils queryPage(Map<String, Object> params);
    /**
	 * 保存用户
	 */
	int save(WorkDailyEntity workDaily);
}

