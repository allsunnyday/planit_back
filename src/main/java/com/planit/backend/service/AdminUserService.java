package com.planit.backend.service;

import java.util.List;
import java.util.Map;

public interface AdminUserService {	
	//Info목록용
	List<AdminUserDTO> selectInfoList(Map map);
	//플래너
	List<AdminUserDTO> selectPlannerList(Map map);
	//리뷰
	List<AdminUserDTO> selectReviewList(Map map);
	//즐겨찾기
	List<AdminUserDTO> selectFavoriteList(Map map);
	//성별
	int genderCount(Map map);
	int gender1Count(Map map);
	
	//나이별
	List<AdminUserDTO> selectAgeList(Map map);
	
	//
	List<AdminUserDTO> hotTourList(Map map);
	List<AdminUserDTO> hotPlannerList (Map map);
	List<AdminUserDTO> hotReviewList(Map map);
	//총합(페이징)
	int getTotalCount(Map map);
	int plannerCount(Map map);
	int memberCount(Map map);
	int noticeCount(Map map);
	int reviewCount(Map map);
	int favoritesCount(Map map);
	//검색
	AdminUserDTO selectOne(Map map);
	
	//입력수정삭제
	int insert(AdminUserDTO dto);
	int update(AdminUserDTO dto);
	int delete(AdminUserDTO dto);
	
	
	int seoulCount(Map map);
	int gyeonggiCount(Map map);
	int incheonCount(Map map);
	int gangwonCount(Map map);
	int gyeongsangCount(Map map);
	int jeollaCount(Map map);
	int jejuCount(Map map);
	int chungcheongCount(Map map);
	

	
}
