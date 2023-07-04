package com.kh.earthball.fo.challenge.service;

import com.kh.earthball.fo.challenge.mapper.ChallengeMapper;
import com.kh.earthball.fo.challenge.vo.ChDetailInfo;
import com.kh.earthball.fo.challenge.vo.Challenge;
import com.kh.earthball.fo.challenge.vo.ConfirmCount;
import com.kh.earthball.fo.common.vo.PageInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ChallengeServiceImpl implements ChallengeService {

  private final ChallengeMapper challengeMapper;

  @Override
  public int selectListCount() {
    return challengeMapper.selectListCount();
  }

  @Override
  public ArrayList<Challenge> selectList(PageInfo pageInfo, Challenge challenge) {

    int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
    int limit = offset + pageInfo.getBoardLimit();

    challenge.setOffset(offset);
    challenge.setLimit(limit);

    return challengeMapper.selectList(challenge);
  }

  @Override
  @Transactional  // 모든 값들이 다 적용 된 후에 커밋 처리 될 수 있도록 묶어두는 개념
  public int requestChallenge(Challenge challenge) {
    challenge.setChStartDay(challenge.getChStartDay().replaceAll("-", ""));
    challenge.setChEndDay(challenge.getChEndDay().replaceAll("-", ""));
    int result = challengeMapper.requestChallenge(challenge);
    if (result == 0) {
      throw new RuntimeException();
    }
    return result;
  }

  @Override
  public Challenge selectChallenge(int chNo) {
    return challengeMapper.selectChallenge(chNo);
  }

  @Override
  public int challengeUpdate(Challenge challenge) {
    challenge.setChStartDay(challenge.getChStartDay().replaceAll("-", ""));
    challenge.setChEndDay(challenge.getChEndDay().replaceAll("-", ""));

    int result = challengeMapper.challengeUpdate(challenge);
    if (result == 0) {
      throw new RuntimeException();
    }
    return result;
  }

  @Override
  public int challengeDelete(int chNo) {
    return challengeMapper.challengeDelete(chNo);
  }

  @Override
  public int selectCategoryListCount(int categoryNo) {
    return challengeMapper.selectCategoryListCount(categoryNo);
  }

  @Override
  public ArrayList<Challenge> selectCategoryList(PageInfo pageInfo, int categoryNo) {
    int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
    int limit = offset + pageInfo.getBoardLimit();

    ArrayList<Challenge> list = challengeMapper.selectCategoryList(offset, limit, categoryNo);

    return list;
  }

  @Override
  public int selectStatListCount(String chStatName) {
    return challengeMapper.selectStatListCount(chStatName);
  }

  @Override
  @Transactional  // 모든 값들이 다 적용 된 후에 커밋 처리 될 수 있도록 묶어두는 개념
  public ArrayList<Challenge> selectStatList(PageInfo pageInfo, String chStatName) {

    int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
    int limit = offset + pageInfo.getBoardLimit();

    return challengeMapper.selectStatList(offset, limit, chStatName);
  }

  @Override
  public List<Challenge> mainChallengeList() {
    return challengeMapper.mainChallengeList();
  }

  @Override
  public  List<ConfirmCount> confirmCount() {
    return challengeMapper.confirmCount();
  }

  @Override
  public Challenge selectHotChallenge(int chNo) {
    return challengeMapper.selectHotChallenge(chNo);
  }

  // 나의 오픈한 챌린지 수
  @Override
  public int myChallengeListCount(String memberId) {
    return challengeMapper.myChallengeListCount(memberId);
  }

  // 마이페이지 오픈한 챌린지
  @Override
  public List<Challenge> selectMyChallenge(PageInfo pageInfo, String memberId) {

    int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
    int limit = offset + pageInfo.getBoardLimit();

    return challengeMapper.selectMyChallenge(offset, limit, memberId);
  }



}
