package com.kh.bluewave.user.service;

public interface SubService {

	/**
	 * 회원의 팔로잉 수 조회 Service
	 * @param userId
	 * @return
	 */
	int selectFollowingCntById(String userId);

	/**
	 * 회원의 팔로워 수 조회 Service
	 * @param userId
	 * @return
	 */
	int selectFollowersCntById(String userId);
}
