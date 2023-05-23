package com.smhrd.dao;

import java.util.List;

import javax.management.openmbean.OpenDataException;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.entity.Message;

public class MessageDAO {

	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

// 메세지 보내기

	public int send(Message dto) {
		SqlSession session = factory.openSession(true);
		int row = session.insert("send", dto);
		session.close();
		return row;
	}

	public List<Message> MessageList(Message dto2) {
		SqlSession session = factory.openSession(true);
		List<Message> MessageList = session.selectList("MessageList", dto2 );
		session.close();
		return MessageList;
	}
	
	public Message viewmessage(Message dto) {
		SqlSession session = factory.openSession(true);
		Message viewmessage = session.selectOne("viewmessage", dto);
		session.close();
		return viewmessage;
	}

}

// 메세지 리스트 (수정 아예 안했음 아직 ㅇㅇ)
//	public List<Board> list() {
//		
//	}

// 메세지 조회하기 

// 메세지 전부 읽음 처리 (우선순위 낮음.)

// 검색조건에 따른 게시글 불러오기
//	public List<Board> searchPost(Board dto) {
//		SqlSession session = factory.openSession(true);
//		List<Board> list = session.selectList("searchPost", dto);
//		session.close();
//		return list;
//	}

// 게시글 내용 보기(클릭하면 보여지기)
//	public Board viewPostContent(Board dto) {
//		SqlSession session = factory.openSession(true);
//		Board info = session.selectOne("viewPostContent", dto);
//		session.close();
//		return info;
//
//	}

// 게시글 수정사항 저장하기
//	public int updatePost(Board dto) {
//		SqlSession session = factory.openSession(true);
//		int row = session.update("updatePost", dto);
//		session.close();
//		return row;
//
//	}

// 게시글 카운트
//	public int getBoardCount() {
//		SqlSession session = factory.openSession(true);
//		int row = session.selectOne("getBoardCount");
//		session.close();
//		return row;
//
//	}

// 리스트 페이지 이동 / 및 불러오기
//	public List<Board> ListPage(Board dto) {
//		SqlSession session = factory.openSession(true);
//		List<Board> ListPage = session.selectList("ListPage", dto);
//		session.close();
//		return ListPage;
//	}
