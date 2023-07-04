package com.kh.earthball.fo.cart.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.kh.earthball.fo.cart.vo.Cart;

@Mapper
public interface CartMapper {

  ArrayList<Cart> selectList(String memberId);

  int updateAmount(Cart c);

  int deleteCart(@Param("productNo") int productNo, @Param("memberId") String memberId);

  int insertCart(Cart c);

  int addStatus(Cart c);

  int insertAmount(Cart c);

  int plusAmount(Cart c);

}
