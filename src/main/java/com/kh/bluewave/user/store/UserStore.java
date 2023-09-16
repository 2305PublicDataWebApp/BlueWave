package com.kh.bluewave.user.store;

import org.apache.ibatis.session.SqlSession;

import com.kh.bluewave.user.domain.User;

public interface UserStore {

	/**
	 * 로그인 Store
	 * @param session
	 * @param user
	 * @return
	 */
	User checkUserLogin(SqlSession session, User user);

	/**
	 * 회원탈퇴 Store
	 * @param session
	 * @param userId
	 * @return
	 */
	int deleteUser(SqlSession session, String userId);

	/**
	 * 회원 정보 수정 Store
	 * @param session
	 * @param userId
	 * @return
	 */
	int updateUser(SqlSession session, User user);

	/**
	 * 회원가입 Store
	 * @param session
	 * @param user
	 * @return
	 */
	int insertUser(SqlSession session, User user);

	/**
	 * 아이디로 정보조회 Store
	 * @param session
	 * @param user
	 * @return
	 */
	User selectOneById(SqlSession session, User user);

}
