package com.kh.bluewave.challenge.store;

import java.util.List;
import java.util.Map;

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
	 * 모든 회원의 챌린지 완료 여부 체크 Store
	 * @param session
	 * @return
	 */
	int updateFinish(SqlSession session);

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

	/**
	 * 회원 아이디로 공개된 개인 챌린지 리스트 조회 Store
	 * @param session
	 * @param userId
	 * @return
	 */
	List<Challenge> selectOtherAllById(SqlSession session, String userId);

	/**
	 * 관리자 챌린지 중 회원이 참여한 챌린지 리스트 조회 Store
	 * @param session
	 * @param userId
	 * @return
	 */
	List<Challenge> selectAllUserWave(SqlSession session, String userId);
	
	/**
	 * 회원이 참여한 챌린지 리스트의 개별 총 좋아요 수 조회 Store
	 * @param session
	 * @param userId
	 * @return
	 */
	List<Challenge> selectLikeById(SqlSession session, String userId);

	/**
	 * 관리자 챌린지 중 회원이 참여한 챌린지 리스트의 개별 총 좋아요 수 조회 Store
	 * @param session
	 * @param userId
	 * @return
	 */
	List<Challenge> selectLikeByAllUserWave(SqlSession session, String userId);

	/**
	 * 관리자 챌린지 중 회원이 참여한 챌린지 리스트의 개별 총 참여 인원 수 조회 Store
	 * @param session
	 * @param userId
	 * @return
	 */
	List<Challenge> selectPeopleByAllUserWave(SqlSession session, String userId);

	/**
	 * 개별 챌린지 별 해당 회원의 인증 게시물 수 조회 Store
	 * @param session
	 * @param userId
	 * @return
	 */
	List<Challenge> selectPostsById(SqlSession session, String userId);

	/** 
	 * 모든 챌린지 조회 Store
	 * @param session
	 * @return
	 */
	List<Challenge> selectAllChallenges(SqlSession session);

	List<Challenge> selectChalByKeyword(SqlSession session, Map<String, String> searchMap);

	/**
	 * 회원이 방금 생성한 챌린지의 챌린지 번호 조회 Store
	 * @param session
	 * @param challenge
	 * @return
	 */
	int findInsertChalNo(SqlSession session, Challenge challenge);
}
