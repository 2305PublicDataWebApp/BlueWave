package com.kh.bluewave.challenge.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.bluewave.challenge.domain.CLike;

public interface CLikeStore {

	/**
	 * 게시물 별 좋아요 수 리스트 조회 Store
	 * @param session
	 * @return
	 */
	List<CLike> selectAllLikeCnt(SqlSession session);
	
	/**
	 * 해당 아이디와 챌린지 게시물 번호를 갖고 있는지 확인
	 * @param session
	 * @param cLOne
	 * @return List<CLike>
	 */
	List<CLike> selectListByUserIdCBoardNo(SqlSession session, CLike cLOne);
	
	/**
	 * 해당 게시물 번호에 해당 유저 아이디로 좋아요 삽입
	 * @param session
	 * @param cLOne
	 * @return int
	 */
	int insertCLike(SqlSession session, CLike cLOne);
	
	/**
	 * 해당 게시물에 해당 유저 아이디의 좋아요 삭제
	 * @param session
	 * @param cLOne
	 * @return int
	 */
	int deleteCLike(SqlSession session, CLike cLOne);
	
	/**
	 * 해당 게시물에 해당 유저 아이디 좋아요 체크
	 * @param session
	 * @param cLOne
	 * @return int
	 */
	List<CLike> checkIsLiked(SqlSession session, String userId);


}
