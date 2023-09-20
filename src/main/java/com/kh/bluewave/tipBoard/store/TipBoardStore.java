package com.kh.bluewave.tipBoard.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.bluewave.tipBoard.domain.PageInfo;
import com.kh.bluewave.tipBoard.domain.TipBoard;

public interface TipBoardStore {

	/**
	 * 팁공유 게시글 등록
	 * @param session
	 * @param noticeBoard
	 * @return
	 */
	int insertTipBoard(SqlSession session, TipBoard tipBoard);

	/**
	 * 팁공유 리스트 조회
	 * @param session
	 * @return
	 */
	List<TipBoard> selectTipBoard(SqlSession session, PageInfo pInfo);

	/**
	 * 팁공유 게시물 전체 갯수
	 * @param session
	 * @return
	 */
	int getListCount(SqlSession session);

	/**
	 * 팁공유 게시글 상세조회
	 * @param session
	 * @param noticeNo
	 * @return
	 */
	TipBoard selectOneTipNo(SqlSession session, int noticeNo);

	/**
	 * 팁공유 게시글 수정
	 * @param session
	 * @param noticeBoard
	 * @return
	 */
	int updateTip(SqlSession session, TipBoard tipBoard);

	/**
	 * 팁공유 조회수 증가
	 * @param session
	 * @param noticeNo
	 * @return
	 */
	int updateViewCount(SqlSession session, TipBoard tOne);

	/**
	 * 팁공유 게시물 삭제
	 * @param session
	 * @param noticeNo
	 * @return
	 */
	int deleteTip(SqlSession session, int tipNo);

}
