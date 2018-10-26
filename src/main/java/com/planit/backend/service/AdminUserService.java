package com.planit.backend.service;

import java.util.List;
import java.util.Map;

public interface AdminUserService {	
	//Info목록용
	List<AdminUserDTO> selectInfoList();
	
	//총합(페이징)
	int getTotalCount(Map map);
	
	//검색
	AdminUserDTO selectOne(Map map);
	
	//입력수정삭제
	int insert(AdminUserDTO dto);
	int update(AdminUserDTO dto);
	int delete(AdminUserDTO dto);
	
}
