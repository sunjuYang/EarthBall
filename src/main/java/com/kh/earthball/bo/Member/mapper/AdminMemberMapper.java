package com.kh.earthball.bo.Member.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.kh.earthball.bo.Member.vo.AdminMember;

@Mapper
public interface AdminMemberMapper {

  int AdminMemberListCount();

  List<AdminMember>selectAdminMemberList(@Param("offset") int offset, @Param("limit") int limit);

  List<AdminMember> searchAdminMember(@Param("keyword") String keyword);
  
  int updateMemberStatus(@Param("MemberId") String memberId, @Param("status") String status);
}
