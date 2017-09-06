package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.DBCon;
import dto.GoodsInfo;

public class GoodsServiceImpl implements GoodsService{

	@Override
	public List<GoodsInfo> selectGoodsList(GoodsInfo gi) {
		Connection con;
		List<GoodsInfo> boardList = new ArrayList<GoodsInfo>();
		try {
			DBCon db = new DBCon();
			con = db.getCon();
			String sql = "select ginum, giname, gidesc, vinum," + 
					" gicredat, gimofdat, gicreusr, gimofusr" + 
					" from goods_info";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				GoodsInfo rGi = new GoodsInfo();
				rGi.setGiNum(rs.getInt("giNum"));
				rGi.setGiName(rs.getString("giName"));
				rGi.setGiDesc(rs.getString("gidesc"));
				rGi.setViNum(rs.getInt("vinum"));
				rGi.setGiCredat(rs.getString("gicredat"));
				rGi.setGiMofDat(rs.getString("gimofdat"));
				rGi.setGiCreusr(rs.getInt("gicreusr"));
				rGi.setGiMofusr(rs.getInt("gimofusr"));
				boardList.add(rGi);
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}

	@Override
	public GoodsInfo selectGoods(GoodsInfo gi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteGoods(GoodsInfo gi) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertGoods(GoodsInfo gi) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateGoods(GoodsInfo gi) {
		// TODO Auto-generated method stub
		return 0;
	}

}
