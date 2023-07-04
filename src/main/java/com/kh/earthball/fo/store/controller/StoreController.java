package com.kh.earthball.fo.store.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.kh.earthball.fo.member.service.MemberService;
import com.kh.earthball.fo.member.vo.Member;
import com.kh.earthball.fo.store.service.StoreService;
import com.kh.earthball.fo.store.template.GeocodingApi;
import com.kh.earthball.fo.store.vo.Region;
import com.kh.earthball.fo.store.vo.Store;
import com.kh.earthball.fo.store.vo.StoreAtta;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Controller
@Slf4j
public class StoreController {
  private final MemberService memberService;
  private final StoreService storeService;
  
  @PostMapping("storeListView.st")
  public String selectList(Member m, HttpSession session, Model model) {
      System.out.println("여기는 selectList");

      String memberId = m.getMemberId();
      if (memberId.equals("")) {
          memberId = "없다!";
      }
      Member loginUser = memberService.loginMember(m);
      // memberId 값을 세션에 저장
      session.setAttribute("memberId", memberId);
      session.setAttribute("loginUser", loginUser);
      
      // 전체 다 가져오기
      ArrayList<Region> regionList = storeService.selectRegion();

      // 시/도 만 가져오기
      ArrayList<Region> cityList = storeService.selectCityList();

      model.addAttribute("memberId", memberId);
      model.addAttribute("regionList", regionList);
      model.addAttribute("cityList", cityList);

      return "fo/store/storeListView";
  }
  
  @ResponseBody
  @GetMapping(value = "getStores.st", produces = "application/json; charset=UTF-8")
  public String getStoreList(String memberId, boolean orderLikeCheck) {
    System.out.println(orderLikeCheck);
      System.out.println("여기는 getStoreList");
      
      
      ArrayList<Store> list = storeService.selectAllStoreList(orderLikeCheck);
      ArrayList<StoreAtta> sList = storeService.selectStoreAttaList();
     
      
      
      // 결과를 담을 Map 생성
      Map<String, Object> resultMap = new HashMap<>();
      resultMap.put("storeList", list);
      resultMap.put("storeAttaList", sList);
      
      for (int i = 0; i < list.size(); i++) {
          GeocodingApi geocodingApi = new GeocodingApi();
          double[] coordinates = geocodingApi.getGeocode(list.get(i).getStoreAddress());
          double latitude = coordinates[0];
          double longitude = coordinates[1];
          String jibunAddress = geocodingApi.getJibunAddress(latitude, longitude);
          list.get(i).setStoreLat(latitude); // Store 객체에 위도 값 설정
          list.get(i).setStoreLon(longitude); // Store 객체에 경도 값 설정
          list.get(i).setJibunAddress(jibunAddress); // Store 객체에 지번 주소 값 설정

          boolean liked = storeService.isStoreLiked(memberId, list.get(i).getStoreNo());
          list.get(i).setLiked(liked); // Store 객체에 좋아요 여부 설정
      }
      
      // Gson을 사용하여 Map을 JSON 형식으로 변환하여 반환
      return new Gson().toJson(resultMap);
  }

  
  @ResponseBody
  @GetMapping(value = "getCities.st", produces = "application/json; charset=UTF-8")
  public String getCityFilter(String city, Model model) {
    ArrayList<Region> provincesList = storeService.selectProvincesList(city); 
    
    return new Gson().toJson(provincesList);
 
  }
  
  @ResponseBody
  @GetMapping(value = "getFilter.st", produces = "application/json; charset=UTF-8")
  public String getFilterList(String city, String provinces, String memberId, boolean orderLikeCheck) {
    System.out.println("getFilterList");
    
    
    if(provinces.equals("")) {

      ArrayList<Store> selectFilterList = storeService.selectFilterListC(city, orderLikeCheck);
      
      ArrayList<StoreAtta> sList = storeService.selectStoreAttaFilterList(selectFilterList);
      
      Map<String, Object> resultMap = new HashMap<>();
      resultMap.put("storeList", selectFilterList);
      resultMap.put("storeAttaList", sList);
      
      for (int i = 0; i < selectFilterList.size(); i++) {
        GeocodingApi geocodingApi = new GeocodingApi();
        double[] coordinates = geocodingApi.getGeocode(selectFilterList.get(i).getStoreAddress());
        double latitude = coordinates[0];
        double longitude = coordinates[1];
        String jibunAddress = geocodingApi.getJibunAddress(latitude, longitude);
        selectFilterList.get(i).setStoreLat(latitude); // Store 객체에 위도 값 설정
        selectFilterList.get(i).setStoreLon(longitude); // Store 객체에 경도 값 설정
        selectFilterList.get(i).setJibunAddress(jibunAddress); // Store 객체에 지번 주소 값 설정

        boolean liked = storeService.isStoreLiked(memberId, selectFilterList.get(i).getStoreNo());
        selectFilterList.get(i).setLiked(liked); // Store 객체에 좋아요 여부 설정
      }
      
    return new Gson().toJson(resultMap);
    }
    
    else {
      int regionNo = storeService.selectRegionNo(city, provinces);
      
      ArrayList<Store> selectFilterList = storeService.selectFilterListR(regionNo, orderLikeCheck);
      ArrayList<StoreAtta> sList = storeService.selectStoreAttaFilterList(selectFilterList);
      Map<String, Object> resultMap = new HashMap<>();
      resultMap.put("storeList", selectFilterList);
      resultMap.put("storeAttaList", sList);
      for (int i = 0; i < selectFilterList.size(); i++) {
        GeocodingApi geocodingApi = new GeocodingApi();
        double[] coordinates = geocodingApi.getGeocode(selectFilterList.get(i).getStoreAddress());
        double latitude = coordinates[0];
        double longitude = coordinates[1];
        String jibunAddress = geocodingApi.getJibunAddress(latitude, longitude);
        selectFilterList.get(i).setStoreLat(latitude); // Store 객체에 위도 값 설정
        selectFilterList.get(i).setStoreLon(longitude); // Store 객체에 경도 값 설정
        selectFilterList.get(i).setJibunAddress(jibunAddress); // Store 객체에 지번 주소 값 설정

        boolean liked = storeService.isStoreLiked(memberId, selectFilterList.get(i).getStoreNo());
        selectFilterList.get(i).setLiked(liked); // Store 객체에 좋아요 여부 설정
      }
      return new Gson().toJson(resultMap);
    }
  }
  
