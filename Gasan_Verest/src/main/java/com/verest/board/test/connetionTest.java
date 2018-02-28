package com.verest.board.test;

import java.sql.Connection;
import java.sql.DriverManager;

public class connetionTest {

		private static final String DRIVER = "com.mysql.jdbc.Driver";
		private static final String URL = "jdbc:mysql://localhost:3306/testDB";
		private static final String USER ="root";
		private static final String PW = "root";
	
		@org.junit.Test
		public void testConnection() throws Exception{
			Class.forName(DRIVER);
			try (Connection con = DriverManager.getConnection(URL, USER, PW))	{
				System.out.println(con);
			}catch(Exception e){
				System.err.println(e);
			}
		}
}
