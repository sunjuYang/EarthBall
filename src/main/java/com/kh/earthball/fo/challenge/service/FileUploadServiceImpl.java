package com.kh.earthball.fo.challenge.service;

import com.kh.earthball.fo.challenge.mapper.FileUpladMapper;
import com.kh.earthball.fo.challenge.vo.ChaFile;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

@Slf4j
@Service
public class FileUploadServiceImpl implements FileUploadService {

  private final ServletContext servletContext;
  private final ResourceLoader resourceLoader;
  private final String DEFAULT_FILE_PATH = "/resources/fo/upload";
  private final FileUpladMapper fileUpladMapper;

  public FileUploadServiceImpl(
      ServletContext servletContext
      , FileUpladMapper fileUpladMapper
      , ResourceLoader resourceLoader) {
    this.servletContext = servletContext;
    this.fileUpladMapper = fileUpladMapper;
    this.resourceLoader = resourceLoader;
  }

  @Override
  public ChaFile setFileUpload(MultipartFile multipartFile) {
    Integer fileNo = fileUpladMapper.getFileNo();
    String fileExtension = FilenameUtils.getExtension(multipartFile.getOriginalFilename());
    String filePath = DEFAULT_FILE_PATH + "/" + fileNo + "."
        + fileExtension;

    try {
      File file = new File(
          servletContext.getRealPath("/") + filePath);
      File savefile = new File(
          "C:/earthball/workspace/earthball/src/main/webapp" + filePath);

      Files.createDirectories(Paths.get(file.getParent()));
      multipartFile.transferTo(file);
      FileUtils.copyFile(file, savefile);
    } catch (IOException e) {
      throw new RuntimeException(e);
    }

    ChaFile chaFile = ChaFile.builder()
        .fileNo(fileNo)
        .fileName(multipartFile.getOriginalFilename())
        .filePath(filePath)
        .build();
    int result = fileUpladMapper.insertChaFile(chaFile);

    if (result == 0) {
      throw new RuntimeException();
    }
    return chaFile;
  }


}
