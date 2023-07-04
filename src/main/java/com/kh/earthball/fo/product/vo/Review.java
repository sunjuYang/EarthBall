package com.kh.earthball.fo.product.vo;

import java.sql.Date;
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
public class Review {

  private int reviewNo;
  private String reviewContent;
  private Date createDate;
  private int rating;
  private String changeName;
  private int productNo;
  private String memberId;
  private int count;
  private int replyNo;
  private String replyContent;
  private String status;
  private Date createdDate;
  private String memberName;
  private String memberImg;

}
