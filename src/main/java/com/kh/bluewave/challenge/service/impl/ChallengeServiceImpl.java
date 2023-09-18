package com.kh.bluewave.challenge.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bluewave.challenge.domain.Challenge;
import com.kh.bluewave.challenge.service.ChallengeService;
import com.kh.bluewave.challenge.store.ChallengeStore;

@Service
public class ChallengeServiceImpl implements ChallengeService {
	
	@Autowired
	private ChallengeStore cStore;
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertChal(Challenge challenge) {
		int result = cStore.insertChal(session, challenge);
		return result;
	}

	@Override
	public int updateChal(Challenge challenge) {
		int result = cStore.updateChal(session, challenge);
		return result;
	}

	@Override
	public int updateFinish() {
		int result = cStore.updateFinish(session);
		return result;
	}

	@Override
	public int deleteChal(int chalNo) {
		int result = cStore.deleteChal(session, chalNo);
		return result;
	}

	@Override
	public Challenge selectOneByNo(int chalNo) {
		Challenge cOne = cStore.selectOneByNo(session, chalNo);
		return cOne;
	}

	@Override
	public Challenge selectOneByTitle(String chalTitle) {
		Challenge cOne = cStore.selectOneByTitle(session, chalTitle);
		return cOne;
	}

	@Override
	public List<Challenge> selectAllById(String userId) {
		List<Challenge> cList = cStore.selectAllById(session, userId);
		return cList;
	}

	@Override
	public List<Challenge> selectAllUserWave(String userId) {
		List<Challenge> cList = cStore.selectAllUserWave(session, userId);
		return cList;
	}

	@Override
	public List<Challenge> selectLikeById(String userId) {
		List<Challenge> cList = cStore.selectLikeById(session, userId);
		return cList;
	}

	@Override
	public List<Challenge> selectLikeByAllUserWave(String userId) {
		List<Challenge> cList = cStore.selectLikeByAllUserWave(session, userId);
		return cList;
	}

	@Override
	public List<Challenge> selectPeopleByAllUserWave(String userId) {
		List<Challenge> cList = cStore.selectPeopleByAllUserWave(session, userId);
		return cList;
	}

	@Override
	public List<Challenge> selectPostsById(String userId) {
		List<Challenge> cList = cStore.selectPostsById(session, userId);
		return cList;
	}

	@Override
	public List<Challenge> selectOptionsByFinish(String finishOption) {
		List<Challenge> cList = cStore.selectOptionsByFinish(session, finishOption);
		return cList;
	}

}
