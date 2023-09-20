package com.kh.bluewave.challenge.domain;

import java.sql.Timestamp;

public class CBoard {
	private int cBoardNo;
	private String cBoardTitle;
	private String cBoardContent;
	private String cBoardFileName;
	private String cBoardFileRename;
	private String cBoardFilePath;
	private long cBoardFileLength;
	private Timestamp cBoardDate;
	private Timestamp cBoardUpdateDate;
	private String cBoardWriter;
	private int chalNo;
	
	public CBoard() {}
	
	public CBoard(String cBoardWriter, int chalNo) {
		super();
		this.cBoardWriter = cBoardWriter;
		this.chalNo = chalNo;
	}

	public int getcBoardNo() {
		return cBoardNo;
	}
	public void setcBoardNo(int cBoardNo) {
		this.cBoardNo = cBoardNo;
	}
	public String getcBoardTitle() {
		return cBoardTitle;
	}
	public void setcBoardTitle(String cBoardTitle) {
		this.cBoardTitle = cBoardTitle;
	}
	public String getcBoardContent() {
		return cBoardContent;
	}
	public void setcBoardContent(String cBoardContent) {
		this.cBoardContent = cBoardContent;
	}
	public String getcBoardFileName() {
		return cBoardFileName;
	}
	public void setcBoardFileName(String cBoardFileName) {
		this.cBoardFileName = cBoardFileName;
	}
	public String getcBoardFileRename() {
		return cBoardFileRename;
	}
	public void setcBoardFileRename(String cBoardFileRename) {
		this.cBoardFileRename = cBoardFileRename;
	}
	public String getcBoardFilePath() {
		return cBoardFilePath;
	}
	public void setcBoardFilePath(String cBoardFilePath) {
		this.cBoardFilePath = cBoardFilePath;
	}
	public long getcBoardFileLength() {
		return cBoardFileLength;
	}
	public void setcBoardFileLength(long cBoardFileLength) {
		this.cBoardFileLength = cBoardFileLength;
	}
	public Timestamp getcBoardDate() {
		return cBoardDate;
	}
	public void setcBoardDate(Timestamp cBoardDate) {
		this.cBoardDate = cBoardDate;
	}
	public Timestamp getcBoardUpdateDate() {
		return cBoardUpdateDate;
	}
	public void setcBoardUpdateDate(Timestamp cBoardUpdateDate) {
		this.cBoardUpdateDate = cBoardUpdateDate;
	}
	public String getcBoardWriter() {
		return cBoardWriter;
	}
	public void setcBoardWriter(String cBoardWriter) {
		this.cBoardWriter = cBoardWriter;
	}
	public int getChalNo() {
		return chalNo;
	}
	public void setChalNo(int chalNo) {
		this.chalNo = chalNo;
	}
	@Override
	public String toString() {
		return "챌린지 게시물 [게시물 번호=" + cBoardNo + ", 글 제목=" + cBoardTitle + ", 글 내용=" + cBoardContent
				+ ", 업로드 파일명=" + cBoardFileName + ", 업로드 파일 리네임=" + cBoardFileRename + ", 업로드 파일 경로="
				+ cBoardFilePath + ", 업로드 파일 크기=" + cBoardFileLength + ", 작성일=" + cBoardDate
				+ ", 수정일=" + cBoardUpdateDate + ", 작성자=" + cBoardWriter + ", 챌린지 명 번호=" + chalNo
				+ "]";
	}
	
	
}
