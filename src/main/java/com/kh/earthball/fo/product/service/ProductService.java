package com.kh.earthball.fo.product.service;

import java.util.ArrayList;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.product.vo.Atta;
import com.kh.earthball.fo.product.vo.Product;

public interface ProductService {

  ArrayList<Product> selectAllProduct(PageInfo pi);

  int selectListCount();

  int selectCategoryListCount(String category);

  ArrayList<Product> selectCategoryProduct(PageInfo pi, String category);

  Product selectProduct(int productNo);

  ArrayList<Atta> selectAtta(int productNo);

  ArrayList<Product> selectTopList();

  ArrayList<Product> selectCategoryList(int category, PageInfo pi);

}
