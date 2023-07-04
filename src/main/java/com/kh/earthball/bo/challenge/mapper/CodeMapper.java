package com.kh.earthball.bo.challenge.mapper;

import com.kh.earthball.bo.challenge.vo.Code;
import com.kh.earthball.bo.challenge.vo.GrpCode;
import com.kh.earthball.fo.common.vo.PageInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

@Mapper
public interface CodeMapper {

  int insertGrp(GrpCode grpCode);

  int selectListCount();

  List<GrpCode> selectList(@Param("offset") int offset,@Param("limit") int limit);

  List<GrpCode> selectListAll();

  GrpCode selectGrp(String grpCode);

  int updateGrp(GrpCode grpCode);

  int deleteGrp(String grpCode);

  int insertCode(Code code);

  List<Code> selectCodeList(String grpCode);

  Code selectCode(@Param("grpCode") String grpCode, @Param("code") String code);

  int updateCode(Code code);

  int deleteCode(@Param("grpCode") String grpCode, @Param("code") String code);

}
