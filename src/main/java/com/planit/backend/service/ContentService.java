package com.planit.backend.service;

import java.util.List;
import java.util.Map;

// 관광정보 서비스 인터페이스 
public interface ContentService {
	// 관광정보를 하나만 입력
	int insertOne(ContentDTO dto);
	// 관광정보를 여러개 입력
	int insertList(List<ContentDTO> list);
	
	List<Map> selectUpdateList(Map map);
	//여러행 추가 
	int insertContents(List<ContentDTO> contents);
	// 관광정보를 입력할 때마다 update_content 테이블 update
	void updateContentList(Map map);
}
