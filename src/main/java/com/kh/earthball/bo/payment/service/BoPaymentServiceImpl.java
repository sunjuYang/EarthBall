package com.kh.earthball.bo.payment.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.kh.earthball.bo.payment.mapper.BoPaymentMapper;
import com.kh.earthball.bo.payment.vo.BoPayInfo;
import com.kh.earthball.fo.common.vo.PageInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class BoPaymentServiceImpl implements BoPaymentService {

  private final BoPaymentMapper boPaymentMapper;

  @Override
  public int cancelPayListCount() {

  return boPaymentMapper.cancelPayListCount();
  }

  @Override
  public List<BoPayInfo> selectCancelPayList(PageInfo pageInfo) {

    int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
    int limit = offset + pageInfo.getBoardLimit();

    return boPaymentMapper.selectCancelPayList(offset, limit);
  }

  @Override
  public int acceptCancel(BoPayInfo p) {

    return boPaymentMapper.acceptCancel(p);
  }

}
