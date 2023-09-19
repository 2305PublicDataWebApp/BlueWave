package com.kh.bluewave.challenge.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bluewave.challenge.domain.CBoard;
import com.kh.bluewave.challenge.service.CBoardService;
import com.kh.bluewave.challenge.store.CBoardStore;

@Service
public class CBoardServiceImpl implements CBoardService{
	
	@Autowired
	private SqlSession session;
	
	@Autowired
	private CBoardStore cStore;
	
	// 챌린지 게시물 작성 ServiceImpl
	@Override
	public int writeCBoard(CBoard cBoard) {
		int result = cStore.insertCBoard(session, cBoard);
		return result;
	}
	
	// 챌린지 게시물 list
	@Override
	public List<CBoard> findCBoardByNo(int chalNo) {
		List<CBoard> cList = cStore.selectCBoardByNo(session, chalNo);
		return cList;
	}
	
	// 좋아요 한 게시물 list
	@Override
	public List<CBoard> selectAllLikePostsById(String userId) {
		List<CBoard> cList = cStore.selectAllLikePostsById(session, userId);
		return cList;
	}

}
