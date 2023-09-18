package com.kh.bluewave.user.domain;

import java.sql.Date;

public class Sub {
	private String subTarget;
	private String subUser;
	private Date subDate;
	
	public String getSubTarget() {
		return subTarget;
	}
	public void setSubTarget(String subTarget) {
		this.subTarget = subTarget;
	}
	public String getSubUser() {
		return subUser;
	}
	public void setSubUser(String subUser) {
		this.subUser = subUser;
	}
	public Date getSubDate() {
		return subDate;
	}
	public void setSubDate(Date subDate) {
		this.subDate = subDate;
	}
	
	@Override
	public String toString() {
		return "구독 [구독대상자=" + subTarget + ", 구독자=" + subUser + ", 구독날짜=" + subDate + "]";
	}
}
