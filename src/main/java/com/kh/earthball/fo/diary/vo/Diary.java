package com.kh.earthball.fo.diary.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;
import org.springframework.web.multipart.MultipartFile;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Diary {

  private int dyBoardNo;               //  DY_BOARD_NO NUMBER NOT NULL,
  private String dyBoardTitle;         // DY_BOARD_TITLE VARCHAR2(100) NOT NULL,
  private String dyBoardContent;   // DY_BOARD_CONTENT VARCHAR2(4000) NOT NULL,
  private String dyCreateDate;       // DY_CREATE_DATE DATE DEFAULT SYSDATE NULL,
  private String dyStatus;            //  DY_STATUS VARCHAR2(1)   DEFAULT 'Y' NULL,
  private int dyCount;               // DY_COUNT NUMBER DEFAULT 0 NULL,
  private String originName;        //ORIGIN_NAME VARCHAR2(100) NOT NULL,
  private String changeName;     // CHANGE_NAME VARCHAR2(100) NOT NULL,
  private String dyBoardWriter;   // DY_BOARD_WRITER
  private String weather;
  private int dyLike;
}