  @ResponseBody
  @GetMapping(value = "getNameSearch.st" , produces = "application/json; charset=UTF-8")
  public String selectNameSearch(String searchValue, String memberId, boolean orderLikeCheck) {
    System.out.println("여기는 : selectNameSearch");
    
    ArrayList<Store> nameSearchList = storeService.selectNameSearch(searchValue, orderLikeCheck);
    ArrayList<StoreAtta> sList = storeService.selectStoreAttaFilterList(nameSearchList);
    Map<String, Object> resultMap = new HashMap<>();
    resultMap.put("storeList", nameSearchList);
    resultMap.put("storeAttaList", sList);
    
    if (nameSearchList == null || nameSearchList.isEmpty()) {
      nameSearchList = new ArrayList<>();
    } else {
        for (int i = 0; i < nameSearchList.size(); i++) {
            GeocodingApi geocodingApi = new GeocodingApi();
            double[] coordinates = geocodingApi.getGeocode(nameSearchList.get(i).getStoreAddress());
            double latitude = coordinates[0];
            double longitude = coordinates[1];
            String jibunAddress = geocodingApi.getJibunAddress(latitude, longitude);
            nameSearchList.get(i).setStoreLat(latitude); // Store 객체에 위도 값 설정
            nameSearchList.get(i).setStoreLon(longitude); // Store 객체에 경도 값 설정
            nameSearchList.get(i).setJibunAddress(jibunAddress); // Store 객체에 지번 주소 값 설정

            boolean liked = storeService.isStoreLiked(memberId, nameSearchList.get(i).getStoreNo());
            nameSearchList.get(i).setLiked(liked); // Store 객체에 좋아요 여부 설정
        }
    }
    
    return new Gson().toJson(resultMap);
  }
  
  @ResponseBody
  @PostMapping(value= "storeLikes.st", produces = "application/json; charset=UTF-8")
  public boolean updatestoreLikes(int storeNo, boolean isLiked, int storeLikes, String memberId, Model model) {
    if(isLiked == true) {
      int result1 = storeService.insertStoreLike(storeNo, memberId);
      if(result1 > 0) {
        int result2 = storeService.updateStoreLikesCount(storeNo, storeLikes, isLiked);
      }
      else {
        System.out.println("변경실패!");
      }
      model.addAttribute("isLiked", isLiked);
      return isLiked;
      
    } else {
      int result1 = storeService.deleteStoreLike(storeNo, memberId);
      if(result1 > 0) {
        int result2 = storeService.updateStoreLikesCount(storeNo, storeLikes, isLiked);
      }
      else {
        System.out.println("변경실패!");
      }
      model.addAttribute("isLiked", isLiked);
      return isLiked;
    }
  }
  
  @ResponseBody
  @PostMapping(value = "likeListView.st", produces = "application/json; charset=UTF-8")
  public String getLikeStore(String memberId) {
    System.out.println("여기는 getLikeStore");
    ArrayList<Store> likeStoreList = storeService.selectLikeStore(memberId);
    ArrayList<StoreAtta> sList = storeService.selectStoreAttaFilterList(likeStoreList);
    Map<String, Object> resultMap = new HashMap<>();
      resultMap.put("storeList", likeStoreList);
      resultMap.put("storeAttaList", sList);
    for (int i = 0; i < likeStoreList.size(); i++) {
      GeocodingApi geocodingApi = new GeocodingApi();
      double[] coordinates = geocodingApi.getGeocode(likeStoreList.get(i).getStoreAddress());
      double latitude = coordinates[0];
      double longitude = coordinates[1];
      String jibunAddress = geocodingApi.getJibunAddress(latitude, longitude);
      likeStoreList.get(i).setStoreLat(latitude); // Store 객체에 위도 값 설정
      likeStoreList.get(i).setStoreLon(longitude); // Store 객체에 경도 값 설정
      likeStoreList.get(i).setJibunAddress(jibunAddress); // Store 객체에 지번 주소 값 설정
      
      boolean liked = storeService.isStoreLiked(memberId, likeStoreList.get(i).getStoreNo());
      likeStoreList.get(i).setLiked(liked); // Store 객체에 좋아요 여부 설정
    }
    return new Gson().toJson(resultMap);
  }
}
