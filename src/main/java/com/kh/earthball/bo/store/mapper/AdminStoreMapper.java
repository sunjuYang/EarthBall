package com.kh.earthball.bo.store.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import com.kh.earthball.bo.store.vo.AdminAtta;
import com.kh.earthball.bo.store.vo.AdminStore;
import com.kh.earthball.fo.common.vo.PageInfo;

@Mapper
public interface AdminStoreMapper {

  int selectListCount();

  int insertStore(AdminStore s);

  int insertStoreAtta(AdminAtta at);

  int selectSignUpListCount();
  
  ArrayList<AdminStore> adminAllStoreList(PageInfo pi, RowBounds rowBounds);

  int getRegionNo(@Param("city") String city, @Param("provinces") String province);

  
  int updateStore(AdminStore s);

  int updateStoreAtta(AdminAtta at);

  AdminStore selectStore(@Param("storeNo") int storeNo);

  ArrayList<AdminAtta> selectAtta(@Param("storeNo" )int storeNo);

  int deleteStore(int storeNo);

  ArrayList<AdminStore> selectSignUpList(PageInfo pi);

  int approvalStore(int storeNo);

  int deleteAttaAll(AdminStore s);
  
}
