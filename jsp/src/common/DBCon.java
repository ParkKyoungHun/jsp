package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBCon {
	private Connection con;
	
	public DBCon() throws ClassNotFoundException, SQLException {
		String url = "jdbc:mysql://localhost:3306/jsp";
		String id = "root";
		String pwd = "r1r2r3";
		Class.forName("org.mariadb.jdbc.Driver");
		con = DriverManager.getConnection(url, id, pwd);
		con.setAutoCommit(false);
	}
	
	public Connection getCon() {
		return con;
	}
	
	public void closeCon() {
		if(con!=null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			con = null;
		}
	}
}
