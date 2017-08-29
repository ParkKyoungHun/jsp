package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConTest {
/*
 * CREATE TABLE `user` (
	`user_no` INT(11) NOT NULL AUTO_INCREMENT,
	`id` VARCHAR(100) NOT NULL,
	`pwd` VARCHAR(100) NOT NULL,
	`name` VARCHAR(100) NOT NULL,
	PRIMARY KEY (`user_no`)
)
 */
	public static void main(String[] args) {
		Connection con;
		try {
			DBCon db = new DBCon();
			con = db.getCon();
			System.out.println("연결 성공");
			String name="홍길동";
			String sql = "select * from user";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				System.out.print(rs.getString("id") + ",");
				System.out.print(rs.getString("pwd") + ",");
				System.out.println(rs.getString("name"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
