package com.kh.earthball.bo.Member.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.kh.earthball.bo.Member.mapper.AdminMemberMapper;
import com.kh.earthball.bo.Member.vo.AdminMember;
import com.kh.earthball.fo.common.vo.PageInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class MemberAdminServiceImpl implements MemberAdminService {
  
  private final AdminMemberMapper adminMemberMapper;
  
  @Override
  public int AdminMemberListCount() {
    return  adminMemberMapper.AdminMemberListCount();
  }

  @Override
  public List<AdminMember> selectAdminMemberList(PageInfo pageInfo) {
    
    int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
    int limit = offset + pageInfo.getBoardLimit();
    
    return adminMemberMapper.selectAdminMemberList(offset, limit);
  }

  @Override
  public List<AdminMember> searchAdminMember(String keyword) {
    return adminMemberMapper.searchAdminMember(keyword);
  }

  @Override
  public int updateMemberStatus(String memberId, String status) {
    return adminMemberMapper.updateMemberStatus(memberId, status);
  }
 }

