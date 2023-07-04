package com.kh.earthball.bo.challenge.service;

import com.kh.earthball.bo.challenge.vo.CategoryTemplate;
import com.kh.earthball.fo.challenge.vo.ChConfirm;
import com.kh.earthball.fo.challenge.vo.Challenge;

import java.util.List;

public interface CategoryTemplateService {

  List<CategoryTemplate> selectTemplateList(ChConfirm chConfirm);

  int insertTemplate(CategoryTemplate template);

  CategoryTemplate selectTemplateForm(int categoryTemplateNo);

  int updateTemplate(CategoryTemplate categoryTemplate);

  int deleteTemplate(int categoryTemplateNo);

  List<CategoryTemplate> selectTemplateListNo(int categoryNo);
}
