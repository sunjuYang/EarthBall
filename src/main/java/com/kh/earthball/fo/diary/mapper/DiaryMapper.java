package com.kh.earthball.fo.diary.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import com.kh.earthball.fo.diary.vo.Diary;

@Mapper
public interface DiaryMapper {

      int selectListCount();

      ArrayList<Diary> selectList(RowBounds rowBounds);

      int insertDiary(Diary d);

      int increaseCount(int dyBoardNo);

      Diary selectDiary(int dyBoardNo);

      int deleteDiary(int dyBoardNo);

      ArrayList<Diary> diaryListMe(RowBounds rowBounds, String memberId);

      int diaryListMeCount(String memberId);

      int updateDiary(Diary d);

      ArrayList<Diary> mainDiaryList();
}

