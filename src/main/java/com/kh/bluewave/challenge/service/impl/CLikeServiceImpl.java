package com.kh.bluewave.challenge.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bluewave.challenge.domain.CBoard;
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
	
	
	@Override
	public List<CLike> selectListByUserIdCBoardNo(CLike cLOne) {
		List<CLike> checkCLike = cLStore.selectListByUserIdCBoardNo(session, cLOne);
		return checkCLike;
	}


	@Override
	public int insertCLike(CLike cLOne) {
		int result = cLStore.insertCLike(session, cLOne);
		return result;
	}


	@Override
	public int deleteCLike(CLike cLOne) {
		int result = cLStore.deleteCLike(session, cLOne);
		return result;
	}


	@Override
	public List<CLike> checkIsLiked(String userId) {
		List<CLike> isLiked = cLStore.checkIsLiked(session, userId);
		return isLiked;
	}

}
