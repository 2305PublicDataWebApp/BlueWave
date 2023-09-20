package com.kh.bluewave.noticeBoard.domain;

import java.sql.Timestamp;

public class NoticeBoard {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeWriter;
	private int noticeViewCount;
	private Timestamp noticeCreateDate;
	private Timestamp noticeUpdateDate;
	
	public NoticeBoard() {}
	
	public NoticeBoard(int noticeNo, String noticeTitle, String noticeContent, String noticeWriter, int noticeViewCount,
			Timestamp noticeCreateDate, Timestamp noticeUpdateDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeWriter = noticeWriter;
		this.noticeViewCount = noticeViewCount;
		this.noticeCreateDate = noticeCreateDate;
		this.noticeUpdateDate = noticeUpdateDate;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeWriter() {
		return noticeWriter;
	}
	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}
	public int getNoticeViewCount() {
		return noticeViewCount;
	}
	public void setNoticeViewCount(int noticeViewCount) {
		this.noticeViewCount = noticeViewCount;
	}
	public Timestamp getNoticeCreateDate() {
		return noticeCreateDate;
	}
	public void setNoticeCreateDate(Timestamp noticeCreateDate) {
		this.noticeCreateDate = noticeCreateDate;
	}
	public Timestamp getNoticeUpdateDate() {
		return noticeUpdateDate;
	}
	public void setNoticeUpdateDate(Timestamp noticeUpdateDate) {
		this.noticeUpdateDate = noticeUpdateDate;
	}
	@Override
	public String toString() {
		return "공지 게시판 [번호=" + noticeNo + ", 제목=" + noticeTitle + ", 내용=" + noticeContent
				+ ", 작성자=" + noticeWriter + ", 조회수=" + noticeViewCount + ", 작성일=" + noticeCreateDate
				+ ", 수정일=" + noticeUpdateDate + "]";
	}
	
	
}
