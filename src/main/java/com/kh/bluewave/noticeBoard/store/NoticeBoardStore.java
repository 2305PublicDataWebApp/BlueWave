package com.kh.bluewave.noticeBoard.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.bluewave.noticeBoard.domain.NoticeBoard;
import com.kh.bluewave.noticeBoard.domain.PageInfo;

public interface NoticeBoardStore {

	/**
	 * 공지 게시글 등록
	 * @param session
	 * @param noticeBoard
	 * @return
	 */
	int insertNoticeBoard(SqlSession session, NoticeBoard noticeBoard);

	/**
	 * 공지 리스트 조회
	 * @param session
	 * @return
	 */
	List<NoticeBoard> selectNoticeBoard(SqlSession session, PageInfo pInfo);

	/**
	 * 공지 게시물 전체 갯수
	 * @param session
	 * @return
	 */
	int getListCount(SqlSession session);

	/**
	 * 공지 게시글 상세조회
	 * @param session
	 * @param noticeNo
	 * @return
	 */
	NoticeBoard selectOneNoticeNo(SqlSession session, int noticeNo);

	/**
	 * 공지 게시글 수정
	 * @param session
	 * @param noticeBoard
	 * @return
	 */
	int updateNotice(SqlSession session, NoticeBoard noticeBoard);

	/**
	 * 공지 조회수 증가
	 * @param session
	 * @param noticeNo
	 * @return
	 */
	int updateViewCount(SqlSession session, NoticeBoard nOne);

	/**
	 * 공지 게시물 삭제
	 * @param session
	 * @param noticeNo
	 * @return
	 */
	int deleteNotice(SqlSession session, int noticeNo);

}
