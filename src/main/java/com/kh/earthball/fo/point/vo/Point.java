package com.kh.earthball.fo.point.vo;

import com.kh.earthball.fo.payment.vo.PayInfo;
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
public class Point {

  private int pointNo;
  private String pointContent;
  private int pointNum;
  private String status;
  private String pointDate;
  private String memberId;

}
