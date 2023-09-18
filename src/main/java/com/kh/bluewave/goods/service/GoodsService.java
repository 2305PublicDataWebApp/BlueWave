package com.kh.bluewave.goods.service;

import java.util.List;

import com.kh.bluewave.goods.domain.Goods;
import com.kh.bluewave.goods.domain.PageInfo;

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
	 * 게시글 상세 조회
	 * @param productNo
	 * @return
	 */
	Goods selectGoodsByNo(int productNo);


}
