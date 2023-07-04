package com.kh.earthball.fo.cart.controller;

import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.kh.earthball.fo.cart.service.CartService;
import com.kh.earthball.fo.cart.vo.Cart;
import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Controller
public class CartController {

  private final CartService cartService;

  @GetMapping("cart.me")
  public String cart(){
    return "fo/cart/cart";
  }

  @ResponseBody
  @GetMapping(value="list.cart", produces="application/json; charset=UTF-8")
  public String ajaxCartList(String memberId) {

    ArrayList<Cart> list = cartService.selectList(memberId);

    return new Gson().toJson(list);
  }


  @ResponseBody
  @PostMapping("updateAmount.cart")
  public String ajaxUpdateAmount(int productNo, int amount, String memberId, Model model) {
    Cart c = new Cart();
    c.setProductNo(productNo);
    c.setAmount(amount);
    c.setMemberId(memberId);

    int result = cartService.updateAmount(c);

    return new Gson().toJson(result);
  }

  @ResponseBody
  @PostMapping("delete.cart")
  public String ajaxDeleteCart(@RequestParam(value="productNo[]")ArrayList<Integer> productNoArray,
                               String memberId) {

    int result = 0;

    for(int i = 0; i < productNoArray.size(); i++) {
      int productNo = productNoArray.get(i);

      result = cartService.deleteCart(productNo, memberId);
    }

    return new Gson().toJson(result);

  }

  @ResponseBody
  @PostMapping("insert.cart")
  public String ajaxInsertCart(int productNo, String memberId, int amount, int price) {

    Cart c = new Cart();

    c.setProductNo(productNo);
    c.setMemberId(memberId);
    c.setAmount(amount);
    c.setPrice(price);

    int addStatus = cartService.addStatus(c);

    int result = 0;

    if(addStatus == 1) {
      result = cartService.plusAmount(c);
    }else {
      result = cartService.insertCart(c);
    }

    return new Gson().toJson(result);
  }

}
