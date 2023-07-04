package com.kh.earthball.bo.challenge.service;

import com.kh.earthball.bo.challenge.mapper.CodeMapper;
import com.kh.earthball.bo.challenge.vo.Code;
import com.kh.earthball.bo.challenge.vo.GrpCode;
import com.kh.earthball.fo.common.vo.PageInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Service
public class CodeServiceImpl implements CodeService {

  private final CodeMapper codeMapper;

  @Override
  public int insertGrp(GrpCode grpCode) {
    return codeMapper.insertGrp(grpCode);
  }

  @Override
  public int selectListCount() {
    return codeMapper.selectListCount();
  }

  @Override
  public List<GrpCode> selectList(PageInfo pi) {

    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
    int limit = offset + pi.getBoardLimit();

    return codeMapper.selectList(offset, limit);
  }

  @Override
  public List<GrpCode> selectListAll() {
    return codeMapper.selectListAll();
  }

  @Override
  public GrpCode selectGrp(String grpCode) {
    return codeMapper.selectGrp(grpCode);
  }

  @Override
  public int updateGrp(GrpCode grpCode) {
    return codeMapper.updateGrp(grpCode);
  }

  @Override
  public int deleteGrp(String grpCode) {
    return codeMapper.deleteGrp(grpCode);
  }

  @Override
  public int insertCode(Code code) {
    int result = codeMapper.insertCode(code);

    return result;
  }

  @Override
  public List<Code> selectCodeList(String grpCode) {
    return codeMapper.selectCodeList(grpCode);
  }

  @Override
  public Code selectCode(String grpCode, String code) {
    return codeMapper.selectCode(grpCode, code);
  }

  @Transactional
  @Override
  public int updateCode(Code code) {

    int result = codeMapper.updateCode(code);

    return result;
  }

  @Override
  public int deleteCode(String grpCode, String code) {
    return codeMapper.deleteCode(grpCode, code);
  }

}
