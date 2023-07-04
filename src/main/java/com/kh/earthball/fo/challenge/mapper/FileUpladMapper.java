package com.kh.earthball.fo.challenge.mapper;

import com.kh.earthball.fo.challenge.vo.ChaFile;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FileUpladMapper {

  int insertChaFile(ChaFile chaFile);

  Integer getFileNo();

}
