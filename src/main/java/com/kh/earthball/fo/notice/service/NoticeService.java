package com.kh.earthball.fo.notice.service;

import java.util.ArrayList;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.notice.vo.Notice;

public interface NoticeService {

  // 공지사항 총 개수 조회
  int selectListNoCount();

// 공지사항  리스트 조회
 ArrayList<Notice> selectNoList(PageInfo pi);

// 공지사항 상세 조회
Notice selectNotice(int noticeNo);

// 공지사항 조회수 증가
int increaseCount(int noticeNo);

// 게시글 작성
int insertNotice(Notice b);

// 게시글 삭제
int deleteNotice(int noticeNo);

// 게시글 수정
int updateNotice(Notice b);

}

