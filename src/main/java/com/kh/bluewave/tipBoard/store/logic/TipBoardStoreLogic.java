package com.kh.bluewave.tipBoard.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bluewave.noticeBoard.domain.PageInfo;
import com.kh.bluewave.tipBoard.domain.TipBoard;
import com.kh.bluewave.tipBoard.store.TipBoardStore;

@Repository
public class TipBoardStoreLogic implements TipBoardStore{

	@Override
	public int insertTipBoard(SqlSession session, TipBoard tipBoard) {
		int result = session.insert("TipMapper.insertTipBoard", tipBoard);
		return result;
	}

	@Override
	public List<TipBoard> selectTipBoard(SqlSession session, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<TipBoard> nList = session.selectList("TipMapper.selectTipBoard", null, rowBounds);
		return nList;
	}

	@Override
	public int getListCount(SqlSession session) {
		int result = session.selectOne("TipMapper.selectListCount");
		return result;
	}

	@Override
	public TipBoard selectOneTipNo(SqlSession session, int tipNo) {
		TipBoard nOne = session.selectOne("TipMapper.selectOneTipNo", tipNo);
		return nOne;
	}

	@Override
	public int updateTip(SqlSession session, TipBoard tipBoard) {
		int result = session.update("TipMapper.updateTip", tipBoard);
		return result;
	}

	@Override
	public int updateViewCount(SqlSession session, TipBoard tOne) {
		int result = session.update("TipMapper.updateViewCount", tOne);
		return result;
	}

	@Override
	public int deleteTip(SqlSession session, int tipNo) {
		int result = session.delete("TipMapper.deleteTip", tipNo);
		return result;
	}

}
