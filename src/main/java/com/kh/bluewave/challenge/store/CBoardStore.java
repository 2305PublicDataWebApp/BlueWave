package com.kh.bluewave.challenge.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.bluewave.challenge.domain.CBoard;
import com.kh.bluewave.point.domain.Point;

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
	 * 회원 챌린지 게시물 list로 가져오는 Store
	 * @param session
	 * @param cBoard
	 * @return
	 */
	List<CBoard> selectCBoardByWriterAndNo(SqlSession session, CBoard cBoard);

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

	/**
	 * 좋아요 게시물 번호로 내용 조회 Store
	 * @param session
	 * @param cBoardNo
	 * @return CBoard
	 */
	CBoard selectLikePostInfoByCBoardNo(SqlSession session, int cBoardNo);

	/**
	 * 해당 chalNo에 해당하는 게시물 갯수 조회
	 * @param session
	 * @return List<CBoard>
	 */
	List<CBoard> selectBoardCountList(SqlSession session);

	/**
	 * 챌린지 게시물에 찍힌 총 좋아요 수 조회 Store
	 * @param session
	 * @return List<CBoard>
	 */
	List<CBoard> selectBoardLikeCountList(SqlSession session);
	
	/**
	 * 해당 유저 아이디가 작성한 최신 챌린지 게시물 조회
	 * @param session
	 * @param userId
	 * @return CBoard
	 */
	CBoard selectOneByCDate(SqlSession session, String userId);

	/**
	 * 해당 유저 아이디의 최신 포인트 내역 조회
	 * @param session
	 * @param userId
	 * @return Point
	 */
	Point selectOneByLastHistory(SqlSession session, String userId);
	
	/**
	 * 챌린지 게시물 작성 시 포인트 적립
	 * @param session
	 * @param point
	 * @return int
	 */
	int rewardPointByCBoard(SqlSession session, Point point);

}
