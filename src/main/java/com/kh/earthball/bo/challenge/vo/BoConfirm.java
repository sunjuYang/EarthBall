package com.kh.earthball.bo.challenge.vo;

import com.kh.earthball.fo.challenge.vo.ChDetailInfo;
import lombok.*;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class BoConfirm {

  private Integer chConNo;             // 챌린지 인증 일련번호
  private Integer chNo;                // 챌린지 일련번호
  private String chConTitle;           // 챌린지 인증 제목
  private String chConContent;         // 챌린지 인증 내용
  private String memberId;             // 회원아이디
  private String status;               // 사용여부
  private String chConCreateDate;        // 작성일

  
  // 추가사항
  private List<ChDetailInfo> chDetailInfoList;      // 인증 디테일 정보 리스트
  private int categoryNo;
  private String filePath;
  private String chDetailInfoData;
}
