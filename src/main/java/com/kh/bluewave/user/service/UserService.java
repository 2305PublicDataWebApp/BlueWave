package com.kh.bluewave.user.service;

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

	User selectOneById(User user);

}
