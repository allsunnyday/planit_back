package com.planit.backend.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.planit.backend.service.AdminDTO;
import com.planit.backend.service.AdminService;

@Repository
public class AdminDAO implements AdminService{

	//mybatis사용 root-context에서 등록한 변수를 가지고 온다. 
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	@Override
	public boolean isMember(Map map) {
		return (Integer)template.selectOne("adminIsMember", map)==1?true:false;
	}

	@Override
	public List<AdminDTO> selectList(Map map) {
		return template.selectList("adminSelectList", map);
	}

	@Override
	public int getTotalCount(Map map) {
		return template.selectOne("adminGetTotal",map);
	}

	@Override
	public AdminDTO selectOne(Map map) {
		return template.selectOne("adminSelectOne", map);
	}

	@Override
	public int insert(AdminDTO dto) {
		return 0;
	}

	@Override
	public int update(AdminDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(AdminDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

}
