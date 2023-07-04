package com.kh.earthball.fo.challenge.vo;

import com.kh.earthball.fo.common.vo.PageInfo;
import lombok.*;
import oracle.sql.CLOB;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class Challenge extends PageInfo {

  private Integer chNo;              // 챌린지일련번호
  private String chTitle;            // 챌린지명
  private String chStartDay;         // 챌린지시작일
  private String chEndDay;           // 챌린지종료일
  private String memberId;           // 회원아이디
  private Integer categoryNo;        // 카테고리일련번호
  private Integer fileNo;            // 파일일련번호
  private String chContent;          // 챌린지 내용

  // 추가사항
  private String filePath;            // 파일경로        
  private String categoryName;        // 카테고리명
  private String chStatName;

  private int offset;
  private int limit;

}
