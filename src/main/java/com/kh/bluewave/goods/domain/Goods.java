package com.kh.bluewave.goods.domain;

public class Goods {
	private int productNo;
	private String productName;
	private int productPoint;
	private String productContent;
	private String productThumbnail;
	private String productThumbnailRename;
	private String productThumbnailPath;
	private int productThumbnailLength;
	private String productImage;
	private String productImageRename;
	private String productImagePath;
	private int productImageLength;
	private int productCount;
	
	public Goods() {}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPoint() {
		return productPoint;
	}

	public void setProductPoint(int productPoint) {
		this.productPoint = productPoint;
	}

	public String getProductContent() {
		return productContent;
	}

	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}

	public String getProductThumbnail() {
		return productThumbnail;
	}

	public void setProductThumbnail(String productThumbnail) {
		this.productThumbnail = productThumbnail;
	}

	public String getProductThumbnailRename() {
		return productThumbnailRename;
	}

	public void setProductThumbnailRename(String productThumbnailRename) {
		this.productThumbnailRename = productThumbnailRename;
	}

	public String getProductThumbnailPath() {
		return productThumbnailPath;
	}

	public void setProductThumbnailPath(String productThumbnailPath) {
		this.productThumbnailPath = productThumbnailPath;
	}

	public int getProductThumbnailLength() {
		return productThumbnailLength;
	}

	public void setProductThumbnailLength(int productThumbnailLength) {
		this.productThumbnailLength = productThumbnailLength;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public String getProductImageRename() {
		return productImageRename;
	}

	public void setProductImageRename(String productImageRename) {
		this.productImageRename = productImageRename;
	}

	public String getProductImagePath() {
		return productImagePath;
	}

	public void setProductImagePath(String productImagePath) {
		this.productImagePath = productImagePath;
	}

	public int getProductImageLength() {
		return productImageLength;
	}

	public void setProductImageLength(int productImageLength) {
		this.productImageLength = productImageLength;
	}

	public int getProductCount() {
		return productCount;
	}

	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}

	@Override
	public String toString() {
		return "상품 [번호=" + productNo + ", 이름=" + productName + ", 가격=" + productPoint
				+ ", 설명=" + productContent + ", 썸네일=" + productThumbnail
				+ ", 썸네일리네임=" + productThumbnailRename + ", 썸네일경로="
				+ productThumbnailPath + ", 썸네일크기=" + productThumbnailLength + ", 이미지="
				+ productImage + ", 이미지리네임=" + productImageRename + ", 이미지경로=" + productImagePath
				+ ", 이미지크기=" + productImageLength + ", 갯수=" + productCount + "]";
	}
	
	
}
