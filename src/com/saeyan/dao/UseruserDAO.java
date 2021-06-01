package com.saeyan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.saeyan.dto.UseruserVO;

import util.DBManager;

public class UseruserDAO {
	private UseruserDAO() {}
	
	private static UseruserDAO instance = new UseruserDAO();
	
	public static UseruserDAO getInstance() {
		return instance;
	}
	
	//사용자 인증시 사용하는 메소드
	public int userCheck(String userid, String pwd) {
		int result = -1;
		String sql = "select pwd from useruser where userid=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("pwd") != null && rs.getString("pwd").equals(pwd)) {
					result = 1;
				} else {
					result = 0;
				}
			} else {
					result = -1;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
	}
	
	//아이디로 회원 정보 가져오는 메소드
	public UseruserVO getMember(String userid) {
		UseruserVO uVo = null;
		String sql = "select * from useruser where userid=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				uVo = new UseruserVO();
				uVo.setName(rs.getString("name"));
				uVo.setUserid(rs.getString("userid"));
				uVo.setPwd(rs.getString("pwd"));
				uVo.setGender(rs.getString("gender"));
				uVo.setAge(rs.getInt("age"));
				uVo.setPhone(rs.getString("phone"));
				uVo.setEmail(rs.getString("email"));
				uVo.setBooks(rs.getString("books"));
			}			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return uVo;
	}

	public int confirmID(String userid) {
		int result = -1;
		String sql = "select userid from useruser where userid=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = 1;
			} else {
				result = -1;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
	}

	public int insertMember(UseruserVO uVo) {
		int result = -1;
		String sql = "insert into useruser values(?, ?, ?, ?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  uVo.getName());
			pstmt.setString(2,  uVo.getUserid());
			pstmt.setString(3,  uVo.getPwd());
			pstmt.setString(4,  uVo.getGender());
			pstmt.setInt(5, uVo.getAge());
			pstmt.setString(6,  uVo.getPhone());
			pstmt.setString(7,  uVo.getEmail());
			pstmt.setString(8,  uVo.getBooks());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}
	
	public int updateMember(UseruserVO uVo) {
		int result = -1;
		String sql = "update useruser set pwd=?, gender=?, phone=?, email=?, books=? where userid=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uVo.getPwd());
			pstmt.setString(2, uVo.getGender());
			pstmt.setString(3, uVo.getPhone());
			pstmt.setString(4, uVo.getEmail());
			pstmt.setString(5, uVo.getBooks());
			pstmt.setString(6, uVo.getUserid());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}
	
	//아이디 찾기
	public String searchId(String name, String email) {
		String userid = null;
		String sql = "select userid from useruser where name=? and email=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userid = rs.getString("userid");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return userid;
	}
		
	//비밀번호 찾기
	public String searchPwd(String name, String userid, String email) {
		String pwd = null;
		String sql = "select pwd from useruser where name=? and userid=? and email=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, userid);
			pstmt.setString(3, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pwd = rs.getString("pwd");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return pwd;
	}
	
	//비밀번호 재설정하기
	public void resetPwd(String userid, String pwd) {
		String sql = "update useruser set pwd=? where userid=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, userid);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
	}
}