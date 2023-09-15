package com.kh.bluewave.challenge.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.bluewave.challenge.domain.Challenge;

public interface ChallengeStore {

	/**
	 * 챌린지 생성 Store
	 * @param session
	 * @param challenge
	 * @return
	 */
	int insertChal(SqlSession session, Challenge challenge);

	/**
	 * 챌린지 수정 Store
	 * @param session
	 * @param challenge
	 * @return
	 */
	int updateChal(SqlSession session, Challenge challenge);

	/**
	 * 챌린지 삭제 Store
	 * @param session
	 * @param chalNo
	 * @return
	 */
	int deleteChal(SqlSession session, int chalNo);

	/**
	 * 챌린지 번호로 챌린지 조회 Store
	 * @param session
	 * @param chalNo
	 * @return
	 */
	Challenge selectOneByNo(SqlSession session, int chalNo);

	/**
	 * 챌린지 명으로 챌린지 조회 Store
	 * @param session
	 * @param chalTitle
	 * @return
	 */
	Challenge selectOneByTitle(SqlSession session, String chalTitle);

	/**
	 * 회원 아이디로 챌린지 리스트 조회 Store
	 * @param session
	 * @param userId
	 * @return
	 */
	List<Challenge> selectAllById(SqlSession session, String userId);

}
