package com.planit.backend.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.planit.backend.service.BbsService;
@Service("bbsService")
public class BbsServiceImpl implements BbsService {
	@Resource(name="bbsDAO")
	private BbsDAO dao;
	
	
	@Override
	public List<Map> selectNoticeList() {
		// TODO Auto-generated method stub
		return dao.selectNoticeList();
	}

}
