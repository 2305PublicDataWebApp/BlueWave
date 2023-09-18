package com.kh.bluewave.user.service;

import java.util.List;


//import com.kh.bluewave.user.controller.Goods;
import com.kh.bluewave.user.domain.User;

public interface UserService {

	/**
	 * 로그인 Service
	 * @param user
	 * @return
	 */
	User checkUserLogin(User user);

	/**
	 * 회원탈퇴 Service
	 * @param userId
	 * @return
	 */
	int deleteUser(String userId);

	/**
	 * 정보수정 Service
	 * @param userId
	 * @return
	 */
	int updateMember(User user);
	
	/**
	 * 회원가입 Service
	 * @param user
	 * @return
	 */
	int insertUser(User user);

	/**
	 * 회원 아이디로 조회 Service
	 * @param user
	 * @return
	 */
	User selectOneById(User user);
	
	/**
	 * 이메일로 회원 조회 Service
	 * @param email
	 * @return
	 */
	User findUserByEmail(String email);
	
	/**
	 * 전화번호로 회원 조회 Service
	 * @param email
	 * @return
	 */
	User findUserByPhone(String phone);

	/**
	 * 회원 게시물 갯수 조회 Service
	 * @param userId
	 * @return
	 */
	int getPostCountByUserId(String userId);

	/**
	 * 회원 총포인트 조회 Service
	 * @param userId
	 * @return
	 */
	int getTotalPointByUserId(String userId);

	/**
	 * 회원 블루웨이브챌린지 갯수 조회 Service
	 * @param userId
	 * @return
	 */
	int getTotalBlueChalCount(String userId);

	/**
	 * 회원 개인챌린지 갯수 조회 Service
	 * @param userId
	 * @return
	 */
	int getTotalPersonalChalCount(String userId);
	
	/**
	 * 회원 교환굿즈 목록 조회 Service
	 * @param userId
	 * @return
	 */
//	List<Goods> getGoodsListByUserId(String userId);

	
}
