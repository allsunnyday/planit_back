package com.planit.backend.service.impl;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.planit.backend.service.SearchListDTO;
import com.planit.backend.service.SerachListService;

@Repository
public class SearchListDAO implements SerachListService{
	
	@Resource(name="template")
	private SqlSessionTemplate template;

	@Override
	public String selectOne(SearchListDTO dto) {
		return null;
	}
	
	

}
