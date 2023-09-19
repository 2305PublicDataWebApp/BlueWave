package com.kh.bluewave.goods.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.bluewave.goods.domain.Goods;

public interface GoodsStore {

	/**
	 * 전체 굿즈 갯수 Store
	 * @param session
	 * @return
	 */
	int selectListCount(SqlSession session);

	/**
	 * 굿즈 전체 조회 Store
	 * @param session
	 * @param pInfo
	 * @return
	 */
	List<Goods> selectGoodsList(SqlSession session);

	/**
	 * 굿즈 상세 조회 Store
	 * @param session
	 * @param productNo
	 * @return
	 */
	Goods selectGoodsByNo(SqlSession session, int productNo);

	/**
	 * 굿즈 등록
	 * @param session
	 * @param goods
	 * @return
	 */
	int insertGoods(SqlSession session, Goods goods);

}
