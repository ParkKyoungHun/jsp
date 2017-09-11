package service;

import java.util.List;

import dto.GoodsInfo;
import dto.VendorInfo;

public interface GoodsService {

	List<GoodsInfo> selectGoodsList(GoodsInfo gi);
	
	List<VendorInfo> selectVendorList(VendorInfo vi);
	
	GoodsInfo selectGoods(GoodsInfo gi);
	
	int deleteGoods(GoodsInfo gi);
	
	int insertGoods(GoodsInfo gi);
	
	int updateGoods(GoodsInfo gi);
}
