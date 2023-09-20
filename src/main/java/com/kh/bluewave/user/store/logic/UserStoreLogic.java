package com.kh.bluewave.user.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bluewave.challenge.domain.CBoard;
import com.kh.bluewave.challenge.domain.Challenge;
import com.kh.bluewave.goods.domain.Goods;
import com.kh.bluewave.noticeBoard.domain.PageInfo;
import com.kh.bluewave.user.domain.Sub;
import com.kh.bluewave.user.domain.User;
import com.kh.bluewave.user.store.UserStore;

@Repository
public class UserStoreLogic implements UserStore{

	@Override
	public User checkUserLogin(SqlSession session, User user) {
		User uOne = session.selectOne("UserMapper.checkUserLogin", user);
		return uOne;
	}

	@Override
	public int deleteUser(SqlSession session, String userId) {
		int result = session.delete("UserMapper.deleteUser", userId);
		return result;
	}

	@Override
	public int updateUser(SqlSession session, User user) {
		int result = session.update("UserMapper.updateUser", user);
		return result;
	}

	@Override
	public int insertUser(SqlSession session, User user) {
		int result = session.insert("UserMapper.insertUser", user);
		return result;
	}

	@Override
	public User selectOneById(SqlSession session, User user) {
		User uOne = session.selectOne("UserMapper.selectOneById", user);
		return uOne;
	}

	@Override
	public int getPostCountByUserId(SqlSession session, String userId) {
		int result = session.selectOne("CBoardMapper.getPostCountByUserId", userId);
		return result;
	}

	@Override
	public int getTotalPointByUserId(SqlSession session, String userId) {
		int result = session.selectOne("PointMapper.getTotalPointByUserId", userId);
		return result;
	}

	@Override
	public int getTotalBlueChalCount(SqlSession session, String userId) {
		int result = session.selectOne("CBoardMapper.getTotalBlueChalCount", userId);
		return result;
	}

	@Override
	public int getTotalPersonalChalCount(SqlSession session, String userId) {
		int result = session.selectOne("CBoardMapper.getTotalPersonalChalCount", userId);
		return result;
	}

	@Override
	public User findUserByEmail(SqlSession session, String email) {
		User uOne = session.selectOne("UserMapper.findUserByEmail", email);
		return uOne;
	}

	@Override
	public User findUserByPhone(SqlSession session, String phone) {
		User uOne = session.selectOne("UserMapper.findUserByPhone", phone);
		return uOne;
	}

	@Override
	public List<Goods> getGoodsListByUserId(SqlSession session, String userId) {
		List<Goods> goodsList = session.selectList("GoodsMapper.getGoodsListByUserId", userId);
		return goodsList;
	}

	@Override
	public int getFinishTotalBlueChalCount(SqlSession session, String userId) {
		int result = session.selectOne("CBoardMapper.getFinishTotalBlueChalCount", userId);
		return result;
	}

	@Override
	public int getFinishTotalPersonalChalCount(SqlSession session, String userId) {
		int result = session.selectOne("CBoardMapper.getFinishTotalPersonalChalCount", userId);
		return result;
	}

	@Override
	public int emailCheck(SqlSession session, String userEmail) {
		int result = session.selectOne("UserMapper.emailCheck", userEmail);
		return result;
	}

	@Override
	public int nickNameCheck(SqlSession session, String userNickName) {
		int result = session.selectOne("UserMapper.nickNameCheck", userNickName);
		return result;
	}

	@Override
	public int idCheck(SqlSession session, String userId) {
		int result = session.selectOne("UserMapper.idCheck", userId);
		return result;
	}
	

	@Override
	public List<Sub> selectAllFollowingListById(SqlSession session, String userId) {
		List<Sub> sList = session.selectList("UserMapper.selectAllFollowingListById", userId);
		return sList;
	}

	@Override
	public List<Sub> selectAllFollowersListById(SqlSession session, String userId) {
		List<Sub> sList = session.selectList("UserMapper.selectAllFollowersListById", userId);
		return sList;
	}

	@Override
	public User selectOneByChalNo(SqlSession session, String chalWriter) {
		User uOne = session.selectOne("UserMapper.selectOneByChalNo", chalWriter);
		return uOne;
	}
	
	@Override
	public List<User> selectUserList(SqlSession session, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<User> uList = session.selectList("UserMapper.selectUserList", null, rowBounds);
		return uList;
	}

	@Override
	public int getListCount(SqlSession session) {
		int result = session.selectOne("UserMapper.selectListCount");
		return result;
	}
	
	@Override
		public List<Challenge> getTodayCList(SqlSession session, String userId) {
		List<Challenge> todayCList = session.selectList("ChalMapper.getTodayCList", userId);
		return todayCList;
	}

	@Override
	public List<CBoard> getCalDateList(SqlSession session, String userId) {
		List<CBoard> calDateList = session.selectList("CBoardMapper.getCalDateList", userId);
		return calDateList;
	}

	@Override
	public int insertPoint(SqlSession session, User user) {
		int result = session.insert("PointMapper.insertRegisterPoint", user);
		return result;
	}

	@Override
	public int followUser(SqlSession session, Sub sub) {
		int result = session.insert("SubMapper.followUser", sub);
		return result;
	}

	@Override
	public int unfollowUser(SqlSession session, Sub sub) {
		int result = session.delete("SubMapper.unfollowUser", sub);
		return result;
	}

	@Override
	public int isFollowing(SqlSession session, Sub sub) {
		int result = session.selectOne("SubMapper.isFollowing", sub);
		return result;
	}
}
