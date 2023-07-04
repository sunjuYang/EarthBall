package com.kh.earthball.bo.challenge.service;

import com.kh.earthball.bo.challenge.vo.Code;
import com.kh.earthball.bo.challenge.vo.GrpCode;
import com.kh.earthball.fo.common.vo.PageInfo;

import java.util.List;

public interface CodeService {

  int insertGrp(GrpCode grpCode);

  int selectListCount();

  List<GrpCode> selectList(PageInfo pi);

  List<GrpCode> selectListAll();

  GrpCode selectGrp(String grpCode);

  int updateGrp(GrpCode grpCode);

  int deleteGrp(String grpCode);

  int insertCode(Code code);

  List<Code> selectCodeList(String grpCode);

  Code selectCode(String grpCode, String code);

  int updateCode(Code code);

  int deleteCode(String grpCode, String code);

}
