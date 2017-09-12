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
import dto.VendorInfo;

public class GoodsServiceImpl implements GoodsService{

	@Override
	public List<GoodsInfo> selectGoodsList(GoodsInfo gi) {
		Connection con;
		List<GoodsInfo> boardList = new ArrayList<GoodsInfo>();
		try {
			DBCon db = new DBCon();
			con = db.getCon();
			String sql = "select gi.ginum, gi.giname, gi.gidesc, " + 
					" gi.vinum, gi.gicredat," + 
					" gi.gimofdat, gi.gicreusr,u.name, gi.gimofusr," + 
					" (select u2.name from user as u2" + 
					" where gi.gimofusr = u2.user_no)" + 
					" as name2" + 
					" from goods_info as gi," + 
					" user as u" + 
					" where gi.gicreusr = u.user_no";
			if(gi!=null) {
				if(gi.getViNum()!=0) {
					sql += " and gi.vinum=?";
				}
				if(gi.getGiName()!=null) {
					sql += " and gi.giname like concat('%',?,'%')";
				}
			}
			PreparedStatement ps = con.prepareStatement(sql);
			if(gi!=null) {
				if(gi.getViNum()!=0) {
					ps.setInt(1, gi.getViNum());
				}
				if(gi.getGiName()!=null) {
					ps.setString(2, gi.getGiName());
				}
			}
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				GoodsInfo rGi = new GoodsInfo();
				rGi.setGiNum(rs.getInt("giNum"));
				rGi.setGiName(rs.getString("giName"));
				rGi.setGiDesc(rs.getString("gidesc"));
				rGi.setViNum(rs.getInt("vinum"));
				rGi.setGiCredat(rs.getString("gicredat"));
				rGi.setGiMofdat(rs.getString("gimofdat"));
				rGi.setGiCreusr(rs.getInt("gicreusr"));
				rGi.setGiMofusr(rs.getInt("gimofusr"));
				rGi.setName(rs.getString("name"));
				rGi.setName2(rs.getString("name2"));
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

	@Override
	public List<VendorInfo> selectVendorList(VendorInfo vi) {
		Connection con;
		List<VendorInfo> boardList = new ArrayList<VendorInfo>();
		try {
			DBCon db = new DBCon();
			con = db.getCon();
			String sql = "select * from vendor_info";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				VendorInfo rVi = new VendorInfo();
				rVi.setViNum(rs.getInt("vinum"));
				rVi.setViName(rs.getString("viname"));
				rVi.setViDesc(rs.getString("viDesc"));
				boardList.add(rVi);
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}

}
