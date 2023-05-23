package com.smhrd.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.entity.Evaluation;
import com.smhrd.entity.Project;

public class EvaluationDAO {

	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	public Project view_leader(int prj_seq) {
		SqlSession session = factory.openSession(true);
		Project view_leader = session.selectOne("view_leader", prj_seq);
		session.close();
		return view_leader;
	}
	
	public int submit_eval_leader(Evaluation dto) {
		SqlSession session = factory.openSession(true);
		int row = session.update("submit_eval_leader",dto);
		session.close();
		return row;
	}
	
	public Evaluation leader_avg_rating(Evaluation dto) {
		SqlSession session = factory.openSession(true);
		Evaluation leader_avg_rating=session.selectOne("leader_avg_rating",dto);
		session.close();
		return leader_avg_rating;
	}
}
