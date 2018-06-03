package io.renren.modules.work.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import io.renren.modules.work.entity.WorkDailyEntity;

/**
 * 
 * 
 * @author xujh
 * @email jhang_mail@163.com
 * @date 2018-05-29 11:15:36
 */
public interface WorkDailyDao extends BaseMapper<WorkDailyEntity> {
	int save(WorkDailyEntity workDaily);
}
