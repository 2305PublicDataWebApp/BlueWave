package com.kh.bluewave.user.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
		int postCount = session.selectOne("UserMapper.getPostCountByUserId", userId);
		return postCount;
	}

	@Override
	public int getTotalPointByUserId(SqlSession session, String userId) {
		int totalPoint = session.selectOne("UserMapper.getTotalPointByUserId", userId);
		return totalPoint;
	}

	@Override
	public int getTotalBlueChalCount(SqlSession session, String userId) {
		int totalBlueChalCount = session.selectOne("UserMapper.getTotalBlueChalCount", userId);
		return totalBlueChalCount;
	}

	@Override
	public int getTotalPersonalChalCount(SqlSession session, String userId) {
		int totalPersonalChalCount = session.selectOne("UserMapper.getTotalPersonalChalCount", userId);
		return totalPersonalChalCount;
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

//	@Override
//	public List<Goods> getGoodsListByUserId(SqlSession session, String userId) {
//		List<Goods> goodsList = session.selectList("UserMapper.getGoodsListByUserId", userId);
//		return goodsList;
//	}
	

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
}
