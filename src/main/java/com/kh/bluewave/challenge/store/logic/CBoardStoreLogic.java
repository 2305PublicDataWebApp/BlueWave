package com.kh.bluewave.challenge.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bluewave.challenge.domain.CBoard;
import com.kh.bluewave.challenge.store.CBoardStore;

@Repository
public class CBoardStoreLogic implements CBoardStore{
	
	
	// 챌린지 게시물 작성
	@Override
	public int insertCBoard(SqlSession session, CBoard cBoard) {
		int result = session.insert("CBoardMapper.insertCBoard", cBoard);
		return result;
	}
	
	// 챌린지 게시물 수정
	@Override
	public int updateCBoard(SqlSession session, CBoard cBoard) {
		int result = session.update("CBoardMapper.updateCBoard", cBoard);
		return result;
	}
	
	// 챌린지 게시물 삭제
	@Override
	public int deleteCBoard(SqlSession session, Integer cBoardNo) {
		int result = session.delete("CBoardMapper.deleteCBoard", cBoardNo);
		return result;
	}

	// 챌린지 게시물 list
	@Override
	public List<CBoard> selectCBoardByNo(SqlSession session, int chalNo) {
		List<CBoard> cList = session.selectList("CBoardMapper.selectCBoardByNo", chalNo);
		return cList;
	}
	
	// 좋아요 한 게시물 list
	@Override
	public List<CBoard> selectAllLikePostsById(SqlSession session, String userId) {
		List<CBoard> cList = session.selectList("CBoardMapper.selectAllLikePostsById", userId);
		return cList;
	}
	
	// cBoardNo로 챌린지 게시물 1개 select
	@Override
	public CBoard selectOneByCBoardNo(SqlSession session, int cBoardNo) {
		CBoard cBOne = session.selectOne("CBoardMapper.selectOneByCBoardNo", cBoardNo);
		return cBOne;
	}

	
}
