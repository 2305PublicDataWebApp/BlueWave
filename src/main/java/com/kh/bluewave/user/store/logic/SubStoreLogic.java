package com.kh.bluewave.user.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bluewave.user.store.SubStore;

@Repository
public class SubStoreLogic implements SubStore {

	@Override
	public int selectFollowingCntById(SqlSession session, String userId) {
		int result = session.selectOne("SubMapper.selectFollowingCntById", userId);
		return result;
	}

	@Override
	public int selectFollowersCntById(SqlSession session, String userId) {
		int result = session.selectOne("SubMapper.selectFollowersCntById", userId);
		return result;
	}
}
