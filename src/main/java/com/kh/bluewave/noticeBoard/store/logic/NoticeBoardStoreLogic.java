package com.kh.bluewave.noticeBoard.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bluewave.noticeBoard.domain.NoticeBoard;
import com.kh.bluewave.noticeBoard.store.NoticeBoardStore;

@Repository
public class NoticeBoardStoreLogic implements NoticeBoardStore{

	@Override
	public int insertNoticeBoard(SqlSession session, NoticeBoard noticeBoard) {
		int result = session.insert("NoticeMapper.insertNoticeBoard", noticeBoard);
		return result;
	}

	@Override
	public List<NoticeBoard> selectNoticeBoard(SqlSession session) {
		List<NoticeBoard> nList = session.selectList("NoticeMapper.selectNoticeBoard");
		return nList;
	}

}
