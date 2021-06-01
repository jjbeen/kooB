package com.saeyan.dto;

public class BookVO {
	private Integer itemid; //책 고유 id
	private String title; //제목
	private String description; //책 내용
	private Integer pubDate; //출판일
	private String coverLargeUrl; //책 표지 이미지
	private Integer categoryId; //카테고리 분류 번호
	private String categoryName; //카테고리 이름
	private String publisher; //출판사
	private Float customerReviewRank; //고객 평점
	private String author; //저자
	private String translator; //번역가
	private String isbn; //isbn 번호
	private String link; //책 정보 링크(인터파크)
	private Integer reviewCount; //리뷰 개수
	private Integer rank; //카테고리 내 순위
	
	public Integer getItemid() {
		return itemid;
	}
	public void setItemid(Integer itemid) {
		this.itemid = itemid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getPubDate() {
		return pubDate;
	}
	public void setPubDate(Integer pubDate) {
		this.pubDate = pubDate;
	}
	public String getCoverLargeUrl() {
		return coverLargeUrl;
	}
	public void setCoverLargeUrl(String coverLargeUrl) {
		this.coverLargeUrl = coverLargeUrl;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public Float getCustomerReviewRank() {
		return customerReviewRank;
	}
	public void setCustomerReviewRank(Float customerReviewRank) {
		this.customerReviewRank = customerReviewRank;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getTranslator() {
		return translator;
	}
	public void setTranslator(String translator) {
		this.translator = translator;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public Integer getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(Integer reviewCount) {
		this.reviewCount = reviewCount;
	}
	public Integer getRank() {
		return rank;
	}
	public void setRank(Integer rank) {
		this.rank = rank;
	}
}