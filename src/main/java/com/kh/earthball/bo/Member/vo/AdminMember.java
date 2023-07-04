package com.kh.earthball.bo.Member.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class AdminMember {
  
  private String memberId;
  private String memberName;
  private String email;
  private Date birthDate;
  private String Phone;
  private String gender;
  private String CreatedDate;
  private String status;
  private String address1;
  private String address2;
  private String gradeName;
  private int MailAuth;

}
