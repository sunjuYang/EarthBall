package com.kh.earthball.bo.notice.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.earthball.bo.notice.dao.BoNoticeDao;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.notice.vo.Notice;

@Service
public class BoNoticeServiceImpl implements BoNoticeService {

	  @Autowired
	  SqlSessionTemplate sqlSession;
	  @Autowired
	  private BoNoticeDao BonoticeDao;

	@Override
	public int boselectListNoCount() {
	    return BonoticeDao.boselectListNoCount(sqlSession);

	}

	@Override
	public ArrayList<Notice> boselectNoList(PageInfo pi) {
	    return BonoticeDao.boselectNoList(sqlSession, pi);

	}

}
