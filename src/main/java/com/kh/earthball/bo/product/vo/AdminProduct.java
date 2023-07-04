package com.kh.earthball.bo.product.vo;

import lombok.*;

import java.sql.Date;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AdminProduct {

  private int productNo;
  private String productName;
  private String productInfo;
  private String category;
  private int price;
  private int discount;
  private int stock;
  private Date createDate;
  private String status;

}
