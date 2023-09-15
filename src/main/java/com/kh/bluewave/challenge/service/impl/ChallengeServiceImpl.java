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

}
