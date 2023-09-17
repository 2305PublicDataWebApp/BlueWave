package com.kh.bluewave.noticeBoard.service;

import java.util.List;

import com.kh.bluewave.noticeBoard.domain.NoticeBoard;

public interface NoticeBoardService {

	/**
	 * 공지 게시물 등록
	 * @param noticeBoard
	 * @return
	 */
	int insertNoticeBoard(NoticeBoard noticeBoard);

	/**
	 * 공지 리스트 조회
	 * @return
	 */
	List<NoticeBoard> selectNoticeBoard();

}
