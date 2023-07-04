package com.kh.earthball.fo.payment.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.kh.earthball.fo.cart.vo.Cart;
import com.kh.earthball.fo.payment.vo.PayInfo;
import com.kh.earthball.fo.payment.vo.PayPageItem;

@Mapper
public interface PaymentMapper {

  int payComplete(PayInfo pi);

  int addTotalPay(PayInfo pi);

  int updateGrade(PayInfo pi);

  Cart selectProductList(PayPageItem ppi);

  PayPageItem selectProductItem(PayPageItem ppi);

  int insertOrder(Cart c);

  int myOrderListCount(String memberId);

  List<PayInfo> selectMyOrder(@Param("offset") int offset, @Param("limit") int limit, @Param("memberId")  String memberId);

  int reqPayCancel(PayInfo p);

}
