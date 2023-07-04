package com.kh.earthball.fo.board.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString

public class QReply {

	private int QreplyNo;
	private int boardNo;
	private String QreplyContent;
	private Date QcreateDate;
	private String status;
	private String memberId;

}
