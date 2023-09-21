package com.kh.bluewave.challenge.service;

import java.util.List;

import com.kh.bluewave.challenge.domain.CBoard;
import com.kh.bluewave.challenge.domain.Challenge;
import com.kh.bluewave.point.domain.Point;

public interface CBoardService {
	
	/**
	 * 챌린지 게시물 작성 Service
	 * @param cBoard
	 * @return int
	 */
	int writeCBoard(CBoard cBoard);
	
	/**
	 * 챌린지 게시물 수정 Service
	 * @param cBoard
	 * @return int
	 */
	int modifyCBoard(CBoard cBoard);
	
	/**
	 * 챌린지 게시물 삭제 Service
	 * @param cBoardNo
	 * @return
	 */
	int removeCBoard(Integer cBoardNo);

	/**
	 * 챌린지 게시물 list로 가져오는 Service
	 * @param chalNo
	 * @return List<CBoard>
	 */
	List<CBoard> findCBoardByNo(int chalNo);

	/**
	 * 회원 챌린지 게시물 list로 가져오는 Service
	 * @param cBoard
	 * @return
	 */
	List<CBoard> findCBoardByWriterAndNo(CBoard cBoard);

	/**
	 * 회원이 좋아요를 한 게시물 리스트 조회 Service
	 * @param userId
	 * @return List<CBoard>
	 */
	List<CBoard> selectAllLikePostsById(String userId);
	
	/**
	 * cBoardNo에 해당하는 챌린지 게시물 select Service
	 * @param cBoardNo
	 * @return CBoard
	 */
	CBoard selectOneByCBoardNo(int cBoardNo);

	/**
	 * 좋아요 게시물 번호로 내용 조회 Service
	 * @param cBoardNo
	 * @return
	 */
	CBoard selectLikePostInfoByCBoardNo(int cBoardNo);
	
	/**
	 * 해당 챌린지 명 안에 게시물 갯수 조회 Service
	 * @return
	 */
	List<CBoard> selectBoardCountList();
	
	/**
	 * 해당 챌린지 게시물에 찍힌 좋아요 수 조회 Service
	 * @return
	 */
	List<CBoard> selectBoardLikeCountList();
	
	/**
	 * 해당 유저 아이디가 작성한 최신 챌린지 게시물 조회 Service
	 * @param userId
	 * @return CBoard
	 */
	CBoard selectOneByCDate(String userId);
	
	/**
	 * 해당 유저 아이디의 최신 포인트 내역 조회 Service
	 * @param userId
	 * @return Point
	 */
	Point selectOneByLastHistory(String userId);
	
	/**
	 * 챌린지 게시물 작성 시 포인트 적립
	 * @param point
	 * @return int
	 */
	int rewardPointByCBoard(Point point);

}
