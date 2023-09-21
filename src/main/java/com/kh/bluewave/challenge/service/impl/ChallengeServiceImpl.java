package com.kh.bluewave.challenge.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bluewave.challenge.domain.CLike;
import com.kh.bluewave.challenge.domain.Challenge;
import com.kh.bluewave.challenge.service.ChallengeService;
import com.kh.bluewave.challenge.store.ChallengeStore;
import com.kh.bluewave.noticeBoard.domain.PageInfo;

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
	public Challenge selectOneByTitle(Challenge challenge) {
		Challenge cOne = cStore.selectOneByTitle(session, challenge);
		return cOne;
	}

	@Override
	public List<Challenge> selectAllById(String userId) {
		List<Challenge> cList = cStore.selectAllById(session, userId);
		return cList;
	}

	@Override
	public List<Challenge> selectOtherAllById(String userId) {
		List<Challenge> cList = cStore.selectOtherAllById(session, userId);
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
	public List<Challenge> selectListByChal() {
		List<Challenge> cList = cStore.selectAllChallenges(session);
		return cList;
	}

	@Override
	public int findInsertChalNo(Challenge challenge) {
		int result = cStore.findInsertChalNo(session, challenge);
		return result;
	}

	@Override
	public List<Challenge> searchChalByKeyword(Map<String, String> searchMap) {
		List<Challenge> cList = cStore.selectChalByKeyword(session, searchMap);
		return cList;
	}

	@Override
	public int getListCount() {
		int result = cStore.getListCount(session);
		return result;
	}

	@Override
	public List<Challenge> selectChallList(PageInfo pInfo) {
		List<Challenge> cList = cStore.selectChallList(session, pInfo);
		return cList;
	}

	@Override
	public List<Challenge> selectAllLikeCnt() {
		List<Challenge> cLikeList = cStore.selectAllLikeCnt(session);
		return cLikeList;
	}

}
