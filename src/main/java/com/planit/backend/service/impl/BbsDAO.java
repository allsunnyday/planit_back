package com.planit.backend.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.planit.backend.service.BbsService;
@Repository
public class BbsDAO implements BbsService {
	//서비스 주입
	
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	@Override
	public List<Map> selectNoticeList() {
		// TODO Auto-generated method stub
		return template.selectList("BbsNoticeList");
	}

}
