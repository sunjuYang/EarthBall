package com.kh.earthball.bo.challenge.service;

import com.kh.earthball.bo.challenge.mapper.CategoryTemplateMapper;
import com.kh.earthball.bo.challenge.mapper.CodeMapper;
import com.kh.earthball.bo.challenge.vo.CategoryTemplate;
import com.kh.earthball.bo.challenge.vo.Code;
import com.kh.earthball.fo.challenge.mapper.ConfirmMapper;
import com.kh.earthball.fo.challenge.vo.ChConfirm;
import com.kh.earthball.fo.challenge.vo.ChDetailInfo;
import com.kh.earthball.fo.challenge.vo.ChDetailInfoParam;
import com.kh.earthball.fo.challenge.vo.Challenge;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class CategoryTemplateServiceImpl implements CategoryTemplateService {

  private final CategoryTemplateMapper templateMapper;
  private final CodeMapper codeMapper;
  private final ConfirmMapper confirmMapper;

  @Override
  public List<CategoryTemplate> selectTemplateList(ChConfirm chConfirm) {

    int categoryNo = chConfirm.getCategoryNo();
    int chNo = chConfirm.getChNo();
    int chConNo = chConfirm.getChConNo();

    List<CategoryTemplate> result = templateMapper.selectTemplateListNo(categoryNo);

    for (CategoryTemplate categoryTemplate : result) {
      if (categoryTemplate.getCategoryTemplateNo() != 0) {
        int categoryTemplateNo = categoryTemplate.getCategoryTemplateNo();

        ChDetailInfoParam detailInfoParam = ChDetailInfoParam.builder().chNo(chNo).chConNo(chConNo)
            .categoryTemplateNo(categoryTemplateNo).build();

        List<ChDetailInfo> chDetailInfoList = confirmMapper.selectDetailInfoList(detailInfoParam);
        categoryTemplate.setChDetailInfoList(chDetailInfoList);
      }

      if (StringUtils.isNotEmpty(categoryTemplate.getGrpCode())) {
        List<Code> codeList = codeMapper.selectCodeList(categoryTemplate.getGrpCode());
        categoryTemplate.setCodeList(codeList);
      }


      if (categoryTemplate.getCodeList() != null && categoryTemplate.getCodeList()
          .isEmpty()) { // 코드 리스트가 있다면 => select / checkbox / radio 라면

        List<Code> codeList = categoryTemplate.getCodeList();
        List<ChDetailInfo> chDetailInfoList = categoryTemplate.getChDetailInfoList();

        for (Code code : codeList) {
          String codeOne = code.getCode();

          for (ChDetailInfo chDetailInfo : chDetailInfoList) {
            if (codeOne.equals(chDetailInfo.getCode())) {
              code.setChecked("true");
            }
            categoryTemplate.setCodeList(codeList);
          }
        }
      }
    }
    return result;
  }

  @Override
  public int insertTemplate(CategoryTemplate template) {
    return templateMapper.insertTemplate(template);
  }

  @Override
  public CategoryTemplate selectTemplateForm(int categoryTemplateNo) {
    return templateMapper.selectTemplateForm(categoryTemplateNo);
  }

  @Override
  public int updateTemplate(CategoryTemplate categoryTemplate) {
    return templateMapper.updateTemplate(categoryTemplate);
  }

  @Override
  public int deleteTemplate(int categoryTemplateNo) {
    return templateMapper.deleteTemplate(categoryTemplateNo);
  }

  @Override
  public List<CategoryTemplate> selectTemplateListNo(int categoryNo) {
    return templateMapper.selectTemplateListNo(categoryNo);
  }


}
