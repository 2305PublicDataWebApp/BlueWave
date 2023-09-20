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
	 * 챌린지 게시물 수정 Store
	 * @param session
	 * @param cBoard
	 * @return int
	 */
	int updateCBoard(SqlSession session, CBoard cBoard);
	
	/**
	 * 챌린지 게시물 삭제 Store
	 * @param session
	 * @param cBoardNo
	 * @return int
	 */
	int deleteCBoard(SqlSession session, Integer cBoardNo);

	/**
	 * 챌린지 게시물 list로 가져오는 Store
	 * @param session
	 * @param chalNo
	 * @return List<CBoard>
	 */
	List<CBoard> selectCBoardByNo(SqlSession session, int chalNo);

	/**
	 * 회원이 좋아요를 한 게시물 리스트 조회 Store
	 * @param session
	 * @param userId
	 * @return List<CBoard>
	 */
	List<CBoard> selectAllLikePostsById(SqlSession session, String userId);
	
	/**
	 * cBoardNo에 해당하는 챌린지 게시물 select Store
	 * @param session
	 * @param cBoardNo
	 * @return CBoard
	 */
	CBoard selectOneByCBoardNo(SqlSession session, int cBoardNo);

}
