package com.kh.earthball.bo.payment.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class BoPayInfo {

  private String paymentNo; // 결제번호
  private String memberId; // 회원아이디
  private String paymentDate; // 결제일
  private String paymentType; // 결제방식
  private String status; // 결제상태
  private String paymentName; // 결제이름
  private int paymentTotal; // 총 결제금액
  private String receiveName; // 수령인 이름
  private int receivePhone; // 수령인 전화번호
  private String postCode; // 수령인 우편번호
  private String receiveAddress1; // 주소
  private String receiveAddress2; // 상세주소
  private String deliveryComment; // 베송메모
  private String paymentToken; // 결제토큰
  private int rewardPoint; // 결제 시 얻는 포인트

}
