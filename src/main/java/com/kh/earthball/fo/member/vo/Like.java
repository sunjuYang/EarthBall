package com.kh.earthball.fo.member.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Like {

  private String memberId;
  private int productNo;
  private String productName;
  private int price;
  private String changerName;


}
