package com.kh.earthball.fo.member.service;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.kh.earthball.fo.member.mapper.MemberMapper;
import com.kh.earthball.fo.member.vo.Member;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

  private final MemberMapper memberMapper;

  @Override
  public Member loginMember(Member m) {
    return memberMapper.loginMember(m);
  }

  @Override
  public int insertMember(Member m) {
    return memberMapper.insertMember(m);
  }

  @Override
  public int updateMember(Member m) {
    return memberMapper.updateMember(m);
  }


  @Override
  public int idCheck(String checkId) {
    return memberMapper.idCheck(checkId);
  }

  @Override
  public int updateMailKey(Member m) throws Exception {
    return memberMapper.updateMailKey(m);
  }

  @Override
  public int updateMailAuth(Member m) throws Exception {
    return memberMapper.updateMailAuth(m);
  }

  @Override
  public int emailAuthFail(String memberId) throws Exception {
    return memberMapper.emailAuthFail(memberId);
  }

  @Override
  public int mailAuthStatus(String memberId) {
    return memberMapper.mailAuthStatus(memberId);
  }

  @Override
  public void updateProfile(String memberId, String profileName) {
    memberMapper.updateProfile(memberId, profileName);
  }

  @Override
  public String selectProfile(String memberId) {
    return memberMapper.selectProfile(memberId);
  }

  @Transactional
  @Override
  public int insertProfile(String memberImg, String memberId) {
    return memberMapper.insertProfile(memberImg, memberId);
  }


  @Override
  public int deleteMember(String memberId) {
    return memberMapper.deleteMember(memberId);
  }

  @Override
  public int nameCheck(String memberName) {
   return memberMapper.nameCheck(memberName);
  }

  


  

}


