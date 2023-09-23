package com.kh.bluewave.user.service;

import java.util.List;

import com.kh.bluewave.challenge.domain.CBoard;
import com.kh.bluewave.challenge.domain.Challenge;
import com.kh.bluewave.goods.domain.Goods;
import com.kh.bluewave.noticeBoard.domain.PageInfo;
import com.kh.bluewave.user.domain.Sub;
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
	 * 회원의 팔로잉 목록 조회 Service
	 * @param userId
	 * @return
	 */
	List<Sub> selectAllFollowingListById(String userId);

	/**
	 * 회원의 팔로워 목록 조회 Service
	 * @param userId
	 * @return
	 */
	List<Sub> selectAllFollowersListById(String userId);

	/**
	 * 회원 교환굿즈 목록 조회 Service
	 * @param userId
	 * @return
	 */
	List<Goods> getGoodsListByUserId(String userId);

	/**
	 * 회원 블루웨이브챌린지 달성 갯수 조회 Service
	 * @param userId
	 * @return
	 */
	int getFinishTotalBlueChalCount(String userId);

	/**
	 * 회원 개인챌린지 달성 갯수 조회 Service
	 * @param userId
	 * @return
	 */
	int getFinishTotalPersonalChalCount(String userId);

	/**
	 * 이메일 중복체크 Service
	 * @param userEmail
	 * @return
	 */
	int emailCheck(String userEmail);

	/**
	 * 닉네임 중복체크 Service
	 * @param userNickName
	 * @return
	 */
	int nickNameCheck(String userNickName);

	/**
	 * 아이디 중복체크 Service
	 * @param userId
	 * @return
	 */
	int idCheck(String userId);
	
	/**
	 * chalNo로 찾은 작성자 아이디 조회 Service
	 * @param chalWriter
	 * @return
	 */
	User selectOneByChalNo(String chalWriter);

	/**
	 * 회원 리스트 조회
	 * @param pInfo
	 * @return
	 */
	List<User> selectUserList(PageInfo pInfo);

	/**
	 * 전체 회원수 조회
	 * @return
	 */
	int getListCount();

	/**
	 * 오늘의 챌린지 리스트 Service
	 * @param userId
	 * @return
	 */
	List<Challenge> getTodayCList(String userId);

	/**
	 * 블루웨이브 캘린더 데이트 리스트 Service
	 * @param userId
	 * @return
	 */
	List<CBoard> getCalDateList(String userId);

	/**
	 * 회원가입시 포인트 적립 Service
	 * @param user
	 * @return
	 */
	int insertPoint(User user);

	/**
	 * 팔로우 Service
	 * @param sub
	 * @return
	 */
	int followUser(Sub sub);

	/**
	 * 팔로우 해제 Service
	 * @param sub
	 * @return
	 */
	int unfollowUser(Sub sub);

	/**
	 * 팔로우 체크 Service
	 * @param subTarget
	 * @param subUser
	 * @return
	 */
	int isFollowing(Sub sub);

	/**
	 * 모든 회원 리스트 조회 Service
	 * @return
	 */
	List<User> selectUserList();

	/**
	 * 임시 비밀번호 Service
	 * @param uOne
	 * @return
	 */
	int updateUserPw(User uOne);

}
