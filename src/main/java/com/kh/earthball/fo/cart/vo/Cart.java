package com.kh.earthball.fo.cart.vo;

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
public class Cart {

  private int cartNo;
  private int amount;
  private int price;
  private int productNo;
  private String memberId;
  private String productName;
  private String changerName;

}