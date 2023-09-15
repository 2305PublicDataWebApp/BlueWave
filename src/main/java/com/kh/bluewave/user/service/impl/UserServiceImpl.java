package com.kh.bluewave.user.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	

}
