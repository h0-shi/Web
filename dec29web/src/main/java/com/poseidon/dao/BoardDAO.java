package com.poseidon.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mariadb.jdbc.export.Prepare;

import com.poseidon.db.DBConnection;

public class BoardDAO {
	DBConnection dbCon = new DBConnection();

	public int update(String no, String title, String content) {
		int result = 0;
		Connection conn = dbCon.getConnection();
		PreparedStatement pstmt = null;

		String sql = "UPDATE board SET board_title=?, board_content=? WHERE board_no=?";
		String name = "박시호"; // 나중에 세션에서 받아올거야
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
//			pstmt.setString(3, name);
			pstmt.setString(3, no);

//			이건 무슨 메서드지?
//			얘도 쿼리를 실행하는 파트다..!
			result = pstmt.executeUpdate(); // 결과를 숫자로 되돌려준다 => 변경된 레코드 수(?)
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, conn);
		}

		return result;
	}

//	글쓰기
	public int write(String title, String content) {
		int result = 0;
		Connection conn = dbCon.getConnection();
		PreparedStatement pstmt = null;

		String sql = "INSERT INTO board (board_title,board_content,board_write) VALUES (?,?,?)";
		String name = "박시호"; // 나중에 세션에서 받아올거야
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, name);
			// pstmt.executeQuery();
//			이건 무슨 메서드지?
//			얘도 쿼리를 실행하는 파트다..!
			result = pstmt.executeUpdate(); // 결과를 숫자로 되돌려준다 => 변경된 레코드 수(?)
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(null, pstmt, conn);
		}

		return result;
	}

	// 삭제하기
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
		count(no);

//		조회수 +1 하는 메서드
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

	// 조회수 올리기
	private void count(String no) {
		Connection conn = dbCon.getConnection();

		PreparedStatement pstmt = null;
		String sql = "UPDATE board SET board_count = board_count+1 WHERE board_no=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, conn);
		}

	}

	// 게시판 보기
	public List<Map<String, Object>> boardList() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = dbCon.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM boardview";

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
