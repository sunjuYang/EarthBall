package com.kh.earthball.fo.product.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import com.kh.earthball.fo.product.vo.Atta;
import com.kh.earthball.fo.product.vo.Product;

public interface ProductMapper {

  int selectListCount();

  ArrayList<Product> selectAllProduct(RowBounds rowBounds);

  int selectCategoryListCount(String category);

  ArrayList<Product> selectCategoryProduct(@Param("rowBounds") RowBounds rowBounds, @Param("category") String category);

  Product selectProduct(int productNo);

  ArrayList<Atta> selectAtta(int productNo);

  ArrayList<Product> selectTopList();

}
