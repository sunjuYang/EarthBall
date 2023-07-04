package com.kh.earthball.fo.notice.service;

import java.util.ArrayList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.notice.dao.NoticeDao;
import com.kh.earthball.fo.notice.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

  @Autowired
  SqlSessionTemplate sqlSession;
  @Autowired
  private NoticeDao noticeDao;

  @Override
  public int selectListNoCount() {
    return noticeDao.selectListNoCount(sqlSession);

  }
  @Override
  public ArrayList<Notice> selectNoList(PageInfo pi) {
    return noticeDao.selectNoList(sqlSession, pi);
  }
  @Override
  public Notice selectNotice(int noticeNo) {
    return noticeDao.selectNotice(sqlSession, noticeNo);
  }
  @Override
  public int insertNotice(Notice b) {
    return noticeDao.insertNotice(sqlSession, b);
  }
  @Override
  public int deleteNotice(int noticeNo) {
    return noticeDao.deleteNotice(sqlSession, noticeNo);
  }
  @Override
  public int updateNotice(Notice b) {
    return noticeDao.updateNotice(sqlSession, b);

  }
  @Override
  public int increaseCount(int noticeNo) {
    return noticeDao.increaseCount(sqlSession, noticeNo);
  }


}
