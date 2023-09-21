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

	@Override
	public List<CLike> selectListByUserIdCBoardNo(SqlSession session, CLike cLOne) {
		List<CLike> checkCLike = session.selectList("CLikeMapper.selectListByUserIdCBoardNo", cLOne);
		return checkCLike;
	}

	@Override
	public int insertCLike(SqlSession session, CLike cLOne) {
		int result = session.insert("CLikeMapper.insertCLike", cLOne);
		return result;
	}

	@Override
	public int deleteCLike(SqlSession session, CLike cLOne) {
		int result = session.delete("CLikeMapper.deleteCLike", cLOne);
		return result;
	}

	@Override
	public List<CLike> checkIsLiked(SqlSession session, String userId) {
		List<CLike> isLiked = session.selectList("CLikeMapper.checkIsLiked", userId);
		return isLiked;
	}
}
