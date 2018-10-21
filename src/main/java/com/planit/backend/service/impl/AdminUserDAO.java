package com.planit.backend.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.planit.backend.service.AdminUserDTO;
import com.planit.backend.service.AdminUserService;

@Repository
public class AdminUserDAO implements AdminUserService{

	//mybatis사용 root-context에서 등록한 변수를 가지고 온다. 
	@Resource(name="template")
	private SqlSessionTemplate template;

	@Override
	public List<AdminUserDTO> selectList(Map map) {
		return template.selectList("AdminUserInfoList", map);
	}

	@Override
	public int getTotalCount(Map map) {
		return template.selectOne("", map);
	}

	@Override
	public AdminUserDTO selectOne(Map map) {
		return template.selectOne("", map);
	}

	@Override
	public int insert(AdminUserDTO dto) {
		return template.insert("", dto);
	}

	@Override
	public int update(AdminUserDTO dto) {
		return template.update("", dto);
	}

	@Override
	public int delete(AdminUserDTO dto) {
		return template.delete("", dto);
	}
	
	

}
