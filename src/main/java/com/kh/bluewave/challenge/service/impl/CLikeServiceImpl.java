package com.kh.bluewave.challenge.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bluewave.challenge.domain.CLike;
import com.kh.bluewave.challenge.service.CLikeService;
import com.kh.bluewave.challenge.store.CLikeStore;

@Service
public class CLikeServiceImpl implements CLikeService{
	
	@Autowired
	private CLikeStore cLStore;
	@Autowired
	private SqlSession session;
	
	@Override
	public List<CLike> selectAllLikeCnt() {
		List<CLike> cLList = cLStore.selectAllLikeCnt(session);
		return cLList;
	}
}
