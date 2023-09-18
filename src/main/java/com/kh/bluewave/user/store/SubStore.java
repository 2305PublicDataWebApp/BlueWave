package com.kh.bluewave.user.store;

import org.apache.ibatis.session.SqlSession;

public interface SubStore {

	/**
	 * 회원의 팔로잉 수 조회 Store
	 * @param session
	 * @param userId
	 * @return
	 */
	int selectFollowingCntById(SqlSession session, String userId);

	/**
	 * 회원의 팔로워 수 조회 Service
	 * @param session
	 * @param userId
	 * @return
	 */
	int selectFollowersCntById(SqlSession session, String userId);
}
