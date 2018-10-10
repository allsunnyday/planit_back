package com.planit.backend.service;

import java.util.List;
import java.util.Map;

//일반 사용자 및 기업 사용자 문의 
public interface AskService {
	
	//일반 사용자 
	List<UserAskDTO> selectUserAskList(Map map);
	
	UserAskDTO selectUserAskOne(Map map);
	
	
	
	//기업 사용자
	List<PartnerAskDTO> selectPartnerAskList(Map map);
	PartnerAskDTO selectPartnerAskOne(Map map);
}
