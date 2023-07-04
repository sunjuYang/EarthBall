package com.kh.earthball.fo.challenge.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class ChDetailInfo {

  private Integer chDetailInfoNo;
  private Integer chNo;
  private Integer chConNo;
  private Integer categoryTemplateNo;
  private String chDetailInfoData;
  private String status;
  private String code;
  private String fileNo;

  private String filePath;
  private String fileName;

}
