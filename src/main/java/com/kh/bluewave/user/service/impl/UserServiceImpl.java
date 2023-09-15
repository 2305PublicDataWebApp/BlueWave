package com.kh.bluewave.user.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bluewave.user.service.UserService;
import com.kh.bluewave.user.store.UserStore;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserStore uStore;
	@Autowired
	private SqlSession session;
	
}
