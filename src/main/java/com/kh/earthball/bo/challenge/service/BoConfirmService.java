package com.kh.earthball.bo.challenge.service;

import com.kh.earthball.bo.challenge.vo.BoConfirm;
import com.kh.earthball.bo.challenge.vo.BoDetailInfo;
import com.kh.earthball.fo.common.vo.PageInfo;

import java.util.List;

public interface BoConfirmService {

  int ConfirmListCount();

  List<BoConfirm> selectConfirmList(PageInfo pageInfo);

  BoConfirm selectConfirm(int chConNo);

  void deleteConfirm(BoConfirm boConfirm);

  int searchConfirmListCount(String keyword);

  List<BoConfirm> searchConfirm(PageInfo pageInfo, String keyword);

  List<BoConfirm> searchDetail(PageInfo pageInfo, String keyword);
}
