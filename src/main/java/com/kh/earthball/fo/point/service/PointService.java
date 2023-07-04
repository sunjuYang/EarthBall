package com.kh.earthball.fo.point.service;

import java.util.List;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.point.vo.Point;

public interface PointService {

  int insertPoint(Point p);

  int plusMemberPoint(Point p);

  int minusMemberPoint(Point p);

  int myPointListCount(String memberId);

  List<Point> selectMyPoint(PageInfo pageInfo, String memberId);

}
