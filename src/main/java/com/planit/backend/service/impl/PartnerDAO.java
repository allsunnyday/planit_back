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
		return template.selectOne("totalCount",map);
	}

	@Override
	public List<PartnerDTO> selectReservationList(Map map) {
		return template.selectList("reservation",map);
	}

	@Override
	public List<PartnerDTO> selectEventRequestList(Map map) {
		return template.selectList("requestEvent",map);
	}

}
