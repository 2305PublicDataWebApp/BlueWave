package com.kh.bluewave.challenge.service;

import java.util.List;

import com.kh.bluewave.challenge.domain.Challenge;

public interface ChallengeService {

	/**
	 * 챌린지 생성 Service
	 * @param challenge
	 * @return
	 */
	int insertChal(Challenge challenge);

	/**
	 * 챌린지 수정 Service
	 * @param challenge
	 * @return
	 */
	int updateChal(Challenge challenge);

	/**
	 * 챌린지 삭제 Service
	 * @param chalNo
	 * @return
	 */
	int deleteChal(int chalNo);

	/**
	 * 챌린지 번호로 챌린지 조회 Service
	 * @param chalNo
	 * @return
	 */
	Challenge selectOneByNo(int chalNo);

	/**
	 * 챌린지 명으로 챌린지 조회 Service
	 * @param chalTitle
	 * @return
	 */
	Challenge selectOneByTitle(String chalTitle);

	/**
	 * 회원 아이디로 챌린지 리스트 조회 Service
	 * @param userId
	 * @return
	 */
	List<Challenge> selectAllById(String userId);
}
