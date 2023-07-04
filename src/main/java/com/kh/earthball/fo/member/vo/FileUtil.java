package com.kh.earthball.fo.member.vo;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;
import org.springframework.web.multipart.MultipartFile;

public class FileUtil {

  public static String uploadFile(MultipartFile multipartFile, String uploadPath) throws UnsupportedEncodingException, NoSuchAlgorithmException, IOException {


    String origFilename = multipartFile.getOriginalFilename();
    if(origFilename == null || "".equals(origFilename)) return null;

    String filename = getUuidFileName(origFilename);
    byte[] bytes = multipartFile.getBytes();

    String filePath = uploadPath + filename;

    OutputStream outStr = new FileOutputStream(new File(filePath));

    outStr.write(bytes);
    outStr.close();

    return  filename;
  }

  public static String getUuidFileName(String origFilename) {
    String extension = origFilename.substring(origFilename.lastIndexOf(".") + 1); // 파일 확장자 추출
    String uniqueFilename = UUID.randomUUID().toString(); // 고유한 파일 이름 생성
    return uniqueFilename + "." + extension; // 고유한 파일 이름과 확장자 결합
  }
}
