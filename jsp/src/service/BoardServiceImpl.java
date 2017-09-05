package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.DBCon;

public class BoardServiceImpl implements BoardService{

	@Override
	public List<Map<String, String>> selectBoardList() {
		Connection con;
		List<Map<String, String>> boardList = new ArrayList<Map<String,String>>();
		try {
			DBCon db = new DBCon();
			con = db.getCon();
			String sql = "select b.*, u.name from user as u, board as b" + 
					" where u.user_no = b.writer order by b.b_num desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Map<String, String> rHm = new HashMap<String, String>();
				rHm.put("b_num", rs.getString("b_num"));
				rHm.put("title", rs.getString("title"));
				rHm.put("content", rs.getString("content"));
				rHm.put("reg_date", rs.getString("reg_date"));
				rHm.put("writer", rs.getString("writer"));
				rHm.put("name", rs.getString("name"));
				boardList.add(rHm);
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}

	@Override
	public int insertBoard(Map<String, String> hm) {
		String sql = "insert into board(title, content, reg_Date,writer)";
		sql +=" values(?,?,now(),?)";
		Connection con = null;
		DBCon db = null;
		try {
			db = new DBCon();
			con = db.getCon();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, hm.get("title"));
			ps.setString(2, hm.get("content"));
			ps.setString(3, hm.get("writer"));
			int rCnt = ps.executeUpdate();
			if(rCnt==1) {
				con.commit();
			}else {
				con.rollback();
			}
			return rCnt;
		}catch(Exception e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			if(db!=null) {
				db.closeCon();
			}
		}
		return 0;
	}

	@Override
	public int deleteBoard(Map<String, String> hm) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBoard(Map<String, String> hm) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String, String>  selectBoard(Map<String, String> hm) {
		Connection con;
		Map<String, String> rHm = new HashMap<String, String>();
		try {
			DBCon db = new DBCon();
			con = db.getCon();
			String sql = "select b.*, u.name from user as u, board as b" + 
					" where u.user_no = b.writer and b.b_num=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, hm.get("b_num"));
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				rHm.put("b_num", rs.getString("b_num"));
				rHm.put("title", rs.getString("title"));
				rHm.put("content", rs.getString("content"));
				rHm.put("reg_date", rs.getString("reg_date"));
				rHm.put("writer", rs.getString("writer"));
				rHm.put("name", rs.getString("name"));
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rHm;
	}

}
