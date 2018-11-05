package com.planit.backend.service;

import java.util.List;
import java.util.Map;


public interface PartnerService {
	//파트너회원관리
	List<PartnerDTO> selectPartnerDescList(Map map);

	//이벤트 관리
	List<PartnerDTO> selectEventList(Map map);
	List<PartnerDTO> selectEventRequestList(Map map);
 	//예약관리
	List<PartnerDTO> selectReservationList(Map map);
	
	int getTotalCount(Map map);

	int update(Map map);
	PartnerDTO eventView(Map map);
	
}
