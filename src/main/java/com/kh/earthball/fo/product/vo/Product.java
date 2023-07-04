package com.kh.earthball.fo.product.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Product {

  private int productNo;
  private String productName;
  private String productInfo;
  private String category;
  private int price;
  private int discount;
  private int stock;
  private Date createDate;
  private String status;
  private String changerName;
  private int fileLevel;
  private int likeCount;
  private int reviewCount;

}
