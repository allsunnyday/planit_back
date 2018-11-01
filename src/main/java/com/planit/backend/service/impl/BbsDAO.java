package com.planit.backend.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.planit.backend.service.BbsService;
@Repository
public class BbsDAO implements BbsService {
	//서비스 주입
	
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	@Override
	public List<Map> selectNoticeList() {
		// TODO Auto-generated method stub
		return template.selectList("BbsNoticeList");
	}

	@Override
	public Map selectNoticeView(Map map) {
		// TODO Auto-generated method stub
		return template.selectOne("BbsNoticeView", map);
	}

	@Override
	public int noticeWrite(Map map) {
		// TODO Auto-generated method stub
		return template.insert("BbsNoticeWrite", map);
	}

	@Override
	public int noticeEdit(Map map) {
		// TODO Auto-generated method stub
		return template.update("BbsNoticeEdit", map);
	}

	@Override
	public int noticeDelite(Map map) {
		// TODO Auto-generated method stub
		return template.delete("BbsNoticeDelete",map);
	}

	@Override
	public Map getEMP_NO(Map map) {
		// TODO Auto-generated method stub
		return template.selectOne("BbsGetEmpID", map);
	}

	@Override
	public List<Map> selectUserAskList(Map map) {
		// TODO Auto-generated method stub
		return template.selectList("BbsUserAskList", map);
	}

	@Override
	public List<Map> selectPartnerAskList(Map map) {
		// TODO Auto-generated method stub
		return template.selectList("BbsPartnerAskList", map);
	}

	@Override
	public Map selectAskUserView(int ask_no) {
		// TODO Auto-generated method stub
		return template.selectOne("BbsUserSelectOne",ask_no);
	}

	@Override
	public Map selectAskPartnerView(int ask_no) {
		// TODO Auto-generated method stub
		return template.selectOne("BbsPartnerSelectOne",ask_no);
	}

	@Override
	public int getTotalCount(Map map) {
		// TODO Auto-generated method stub
		return template.selectOne("getTotalCount",map);
	}

	@Override
	public int askReply(Map map) {
		// TODO Auto-generated method stub
		return template.update("BbsASKReply",map);
	}

	@Override
	public int askPartnerReply(Map map) {
		// TODO Auto-generated method stub
		return template.update("BbsPartnerASKReply",map);
	}

}
