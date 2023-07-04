package com.kh.earthball.fo.notice.dao;

import java.util.ArrayList;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.notice.vo.Notice;

@Repository
public class NoticeDao {

  public int selectListNoCount(SqlSessionTemplate sqlSession) {
    return sqlSession.selectOne("noticeMapper.selectNoListCount");
  }

  public ArrayList<Notice> selectNoList(SqlSessionTemplate sqlSession, PageInfo pi) {

    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // offset : 건너뛸 숫자
    int limit = pi.getBoardLimit(); // limit : 조회할 갯수

    RowBounds rowBounds = new RowBounds(offset, limit);

    return (ArrayList)sqlSession.selectList("noticeMapper.selectNoList", null, rowBounds);
  }

  public Notice selectNotice(SqlSessionTemplate sqlSession, int noticeNo) {
    return sqlSession.selectOne("noticeMapper.selectNotice", noticeNo);
}
public int insertNotice(SqlSessionTemplate sqlSession, Notice b) {
  return sqlSession.insert("noticeMapper.insertNotice", b);
}

public int increaseCount(SqlSessionTemplate sqlSession, int noticeNo) {
  return sqlSession.update("noticeMapper.increaseCount", noticeNo);
}

public int deleteNotice(SqlSessionTemplate sqlSession, int noticeNo) {
  return sqlSession.update("noticeMapper.deleteNotice", noticeNo);
}

public int updateNotice(SqlSessionTemplate sqlSession, Notice b) {
  return sqlSession.update("noticeMapper.updateNotice", b);


}
}

