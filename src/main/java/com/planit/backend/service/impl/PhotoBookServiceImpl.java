package com.planit.backend.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.planit.backend.service.PhotoBookDTO;
import com.planit.backend.service.PhotoBookService;
@Service("photoBookService")
public class PhotoBookServiceImpl implements PhotoBookService{

	@Resource(name="photoBookDAO")
	private PhotoBookDAO dao;
	
	@Override
	public List<PhotoBookDTO> selectPhotoList(Map map) {
		return dao.selectPhotoList(map);
	}

	@Override
	public int getTotalCount(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
