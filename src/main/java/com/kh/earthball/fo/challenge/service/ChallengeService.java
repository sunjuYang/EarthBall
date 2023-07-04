package com.kh.earthball.fo.challenge.service;


import com.kh.earthball.fo.challenge.vo.ChConfirm;
import com.kh.earthball.fo.challenge.vo.Challenge;
import com.kh.earthball.fo.challenge.vo.ConfirmCount;
import com.kh.earthball.fo.common.vo.PageInfo;

import java.util.ArrayList;
import java.util.List;

public interface ChallengeService {

  int selectListCount();

  ArrayList<Challenge> selectList(PageInfo pageInfo, Challenge challenge);

  int requestChallenge(Challenge challenge);

  Challenge selectChallenge(int chNo);

  int challengeUpdate(Challenge challenge);

  int challengeDelete(int chNo);

  int selectCategoryListCount(int categoryNo);

  ArrayList<Challenge> selectCategoryList(PageInfo pageInfo, int categoryNo);

  int selectStatListCount(String chStatName);

  ArrayList<Challenge> selectStatList(PageInfo pageInfo, String chStatName);

  List<Challenge> mainChallengeList();

  List<ConfirmCount> confirmCount();

  Challenge selectHotChallenge(int chNo);

  // 나의 오픈한 챌린지 수
  int myChallengeListCount(String memberId);

  // 마이페이지 오픈한 챌린지
  List<Challenge> selectMyChallenge(PageInfo pageInfo, String memberId);
}
