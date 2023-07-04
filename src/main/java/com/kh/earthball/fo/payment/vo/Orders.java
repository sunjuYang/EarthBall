package com.kh.earthball.fo.payment.vo;

import java.util.List;
import com.kh.earthball.fo.cart.vo.Cart;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Orders {

  private String paymentNo;
  private int itemAmount;
  private List<Cart> orderList;

}
