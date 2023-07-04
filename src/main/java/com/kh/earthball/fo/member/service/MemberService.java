package com.kh.earthball.fo.member.service;

import com.kh.earthball.fo.member.vo.Member;


public interface MemberService {

  Member loginMember(Member m);

  int insertMember(Member m);

  int updateMember(Member m);

  int idCheck(String checkId);
  
  int updateMailKey(Member m) throws Exception;

  int updateMailAuth(Member m) throws Exception;

  int emailAuthFail(String memberId) throws Exception;

  int mailAuthStatus(String memberId);

  void updateProfile(String memberId, String profileName);

  String selectProfile(String memberId);

  int insertProfile(String memberImg, String memberId);

  int deleteMember(String memberId);
  
  int nameCheck(String memberName);
  
}
