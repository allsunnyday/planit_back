package com.planit.backend.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.planit.backend.service.AskService;
import com.planit.backend.service.PartnerAskDTO;
import com.planit.backend.service.UserAskDTO;

@Repository
public class AskDAO implements AskService{

	// sqlsession주입
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	//일반 사용자 
	@Override
	public List<UserAskDTO> selectUserAskList(Map map) {
		return template.selectList("askSelectUserAsk", map);
	}

	@Override
	public UserAskDTO selectUserAskOne(Map map) {
		return template.selectOne("askSelectUserOne", map);
	}

	// 기업 사용자 
	@Override
	public List<Map> selectPartnerAskList(Map map) {
		return template.selectList("askSelectPatnerAsk", map);
	}

	@Override
	public PartnerAskDTO selectPartnerAskOne(Map map) {
		return template.selectOne("askSelectPartnerOne", map);
	}

	@Override
	public List<Map> selectAskList(Map map) {
		
		return template.selectList("askSelectAskList", map);
	}

	@Override
	public int update(Map map) {
		return template.update("askUpdate",map);
	}

	@Override
	public List<UserAskDTO> selectAskReply(Map map) {
		return template.selectList("askReply",map);
	}

	
}
