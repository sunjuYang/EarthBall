package com.kh.earthball.fo.challenge.controller;

import com.kh.earthball.fo.challenge.mapper.FileUpladMapper;
import com.kh.earthball.fo.challenge.service.FileUploadService;
import com.kh.earthball.fo.challenge.vo.ChaFile;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Slf4j
@Controller
@RequiredArgsConstructor
public class FileUploadController {

  private final FileUploadService fileUploadService;

  @ResponseBody
  @PostMapping("/challenge/file-upload")
  public ResponseEntity<ChaFile> setFileUpload(@RequestParam("file") MultipartFile file) {
    if (!file.isEmpty()) {
      return ResponseEntity.ok(fileUploadService.setFileUpload(file));
    } else {
      return ResponseEntity.badRequest().build();
    }
  }

}
