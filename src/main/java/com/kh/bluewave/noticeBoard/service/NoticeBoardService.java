package com.kh.bluewave.noticeBoard.service;

import java.util.List;

import com.kh.bluewave.noticeBoard.domain.NoticeBoard;
import com.kh.bluewave.noticeBoard.domain.PageInfo;

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
	List<NoticeBoard> selectNoticeBoard(PageInfo pInfo);

	/**
	 * 공지 게시물 전체 갯수
	 * @return
	 */
	int getListCount();

	/**
	 * 공지 게시글 상세조회
	 * @param noticeNo
	 * @return
	 */
	NoticeBoard selectOneNoticeNo(int noticeNo);

	/**
	 * 공지 게시글 수정
	 * @param noticeBoard
	 * @return
	 */
	int updateNotice(NoticeBoard noticeBoard);

	/**
	 * 공지 조회수 증가
	 * @param noticeNo
	 * @return
	 */
	int updateViewCount(NoticeBoard nOne);

	/**
	 * 공지 게시물 삭제
	 * @param noticeNo
	 * @return
	 */
	int deleteNotice(int noticeNo);

}
