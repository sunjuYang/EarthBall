package com.kh.earthball.fo.product.service;

import java.util.ArrayList;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.product.mapper.ProductMapper;
import com.kh.earthball.fo.product.vo.Atta;
import com.kh.earthball.fo.product.vo.Product;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ProductServiceImpl implements ProductService {

  private final ProductMapper productMapper;

  @Override
  public ArrayList<Product> selectAllProduct(PageInfo pi) {

    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
    int limit = pi.getBoardLimit();

    RowBounds rowBounds = new RowBounds(offset, limit);

    return productMapper.selectAllProduct(rowBounds);
  }

  @Override
  public int selectListCount() {
    return productMapper.selectListCount();
  }

  @Override
  public int selectCategoryListCount(String category) {
    return productMapper.selectCategoryListCount(category);
  }

  @Override
  public ArrayList<Product> selectCategoryProduct(PageInfo pi, String category) {
    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
    int limit = pi.getBoardLimit();

    RowBounds rowBounds = new RowBounds(offset, limit);

    return productMapper.selectCategoryProduct(rowBounds, category);
  }

  @Override
  public Product selectProduct(int productNo) {
    return productMapper.selectProduct(productNo);
  }

  @Override
  public ArrayList<Atta> selectAtta(int productNo) {
    return productMapper.selectAtta(productNo);
  }

  @Override
  public ArrayList<Product> selectTopList() {
    return productMapper.selectTopList();
  }

  @Override
  public ArrayList<Product> selectCategoryList(int category, PageInfo pi) {

    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
    int limit = pi.getBoardLimit();

    RowBounds rowBounds = new RowBounds(offset, limit);

    ArrayList<Product> list = productMapper.selectAllProduct(rowBounds);

    return list;
  }

}
