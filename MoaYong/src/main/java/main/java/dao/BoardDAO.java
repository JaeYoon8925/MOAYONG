package main.java.dao;

import java.util.List;

import javax.management.openmbean.OpenDataException;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import main.java.entity.Board;

public class BoardDAO {

	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

// 게시글 올리기
	public int write(Board dto) {
		SqlSession session = factory.openSession(true);
		int row = session.insert("write", dto);
		session.close();
		return row;
	}

// 게시글 리스트
	public List<Board> list() {
		SqlSession session = factory.openSession(true);
		List<Board> list = session.selectList("list");
		session.close();
		return list;
	}

	// 검색조건에 따른 게시글 불러오기
	public List<Board> searchPost(Board dto) {
		SqlSession session = factory.openSession(true);
		List<Board> list = session.selectList("searchPost", dto);
		session.close();
		return list;
	}

	// 게시글 내용 보기(클릭하면 보여지기)
	public Board viewPostContent(Board dto) {
		SqlSession session = factory.openSession(true);
		Board info = session.selectOne("viewPostContent", dto);
		session.close();
		return info;

	}

	// 게시글 수정사항 저장하기
	public int updatePost(Board dto) {
		SqlSession session = factory.openSession(true);
		int row = session.update("updatePost", dto);
		session.close();
		return row;

	}

	// 게시글 삭제하기
	public int deletePost(Board dto) {
		SqlSession session = factory.openSession(true);
		int row = session.delete("deletePost", dto);
		session.close();
		return row;
	}
	
	// 게시글 카운트
	public int getBoardCount() {
		SqlSession session = factory.openSession(true);
		int row = session.selectOne("getBoardCount");
		session.close();
		return row;

	}

	// 리스트 페이지 이동 / 및 불러오기
	public List<Board> ListPage(Board dto) {
		SqlSession session = factory.openSession(true);
		List<Board> ListPage = session.selectList("ListPage", dto);
		session.close();
		return ListPage;
	}

}
