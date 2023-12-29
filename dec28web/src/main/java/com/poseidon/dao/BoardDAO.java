package com.poseidon.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.poseidon.db.DBConnection;
import com.poseidon.dto.BoardDTO;

public class BoardDAO {
	DBConnection dbcon = new DBConnection();

	public List<BoardDTO> boardList() {
		List<BoardDTO> result = new ArrayList<BoardDTO>();

		Connection conn = dbcon.getConn();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM board";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setBoard_no(rs.getInt(1));
				dto.setBoard_title(rs.getString(2));
				dto.setBoard_write(rs.getString(3));
				dto.setBoard_date(rs.getString(4));
				dto.setBoard_count(rs.getInt(5));
				result.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}
}
