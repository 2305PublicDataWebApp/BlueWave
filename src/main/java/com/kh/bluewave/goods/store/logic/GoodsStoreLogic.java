package com.kh.bluewave.goods.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bluewave.goods.domain.Goods;
import com.kh.bluewave.goods.store.GoodsStore;
import com.kh.bluewave.noticeBoard.domain.PageInfo;
import com.kh.bluewave.point.domain.Point;

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

	@Override
	public int modifyGoods(SqlSession session, Goods goods) {
		int result = session.update("GoodsMapper.modifyGoods", goods);
		return result;
	}

	@Override
	public int deleteGoods(SqlSession session, int productNo) {
		int result = session.delete("GoodsMapper.deleteGoods", productNo);
		return result;
	}

	@Override
	public Point selectPointByUserId(SqlSession session, String userId) {
		Point onePoint = session.selectOne("PointMapper.selectPointByUserId", userId);
		return onePoint;
	}

	@Override
	public int buyGoods(SqlSession session, Point point) {
		int result = session.insert("PointMapper.buyGoods", point);
		return result;
	}

	@Override
	public List<Goods> selectGoodsList(SqlSession session, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Goods> gList = session.selectList("GoodsMapper.selectGoodsList", null, rowBounds);
		return gList;
	}

}
