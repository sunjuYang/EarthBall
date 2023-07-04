package com.kh.earthball.bo.store.vo;

import lombok.*;

import java.sql.Date;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AdminStore {
  private int storeNo;
  private String storeName;
  private String storeAddress;
  private String storeDetailAddress;
  private String storePhone;
  private String businessHours;
  private int storeLikes;
  private double storeLat;
  private double storeLon;
  private int storeRegionNo;
  private String storeInfo;
  private String status;
  private String jibunAddress;
  private boolean isLiked;
}
