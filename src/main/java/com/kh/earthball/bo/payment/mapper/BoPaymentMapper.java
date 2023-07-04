package com.kh.earthball.bo.payment.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.kh.earthball.bo.payment.vo.BoPayInfo;

@Mapper
public interface BoPaymentMapper {

  int cancelPayListCount();

  List<BoPayInfo> selectCancelPayList(@Param("offset") int offset, @Param("limit") int limit);

  int acceptCancel(BoPayInfo p);

}
