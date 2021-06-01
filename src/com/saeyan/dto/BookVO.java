package com.saeyan.dto;

public class BookVO {
	private Integer itemid; //å ���� id
	private String title; //����
	private String description; //å ����
	private Integer pubDate; //������
	private String coverLargeUrl; //å ǥ�� �̹���
	private Integer categoryId; //ī�װ� �з� ��ȣ
	private String categoryName; //ī�װ� �̸�
	private String publisher; //���ǻ�
	private Float customerReviewRank; //�� ����
	private String author; //����
	private String translator; //������
	private String isbn; //isbn ��ȣ
	private String link; //å ���� ��ũ(������ũ)
	private Integer reviewCount; //���� ����
	private Integer rank; //ī�װ� �� ����
	
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