package com.kh.bluewave.challenge.service;

import java.util.List;

import com.kh.bluewave.challenge.domain.CBoard;
import com.kh.bluewave.challenge.domain.CLike;

public interface CLikeService {

	/**
	 * 게시물 별 좋아요 수 리스트 조회 Service
	 * @return
	 */
	List<CLike> selectAllLikeCnt();
	
	/**
	 * 해당 아이디와 챌린지 게시물 번호를 갖고 있는지 확인
	 * @param cLOne
	 * @return List<CLike>
	 */
	List<CLike> selectListByUserIdCBoardNo(CLike cLOne);
	
	/**
	 * 해당 게시물에 해당 유저 아이디로 좋아요 삽입
	 * @param cLOne
	 * @return int
	 */
	int insertCLike(CLike cLOne);
	
	/**
	 * 해당 게시물에 해당 유저 아이디 좋아요 삭제
	 * @param cLOne
	 * @return
	 */
	int deleteCLike(CLike cLOne);
	
	/**
	 * 해당 게시물에 해당 유저 좋아요 체크
	 * @param cLOne
	 * @return
	 */
	List<CLike> checkIsLiked(String userId);
	

}
