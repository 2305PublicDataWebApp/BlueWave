package com.kh.bluewave.challenge.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bluewave.challenge.domain.CLike;
import com.kh.bluewave.challenge.store.CLikeStore;

@Repository
public class CLikeStoreLogic implements CLikeStore{

	@Override
	public List<CLike> selectAllLikeCnt(SqlSession session) {
		List<CLike> cLList = session.selectList("CLikeMapper.selectAllLikeCnt");
		return cLList;
	}

}
