package com.kh.earthball.bo.notice.service;

import java.util.ArrayList;

import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.notice.vo.Notice;

public interface BoNoticeService {

	// 공지사항 총 개수
	int boselectListNoCount();

	// 공지사항 리스트 조회
	ArrayList<Notice> boselectNoList(PageInfo pi);

}
