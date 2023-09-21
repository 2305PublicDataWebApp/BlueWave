package com.kh.bluewave.goods.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.bluewave.goods.domain.Goods;
import com.kh.bluewave.noticeBoard.domain.PageInfo;
import com.kh.bluewave.point.domain.Point;

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

	/**
	 * 굿즈 수정
	 * @param session
	 * @param goods
	 * @return
	 */
	int modifyGoods(SqlSession session, Goods goods);

	/**
	 * 굿즈 삭제
	 * @param session
	 * @param productNo
	 * @return
	 */
	int deleteGoods(SqlSession session, int productNo);

	/**
	 * 맴버 아이디로 포인트 조회
	 * @param session
	 * @param userId
	 * @return
	 */
	Point selectPointByUserId(SqlSession session, String userId);

	int buyGoods(SqlSession session, Point point);

	/**
	 * 굿즈 관리자페이지에서 전체조회
	 * @param session
	 * @param pInfo
	 * @return
	 */
	List<Goods> selectGoodsList(SqlSession session, PageInfo pInfo);

}
