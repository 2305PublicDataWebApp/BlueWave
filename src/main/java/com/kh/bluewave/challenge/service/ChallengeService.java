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
	 * 모든 회원의 챌린지 완료 여부 체크 Service
	 * @return
	 */
	int updateFinish();

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

	/**
	 * 회원 아이디로 공개된 개인 챌린지 리스트 조회 Service
	 * @param userId
	 * @return
	 */
	List<Challenge> selectOtherAllById(String userId);

	/**
	 * 관리자 챌린지 중 회원이 참여한 챌린지 리스트 조회 Service
	 * @param userId
	 * @return
	 */
	List<Challenge> selectAllUserWave(String userId);

	/**
	 * 회원이 참여한 챌린지 리스트의 개별 총 좋아요 수 조회 Service
	 * @param userId
	 * @return
	 */
	List<Challenge> selectLikeById(String userId);

	/**
	 * 관리자 챌린지 중 회원이 참여한 챌린지 리스트의 개별 총 좋아요 수 조회 Service
	 * @param userId
	 * @return
	 */
	List<Challenge> selectLikeByAllUserWave(String userId);

	/**
	 * 관리자 챌린지 중 회원이 참여한 챌린지 리스트의 개별 총 참여 인원 수 조회 Service
	 * @param userId
	 * @return
	 */
	List<Challenge> selectPeopleByAllUserWave(String userId);

	/**
	 * 개별 챌린지 별 해당 회원의 인증 게시물 수 조회 Service
	 * @param userId
	 * @return
	 */
	List<Challenge> selectPostsById(String userId);

	/**
	 * 챌린지 완료 여부에 따른 챌린지 리스트 조회 Service
	 * @param finishOption
	 * @return
	 */
	List<Challenge> selectOptionsByFinish(String finishOption);

	List<Challenge> selectListByChal();
}
