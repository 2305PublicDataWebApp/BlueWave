package com.kh.bluewave.point.domain;

import java.sql.Timestamp;

public class Point {
	private String userId;
	private int userTotalPoint;
	private int pointHistory;
	private String tradeType;
	private Timestamp pointHistoryDate;
	private int productNo;
	private int cBoardNo;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getUserTotalPoint() {
		return userTotalPoint;
	}
	public void setUserTotalPoint(int userTotalPoint) {
		this.userTotalPoint = userTotalPoint;
	}
	public int getPointHistory() {
		return pointHistory;
	}
	public void setPointHistory(int pointHistory) {
		this.pointHistory = pointHistory;
	}
	public String getTradeType() {
		return tradeType;
	}
	public void setTradeType(String tradeType) {
		this.tradeType = tradeType;
	}
	public Timestamp getPointHistoryDate() {
		return pointHistoryDate;
	}
	public void setPointHistoryDate(Timestamp pointHistoryDate) {
		this.pointHistoryDate = pointHistoryDate;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getcBoardNo() {
		return cBoardNo;
	}
	public void setcBoardNo(int cBoardNo) {
		this.cBoardNo = cBoardNo;
	}
	
	@Override
	public String toString() {
		return "Point [userId=" + userId + ", userTotalPoint=" + userTotalPoint + ", pointHistory=" + pointHistory
				+ ", tradeType=" + tradeType + ", pointHistoryDate=" + pointHistoryDate + ", productNo=" + productNo
				+ ", cBoardNo=" + cBoardNo + "]";
	}
	
	
}
