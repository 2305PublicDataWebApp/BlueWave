package com.kh.bluewave.challenge.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.bluewave.challenge.domain.CLike;

public interface CLikeStore {

	/**
	 * 게시물 별 좋아요 수 리스트 조회 Store
	 * @param session
	 * @return
	 */
	List<CLike> selectAllLikeCnt(SqlSession session);

}
