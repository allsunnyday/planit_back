package com.planit.backend.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.planit.backend.service.AdminReservationDTO;
import com.planit.backend.service.AdminReservationService;

@Repository
public class AdminReservationDAO implements AdminReservationService{

	//mybatis사용 root-context에서 등록한 변수를 가지고 온다. 
	@Resource(name="template")
	private SqlSessionTemplate template;

	@Override
	public List<AdminReservationDTO> selectReservationList(Map map) {
		return template.selectList("AdminUserReservationList",map);
	}

	@Override
	public int getTotalCount(Map map) {
		return 0;
	}

	@Override
	public AdminReservationDTO selectOne(Map map) {
		return null;
	}



}
