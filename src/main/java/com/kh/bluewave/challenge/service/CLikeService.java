package com.kh.bluewave.challenge.service;

import java.util.List;

import com.kh.bluewave.challenge.domain.CLike;

public interface CLikeService {

	/**
	 * 게시물 별 좋아요 수 리스트 조회 Service
	 * @return
	 */
	List<CLike> selectAllLikeCnt();

}
