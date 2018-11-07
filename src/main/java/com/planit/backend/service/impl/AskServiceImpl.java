package com.planit.backend.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.planit.backend.service.AskService;
import com.planit.backend.service.PartnerAskDTO;
import com.planit.backend.service.UserAskDTO;

@Service("askService")
public class AskServiceImpl implements AskService {
	
	@Resource(name="askDAO")
	private AskDAO dao;
	
	//일반 사용자
	@Override
	public List<UserAskDTO> selectUserAskList(Map map) {
		return dao.selectUserAskList(map);
	}

	@Override
	public UserAskDTO selectUserAskOne(Map map) {
		return dao.selectUserAskOne(map);
	}
	
	
	//기업사용자
	@Override
	public List<Map> selectPartnerAskList(Map map) {
		return dao.selectPartnerAskList(map);
	}

	@Override
	public PartnerAskDTO selectPartnerAskOne(Map map) {
		return dao.selectPartnerAskOne(map);
	}

	@Override
	public List<Map> selectAskList(Map map) {
		return dao.selectAskList(map);
	}

	@Override
	public int update(Map map) {
		return dao.update(map);
	}

	@Override
	public List<UserAskDTO> selectAskReply(Map map) {
		return dao.selectAskReply(map);
	}

}
