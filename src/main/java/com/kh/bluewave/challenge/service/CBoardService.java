package com.kh.bluewave.challenge.service;

import java.util.List;

import com.kh.bluewave.challenge.domain.CBoard;
import com.kh.bluewave.challenge.domain.Challenge;

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

	/**
	 * 회원이 좋아요를 한 게시물 리스트 조회 Service
	 * @param userId
	 * @return
	 */
	List<CBoard> selectAllLikePostsById(String userId);

	/**
	 * 좋아요 게시물 번호로 내용 조회 Service
	 * @param cBoardNo
	 * @return
	 */
	CBoard selectLikePostInfoByCBoardNo(int cBoardNo);

}
