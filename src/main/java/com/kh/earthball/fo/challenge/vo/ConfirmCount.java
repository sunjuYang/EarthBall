package com.kh.earthball.fo.challenge.vo;

import lombok.*;
import lombok.extern.slf4j.Slf4j;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ConfirmCount {

  private int chNo;
  private int countConfirm;
  private int rowNum;

}
