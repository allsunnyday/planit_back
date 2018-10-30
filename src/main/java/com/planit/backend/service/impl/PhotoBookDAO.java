package com.planit.backend.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.planit.backend.service.PhotoBookDTO;
import com.planit.backend.service.PhotoBookService;
@Repository
public class PhotoBookDAO implements PhotoBookService {
	@Resource(name="template")
	private SqlSessionTemplate template;
	@Override
	public List<PhotoBookDTO> selectPhotoList(Map map) {
		return template.selectList("photo",map);
	}
	@Override
	public int getTotalCount(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
