package com.kh.earthball.fo.board.service;

import java.util.ArrayList;

import com.kh.earthball.fo.board.vo.Board;
import com.kh.earthball.fo.board.vo.QReply;
import com.kh.earthball.fo.common.vo.PageInfo;

public interface BoardService {

  // 게시글 총 개수 조회
  int selectListCount();

  // 게시글 리스트 조회
  ArrayList<Board> selectList(PageInfo pi);

  // 게시글 상세 조회
  Board selectBoard(int boardNo);

  // 게시글 작성
  int insertBoard(Board b);

  // 게시글 삭제
  int deleteBoard(int boardNo);

  // 게시글 수정
  int updateBoard(Board b);

  // 이전글 조회
  Board selectPrevBoard(int boardNo);

  // 다음글 조회
  Board selectNextBoard(int boardNo);

  //댓글 조회 서비스
  ArrayList<QReply> selectReplyList(int boardNo);

  // 댓글 작성 서비스
  int insertReply(QReply r);

  // 댓글 삭제 서비스
  int deleteReply(int boardNo);

  // 마이페이지 리스트 조회
  ArrayList<Board> selectMyBoard(PageInfo pi, String memberId);

  // 마이페이지 개수 조회
  int myBoardListCount(String memberId);

}
