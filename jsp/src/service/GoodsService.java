package service;

import java.util.List;

import dto.GoodsInfo;

public interface GoodsService {

	List<GoodsInfo> selectGoodsList(GoodsInfo gi);
	
	GoodsInfo selectGoods(GoodsInfo gi);
	
	int deleteGoods(GoodsInfo gi);
	
	int insertGoods(GoodsInfo gi);
	
	int updateGoods(GoodsInfo gi);
}
