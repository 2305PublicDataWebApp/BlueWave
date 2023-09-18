package com.kh.bluewave.noticeBoard.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bluewave.noticeBoard.domain.NoticeBoard;
import com.kh.bluewave.noticeBoard.domain.PageInfo;
import com.kh.bluewave.noticeBoard.store.NoticeBoardStore;

@Repository
public class NoticeBoardStoreLogic implements NoticeBoardStore{

	@Override
	public int insertNoticeBoard(SqlSession session, NoticeBoard noticeBoard) {
		int result = session.insert("NoticeMapper.insertNoticeBoard", noticeBoard);
		return result;
	}

	@Override
	public List<NoticeBoard> selectNoticeBoard(SqlSession session, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<NoticeBoard> nList = session.selectList("NoticeMapper.selectNoticeBoard", null, rowBounds);
		return nList;
	}

	@Override
	public int getListCount(SqlSession session) {
		int result = session.selectOne("NoticeMapper.selectListCount");
		return result;
	}

	@Override
	public NoticeBoard selectOneNoticeNo(SqlSession session, int noticeNo) {
		NoticeBoard nOne = session.selectOne("NoticeMapper.selectOneNoticeNo", noticeNo);
		return nOne;
	}

}
