package com.kh.earthball.bo.Member.service;

import java.util.List;
import com.kh.earthball.bo.Member.vo.AdminMember;
import com.kh.earthball.fo.common.vo.PageInfo;

public interface MemberAdminService {
  
  int AdminMemberListCount();
  
  List<AdminMember>selectAdminMemberList(PageInfo pageInfo);
  
  List<AdminMember> searchAdminMember(String keyword);
  
  int updateMemberStatus(String memberId, String status);

}
