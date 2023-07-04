package com.kh.earthball.bo.notice.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.notice.vo.Notice;

@Repository
public class BoNoticeDao {

	public int boselectListNoCount(SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("BonoticeMapper.boselectListNoCount");
	}

	public ArrayList<Notice> boselectNoList(SqlSessionTemplate sqlSession, PageInfo pi) {
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // offset : 건너뛸 숫자
		 int limit = pi.getBoardLimit(); // limit : 조회할 갯수

	     RowBounds rowBounds = new RowBounds(offset, limit);

	     return (ArrayList)sqlSession.selectList("BonoticeMapper.boselectNoList", null, rowBounds);
	}

}
