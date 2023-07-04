package com.kh.earthball.fo.store.service;

import java.util.ArrayList;
import org.springframework.stereotype.Service;
import com.kh.earthball.fo.store.mapper.StoreMapper;
import com.kh.earthball.fo.store.vo.Region;
import com.kh.earthball.fo.store.vo.Store;
import com.kh.earthball.fo.store.vo.StoreAtta;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
@RequiredArgsConstructor
public class StoreServiceImpl implements StoreService {

  private final StoreMapper storeMapper;

  @Override
  public int selectStoreListCount() {
    return storeMapper.selectStoreListCount();
  }

  @Override
  public ArrayList<Store> selectAllStoreList(boolean orderLikeCheck) {
    return storeMapper.selectAllStoreList(orderLikeCheck);
  }

  @Override
  public ArrayList<Region> selectRegion() {
    return storeMapper.selectRegion();
  }

  @Override
  public ArrayList<Region> selectCityList() {
    return storeMapper.selectCityList();
  }

  @Override
  public ArrayList<Region> selectProvincesList(String city) {
   return storeMapper.selectProvincesList(city);
  }

  @Override
  public int selectRegionNo(String city, String provinces) {
    return storeMapper.selectRegionNo(city, provinces);
  }

  @Override
  public ArrayList<Store> selectFilterListC(String city, boolean orderLikeCheck) {
    return storeMapper.selectFilterListC(city, orderLikeCheck);
  }

  @Override
  public ArrayList<Store> selectFilterListR(int regionNo, boolean orderLikeCheck) {
    return storeMapper.selectFilterListR(regionNo, orderLikeCheck);
  }

  @Override
  public ArrayList<Store> selectNameSearch(String searchValue, boolean orderLikeCheck) {
    return storeMapper.selectNameSearch(searchValue, orderLikeCheck);
  }


  @Override
  public int insertStoreLike(int storeNo, String memberId) {
    return (int) storeMapper.insertStoreLike(storeNo, memberId);
    
  }

  @Override
  public int deleteStoreLike(int storeNo, String memberId) {
    return (int) storeMapper.deleteStoreLike(storeNo, memberId);
  }

  @Override
  public int updateStoreLikesCount(int storeNo, int storeLikes, boolean isLiked) {
    return (int) storeMapper.updateStoreLikesCount(storeNo, storeLikes, isLiked);
  }

  @Override
  public boolean isStoreLiked(String memberId, int storeNo) {
    return storeMapper.isStoreLiked(memberId, storeNo);
  }

  @Override
  public ArrayList<Store> selectLikeStore(String memberId) {
    return storeMapper.selectLikeStore(memberId);
  }

  @Override
  public ArrayList<StoreAtta> selectStoreAttaList() {
    return storeMapper.selectStoreAttaList();
  }

  @Override
  public ArrayList<StoreAtta> selectStoreAttaFilterList(ArrayList<Store> selectFilterList) {
    return storeMapper.selectStoreAttaFilterList(selectFilterList);
  }
  
}
