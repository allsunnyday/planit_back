package com.planit.backend.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.planit.backend.service.AdminUserDTO;
import com.planit.backend.service.AdminUserService;

@Service("adminUserService")
public class AdminUserServiceImpl implements AdminUserService{

	@Resource(name="adminUserDAO")
	private AdminUserDAO dao;

	@Override
	public List<AdminUserDTO> selectInfoList(Map map) {
		return dao.selectInfoList(map);
	}

	@Override
	public int getTotalCount(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public AdminUserDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(AdminUserDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(AdminUserDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(AdminUserDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<AdminUserDTO> selectPlannerList(Map map) {
		return dao.selectPlannerList(map);
	}

	@Override
	public List<AdminUserDTO> selectReviewList(Map map) {
		return dao.selectReviewList(map);
	}
	
	

}
