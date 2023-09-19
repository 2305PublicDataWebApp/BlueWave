package com.kh.bluewave.goods.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bluewave.goods.domain.Goods;
import com.kh.bluewave.goods.store.GoodsStore;

@Repository
public class GoodsStoreLogic implements GoodsStore {

	@Override
	public int selectListCount(SqlSession session) {
		int result = session.selectOne("GoodsMapper.selectListCount");
		return result;
	}

	@Override
	public List<Goods> selectGoodsList(SqlSession session) {
		List<Goods> gList = session.selectList("GoodsMapper.selectGoodsList");
		return gList;
	}

	@Override
	public Goods selectGoodsByNo(SqlSession session, int productNo) {
		Goods goodsOne = session.selectOne("GoodsMapper.selectGoodsByNo", productNo);
		return goodsOne;
	}

	@Override
	public int insertGoods(SqlSession session, Goods goods) {
		int result = session.insert("GoodsMapper.insertGoods", goods);
		return result;
	}

}
