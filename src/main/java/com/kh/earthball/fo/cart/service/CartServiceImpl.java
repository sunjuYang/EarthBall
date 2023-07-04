package com.kh.earthball.fo.cart.service;

import java.util.ArrayList;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.kh.earthball.fo.cart.mapper.CartMapper;
import com.kh.earthball.fo.cart.vo.Cart;
import com.kh.earthball.fo.common.vo.PageInfo;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CartServiceImpl implements CartService  {

  private final CartMapper cartMapper;

  @Override
  public ArrayList<Cart> selectList(String memberId) {
    return cartMapper.selectList(memberId);
  }

  @Transactional
  @Override
  public int updateAmount(Cart c) {
    return cartMapper.updateAmount(c);
  }

  @Transactional
  @Override
  public int deleteCart(int productNo, String memberId) {
    return cartMapper.deleteCart(productNo, memberId);
  }

  @Override
  public int insertCart(Cart c) {
    return cartMapper.insertCart(c);
  }

  @Override
  public int addStatus(Cart c) {
    return cartMapper.addStatus(c);
  }

  @Override
  public int plusAmount(Cart c) {
    return cartMapper.plusAmount(c);
  }

}
