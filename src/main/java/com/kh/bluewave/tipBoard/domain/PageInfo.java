package com.kh.bluewave.tipBoard.domain;

// 페이징 처리 관련 VO
public class PageInfo {
	
	private int currentPage;
	private int recordCountPerPage;
	private int naviCountPerPage;
	private int startNavi;
	private int endNavi;
	private int totalCount;
	private int naviTotalCount;
	
	public PageInfo() {}
	
	public PageInfo(int currentPage, int recordCountPerPage, int naviCountPerPage, int startNavi, int endNavi,
			int totalCount, int naviTotalCount) {
		super();
		this.currentPage = currentPage;
		this.recordCountPerPage = recordCountPerPage;
		this.naviCountPerPage = naviCountPerPage;
		this.startNavi = startNavi;
		this.endNavi = endNavi;
		this.totalCount = totalCount;
		this.naviTotalCount = naviTotalCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public int getNaviCoumtPerPage() {
		return naviCountPerPage;
	}

	public void setNaviCoumtPerPage(int naviCoumtPerPage) {
		this.naviCountPerPage = naviCoumtPerPage;
	}

	public int getStartNavi() {
		return startNavi;
	}

	public void setStartNavi(int startNavi) {
		this.startNavi = startNavi;
	}

	public int getEndNavi() {
		return endNavi;
	}

	public void setEndNavi(int endNavi) {
		this.endNavi = endNavi;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getNaviTotalCount() {
		return naviTotalCount;
	}

	public void setNaviTotalCount(int naviTotalCount) {
		this.naviTotalCount = naviTotalCount;
	}

	@Override
	public String toString() {
		return "페이징 [현재페이지=" + currentPage + ", 한 페이지당 게시되는 갯수=" + recordCountPerPage
				+ ", 한 페이지당 페이지 네비 갯수=" + naviCountPerPage + ", 네비 시작 번호=" + startNavi + ", 네비 끝 번호=" + endNavi
				+ ", 전체 갯수=" + totalCount + ", 네비 전체 갯수=" + naviTotalCount + "]";
	}
	
}
