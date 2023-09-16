package com.kh.bluewave.noticeBoard.domain;

import java.sql.Timestamp;

public class NoticeBoard {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeWriter;
	private String noticeFileName;
	private String noticeFileRename;
	private String noticeFilePath;
	private int noticeFileLength;
	private int noticeViewCount;
	private Timestamp noticeCreateDate;
	private Timestamp noticeUpdateDate;
	
	
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
	public String getNoticeFileName() {
		return noticeFileName;
	}
	public void setNoticeFileName(String noticeFileName) {
		this.noticeFileName = noticeFileName;
	}
	public String getNoticeFileRename() {
		return noticeFileRename;
	}
	public void setNoticeFileRename(String noticeFileRename) {
		this.noticeFileRename = noticeFileRename;
	}
	public String getNoticeFilePath() {
		return noticeFilePath;
	}
	public void setNoticeFilePath(String noticeFilePath) {
		this.noticeFilePath = noticeFilePath;
	}
	public int getNoticeFileLength() {
		return noticeFileLength;
	}
	public void setNoticeFileLength(int noticeFileLength) {
		this.noticeFileLength = noticeFileLength;
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
				+ ", 작성자=" + noticeWriter + ", 파일이름=" + noticeFileName + ", 파일리네임="
				+ noticeFileRename + ", 파일경로=" + noticeFilePath + ", 파일크기=" + noticeFileLength
				+ ", 조회수=" + noticeViewCount + ", 작성일=" + noticeCreateDate
				+ ", 수정일=" + noticeUpdateDate + "]";
	}
	
	
}
