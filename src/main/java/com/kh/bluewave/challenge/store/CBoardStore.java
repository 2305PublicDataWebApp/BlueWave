package com.kh.bluewave.challenge.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.bluewave.challenge.domain.CBoard;

public interface CBoardStore {
	
	/**
	 * 챌린지 게시물 작성 Store
	 * @param session
	 * @param cBoard
	 * @return int
	 */
	int insertCBoard(SqlSession session, CBoard cBoard);
	
	/**
	 * 챌린지 게시물 list로 가져오는 Store
	 * @param session
	 * @param chalNo
	 * @return List<CBoard>
	 */
	List<CBoard> selectCBoardByNo(SqlSession session, int chalNo);

}
