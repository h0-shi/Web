package com.poseidon.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.poseidon.db.DBConnection;

public class BoardDAO {
	DBConnection dbCon = new DBConnection();

	//삭제하기
	public void delete(String no) {
		Connection conn = dbCon.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "DELETE FROM board WHERE board_no=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(null, pstmt, conn);
		}
		
	}
	
	private void close(ResultSet rs, PreparedStatement pstmt, Connection con) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// 톺아보기
	public Map<String, Object> detail(String no) {
		Map<String, Object> detail = new HashMap<String, Object>();

		Connection con = dbCon.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM board WHERE board_no=?";

		try {
			pstmt = con.prepareStatement(sql);
//			상기sql문의 ?를 처리함
			pstmt.setString(1, no);
//			1번째 물음표값에 no를 할당해 (sql문이라서 1부터 시작)
			rs = pstmt.executeQuery();

			if (rs.next()) {
				detail.put("board_no", rs.getString("board_no"));
				detail.put("board_title", rs.getString("board_title"));
				detail.put("board_content", rs.getString("board_content"));
				detail.put("board_write", rs.getString("board_write"));
				detail.put("board_date", rs.getString("board_date"));
				detail.put("board_count", rs.getString("board_count"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);

		}

		return detail;
	}

	// 게시판 보기
	public List<Map<String, Object>> boardList() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = dbCon.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM board";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Map<String, Object> e = new HashMap<String, Object>();
				e.put("board_no", rs.getString("board_no"));
				e.put("board_title", rs.getString("board_title"));
				e.put("board_write", rs.getString("board_write"));
				e.put("board_date", rs.getString("board_date"));
				e.put("board_count", rs.getString("board_count"));
				list.add(e);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}

		return list;
	}
	

}
