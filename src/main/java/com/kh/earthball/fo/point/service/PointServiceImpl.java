package com.kh.earthball.fo.point.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.point.mapper.PointMapper;
import com.kh.earthball.fo.point.vo.Point;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Service
@Slf4j
public class PointServiceImpl implements PointService {

  private final PointMapper pointMapper;

  @Override
  public int insertPoint(Point p) {

    return pointMapper.insertPoint(p);
  }

  @Override
  public int plusMemberPoint(Point p) {

    return pointMapper.plusMemberPoint(p);
  }

  @Override
  public int minusMemberPoint(Point p) {

    return pointMapper.minusMemberPoint(p);
  }

  @Override
  public int myPointListCount(String memberId) {

    return pointMapper.myPointListCount(memberId);
  }

  @Override
  public List<Point> selectMyPoint(PageInfo pageInfo, String memberId) {

    int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
    int limit = offset + pageInfo.getBoardLimit();

    return pointMapper.selectMyPoint(offset, limit, memberId);
  }

}
