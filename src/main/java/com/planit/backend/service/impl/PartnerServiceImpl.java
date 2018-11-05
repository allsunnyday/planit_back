package com.planit.backend.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.planit.backend.service.PartnerDTO;
import com.planit.backend.service.PartnerService;
@Service("partnerService")
public class PartnerServiceImpl implements PartnerService{

	@Resource(name="partnerDAO")
	private PartnerDAO dao;
	
	
	@Override
	public List<PartnerDTO> selectPartnerDescList(Map map) {
		return dao.selectPartnerDescList(map);
	}


	@Override
	public int getTotalCount(Map map) {
		return dao.getTotalCount(map);
	}


	@Override
	public List<PartnerDTO> selectEventList(Map map) {
		return dao.selectEventList(map);
	}


	@Override
	public List<PartnerDTO> selectReservationList(Map map) {
		return dao.selectReservationList(map);
	}


	@Override
	public List<PartnerDTO> selectEventRequestList(Map map) {
		return dao.selectEventRequestList(map);
	}


	@Override
	public  PartnerDTO eventView(Map map) {
		return dao.eventView(map);
	}


	@Override
	public int update(Map map) {
		return dao.update(map);
	}



}
