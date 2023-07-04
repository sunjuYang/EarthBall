package com.kh.earthball.fo.point.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.kh.earthball.fo.point.vo.Point;

@Mapper
public interface PointMapper {

  int insertPoint(Point p);

  int plusMemberPoint(Point p);

  int minusMemberPoint(Point p);

  int myPointListCount(String memberId);

  List<Point> selectMyPoint(@Param("offset") int offset, @Param("limit") int limit, @Param("memberId")  String memberId);

}
