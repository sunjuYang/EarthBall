package com.kh.earthball.bo.challenge.vo;

import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Category {

  private int categoryNo;
  private String categoryName;
  private String status;

  // 카테고리 초이스 화면에서 뿌릴 용도
  private List<Code> codeList;
}
