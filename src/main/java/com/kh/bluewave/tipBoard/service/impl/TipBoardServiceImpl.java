package com.kh.bluewave.tipBoard.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bluewave.noticeBoard.domain.PageInfo;
import com.kh.bluewave.tipBoard.domain.TipBoard;
import com.kh.bluewave.tipBoard.service.TipBoardService;
import com.kh.bluewave.tipBoard.store.TipBoardStore;

@Service
public class TipBoardServiceImpl implements TipBoardService{
	
	@Autowired
	private TipBoardStore tStore;
	@Autowired
	private SqlSession session;

	@Override
	public int insertTipBoard(TipBoard tipBoard) {
		int result = tStore.insertTipBoard(session, tipBoard);
		return result;
	}

	@Override
	public List<TipBoard> selectTipBoard(PageInfo pInfo) {
		List<TipBoard> tList = tStore.selectTipBoard(session, pInfo);
		return tList;
	}

	@Override
	public int getListCount() {
		int result = tStore.getListCount(session);
		return result;
	}

	@Override
	public TipBoard selectOneTipNo(int tipNo) {
		TipBoard tOne = tStore.selectOneTipNo(session, tipNo);
		return tOne;
	}

	@Override
	public int updateTip(TipBoard tipBoard) {
		int result = tStore.updateTip(session, tipBoard);
		return result;
	}

	@Override
	public int updateViewCount(TipBoard tOne) {
		int result = tStore.updateViewCount(session, tOne);
		return result;
	}

	@Override
	public int deleteTip(int tipNo) {
		int result = tStore.deleteTip(session, tipNo);
		return result;
	}

}
