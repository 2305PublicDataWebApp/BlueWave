package com.kh.bluewave.user.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.bluewave.goods.domain.Goods;
import com.kh.bluewave.noticeBoard.domain.PageInfo;
import com.kh.bluewave.user.domain.Sub;
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
	List<Goods> getGoodsListByUserId(SqlSession session, String userId);

	/**
	 * 회원 블루웨이브챌린지 달성 갯수 조회 Store
	 * @param session
	 * @param userId
	 * @return
	 */
	int getFinishTotalBlueChalCount(SqlSession session, String userId);

	/**
	 * 회원 개인챌린지 달성 갯수 조회 Store
	 * @param session
	 * @param userId
	 * @return
	 */
	int getFinishTotalPersonalChalCount(SqlSession session, String userId);

	/**
	 * 이메일 중복체크 Store
	 * @param session
	 * @param userEmail
	 * @return
	 */
	int emailCheck(SqlSession session, String userEmail);

	/**
	 * 닉네임 중복체크 Store
	 * @param session
	 * @param userNickName
	 * @return
	 */
	int nickNameCheck(SqlSession session, String userNickName);

	/**
	 * 아이디 중복체크 Store
	 * @param session
	 * @param userId
	 * @return
	 */
	int idCheck(SqlSession session, String userId);

	/**
	 * 회원의 팔로잉 목록 조회 Store
	 * @param session
	 * @param userId
	 * @return
	 */
	List<Sub> selectAllFollowingListById(SqlSession session, String userId);

	/**
	 * 회원의 팔로워 목록 조회 Store
	 * @param session
	 * @param userId
	 * @return
	 */
	List<Sub> selectAllFollowersListById(SqlSession session, String userId);

	/**
	 * 전체 회원 리스트 조회
	 * @param session
	 * @param pInfo
	 * @return
	 */
	List<User> selectUserList(SqlSession session, PageInfo pInfo);

	/**
	 * 전체 회원수 조회
	 * @param session
	 * @return
	 */
	int getListCount(SqlSession session);
}
