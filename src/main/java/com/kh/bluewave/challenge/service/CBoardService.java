package com.kh.bluewave.challenge.service;

import java.util.List;

import com.kh.bluewave.challenge.domain.CBoard;

public interface CBoardService {
	
	/**
	 * 챌린지 게시물 작성 Service
	 * @param cBoard
	 * @return int
	 */
	int writeCBoard(CBoard cBoard);
	
	/**
	 * 챌린지 게시물 list로 가져오는 Service
	 * @param chalNo
	 * @return List<CBoard>
	 */
	List<CBoard> findCBoardByNo(int chalNo);

}
