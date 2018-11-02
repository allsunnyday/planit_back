package com.planit.backend.service;

import java.util.List;
import java.util.Map;

public interface AdminReservationService {	
	//Reservation목록용
	List<AdminReservationDTO> selectReservationList(Map map);
	//총합(페이징)
	int getTotalCount(Map map);
	//검색
	AdminReservationDTO selectOne(Map map);
	
}
