package com.kh.earthball.fo.payment.vo;

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
public class PayPageItem {

  private int productNo;
  private int amount;
  private int price;
  private String memberId;
  private String productName;
  private String changerName;

}
