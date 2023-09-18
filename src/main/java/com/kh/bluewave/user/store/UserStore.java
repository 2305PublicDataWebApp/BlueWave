package com.kh.bluewave.user.store;

import java.util.List;


import org.apache.ibatis.session.SqlSession;

import com.kh.bluewave.user.domain.User;
//import com.kh.bluewave.user.service.impl.Goods;

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

	/**
	 * 회원 게시물 갯수 조회 Store
	 * @param session
	 * @param userId
	 * @return
	 */
	int getPostCountByUserId(SqlSession session, String userId);

	/**
	 * 회원 총포인트 조회 Store
	 * @param session
	 * @param userId
	 * @return
	 */
	int getTotalPointByUserId(SqlSession session, String userId);

	/**
	 * 회원 블루웨이브챌린지 갯수 조회 Store
	 * @param session
	 * @param userId
	 * @return
	 */
	int getTotalBlueChalCount(SqlSession session, String userId);

	/**
	 * 회원 개인챌린지 갯수 조회 Store
	 * @param session
	 * @param userId
	 * @return
	 */
	int getTotalPersonalChalCount(SqlSession session, String userId);

	/**
	 * 이메일로 회원 조회 Store
	 * @param session
	 * @param email
	 * @return
	 */
	User findUserByEmail(SqlSession session, String email);

	/**
	 * 전화번호로 회원 조회 Store
	 * @param session
	 * @param phone
	 * @return
	 */
	User findUserByPhone(SqlSession session, String phone);

	/**
	 * 회원 교환굿즈 목록 조회 Store
	 * @param session
	 * @param userId
	 * @return
	 */
//	List<Goods> getGoodsListByUserId(SqlSession session, String userId);

}
