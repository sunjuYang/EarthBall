              package com.kh.earthball.fo.board.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.earthball.fo.board.vo.Board;
import com.kh.earthball.fo.board.vo.QReply;
import com.kh.earthball.fo.common.vo.PageInfo;

@Repository
public class BoardDao {

  public int selectListCount(SqlSessionTemplate sqlSession) {
    return sqlSession.selectOne("boardMapper.selectListCount");
  }

  public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {

    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // offset : 건너뛸 숫자
    int limit = pi.getBoardLimit(); // limit : 조회할 갯수

    RowBounds rowBounds = new RowBounds(offset, limit);

    return (ArrayList) sqlSession.selectList("boardMapper.selectList", null, rowBounds);
  }

  public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
    return sqlSession.selectOne("boardMapper.selectBoard", boardNo);
}

  public Board selectPrevBoard(SqlSessionTemplate sqlSession, int boardNo) {
    return sqlSession.selectOne("boardMapper.selectPrevBoard", boardNo) ;
  }

public Board selectNextBoard(SqlSessionTemplate sqlSession, int boardNo) {
  return sqlSession.selectOne("boardMapper.selectNextBoard", boardNo);
  }

public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
  return sqlSession.insert("boardMapper.insertBoard", b);
}

public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
  return sqlSession.update("boardMapper.deleteBoard", boardNo);
}

public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
  return sqlSession.update("boardMapper.updateBoard", b);
}

public int insertReply(SqlSessionTemplate sqlSession, QReply r) {
	return sqlSession.insert("boardMapper.insertReply", r);
}

public ArrayList<QReply> selectReplyList(SqlSessionTemplate sqlSession, int boardNo) {
	return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList", boardNo);
}

public int deleteReply(SqlSessionTemplate sqlSession, int boardNo) {
	  return sqlSession.update("boardMapper.deleteReply", boardNo);
	}

public Object saveFileToDB(SqlSessionTemplate sqlSession, String originalFileName, String savedFileName, String url) {
    Map<String, Object> parameters = new HashMap<>();
    parameters.put("originalFileName", originalFileName);
    parameters.put("savedFileName", savedFileName);
    parameters.put("url", url);
    return sqlSession.insert("boardMapper.insertBoard", parameters);
}

public ArrayList<Board> selectMyBoard(SqlSessionTemplate sqlSession, PageInfo pi, String memberId) {

	 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
	 int limit = pi.getBoardLimit();

	 RowBounds rowBounds = new RowBounds(offset, limit);

	 return (ArrayList) sqlSession.selectList("boardMapper.selectMyBoard", memberId, rowBounds);
}

public int myBoardListCount(SqlSessionTemplate sqlSession, String memberId) {
    return sqlSession.selectOne("boardMapper.myBoardListCount", memberId);
}


}
