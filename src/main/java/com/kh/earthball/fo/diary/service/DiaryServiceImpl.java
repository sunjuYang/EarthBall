package com.kh.earthball.fo.diary.service;

import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.diary.mapper.DiaryMapper;
import org.apache.ibatis.session.RowBounds;
import com.kh.earthball.fo.diary.vo.Diary;
import com.kh.earthball.fo.diary.vo.DyReply;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Slf4j
@RequiredArgsConstructor
@Service
public class DiaryServiceImpl  implements DiaryService {

  public final DiaryMapper diaryMapper;

  @Override
   public int selectListCount() {
       return diaryMapper.selectListCount();
  }

  @Override
  public ArrayList<Diary> selectList(PageInfo pi ) {

    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
    int limit = pi.getBoardLimit();

    RowBounds rowBounds = new RowBounds(offset, limit);

    return diaryMapper.selectList(rowBounds);
  }


  @Override
  public int insertDiary(Diary d) {
    return diaryMapper.insertDiary(d);

  }

  @Override
  public int increaseCount(int dyBoardNo) {
      return diaryMapper.increaseCount(dyBoardNo);

  }

  @Override
  public Diary selectDiary(int dyBoardNo) {
    return diaryMapper.selectDiary(dyBoardNo);

  }

  @Override
  public int deleteDiary(int dyBoardNo) {
      return diaryMapper.deleteDiary(dyBoardNo);
  }

  @Override
  public int updateDiary(Diary d) {
    return diaryMapper.updateDiary(d);
  }

  @Override
  public ArrayList<Diary> diaryListMe(PageInfo pi,String memberId) {

    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
    int limit = offset + pi.getBoardLimit();

    RowBounds rowBounds = new RowBounds(offset, limit);

    return diaryMapper.diaryListMe( rowBounds, memberId);
  }

  @Override
  public ArrayList<Diary> mainDiaryList() {
    return diaryMapper.mainDiaryList();
  }

  @Override
  public int diaryListMeCount(String memberId) {
    return  diaryMapper.diaryListMeCount(memberId);
  }

  @Override
  public ArrayList<DyReply> selectDyReplyList(int dyBoardNo) {
    return null;
  }

  @Override
  public int insertDyReply(DyReply r) {
    return 0;
  }


}
