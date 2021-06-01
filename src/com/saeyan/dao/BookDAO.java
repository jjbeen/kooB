package com.saeyan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.saeyan.dto.BookVO;

import util.DBManager;

public class BookDAO {
	private BookDAO() {
	}
	
	private static BookDAO instance = new BookDAO();
	
	public static BookDAO getInstance() {
		return instance;
	}

	//ī�װ�
	public List<BookVO> selectBooks(String category) {
		String sql="select * from book where categoryname=? order by rank";
		List<BookVO> list=new ArrayList<>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs=pstmt.executeQuery();
			
			while(rs.next()) { //�̵��� �� ������				
				BookVO bVo=new BookVO();
				bVo.setItemid(rs.getInt("itemid"));
				bVo.setTitle(rs.getString("title"));
				bVo.setDescription(rs.getString("description"));
				bVo.setPubDate(rs.getInt("pubDate"));
				bVo.setCoverLargeUrl(rs.getString("coverLargeUrl"));
				bVo.setCategoryId(rs.getInt("categoryId"));
				bVo.setCategoryName(rs.getString("categoryName"));
				bVo.setPublisher(rs.getString("publisher"));
				bVo.setCustomerReviewRank(rs.getFloat("customerReviewRank"));
				bVo.setAuthor(rs.getString("author"));
				bVo.setTranslator(rs.getString("translator"));
				bVo.setIsbn(rs.getString("isbn"));
				bVo.setLink(rs.getString("link"));
				bVo.setReviewCount(rs.getInt("reviewCount"));
				bVo.setRank(rs.getInt("rank"));
				list.add(bVo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
	
	//�˻�
	public List<BookVO> searchBooks(String condition, String query) {
		List<BookVO> list = new ArrayList<>();
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		
		try { //����
			String sql = "select * from book";
			
			if(condition.equals("1")) { //title �˻�
				sql += " where title like '%" + query.trim() + "%' and categoryName<>'��ü'";
			} else if(condition.equals("2")) { //description �˻�
				sql += " where description like '%" + query.trim() + "%' and categoryName<>'��ü'";
			} else if(condition.equals("3")) { //author, translator �˻�
				sql += " where (author like '%" + query.trim() + "%' or translator like '%" + query.trim()
							+ "%') and categoryName<>'��ü'";
			} else if(condition.equals("4")) { //publisher �˻�
				sql += " where publisher like '%" + query.trim() + "%' and categoryName<>'��ü'"; 
			}
			
			conn = DBManager.getConnection();
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()) {
				BookVO bVo = new BookVO();
				bVo.setItemid(rs.getInt(1));
				bVo.setTitle(rs.getString(2));
				bVo.setDescription(rs.getString(3));
				bVo.setPubDate(rs.getInt(4));
				bVo.setCoverLargeUrl(rs.getString(6));
				bVo.setCategoryId(rs.getInt(7));
				bVo.setCategoryName(rs.getString(8));
				bVo.setPublisher(rs.getString(9));
				bVo.setCustomerReviewRank(rs.getFloat(10));
				bVo.setAuthor(rs.getString(11));
				bVo.setTranslator(rs.getString(12));
				bVo.setIsbn(rs.getString(13));
				bVo.setLink(rs.getString(14));
				bVo.setReviewCount(rs.getInt(15));
				bVo.setRank(rs.getInt(16));
				list.add(bVo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, st, rs);
		}
		return list;
	}
	
	//å ���� ���̵�� å ���� ��������
	public BookVO getBook(int itemid) {
		BookVO bVo = null;
		String sql = "select * from book where itemid=? and categoryName<>'��ü'";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, itemid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				bVo=new BookVO();
				bVo.setItemid(rs.getInt("itemid"));
				bVo.setTitle(rs.getString("title"));
				bVo.setDescription(rs.getString("description"));
				bVo.setPubDate(rs.getInt("pubDate"));
				bVo.setCoverLargeUrl(rs.getString("coverLargeUrl"));
				bVo.setCategoryId(rs.getInt("categoryId"));
				bVo.setCategoryName(rs.getString("categoryName"));
				bVo.setPublisher(rs.getString("publisher"));
				bVo.setCustomerReviewRank(rs.getFloat("customerReviewRank"));
				bVo.setAuthor(rs.getString("author"));
				bVo.setTranslator(rs.getString("translator"));
				bVo.setIsbn(rs.getString("isbn"));
				bVo.setLink(rs.getString("link"));
				bVo.setReviewCount(rs.getInt("reviewCount"));
				bVo.setRank(rs.getInt("rank"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return bVo;
	}
	
	//���� ������ �ٸ� å���, ���� ī�װ��� �ٸ� å ����Ʈ���� �������� �޼ҵ�
	public List<BookVO> selectSimilarBooks(int itemid, String author, String categoryName) {
		String sql = "select * from book where author=? and itemid<>? and categoryName!='��ü' union"
				+ " select * from (select * from book where categoryName=? and itemid<>?"
				+ " order by dbms_random.value) where rownum <= 4";
		List<BookVO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, author);
			pstmt.setInt(2, itemid);
			pstmt.setString(3, categoryName);
			pstmt.setInt(4, itemid);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				BookVO bVo = new BookVO();
				bVo.setItemid(rs.getInt("itemid"));
				bVo.setTitle(rs.getString("title"));
				bVo.setDescription(rs.getString("description"));
				bVo.setPubDate(rs.getInt("pubDate"));
				bVo.setCoverLargeUrl(rs.getString("coverLargeUrl"));
				bVo.setCategoryId(rs.getInt("categoryId"));
				bVo.setCategoryName(rs.getString("categoryName"));
				bVo.setPublisher(rs.getString("publisher"));
				bVo.setCustomerReviewRank(rs.getFloat("customerReviewRank"));
				bVo.setAuthor(rs.getString("author"));
				bVo.setTranslator(rs.getString("translator"));
				bVo.setIsbn(rs.getString("isbn"));
				bVo.setLink(rs.getString("link"));
				bVo.setReviewCount(rs.getInt("reviewCount"));
				bVo.setRank(rs.getInt("rank"));
				list.add(bVo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
}