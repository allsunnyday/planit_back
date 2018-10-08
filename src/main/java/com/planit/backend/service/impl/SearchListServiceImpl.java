package com.planit.backend.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.planit.backend.service.SearchListDTO;
import com.planit.backend.service.SerachListService;

@Service("serarchListsService")
public class SearchListServiceImpl implements SerachListService {

	@Resource(name="serachListDAO")
	private SearchListDAO dao;
	
	
	@Override
	public String selectOne(SearchListDTO dto) {
		return null;
	}


}
