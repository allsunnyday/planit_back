package com.planit.backend.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.planit.backend.service.AdminReservationDTO;
import com.planit.backend.service.AdminReservationService;

@Service("adminReservationService")
public class AdminReservationServiceImpl implements AdminReservationService{

	@Resource(name="adminReservationDAO")
	private AdminReservationDAO dao;

	@Override
	public List<AdminReservationDTO> selectReservationList(Map map) {
		return dao.selectReservationList(map);
	}

	@Override
	public int getTotalCount(Map map) {
		return 0;
	}

	@Override
	public AdminReservationDTO selectOne(Map map) {
		return dao.selectOne(map);
	}

	
	
	

}
