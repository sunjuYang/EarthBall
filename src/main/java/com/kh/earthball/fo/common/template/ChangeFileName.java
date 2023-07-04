package com.kh.earthball.fo.common.template;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ChangeFileName {

  public static String saveFile(MultipartFile upfile, HttpSession session) {
    // 기존 파일명 추출
    String originName = upfile.getOriginalFilename();
    // 첨부파일의 입력시간기준으로 문자열만들기
    String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
    // 10000 ~ 99999까지의 랜덤숫자 생성
    int ranNum = (int)(Math.random() * 90000 + 10000);
    // 확장자명 추출
    String ext = "";
    int dotIndex = originName.lastIndexOf(".");
    if (dotIndex >= 0) {
      ext = originName.substring(dotIndex);
    }
    // 새로운 파일명 생성
    String changeName = currentTime + ranNum + ext;
    // 정해진 경로로 첨부파일 저장
    String savePath = session.getServletContext().getRealPath("/resources/fo/upfiles/");

    try {
      File target = new File(savePath + changeName);
      upfile.transferTo(target);
    } catch (IOException e) {
      e.printStackTrace();
    }
    return changeName;
  }

}
