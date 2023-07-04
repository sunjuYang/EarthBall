package com.kh.earthball.fo.challenge.vo;

import lombok.*;
import lombok.extern.slf4j.Slf4j;

@Getter
@Setter
@Slf4j
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChDetailInfoParam {

  private Integer chNo;
  private Integer chConNo;
  private Integer categoryTemplateNo;
}
