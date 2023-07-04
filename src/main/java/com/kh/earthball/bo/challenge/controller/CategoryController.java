package com.kh.earthball.bo.challenge.controller;

import com.kh.earthball.bo.challenge.service.CategoryService;
import com.kh.earthball.bo.challenge.service.CategoryTemplateService;
import com.kh.earthball.bo.challenge.vo.Category;
import com.kh.earthball.bo.challenge.vo.CategoryTemplate;
import com.kh.earthball.fo.member.vo.Member;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@RequiredArgsConstructor
@Controller
@Slf4j
public class CategoryController {

  private final CategoryService categoryService;
  private final CategoryTemplateService templateService;

  @GetMapping("list.ca")
  public String selectListCategory(Model model, HttpSession session) {

    // 관리자가 아니라면 접근 불가하도록 설정
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || !"admin".equals(loginUser.getMemberId())) {
      return "redirect:/loginForm.me";
    }

    List<Category> categoryList = categoryService.selectCategoryList();

    model.addAttribute("categoryList", categoryList);

    return "bo/challenge/category/categoryListView";
  }


  @GetMapping("EnrollForm.ca")
  public String insertCategoryForm(HttpSession session) {

    // 관리자가 아니라면 접근 불가하도록 설정
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || !"admin".equals(loginUser.getMemberId())) {
      return "redirect:/loginForm.me";
    }

    return "bo/challenge/category/categoryEnrollForm";
  }


  @ResponseBody
  @PostMapping("insert.ca")
  public int insertCategory(String categoryName) {
    return categoryService.insertCategory(categoryName);
  }


  @GetMapping("updateForm.ca")
  public String updateCategoryForm(@RequestParam(value = "categoryNo") int categoryNo, Model model, HttpSession session) {

    // 관리자가 아니라면 접근 불가하도록 설정
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || !"admin".equals(loginUser.getMemberId())) {
      return "redirect:/loginForm.me";
    }

    Category category = categoryService.selectCategory(categoryNo);

    model.addAttribute("category", category);
    return "bo/challenge/category/categoryUpdateForm";
  }

  @ResponseBody
  @PostMapping("update.ca")
  public int updateCategory(Category category) {
    int result = categoryService.updateCategory(category);
    return result;
  }

  @ResponseBody
  @PostMapping("delete.ca")
  public int deleteCategory(int categoryNo) {
    return categoryService.deleteCategory(categoryNo);
  }


  @GetMapping("detail.ca")
  public String categoryDetailView(int categoryNo, Model model, HttpSession session) {

    // 관리자가 아니라면 접근 불가하도록 설정
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || !"admin".equals(loginUser.getMemberId())) {
      return "redirect:/loginForm.me";
    }

    List<CategoryTemplate> templateList = templateService.selectTemplateListNo(categoryNo);
    Category category = categoryService.selectCategory(categoryNo);

    model.addAttribute("templateList", templateList);
    model.addAttribute("category", category);

    return "bo/challenge/category/categoryDetailView";
  }
}
