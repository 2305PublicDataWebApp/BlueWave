package com.kh.bluewave.challenge.domain;

public class CLike {
	private String userId;
	private int cBoardNo;
	private int likeCnt; // 게시물 별 총 좋아요 수
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getcBoardNo() {
		return cBoardNo;
	}
	public void setcBoardNo(int cBoardNo) {
		this.cBoardNo = cBoardNo;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	
	@Override
	public String toString() {
		return "좋아요 [회원아이디=" + userId + ", 게시물번호=" + cBoardNo + ", 총좋아요수=" + likeCnt + "]";
	}
}
