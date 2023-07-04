package com.kh.earthball.fo.store.service;

import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.store.vo.Region;
import com.kh.earthball.fo.store.vo.Store;
import com.kh.earthball.fo.store.vo.StoreAtta;
import java.util.ArrayList;

public interface StoreService {
  // 매장 수 조회 
  int selectStoreListCount();

  // 매장 전체 리스트 조회
  ArrayList<Store> selectAllStoreList(boolean orderLikeCheck);

  ArrayList<Region> selectRegion();

  ArrayList<Region> selectCityList();

  ArrayList<Region> selectProvincesList(String city);

  int selectRegionNo(String city, String provinces);
  
  ArrayList<Store> selectFilterListC(String city, boolean orderLikeCheck);
  
  ArrayList<Store> selectFilterListR(int regionNo, boolean orderLikeCheck);

  ArrayList<Store> selectNameSearch(String searchValue, boolean orderLikeCheck);

  int insertStoreLike(int storeNo, String memberId);

  int deleteStoreLike(int storeNo, String memberId);

  int updateStoreLikesCount(int storeNo, int storeLikes, boolean isLiked);

  boolean isStoreLiked(String memberId, int storeNo);

  ArrayList<Store> selectLikeStore(String memberId);

  ArrayList<StoreAtta> selectStoreAttaList();

  ArrayList<StoreAtta> selectStoreAttaFilterList(ArrayList<Store> selectFilterList);


//  // 매장 상세 조회
//  Store selectStoreDetail(int storeNo);
//
  // 매장 좋아요 순 조회용
//  ArrayList<Store> selectStoreLikeList();

}
