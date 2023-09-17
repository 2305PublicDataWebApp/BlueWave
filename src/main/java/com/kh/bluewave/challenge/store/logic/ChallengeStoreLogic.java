package com.kh.bluewave.challenge.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bluewave.challenge.domain.Challenge;
import com.kh.bluewave.challenge.store.ChallengeStore;

@Repository
public class ChallengeStoreLogic implements ChallengeStore{

	@Override
	public int insertChal(SqlSession session, Challenge challenge) {
		int result = session.insert("ChalMapper.insertChal", challenge);
		return result;
	}

	@Override
	public int updateChal(SqlSession session, Challenge challenge) {
		int result = session.update("ChalMapper.updateChal", challenge);
		return result;
	}

	@Override
	public int updateFinish(SqlSession session) {
		int result = session.update("ChalMapper.updateFinish");
		return result;
	}

	@Override
	public int deleteChal(SqlSession session, int chalNo) {
		int result = session.delete("ChalMapper.deleteChal", chalNo);
		return result;
	}

	@Override
	public Challenge selectOneByNo(SqlSession session, int chalNo) {
		Challenge cOne = session.selectOne("ChalMapper.selectOneByNo", chalNo);
		return cOne;
	}

	@Override
	public Challenge selectOneByTitle(SqlSession session, String chalTitle) {
		Challenge cOne = session.selectOne("ChalMapper.selectOneByTitle", chalTitle);
		return cOne;
	}

	@Override
	public List<Challenge> selectAllById(SqlSession session, String userId) {
		List<Challenge> cList = session.selectList("ChalMapper.selectAllById", userId);
		return cList;
	}

	@Override
	public List<Challenge> selectAllUserWave(SqlSession session, String userId) {
		List<Challenge> cList = session.selectList("ChalMapper.selectAllUserWave", userId);
		return cList;
	}

	@Override
	public List<Challenge> selectLikeById(SqlSession session, String userId) {
		List<Challenge> cList = session.selectList("ChalMapper.selectLikeById", userId);
		return cList;
	}

	@Override
	public List<Challenge> selectLikeByAllUserWave(SqlSession session, String userId) {
		List<Challenge> cList = session.selectList("ChalMapper.selectLikeByAllUserWave", userId);
		return cList;
	}

	@Override
	public List<Challenge> selectPeopleByAllUserWave(SqlSession session, String userId) {
		List<Challenge> cList = session.selectList("ChalMapper.selectPeopleByAllUserWave", userId);
		return cList;
	}

	@Override
	public List<Challenge> selectOptionsByFinish(SqlSession session, String finishOption) {
		List<Challenge> cList = session.selectList("ChalMapper.selectOptionsByFinish", finishOption);
		return cList;
	}

}
