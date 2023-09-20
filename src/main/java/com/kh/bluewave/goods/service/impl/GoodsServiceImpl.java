package com.kh.bluewave.goods.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bluewave.goods.domain.Goods;
import com.kh.bluewave.goods.service.GoodsService;
import com.kh.bluewave.goods.store.GoodsStore;
import com.kh.bluewave.point.domain.Point;

@Service
public class GoodsServiceImpl implements GoodsService {
	
	@Autowired
	private GoodsStore gStore;
	@Autowired
	private SqlSession session;

	@Override
	public int getListCount() {
		int result = gStore.selectListCount(session);
		return result;
	}

	@Override
	public List<Goods> selectGoodsList() {
		List<Goods> gList = gStore.selectGoodsList(session);
		return gList;
	}

	@Override
	public Goods selectGoodsByNo(int productNo) {
		Goods goodsOne = gStore.selectGoodsByNo(session, productNo);
		return goodsOne;
	}

	@Override
	public int insertGoods(Goods goods) {
		int result = gStore.insertGoods(session, goods);
		return result;
	}

	@Override
	public int modifyGoods(Goods goods) {
		int result = gStore.modifyGoods(session, goods);
		return result;
	}

	@Override
	public int deleteGoods(int productNo) {
		int result = gStore.deleteGoods(session, productNo);
		return result;
	}

	@Override
	public Point selectPointByUserId(String userId) {
		Point onePoint = gStore.selectPointByUserId(session, userId);
		return onePoint;
	}

	@Override
	public int buyGoods(Point point) {
		int result = gStore.buyGoods(session, point);
		return result;
	}

}
