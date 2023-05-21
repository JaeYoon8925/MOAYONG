package com.smhrd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.entity.Reply;

public class ReplyDAO {
	
	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	public int uploadReply(Reply dto) {
		SqlSession session = factory.openSession(true);
		int row=session.insert("uploadReply",dto);
		session.close();
		return row;
		
	}
	public List<Reply> viewReplyList(Reply dto){
		SqlSession session = factory.openSession(true);
		List<Reply> list = session.selectList("viewReply",dto);
		session.close();
		return list;
	}

}
