package com.planit.backend.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.planit.backend.service.ContentDTO;
import com.planit.backend.service.ContentService;

@Repository
public class ContentDAO implements ContentService {

	// sqlsession주입 
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	@Override
	public int insertOne(ContentDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertList(List<ContentDTO> list) {
		// TODO Auto-generated method stub
		return 0;
	}

}
