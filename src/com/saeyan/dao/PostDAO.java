package com.saeyan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.saeyan.dto.PostVO;
import util.DBManager;

public class PostDAO {
	private PostDAO() {
	}
	
	private static PostDAO instance = new PostDAO();
	
	public static PostDAO getInstance() {
		return instance;
	}
	
	public List<PostVO> selectAllPosts() {
		String sql = "select * from post order by num desc";
		
		List<PostVO> list = new ArrayList<PostVO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				PostVO pVo = new PostVO();
				
				pVo.setNum(rs.getInt("num"));
				pVo.setId(rs.getString("id"));
				pVo.setTitle(rs.getString("title"));
				pVo.setContent(rs.getString("content"));
				pVo.setReadcount(rs.getInt("readcount"));
				pVo.setWritedate(rs.getTimestamp("writedate"));
				
				list.add(pVo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return list;
	}
	
	public void insertPost(PostVO pVo) {
		String sql = "insert into post("
							+ "num, id, title, content)"
							+ "values(Post_seq.nextval, ?, ?, ?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pVo.getId());
			pstmt.setString(2, pVo.getTitle());
			pstmt.setString(3, pVo.getContent());
			
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	public void updateReadCount(String num) {
		String sql = "update post set readcount=readcount+1 where num=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	//게시판 글 상세 내용 보기 : 글번호로 검색 : 실패 null
	public PostVO selectOnePostByNum(String num) {
		String sql = "select * from post where num=?";
		
		PostVO pVo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pVo = new PostVO();
				
				pVo.setNum(rs.getInt("num"));
				pVo.setId(rs.getString("id"));
				pVo.setTitle(rs.getString("title"));
				pVo.setContent(rs.getString("content"));
				pVo.setWritedate(rs.getTimestamp("writedate"));
				pVo.setReadcount(rs.getInt("readcount"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return pVo;
	}
	
	public void updatePost(PostVO pVo) {
		String sql = "update post set id=?, title=?, content=? where num=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pVo.getId());
			pstmt.setString(2, pVo.getTitle());
			pstmt.setString(3, pVo.getContent());
			pstmt.setInt(4, pVo.getNum());
			
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	public void deletePost(String num) {
		String sql = "delete post where num=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
