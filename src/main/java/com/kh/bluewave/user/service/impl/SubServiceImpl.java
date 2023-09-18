package com.kh.bluewave.user.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bluewave.user.service.SubService;
import com.kh.bluewave.user.store.SubStore;

@Service
public class SubServiceImpl implements SubService{
	
	@Autowired
	private SubStore sStore;
	@Autowired
	private SqlSession session;
	
	@Override
	public int selectFollowingCntById(String userId) {
		int result = sStore.selectFollowingCntById(session, userId);
		return result;
	}

	@Override
	public int selectFollowersCntById(String userId) {
		int result = sStore.selectFollowersCntById(session, userId);
		return result;
	}
}
