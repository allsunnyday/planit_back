package com.planit.backend.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.planit.backend.service.PartnerDTO;
import com.planit.backend.service.PartnerService;
@Repository
public class PartnerDAO implements PartnerService {

	
	@Resource(name="template")
	private SqlSessionTemplate template;
	@Override
	public List<PartnerDTO> selectPartnerDescList(Map map) {
		return template.selectList("descList",map);
	}

	@Override
	public List<PartnerDTO> selectEventList(Map map) {
		return template.selectList("eventList",map);
	}

	
	@Override
	public int getTotalCount(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<PartnerDTO> selectReservationList() {
		return template.selectList("reservation");
	}

}
