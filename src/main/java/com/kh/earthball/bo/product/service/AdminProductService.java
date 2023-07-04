package com.kh.earthball.bo.product.service;

import java.util.ArrayList;
import com.kh.earthball.bo.product.vo.AdminAtta;
import com.kh.earthball.bo.product.vo.AdminProduct;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.product.vo.Product;

public interface AdminProductService {

  int selectListCount();

  int insertProduct(AdminProduct p, ArrayList<AdminAtta> list);

  ArrayList<AdminProduct> adminAllProductList(PageInfo pi);

  AdminProduct selectDetailView(int productNo);

  ArrayList<AdminAtta> selectDetailviewAtta(int productNo);

  int updateProduct(AdminProduct p, ArrayList<AdminAtta> list);

  int updateStatus(int productNo, String status);

}
