package com.kh.earthball.fo.board.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.earthball.fo.board.dao.BoardDao;
import com.kh.earthball.fo.board.vo.Board;
import com.kh.earthball.fo.board.vo.QReply;
import com.kh.earthball.fo.common.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {

  @Autowired
  SqlSessionTemplate sqlSession;
  @Autowired
  private BoardDao boardDao;

  @Override
  public int selectListCount() {
    return boardDao.selectListCount(sqlSession);
  }

  @Override
  public ArrayList<Board> selectList(PageInfo pi) {
    return boardDao.selectList(sqlSession, pi);
  }

  @Override
  public Board selectBoard(int boardNo) {
    return boardDao.selectBoard(sqlSession, boardNo);

  }

  @Override
  public Board selectPrevBoard(int boardNo) {
    return boardDao.selectPrevBoard(sqlSession, boardNo);
  }

  @Override
  public Board selectNextBoard(int boardNo) {
    return boardDao.selectNextBoard(sqlSession, boardNo);
  }

  @Override
  public int insertBoard(Board b) {
    return boardDao.insertBoard(sqlSession, b);
  }

  @Override
  public int deleteBoard(int boardNo) {
    return boardDao.deleteBoard(sqlSession, boardNo);
  }

  @Override
  public int updateBoard(Board b) {
      return boardDao.updateBoard(sqlSession, b);
  }


  @Override
  public int insertReply(QReply r) {
	  return boardDao.insertReply(sqlSession, r);
	}

  @Override
  public ArrayList<QReply> selectReplyList(int boadrNo) {
		return boardDao.selectReplyList(sqlSession, boadrNo);
	}

	@Override
	public int deleteReply(int boardNo) {
		return boardDao.deleteReply(sqlSession, boardNo);

	}

	@Override
	public ArrayList<Board> selectMyBoard(PageInfo pi, String memberId) {
		return boardDao.selectMyBoard(sqlSession, pi,memberId);
	}

	@Override
	public int myBoardListCount(String memberId) {
		return boardDao.myBoardListCount(sqlSession, memberId);
	}


}
