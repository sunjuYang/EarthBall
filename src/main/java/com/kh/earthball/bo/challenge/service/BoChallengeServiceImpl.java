package com.kh.earthball.bo.challenge.service;

import com.kh.earthball.bo.challenge.mapper.BoChallengeMapper;
import com.kh.earthball.bo.challenge.vo.BoChallenge;
import com.kh.earthball.bo.challenge.vo.SearchParameters;
import com.kh.earthball.fo.common.vo.PageInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class BoChallengeServiceImpl implements BoChallengeService {

  private final BoChallengeMapper boChallengeMapper;

  @Override
  public int ChallengeListCount() {
    return boChallengeMapper.ChallengeListCount();
  }

  @Override
  public List<BoChallenge> selectChallengeList(PageInfo pageInfo) {

    int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
    int limit = offset + pageInfo.getBoardLimit();

    return boChallengeMapper.selectChallengeList(offset, limit);
  }

  @Override
  public BoChallenge selectChallenge(int chNo) {
    return boChallengeMapper.selectChallenge(chNo);
  }

  @Override
  public int deleteChallenge(int chNo) {
    return boChallengeMapper.deleteChallenge(chNo);
  }

  @Override
  public int searchChallengeListCount(String keyword) {
    return boChallengeMapper.searchChallengeListCount(keyword);
  }

  @Override
  public List<BoChallenge> searchChallenge(PageInfo pageInfo, String keyword) {

    int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
    int limit = offset + pageInfo.getBoardLimit();

    SearchParameters searchParameters = new SearchParameters();

    searchParameters.setOffset(offset);
    searchParameters.setLimit(limit);
    searchParameters.setKeyword(keyword);

    return boChallengeMapper.searchChallenge(searchParameters);
  }
}
