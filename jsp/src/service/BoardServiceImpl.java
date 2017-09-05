package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
					" where u.user_no = b.writer";
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
		Connection con;
		try {
			DBCon db = new DBCon();
			con = db.getCon();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, hm.get("title"));
			ps.setString(2, hm.get("content"));
			ps.setString(3, hm.get("writer"));
			int rCnt = ps.executeUpdate();
			return rCnt;
		}catch(Exception e) {
			e.printStackTrace();
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
	public HashMap selectBoard() {
		// TODO Auto-generated method stub
		return null;
	}

}
