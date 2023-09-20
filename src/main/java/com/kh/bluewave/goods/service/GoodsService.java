package com.kh.bluewave.goods.service;

import java.util.List;

import com.kh.bluewave.goods.domain.Goods;
import com.kh.bluewave.point.domain.Point;

public interface GoodsService {

	/**
	 * 전체 굿즈 갯수 Service
	 * @return
	 */
	int getListCount();

	/**
	 * 굿즈 전체 조회 Service
	 * @param pInfo
	 * @return
	 */
	List<Goods> selectGoodsList();

	/**
	 * 굿즈 상세 조회
	 * @param productNo
	 * @return
	 */
	Goods selectGoodsByNo(int productNo);

	/**
	 * 굿즈 등록
	 * @param goods
	 * @return
	 */
	int insertGoods(Goods goods);

	/**
	 * 굿즈 수정
	 * @param goods
	 * @return
	 */
	int modifyGoods(Goods goods);

	/**
	 * 굿즈 삭제
	 * @param productNo
	 * @return
	 */
	int deleteGoods(int productNo);

	/**
	 * 맴버 아이디로 포인트 조회
	 * @param userId
	 * @return
	 */
	Point selectPointByUserId(String userId);

	/**
	 * 굿즈 구매
	 * @param point
	 * @return
	 */
	int buyGoods(Point point);


}
