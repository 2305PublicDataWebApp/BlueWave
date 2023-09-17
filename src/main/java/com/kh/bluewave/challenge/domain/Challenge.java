package com.kh.bluewave.challenge.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class Challenge {
	private int chalNo;
	private String chalTitle;
	private String chalContent;
	private String chalFileName;
	private String chalFileRename;
	private String chalFilePath;
	private long chalFileLength;
	private Date chalStartDate;
	private Date chalEndDate;
	private char chalPublic;
	private char chalFinish;
	private Timestamp chalCreateDate;
	private Timestamp chalUpdateDate;
	private String chalUserId;
	private int likeCount; // 총 좋아요 수
	private int pplCount; // 총 참여 인원 수
	
	public Challenge() {}
	
	public Challenge(String chalTitle, String chalContent, String chalFileName, String chalFileRename,
			String chalFilePath, long chalFileLength, Date chalStartDate, Date chalEndDate, char chalPublic,
			char chalFinish, String chalUserId) {
		super();
		this.chalTitle = chalTitle;
		this.chalContent = chalContent;
		this.chalFileName = chalFileName;
		this.chalFileRename = chalFileRename;
		this.chalFilePath = chalFilePath;
		this.chalFileLength = chalFileLength;
		this.chalStartDate = chalStartDate;
		this.chalEndDate = chalEndDate;
		this.chalPublic = chalPublic;
		this.chalFinish = chalFinish;
		this.chalUserId = chalUserId;
	}


	public int getChalNo() {
		return chalNo;
	}
	public void setChalNo(int chalNo) {
		this.chalNo = chalNo;
	}
	public String getChalTitle() {
		return chalTitle;
	}
	public void setChalTitle(String chalTitle) {
		this.chalTitle = chalTitle;
	}
	public String getChalContent() {
		return chalContent;
	}
	public void setChalContent(String chalContent) {
		this.chalContent = chalContent;
	}
	public String getChalFileName() {
		return chalFileName;
	}
	public void setChalFileName(String chalFileName) {
		this.chalFileName = chalFileName;
	}
	public String getChalFileRename() {
		return chalFileRename;
	}
	public void setChalFileRename(String chalFileRename) {
		this.chalFileRename = chalFileRename;
	}
	public String getChalFilePath() {
		return chalFilePath;
	}
	public void setChalFilePath(String chalFilePath) {
		this.chalFilePath = chalFilePath;
	}
	public long getChalFileLength() {
		return chalFileLength;
	}
	public void setChalFileLength(long chalFileLength) {
		this.chalFileLength = chalFileLength;
	}
	public Date getChalStartDate() {
		return chalStartDate;
	}
	public void setChalStartDate(Date chalStartDate) {
		this.chalStartDate = chalStartDate;
	}
	public Date getChalEndDate() {
		return chalEndDate;
	}
	public void setChalEndDate(Date chalEndDate) {
		this.chalEndDate = chalEndDate;
	}
	public char getChalPublic() {
		return chalPublic;
	}
	public void setChalPublic(char chalPublic) {
		this.chalPublic = chalPublic;
	}
	public char getChalFinish() {
		return chalFinish;
	}
	public void setChalFinish(char chalFinish) {
		this.chalFinish = chalFinish;
	}
	public Timestamp getChalCreateDate() {
		return chalCreateDate;
	}
	public void setChalCreateDate(Timestamp chalCreateDate) {
		this.chalCreateDate = chalCreateDate;
	}
	public Timestamp getChalUpdateDate() {
		return chalUpdateDate;
	}
	public void setChalUpdateDate(Timestamp chalUpdateDate) {
		this.chalUpdateDate = chalUpdateDate;
	}
	public String getChalUserId() {
		return chalUserId;
	}
	public void setChalUserId(String chalUserId) {
		this.chalUserId = chalUserId;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public int getPplCount() {
		return pplCount;
	}
	public void setPplCount(int pplCount) {
		this.pplCount = pplCount;
	}

	@Override
	public String toString() {
		return "챌린지 [번호=" + chalNo + ", 명=" + chalTitle + ", 내용=" + chalContent
				+ ", 파일명=" + chalFileName + ", 파일리네임=" + chalFileRename + ", 파일경로="
				+ chalFilePath + ", 파일크기=" + chalFileLength + ", 시작일=" + chalStartDate
				+ ", 종료일=" + chalEndDate + ", 공개여부=" + chalPublic + ", 완료여부=" + chalFinish
				+ ", 생성일=" + chalCreateDate + ", 수정일=" + chalUpdateDate + ", 작성회원="
				+ chalUserId + ", 총좋아요수=" + likeCount + ", 참여인원수" + pplCount + "]";
	}
}
