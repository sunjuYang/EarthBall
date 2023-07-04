package com.kh.earthball.fo.challenge.service;

import com.kh.earthball.fo.challenge.vo.ChaFile;
import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService {

  ChaFile setFileUpload(MultipartFile multipartFile);

}
