package com.kh.bluewave.challenge.service;

import java.util.List;
import java.util.Map;

import com.kh.bluewave.challenge.domain.Challenge;
import com.kh.bluewave.noticeBoard.domain.PageInfo;

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
	 * @param challenge
	 * @return
	 */
	Challenge selectOneByTitle(Challenge challenge);

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
	 * 모든 챌린지 조회 Service
	 * @return
	 */
	List<Challenge> selectListByChal();
	
	/**
	 * 챌린지 검색된 데이터 조회 Service
	 * @param searchMap
	 * @return List<String, String>
	 */
	List<Challenge> searchChalByKeyword(Map<String, String> searchMap);

	/**
	 * 회원이 방금 생성한 챌린지의 챌린지 번호 조회 Service 
	 * @param challenge
	 * @return
	 */
	int findInsertChalNo(Challenge challenge);

	/**
	 * 챌린지명 전체 갯수
	 * @return
	 */
	int getListCount();

	/**
	 * 챌린지명 전체 리스트 조회
	 * @param pInfo
	 * @return
	 */
	List<Challenge> selectChallList(PageInfo pInfo);
	
	/**
	 * 챌린지명 관리자만 리스트 조회
	 * @return
	 */
	List<Challenge> selectAllListByAdmin();
}
