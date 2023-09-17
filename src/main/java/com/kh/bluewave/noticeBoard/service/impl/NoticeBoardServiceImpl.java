package com.kh.bluewave.noticeBoard.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bluewave.noticeBoard.domain.NoticeBoard;
import com.kh.bluewave.noticeBoard.service.NoticeBoardService;
import com.kh.bluewave.noticeBoard.store.NoticeBoardStore;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService{
	
	@Autowired
	private NoticeBoardStore nStore;
	@Autowired
	private SqlSession session;

	@Override
	public int insertNoticeBoard(NoticeBoard noticeBoard) {
		int result = nStore.insertNoticeBoard(session, noticeBoard);
		return result;
	}

	@Override
	public List<NoticeBoard> selectNoticeBoard() {
		List<NoticeBoard> nList = nStore.selectNoticeBoard(session);
		return nList;
	}

}
