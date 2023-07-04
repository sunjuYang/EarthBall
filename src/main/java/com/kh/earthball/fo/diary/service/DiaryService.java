package com.kh.earthball.fo.diary.service;

import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.diary.vo.Diary;
import com.kh.earthball.fo.diary.vo.DyReply;

import java.util.ArrayList;

public interface DiaryService {

      // 게시글의 총 갯수 조회
      int selectListCount();

      //게시글 리스트 조회
       ArrayList<Diary> selectList(PageInfo pi);

      // 게시글 작성하기 서비스
      int insertDiary(Diary d);

      // 게시글 조회수 증가
      int increaseCount(int dyBoardNo);

      // 게시글 상세 조회
      Diary selectDiary(int dyBoardNo);

      // 게시글 삭제 서비스
      int deleteDiary(int dyBoardNo);

      // 게시글 수정 서비스
      int updateDiary(Diary d);

      // 마이페이지 내가 참여한 일기 조회
      ArrayList<Diary> diaryListMe(PageInfo pi, String memberId);

      //마이페이지 내가 참여한 일기 총 갯수 조회
       int diaryListMeCount(String memberId);

      // 메인페이지 일기 조회
      ArrayList<Diary> mainDiaryList();


      // 댓글 리스트 조회 서비스
      ArrayList<DyReply> selectDyReplyList(int dyBoardNo);

      // 댓글 작성 서비스 (Ajax)
      int insertDyReply(DyReply r);




    }
