package com.kh.earthball.bo.store.service;

import java.util.ArrayList;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.kh.earthball.bo.store.mapper.AdminStoreMapper;
import com.kh.earthball.bo.store.vo.AdminAtta;
import com.kh.earthball.bo.store.vo.AdminStore;
import com.kh.earthball.fo.common.vo.PageInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class AdminStoreServiceImpl implements AdminStoreService {

  private final AdminStoreMapper adminStoreMapper;

  @Transactional
  @Override
  public int insertStore(AdminStore s, ArrayList<AdminAtta> list) {
    int result1 = adminStoreMapper.insertStore(s);

    int result2 = 0;

    for(AdminAtta at : list) {
      result2 = adminStoreMapper.insertStoreAtta(at);
    }

    return result1 * result2;
  }

  @Override
  public ArrayList<AdminStore> adminAllStoreList(PageInfo pi) {

    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
    int limit = pi.getBoardLimit();

    RowBounds rowBounds = new RowBounds(offset, limit);

    return adminStoreMapper.adminAllStoreList(pi, rowBounds);
  }

  @Override
  public int selectListCount() {
    return adminStoreMapper.selectListCount();
  }

  // 매장 등록때 받은 city와 provinces로 지역값 불러오 
  @Override
  public int getRegionNo(String city, String provinces) {
    
    return adminStoreMapper.getRegionNo(city, provinces);
  }

  @Override
  public int updateStore(AdminStore s, ArrayList<AdminAtta> list) {
    
    int result = 0;

    result = adminStoreMapper.updateStore(s);
    
    result = adminStoreMapper.deleteAttaAll(s);

    for(AdminAtta at : list) {
      
      if(!"".equals(at.getChangerName()) && at.getChangerName() != null) {

        result = adminStoreMapper.updateStoreAtta(at);

      }
    }
    return result;
  }

  @Override
  public AdminStore selectStore(int storeNo) {
    return adminStoreMapper.selectStore(storeNo);
  }

  @Override
  public ArrayList<AdminAtta> selectAtta(int storeNo) {
    return adminStoreMapper.selectAtta(storeNo);
  }

  @Override
  public int deleteService(int storeNo) {
    return adminStoreMapper.deleteStore(storeNo);
  }

  @Override
  public int selectSignUpListCount() {
   return adminStoreMapper.selectSignUpListCount();
  }

  @Override
  public ArrayList<AdminStore> selectSignUpList(PageInfo pi) {
    return adminStoreMapper.selectSignUpList(pi);
  }

  @Override
  public int approvalStore(int storeNo) {
    return adminStoreMapper.approvalStore(storeNo);
  }

}
