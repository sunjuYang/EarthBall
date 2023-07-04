package com.kh.earthball.fo.challenge.vo;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class ChConReply {

 private int reNo;                     // 댓글번호
 private int chConNo;                  // 챌린지 인증 일련번호
 private int chNo;                     // 챌린지 일련번호
 private String reContent;                // 댓글내용
 private String reCreateDate;             // 작성일
 private String status;                   // 사용여부
 private String memberId;                 // 회원아이디

}
