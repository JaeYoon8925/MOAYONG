package com.smhrd.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.entity.User;


public class UserDAO {

	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

	public User login(User dto) {
		SqlSession session = factory.openSession(true);
		User user = session.selectOne("login", dto);
		session.close();
		return user;

	}
	
	public int join(User dto) {
		SqlSession session = factory.openSession(true);
		int row = session.insert("join", dto);
		session.close();
		return  row;
	}
	
	public User searchInfo(User dto) {
		SqlSession session = factory.openSession(true);
		User searchInfo = session.selectOne("searchInfo",dto);
		session.close();
		return searchInfo;
	}
}
