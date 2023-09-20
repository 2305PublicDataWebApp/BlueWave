package com.kh.bluewave.noticeBoard.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bluewave.noticeBoard.domain.NoticeBoard;
import com.kh.bluewave.noticeBoard.domain.PageInfo;
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
	public List<NoticeBoard> selectNoticeBoard(PageInfo pInfo) {
		List<NoticeBoard> nList = nStore.selectNoticeBoard(session, pInfo);
		return nList;
	}

	@Override
	public int getListCount() {
		int result = nStore.getListCount(session);
		return result;
	}

	@Override
	public NoticeBoard selectOneNoticeNo(int noticeNo) {
		NoticeBoard nOne = nStore.selectOneNoticeNo(session, noticeNo);
		return nOne;
	}

	@Override
	public int updateNotice(NoticeBoard noticeBoard) {
		int result = nStore.updateNotice(session, noticeBoard);
		return result;
	}

	@Override
	public int updateViewCount(NoticeBoard nOne) {
		int result = nStore.updateViewCount(session, nOne);
		return result;
	}

	@Override
	public int deleteNotice(int noticeNo) {
		int result = nStore.deleteNotice(session, noticeNo);
		return result;
	}

}
