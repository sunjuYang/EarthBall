package com.kh.earthball.bo.notice.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString

public class BoNotice {

	  private int noticeNo;
	  private String noticeTitle;
	  private String noticeContent;
	  private Date noticeDate;
	  private String status;
	  private String noticeCategory; // 카테고리(공지,배송) ?
	  private int noticeView; // 조회수

	}

