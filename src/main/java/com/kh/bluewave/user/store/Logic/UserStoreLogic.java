package com.kh.bluewave.user.store.Logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

}
