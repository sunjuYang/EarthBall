package com.kh.earthball.bo.challenge.service;

import com.kh.earthball.bo.challenge.vo.BoChallenge;
import com.kh.earthball.fo.common.vo.PageInfo;

import java.util.List;

public interface BoChallengeService {

  int ChallengeListCount();

  List<BoChallenge> selectChallengeList(PageInfo pageInfo);

  BoChallenge selectChallenge(int chNo);

  int deleteChallenge(int chNo);

  int searchChallengeListCount(String keyword);

  List<BoChallenge> searchChallenge(PageInfo pageInfo, String keyword);
}
