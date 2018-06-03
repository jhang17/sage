package io.renren.modules.work.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * 
 * @author xujh
 * @email jhang_mail@163.com
 * @date 2018-05-29 16:40:22
 */
@TableName("work_daily")
public class WorkDailyEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Integer id;
	/**
	 * 姓名
	 */
	private String name;
	/**
	 * 工作日期
	 */
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date workDate;
	/**
	 * 部门id
	 */
	private Long deptId;
	/**
	 * 部门名称
	 */
	@TableField(exist=false)
	private String deptName;
	/**
	 * 计划任务
	 */
	private String planTask;
	/**
	 * 实际任务
	 */
	private String actualTask;
	/**
	 * 工作总结
	 */
	private String workSummary;
	/**
	 * 问题
	 */
	private String problem;
	/**
	 * 明天计划
	 */
	private String tomorrowPlan;
	/**
	 * 工作建议
	 */
	private String advise;
	/**
	 * 创建人id
	 */
	private Integer userId;
	/**
	 * 创建时间
	 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	/**
	 * 创建者名字
	 */
	private String createName;

	/**
	 * 设置：
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * 获取：
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * 设置：姓名
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：姓名
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：工作日期
	 */
	public void setWorkDate(Date workDate) {
		this.workDate = workDate;
	}
	/**
	 * 获取：工作日期
	 */
	public Date getWorkDate() {
		return workDate;
	}
	/**
	 * 设置：部门id
	 */
	public void setDeptId(Long deptId) {
		this.deptId = deptId;
	}
	/**
	 * 获取：部门id
	 */
	public Long getDeptId() {
		return deptId;
	}
	
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	/**
	 * 设置：计划任务
	 */
	public void setPlanTask(String planTask) {
		this.planTask = planTask;
	}
	/**
	 * 获取：计划任务
	 */
	public String getPlanTask() {
		return planTask;
	}
	/**
	 * 设置：实际任务
	 */
	public void setActualTask(String actualTask) {
		this.actualTask = actualTask;
	}
	/**
	 * 获取：实际任务
	 */
	public String getActualTask() {
		return actualTask;
	}
	/**
	 * 设置：工作总结
	 */
	public void setWorkSummary(String workSummary) {
		this.workSummary = workSummary;
	}
	/**
	 * 获取：工作总结
	 */
	public String getWorkSummary() {
		return workSummary;
	}
	/**
	 * 设置：问题
	 */
	public void setProblem(String problem) {
		this.problem = problem;
	}
	/**
	 * 获取：问题
	 */
	public String getProblem() {
		return problem;
	}
	/**
	 * 设置：明天计划
	 */
	public void setTomorrowPlan(String tomorrowPlan) {
		this.tomorrowPlan = tomorrowPlan;
	}
	/**
	 * 获取：明天计划
	 */
	public String getTomorrowPlan() {
		return tomorrowPlan;
	}
	/**
	 * 设置：工作建议
	 */
	public void setAdvise(String advise) {
		this.advise = advise;
	}
	/**
	 * 获取：工作建议
	 */
	public String getAdvise() {
		return advise;
	}
	/**
	 * 设置：创建人id
	 */
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	/**
	 * 获取：创建人id
	 */
	public Integer getUserId() {
		return userId;
	}
	/**
	 * 设置：创建时间
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	/**
	 * 获取：创建时间
	 */
	public Date getCreateTime() {
		return createTime;
	}
	/**
	 * 设置：创建者名字
	 */
	public void setCreateName(String createName) {
		this.createName = createName;
	}
	/**
	 * 获取：创建者名字
	 */
	public String getCreateName() {
		return createName;
	}
}
