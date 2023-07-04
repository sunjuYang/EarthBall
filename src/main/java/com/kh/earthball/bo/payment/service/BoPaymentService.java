package com.kh.earthball.bo.payment.service;

import java.util.List;
import com.kh.earthball.bo.payment.vo.BoPayInfo;
import com.kh.earthball.fo.common.vo.PageInfo;

public interface BoPaymentService {

  int cancelPayListCount();

  List<BoPayInfo> selectCancelPayList(PageInfo pageInfo);

  int acceptCancel(BoPayInfo p);

}
