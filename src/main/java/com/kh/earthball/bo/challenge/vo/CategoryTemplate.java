package com.kh.earthball.bo.challenge.vo;

import com.kh.earthball.fo.challenge.vo.ChDetailInfo;
import lombok.*;

import java.util.List;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class CategoryTemplate {

  private int categoryTemplateNo;
  private String inputType;
  private String status;
  private int sortNo;
  private String chSubTitle;
  private String grpCode;
  private int categoryNo;
  private String chDetailInfoData;

  private List<Code> codeList;
  private List<ChDetailInfo> chDetailInfoList;

}
