package com.poseidon.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public Connection getConnection(){
		Connection con = null;

		try {
			Class.forName("org.mariadb.jdbc.Driver");
			String url = "jdbc:mariadb://guro.wisejia.com:3307/c23c_07";
			con = DriverManager.getConnection(url, "c23c_07", "kiri!94859485");
		} catch (ClassNotFoundException e) {
			System.out.println("class 정보 없음");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("접속 정보 에러");
			e.printStackTrace();
		}
		

		
		
		return con;
	}

}
