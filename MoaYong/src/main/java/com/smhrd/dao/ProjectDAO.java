package com.smhrd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.entity.Board;
import com.smhrd.entity.Message;
import com.smhrd.entity.Project;

public class ProjectDAO {
	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

	// 
		public List<Project> partin(String userid){
			SqlSession session =factory.openSession(true);
			List<Project> list = session.selectList("partin", userid);
			session.close();
			return list;
		}
		
		public List<Project> ing(String userid){
			SqlSession session =factory.openSession(true);
			List<Project> list = session.selectList("ing", userid);
			session.close();
			return list;
		}
		
		public List<Project> end(String userid){
			SqlSession session =factory.openSession(true);
			List<Project> list = session.selectList("end", userid);
			session.close();
			return list;
		}
		
		public List<Project> recruiting(String userid){
			SqlSession session =factory.openSession(true);
			List<Project> list = session.selectList("recruiting", userid);
			session.close();
			return list;
		}



}
