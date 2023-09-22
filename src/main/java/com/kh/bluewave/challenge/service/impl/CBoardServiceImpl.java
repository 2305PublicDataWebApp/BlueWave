package com.kh.bluewave.challenge.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bluewave.challenge.domain.CBoard;
import com.kh.bluewave.challenge.service.CBoardService;
import com.kh.bluewave.challenge.store.CBoardStore;
import com.kh.bluewave.point.domain.Point;

@Service
public class CBoardServiceImpl implements CBoardService{
	
	@Autowired
	private SqlSession session;
	
	@Autowired
	private CBoardStore cStore;
	
	// 챌린지 게시물 작성 
	@Override
	public int writeCBoard(CBoard cBoard) {
		int result = cStore.insertCBoard(session, cBoard);
		return result;
	}
	
	// 챌린지 게시물 수정
	@Override
	public int modifyCBoard(CBoard cBoard) {
		int result = cStore.updateCBoard(session, cBoard);
		return result;
	}

	// 챌린지 게시물 삭제
	@Override
	public int removeCBoard(Integer cBoardNo) {
		int result = cStore.deleteCBoard(session, cBoardNo);
		return result;
	}

	// 챌린지 게시물 list
	@Override
	public List<CBoard> findCBoardByNo(int chalNo) {
		List<CBoard> cList = cStore.selectCBoardByNo(session, chalNo);
		return cList;
	}
	
	// 회원 챌린지 게시물 list
	@Override
	public List<CBoard> findCBoardByWriterAndNo(CBoard cBoard) {
		List<CBoard> cList = cStore.selectCBoardByWriterAndNo(session, cBoard);
		return cList;
	}

	// 좋아요 한 게시물 list
	@Override
	public List<CBoard> selectAllLikePostsById(String userId) {
		List<CBoard> cList = cStore.selectAllLikePostsById(session, userId);
		return cList;
	}
	
	// cBoardNo에 해당하는 챌린지 게시물 select
	@Override
	public CBoard selectOneByCBoardNo(int cBoardNo) {
		CBoard cBOne = cStore.selectOneByCBoardNo(session, cBoardNo);
		return cBOne;
	}


	// 좋아요 게시물 정보
	@Override
	public CBoard selectLikePostInfoByCBoardNo(int cBoardNo) {
		CBoard cOne = cStore.selectLikePostInfoByCBoardNo(session, cBoardNo);
		return cOne;
	}
	
	// 해당 챌린지 명에 대한 게시물 갯수 select
	@Override
	public List<CBoard> selectBoardCountList() {
		List<CBoard> cBoardCNT = cStore.selectBoardCountList(session);
		return cBoardCNT;
	}
	
	// 해당 챌린지 게시물에 찍힌 좋아요 갯수 조회
	@Override
	public List<CBoard> selectBoardLikeCountList() {
		List<CBoard> cBoardLikeCNT = cStore.selectBoardLikeCountList(session);
		return cBoardLikeCNT;
	}
	
	// 해당 유저 아이디가 작성한 최신 챌린지 게시물 조회
	@Override
	public CBoard selectOneByCDate(String userId) {
		CBoard newCBoardOne = cStore.selectOneByCDate(session, userId);
		return newCBoardOne;
	}

	// 해당 유저 아이디의 최신 포인트 내역 조회
	@Override
	public Point selectOneByLastHistory(String userId) {
		Point pOne = cStore.selectOneByLastHistory(session, userId);
		return pOne;
	}
	
	// 챌린지 게시물 작성 시 포인트 적립
	@Override
	public int rewardPointByCBoard(Point point) {
		int result = cStore.rewardPointByCBoard(session, point);
		return result;
	}

	@Override
	public int selectCountPointIsReward(String userId) {
		int result = cStore.selectCountPointIsReward(session, userId);
		return result;
	}

}
