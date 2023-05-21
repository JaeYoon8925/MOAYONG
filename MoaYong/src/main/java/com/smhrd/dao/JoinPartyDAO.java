package com.smhrd.dao;

import java.util.List;

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
	public List<JoinParty> joinList(JoinParty dto){
		SqlSession session = factory.openSession(true);
		List<JoinParty> joinList = session.selectList("joinList",dto);
		session.close();
		return joinList;
	}
	
	public int joinOk(JoinParty dto) {
		SqlSession session = factory.openSession(true);
		int row = session.update("joinOk",dto);
		session.close();
		return row;
	}
	
	public int joinNo(JoinParty dto) {
		SqlSession session = factory.openSession(true);
		int row = session.update("joinNo",dto);
		session.close();
		return row;
	}
}



