package com.kh.earthball.fo.board.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString

public class Board {

  private int boardNo;
  private String boardTitle;
  private String boardContent;
  private String boardReply;
  private Date boardDate; // 날짜 타입을 문자열로 표기 가능, TO_CHAR 를 사용
  private String status;
  private String memberId;
  private String originName;
  private String changeName;

}
