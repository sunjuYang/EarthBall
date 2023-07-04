package com.kh.earthball.bo.product.service;

import java.util.ArrayList;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.kh.earthball.bo.product.mapper.AdminProductMapper;
import com.kh.earthball.bo.product.vo.AdminAtta;
import com.kh.earthball.bo.product.vo.AdminProduct;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.product.vo.Product;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class AdminProductServiceImpl implements AdminProductService {

  private final AdminProductMapper productMapper;

  @Transactional
  @Override
  public int insertProduct(AdminProduct p, ArrayList<AdminAtta> list) {
    int result = productMapper.insertProduct(p);


    for(AdminAtta at : list) {
      result = productMapper.insertProductAtta(at);
    }
    return result;
  }

  @Override
  public ArrayList<AdminProduct> adminAllProductList(PageInfo pi) {

    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
    int limit = pi.getBoardLimit();

    RowBounds rowBounds = new RowBounds(offset, limit);

    return productMapper.adminAllProductList(pi, rowBounds);
  }

  @Override
  public int selectListCount() {
    return productMapper.selectListCount();
  }

  @Override
  public AdminProduct selectDetailView(int productNo) {
    return productMapper.selectDetailView(productNo);
  }

  @Override
  public ArrayList<AdminAtta> selectDetailviewAtta(int productNo) {
    return productMapper.selectDetailviewAtta(productNo);
  }

  @Transactional
  @Override
  public int updateProduct(AdminProduct p, ArrayList<AdminAtta> list) {

    int result = 0;

    result = productMapper.updateProduct(p);

    result = productMapper.deleteAttaAll(p);

    for(AdminAtta at : list) {

      if(!"".equals(at.getChangerName()) && at.getChangerName() != null) {

        result = productMapper.updateProductAtta(at);

      }
    }
    return result;
  }

  @Transactional
  @Override
  public int updateStatus(int productNo, String status) {
    return productMapper.updateStatus(productNo, status);
  }

}
