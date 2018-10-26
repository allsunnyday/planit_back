package com.planit.backend.service;

import java.util.List;
import java.util.Map;

public interface AdminService {

	//로그인용
	boolean isMember(Map map);
	
	//목록용
	List<AdminDTO> selectList(Map map);
	//
	int getTotalCount(Map map);
	//검색
	AdminDTO selectOne(Map map);
	//입력수정삭제
	int insert(AdminDTO dto);
	int update(AdminDTO dto);
	int delete(AdminDTO dto);

	
}
