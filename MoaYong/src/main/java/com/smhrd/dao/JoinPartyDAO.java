package com.smhrd.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.entity.JoinParty;

public class JoinPartyDAO {
	
	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	public int joinParty(JoinParty dto) {
		SqlSession session = factory.openSession(true);
		int row = session.insert("joinParty",dto);
		session.close();
		return row;
		
	}

}
