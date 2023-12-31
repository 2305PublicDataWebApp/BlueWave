package com.kh.bluewave.user.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bluewave.challenge.domain.CBoard;
import com.kh.bluewave.challenge.domain.Challenge;
import com.kh.bluewave.goods.domain.Goods;
import com.kh.bluewave.noticeBoard.domain.PageInfo;
import com.kh.bluewave.user.domain.Sub;
import com.kh.bluewave.user.domain.User;
import com.kh.bluewave.user.service.UserService;
import com.kh.bluewave.user.store.UserStore;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserStore uStore;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public User checkUserLogin(User user) {
		User uOne = uStore.checkUserLogin(session, user);
		return uOne;
	}

	@Override
	public int deleteUser(String userId) {
		int result = uStore.deleteUser(session, userId);
		return result;
	}

	@Override
	public int updateMember(User user) {
		int result = uStore.updateUser(session, user);
		return result;
	}

	@Override
	public int insertUser(User user) {
		int result = uStore.insertUser(session, user);
		return result;
	}

	@Override
	public User selectOneById(User user) {
		User uOne = uStore.selectOneById(session, user);
		return uOne;
	}

	@Override
	public int getPostCountByUserId(String userId) {
		int result = uStore.getPostCountByUserId(session, userId);
		return result;
	}

	@Override
	public int getTotalPointByUserId(String userId) {
		int result = uStore.getTotalPointByUserId(session, userId);
		return result;
	}

	@Override
	public int getTotalBlueChalCount(String userId) {
		int result = uStore.getTotalBlueChalCount(session, userId);
		return result;
	}

	@Override
	public int getTotalPersonalChalCount(String userId) {
		int result = uStore.getTotalPersonalChalCount(session, userId);
		return result;
	}

	@Override
	public User findUserByEmail(String email) {
		User uOne = uStore.findUserByEmail(session, email);
		return uOne;
	}


	@Override
	public List<Goods> getGoodsListByUserId(String userId) {
		List<Goods> goodsList = uStore.getGoodsListByUserId(session, userId);
		return goodsList;
	}

	@Override
	public int getFinishTotalBlueChalCount(String userId) {
		int result = uStore.getFinishTotalBlueChalCount(session, userId);
		return result;
	}

	@Override
	public int getFinishTotalPersonalChalCount(String userId) {
		int result = uStore.getFinishTotalPersonalChalCount(session, userId);
		return result;
	}

	@Override
	public int emailCheck(String userEmail) {
		int result = uStore.emailCheck(session, userEmail);
		return result;
	}

	@Override
	public int nickNameCheck(String userNickName) {
		int result = uStore.nickNameCheck(session, userNickName);
		return result;
	}

	@Override
	public int idCheck(String userId) {
		int result = uStore.idCheck(session, userId);
		return result;
	}

	@Override
	public List<Sub> selectAllFollowingListById(String userId) {
		List<Sub> sList = uStore.selectAllFollowingListById(session, userId);
		return sList;
	}

	@Override
	public List<Sub> selectAllFollowersListById(String userId) {
		List<Sub> sList = uStore.selectAllFollowersListById(session, userId);
		return sList;
	}

	@Override
	public User selectOneByChalNo(String chalWriter) {
		User uOne = uStore.selectOneByChalNo(session, chalWriter);
		return uOne;
	}

	@Override
	public List<User> selectUserList(PageInfo pInfo) {
		List<User> uList = uStore.selectUserList(session, pInfo);
		return uList;
	}

	@Override
	public int getListCount() {
		int result = uStore.getListCount(session);
		return result;
	}
	
	@Override
	public List<Challenge> getTodayCList(String userId) {
		List<Challenge> todayCList = uStore.getTodayCList(session, userId);
		return todayCList;
	}

	@Override
	public List<CBoard> getCalDateList(String userId) {
		List<CBoard> calDateList = uStore.getCalDateList(session, userId);
		return calDateList;
	}

	@Override
	public int insertPoint(User user) {
		int result = uStore.insertPoint(session, user);
		return result;
	}

	@Override
	public int followUser(Sub sub) {
		int result = uStore.followUser(session, sub);
		return result;
	}

	@Override
	public int unfollowUser(Sub sub) {
		int result = uStore.unfollowUser(session, sub);
		return result;
	}

	@Override
	public int isFollowing(Sub sub) {
		int result = uStore.isFollowing(session, sub);
		return result;
	}

	@Override
	public List<User> selectUserList() {
		List<User> uList = uStore.selectUserList(session);
		return uList;
	}

	@Override
	public int updateUserPw(User uOne) {
		int result = uStore.updateUserPw(session, uOne);
		return result;
	}


}
