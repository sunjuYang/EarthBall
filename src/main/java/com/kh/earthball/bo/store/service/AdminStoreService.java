package com.kh.earthball.bo.store.service;

import java.util.ArrayList;

import com.kh.earthball.bo.store.vo.AdminAtta;
import com.kh.earthball.bo.store.vo.AdminStore;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.store.vo.Store;

public interface AdminStoreService {

  int selectListCount();

  AdminStore selectStore(int storeNo);
  
  int insertStore(AdminStore s, ArrayList<AdminAtta> list);

  ArrayList<AdminStore> adminAllStoreList(PageInfo pi);

  int getRegionNo(String city, String provinces);
  
  int updateStore(AdminStore s, ArrayList<AdminAtta> list);

  ArrayList<AdminAtta> selectAtta(int storeNo);

  int deleteService(int storeNo);

  int selectSignUpListCount();

  ArrayList<AdminStore> selectSignUpList(PageInfo pi);

  int approvalStore(int storeNo);

}
