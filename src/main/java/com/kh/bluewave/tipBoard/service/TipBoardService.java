package com.kh.bluewave.tipBoard.service;

import java.util.List;

import com.kh.bluewave.tipBoard.domain.TipBoard;
import com.kh.bluewave.noticeBoard.domain.PageInfo;

public interface TipBoardService {

	/**
	 * 팁공유 게시물 등록
	 * @param TipBoard
	 * @return
	 */
	int insertTipBoard(TipBoard TipBoard);

	/**
	 * 팁공유 리스트 조회
	 * @return
	 */
	List<TipBoard> selectTipBoard(PageInfo pInfo);

	/**
	 * 팁공유 게시물 전체 갯수
	 * @return
	 */
	int getListCount();

	/**
	 * 팁공유 게시글 상세조회
	 * @param tipNo
	 * @return
	 */
	TipBoard selectOneTipNo(int tipNo);

	/**
	 * 팁공유 게시글 수정
	 * @param TipBoard
	 * @return
	 */
	int updateTip(TipBoard tipBoard);

	/**
	 * 팁공유 조회수 증가
	 * @param tipNo
	 * @return
	 */
	int updateViewCount(TipBoard tOne);

	/**
	 * 팁공유 게시물 삭제
	 * @param tipNo
	 * @return
	 */
	int deleteTip(int tipNo);

}
