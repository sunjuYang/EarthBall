package com.kh.earthball.fo.challenge.service;

import com.kh.earthball.fo.challenge.mapper.ConfirmMapper;
import com.kh.earthball.fo.challenge.vo.ChConReply;
import com.kh.earthball.fo.challenge.vo.ChConfirm;
import com.kh.earthball.fo.challenge.vo.ChDetailInfo;
import com.kh.earthball.fo.challenge.vo.ChDetailInfoParam;
import com.kh.earthball.fo.common.vo.PageInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ConfirmServiceImpl implements ConfirmService {

  private final ConfirmMapper confirmMapper;

  @Override
  public void insertConfirm(ChConfirm chConfirm) {
    confirmMapper.insertConfirm(chConfirm);

    List<ChDetailInfo> chDetailInfoList = chConfirm.getChDetailInfoList();

    for (ChDetailInfo chDetailInfo : chDetailInfoList) {
      chDetailInfo.setChConNo(chConfirm.getChConNo());
      chDetailInfo.setChNo(chConfirm.getChNo());

      confirmMapper.insertDetailInfo(chDetailInfo);
    }
  }


  @Override
  public void updateConfirm(ChConfirm chConfirm) {
    confirmMapper.updateConfirm(chConfirm);

    confirmMapper.deleteDetailInfo(chConfirm);
    List<ChDetailInfo> chDetailInfoList = chConfirm.getChDetailInfoList();

    for (ChDetailInfo chDetailInfo : chDetailInfoList) {
      chDetailInfo.setChConNo(chConfirm.getChConNo());
      chDetailInfo.setChNo(chConfirm.getChNo());

      confirmMapper.insertDetailInfo(chDetailInfo);
    }
  }
  @Override
  public int insertDetailInfo(ChDetailInfo chDetailInfo) {
    return confirmMapper.insertDetailInfo(chDetailInfo);
  }

  @Override
  public int selectListCount(int chNo) {
    return confirmMapper.selectListCount(chNo);
  }

  @Override
  public List<ChConfirm> selectConfirmList(PageInfo pageInfo, int chNo) {
    int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
    int limit = offset + pageInfo.getBoardLimit();
    return confirmMapper.selectConfirmList(offset, limit, chNo);
  }

  @Override
  public ChConfirm selectConfirm(int chConNo) {
    return confirmMapper.selectConfirm(chConNo);
  }


  @Override
  public List<ChDetailInfo> selectDetailInfoList(ChDetailInfoParam detailInfoParam) {
    return confirmMapper.selectDetailInfoList(detailInfoParam);
  }

  @Override
  @Transactional
  public void deleteConfirm(ChConfirm chConfirm) {
    // 인증 기본 정보는 status 업데이트
    confirmMapper.deleteConfirm(chConfirm);
    // 인증 디테일 정보는 모두 딜리트
    confirmMapper.deleteDetailInfo(chConfirm);
  }

  @Override
  public int insertReply(ChConReply reply) {
    return confirmMapper.insertReply(reply);
  }

  @Override
  public List<ChConReply> selectReplyList(ChConReply reply) {
    return confirmMapper.selectReplyList(reply);
  }

  @Override
  public int deleteReply(int reNo) {
    return confirmMapper.deleteReply(reNo);
  }

  @Override
  public int myConfirmListCount(String memberId) {
    return confirmMapper.myConfirmListCount(memberId);
  }

  @Override
  public List<ChConfirm> selectMyConfirm(PageInfo pageInfo, String memberId) {
    int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
    int limit = offset + pageInfo.getBoardLimit();
    return confirmMapper.selectMyConfirm(offset, limit, memberId);
  }

}
