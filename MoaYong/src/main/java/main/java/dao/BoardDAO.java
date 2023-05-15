package dao;

import java.util.List;

import javax.management.openmbean.OpenDataException;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import entity.Board;

public class BoardDAO {

	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
// 게시글 올리기
	public int write(Board dto) {
		SqlSession session= factory.openSession(true);
		int row = session.insert("write",dto);
		session.close();
		return row;		
	}
// 게시글 리스트
	public List<Board> list(){
		SqlSession session =factory.openSession(true);
		List<Board> list = session.selectList("list");
		session.close();
		return list;
	}
	// 검색조건에 따른 게시글 불러오기
	public List<Board> searchPost(Board dto){
		SqlSession session = factory.openSession(true);
		List<Board> list =session.selectList("searchPost",dto);
		session.close();
		return list;
	}
	
	public Board viewPostContent(int post) {
		SqlSession session = factory.openSession(true);
		Board dto = session.selectOne("viewPostContent",post);
		session.close();
		return dto;
		
	}

}
