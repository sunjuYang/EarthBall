package com.kh.earthball.bo.product.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import com.kh.earthball.bo.product.vo.AdminAtta;
import com.kh.earthball.bo.product.vo.AdminProduct;
import com.kh.earthball.fo.common.vo.PageInfo;

@Mapper
public interface AdminProductMapper {

  int selectListCount();

  int insertProduct(AdminProduct p);

  int insertProductAtta(AdminAtta at);

  ArrayList<AdminProduct> adminAllProductList(PageInfo pi, RowBounds rowBounds);

  AdminProduct selectDetailView(int productNo);

  ArrayList<AdminAtta> selectDetailviewAtta(int productNo);

  int updateProduct(AdminProduct p);

  int deleteAttaAll(AdminProduct p);

  int updateProductAtta(AdminAtta at);

  int updateStatus(@Param("productNo") int productNo, @Param("status") String status);

}
