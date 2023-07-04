package com.kh.earthball.bo.challenge.service;

import com.kh.earthball.bo.challenge.mapper.CategoryMapper;
import com.kh.earthball.bo.challenge.vo.Category;
import com.kh.earthball.bo.challenge.vo.Code;
import com.kh.earthball.fo.challenge.vo.Challenge;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService {

  private final CategoryMapper categoryMapper;

  @Override
  public List<Category> selectCategoryList() {
    return categoryMapper.selectCategoryList();
  }

  @Transactional
  @Override
  public int insertCategory(String categoryName) {
    return categoryMapper.insertCategory(categoryName);
  }

  @Override
  public Category selectCategory(int categoryNo) {
    return categoryMapper.selectCategory(categoryNo);
  }

  @Transactional
  @Override
  public int updateCategory(Category category) {
    return categoryMapper.updateCategory(category);
  }

  @Transactional
  @Override
  public int deleteCategory(int categoryNo) {
    return categoryMapper.deleteCategory(categoryNo);
  }

  @Override
  public List<Code> selectCodeList(String categoryName) {
    return categoryMapper.selectCodeList(categoryName);
  }



}
