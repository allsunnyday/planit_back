package com.planit.backend.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.planit.backend.service.AdminUserDTO;
import com.planit.backend.service.AdminUserService;

@Repository
public class AdminUserDAO implements AdminUserService{

	//mybatis사용 root-context에서 등록한 변수를 가지고 온다. 
	@Resource(name="template")
	private SqlSessionTemplate template;

	@Override
	public List<AdminUserDTO> selectInfoList(Map map) {
		return template.selectList("AdminUserInfoList",map);
	}
	@Override
	public int getTotalCount(Map map) {
		return template.selectOne("getTotal", map);
	}

	@Override
	public AdminUserDTO selectOne(Map map) {
		return template.selectOne("", map);
	}

	@Override
	public int insert(AdminUserDTO dto) {
		return template.insert("", dto);
	}

	@Override
	public int update(AdminUserDTO dto) {
		return template.update("", dto);
	}

	@Override
	public int delete(AdminUserDTO dto) {
		return template.delete("", dto);
	}

	@Override
	public List<AdminUserDTO> selectPlannerList(Map map) {
		return template.selectList("SelectPlannerList",map);
	}

	@Override
	public List<AdminUserDTO> selectReviewList(Map map) {
		return template.selectList("SelectReviewList",map);
	}
	@Override
	public List<AdminUserDTO> selectFavoriteList(Map map) {
		return template.selectList("SelectFavoriteList",map);
	}
	@Override
	public int genderCount(Map map) {
		return template.selectOne("genderCount",map);
	}
	@Override
	public int plannerCount(Map map) {
		return template.selectOne("getPlannerTotal",map);
	}
	@Override
	public int memberCount(Map map) {
		return template.selectOne("memberCount",map);
	}
	@Override
	public int noticeCount(Map map) {
		return template.selectOne("noticeCount",map);
	}
	@Override
	public List<AdminUserDTO> hotTourList(Map map) {
		return template.selectList("hotTour",map);
	}
	@Override
	public List<AdminUserDTO> hotPlannerList (Map map) {
		return template.selectList("hotPlanner",map);
	}
	@Override
	public List<AdminUserDTO> hotReviewList(Map map) {
		return template.selectList("hotReview",map);
	}
	@Override
	public List<AdminUserDTO> selectAgeList(Map map) {
		return template.selectList("ageList",map);
		
	}
	@Override
	public int reviewCount(Map map) {
		return template.selectOne("reviewCount",map);
	}
	

}
