package com.planit.backend.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.planit.backend.service.ContentDTO;
import com.planit.backend.service.ContentService;
import com.planit.backend.service.UpdateDTO;


@Service("contentService")
public class ContentServiceImpl implements ContentService {

	@Resource(name="contentDAO")
	private ContentDAO dao;
	
	@Override
	public int insertOne(ContentDTO dto) {
		return dao.insertOne(dto);
	}

	@Override
	public int insertList(List<ContentDTO> list) {
		return dao.insertList(list);
	}

	@Override
	public List<UpdateDTO> selectUpdateList(Map map) {
		return dao.selectUpdateList(map);
	}

	

}
