package com.kh.bluewave.tipBoard.domain;

import java.sql.Timestamp;

public class TipBoard {
	private int tipNo;
	private String tipTitle;
	private String tipContent;
	private String tipWriter;
	private int tipViewCount;
	private Timestamp tipCreateDate;
	private Timestamp tipUpdateDate;
	
	public TipBoard() {}
	
	public TipBoard(int tipNo, String tipTitle, String tipContent, String tipWriter, int tipViewCount,
			Timestamp tipCreateDate, Timestamp tipUpdateDate) {
		super();
		this.tipNo = tipNo;
		this.tipTitle = tipTitle;
		this.tipContent = tipContent;
		this.tipWriter = tipWriter;
		this.tipViewCount = tipViewCount;
		this.tipCreateDate = tipCreateDate;
		this.tipUpdateDate = tipUpdateDate;
	}
	
	public int getTipNo() {
		return tipNo;
	}

	public void setTipNo(int tipNo) {
		this.tipNo = tipNo;
	}

	public String getTipTitle() {
		return tipTitle;
	}

	public void setTipTitle(String tipTitle) {
		this.tipTitle = tipTitle;
	}

	public String getTipContent() {
		return tipContent;
	}

	public void setTipContent(String tipContent) {
		this.tipContent = tipContent;
	}

	public String getTipWriter() {
		return tipWriter;
	}

	public void setTipWriter(String tipWriter) {
		this.tipWriter = tipWriter;
	}

	public int getTipViewCount() {
		return tipViewCount;
	}

	public void setTipViewCount(int tipViewCount) {
		this.tipViewCount = tipViewCount;
	}

	public Timestamp getTipCreateDate() {
		return tipCreateDate;
	}

	public void setTipCreateDate(Timestamp tipCreateDate) {
		this.tipCreateDate = tipCreateDate;
	}

	public Timestamp getTipUpdateDate() {
		return tipUpdateDate;
	}

	public void setTipUpdateDate(Timestamp tipUpdateDate) {
		this.tipUpdateDate = tipUpdateDate;
	}

	@Override
	public String toString() {
		return "팁공유 게시판 [번호=" + tipNo + ", 제목=" + tipTitle + ", 내용=" + tipContent
				+ ", 작성자=" + tipWriter + ", 조회수=" + tipViewCount + ", 작성일=" + tipCreateDate
				+ ", 수정일=" + tipUpdateDate + "]";
	}
	
	
}
