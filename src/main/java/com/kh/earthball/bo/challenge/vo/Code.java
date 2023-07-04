package com.kh.earthball.bo.challenge.vo;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Code {

  private String code;
  private String grpCode;
  private String codeName;
  private String status;
  private int sortNo;
  private String checked;   // true , false

}
