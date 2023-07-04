package com.kh.earthball.fo.cart.service;

import java.util.ArrayList;
import com.kh.earthball.fo.cart.vo.Cart;

public interface CartService {

  ArrayList<Cart> selectList(String memberId);

  int updateAmount(Cart c);

  int deleteCart(int productNo, String memberId);

  int insertCart(Cart c);

  int addStatus(Cart c);

  int plusAmount(Cart c);

}
