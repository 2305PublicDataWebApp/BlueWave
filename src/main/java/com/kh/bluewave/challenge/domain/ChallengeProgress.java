package com.kh.bluewave.challenge.domain;

public class ChallengeProgress {
	private int chalNo;
    private String chalTitle;
    private String chalStartDate;
    private String chalEndDate;
    private int cBoardCount;
    private double progress;
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
	public String getChalStartDate() {
		return chalStartDate;
	}
	public void setChalStartDate(String chalStartDate) {
		this.chalStartDate = chalStartDate;
	}
	public String getChalEndDate() {
		return chalEndDate;
	}
	public void setChalEndDate(String chalEndDate) {
		this.chalEndDate = chalEndDate;
	}
	public int getcBoardCount() {
		return cBoardCount;
	}
	public void setcBoardCount(int cBoardCount) {
		this.cBoardCount = cBoardCount;
	}
	public double getProgress() {
		return progress;
	}
	public void setProgress(double progress) {
		this.progress = progress;
	}
	@Override
	public String toString() {
		return "ChallengeProgress [chalNo=" + chalNo + ", chalTitle=" + chalTitle + ", chalStartDate=" + chalStartDate
				+ ", chalEndDate=" + chalEndDate + ", cBoardCount=" + cBoardCount + ", progress=" + progress + "]";
	}

    // 생성자, getter, setter 등의 필요한 메서드를 추가하세요.
    
}
