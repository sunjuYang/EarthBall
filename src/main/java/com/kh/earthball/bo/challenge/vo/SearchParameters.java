package com.kh.earthball.bo.challenge.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class SearchParameters {

  private String keyword;
  private int offset;
  private int limit;

}
