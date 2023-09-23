package com.kh.bluewave.user.domain;

import java.sql.Date;

public class User {
	private String userId;
	private String userPw;
	private String userNickName;
	private String userName;
	private String userPhone;
	private String userAddr;
	private String userEmail;
	private String userProfileName;
	private String userProfileRename;
	private String userProfilePath;
	private long userProfileLength;
	private String userAd;
	private Date userDate;

	public User() {
		super();
	}
	
	public User(String userName, String userEmail) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserProfileName() {
		return userProfileName;
	}
	public void setUserProfileName(String userProfileName) {
		this.userProfileName = userProfileName;
	}
	public String getUserProfileRename() {
		return userProfileRename;
	}
	public void setUserProfileRename(String userProfileRename) {
		this.userProfileRename = userProfileRename;
	}
	public String getUserProfilePath() {
		return userProfilePath;
	}
	public void setUserProfilePath(String userProfilePath) {
		this.userProfilePath = userProfilePath;
	}
	public long getUserProfileLength() {
		return userProfileLength;
	}
	public void setUserProfileLength(long userProfileLength) {
		this.userProfileLength = userProfileLength;
	}
	public String getUserAd() {
		return userAd;
	}
	public void setUserAd(String userAd) {
		this.userAd = userAd;
	}
	public Date getUserDate() {
		return userDate;
	}
	public void setUserDate(Date userDate) {
		this.userDate = userDate;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userPw=" + userPw + ", userNickName=" + userNickName + ", userName="
				+ userName + ", userPhone=" + userPhone + ", userAddr=" + userAddr + ", userEmail=" + userEmail
				+ ", userProfileName=" + userProfileName + ", userProfileRename=" + userProfileRename
				+ ", userProfilePath=" + userProfilePath + ", userProfileLength=" + userProfileLength + ", userAd="
				+ userAd + ", userDate=" + userDate + "]";
	}
}