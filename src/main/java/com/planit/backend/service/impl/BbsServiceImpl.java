package com.planit.backend.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.planit.backend.service.BbsService;
@Service("bbsService")
public class BbsServiceImpl implements BbsService {
	@Resource(name="bbsDAO")
	private BbsDAO dao;
	
	
	@Override
	public List<Map> selectNoticeList() {
		// TODO Auto-generated method stub
		return dao.selectNoticeList();
	}


	@Override
	public Map selectNoticeView(Map map) {
		// TODO Auto-generated method stub
		return dao.selectNoticeView(map);
	}


	@Override
	public int noticeWrite(Map map) {
		// TODO Auto-generated method stub
		return dao.noticeWrite(map);
	}


	@Override
	public int noticeEdit(Map map) {
		// TODO Auto-generated method stub
		return dao.noticeEdit(map);
	}


	@Override
	public int noticeDelite(Map map) {
		// TODO Auto-generated method stub
		return dao.noticeDelite(map);
	}


	@Override
	public Map getEMP_NO(Map map) {
		// TODO Auto-generated method stub
		return dao.getEMP_NO(map);
	}


	@Override
	public List<Map> selectUserAskList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectUserAskList(map);
	}


	@Override
	public List<Map> selectPartnerAskList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectPartnerAskList(map);
	}


	@Override
	public Map selectAskView(Map map) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int askWrite(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int askEdit(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int askDelite(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
