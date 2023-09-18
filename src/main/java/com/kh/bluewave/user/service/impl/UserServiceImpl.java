package com.kh.bluewave.user.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		int postCount = uStore.getPostCountByUserId(session, userId);
		return postCount;
	}

	@Override
	public int getTotalPointByUserId(String userId) {
		int totalPoint = uStore.getTotalPointByUserId(session, userId);
		return totalPoint;
	}

	@Override
	public int getTotalBlueChalCount(String userId) {
		int totalBlueChalCount = uStore.getTotalBlueChalCount(session, userId);
		return totalBlueChalCount;
	}

	@Override
	public int getTotalPersonalChalCount(String userId) {
		int totalPersonalChalCount = uStore.getTotalPersonalChalCount(session, userId);
		return totalPersonalChalCount;
	}

	@Override
	public User findUserByEmail(String email) {
		User uOne = uStore.findUserByEmail(session, email);
		return uOne;
	}

	@Override
	public User findUserByPhone(String phone) {
		User uOne = uStore.findUserByPhone(session, phone);
		return uOne;
	}

//	@Override
//	public List<Goods> getGoodsListByUserId(String userId) {
//		List<Goods> goodsList = uStore.getGoodsListByUserId(session, userId);
//		return goodsList;
//	}
	

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
}
