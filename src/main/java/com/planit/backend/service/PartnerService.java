package com.planit.backend.service;

import java.util.List;
import java.util.Map;


public interface PartnerService {
	//
	List<PartnerDTO> selectPartnerDescList(Map map);

	//이벤트 관리
	List<PartnerDTO> selectEventList(Map map);
	
	List<PartnerDTO> selectReservationList();
	
	int getTotalCount(Map map);

	
	
}
