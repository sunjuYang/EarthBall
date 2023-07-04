package com.kh.earthball.bo.challenge.mapper;

import com.kh.earthball.bo.challenge.vo.Category;
import com.kh.earthball.bo.challenge.vo.Code;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryMapper {
  List<Category> selectCategoryList();

  int insertCategory(String categoryName);

  Category selectCategory(int categoryNo);

  int updateCategory(Category category);

  int deleteCategory(int categoryNo);

  String selectGrpCode(String categoryName);

  List<Code> selectCodeList(String categoryName);
}
