package com.planit.backend.service;

import java.util.List;
import java.util.Map;

public interface BbsService {
	//[공지사항 리스트]
	List<Map> selectNoticeList();
	//[공지사항 상세보기]
	Map selectNoticeView(Map map);
	//[공지사항 입력,수정,삭제]
	int noticeWrite(Map map);
	int noticeEdit(Map map);
	int noticeDelite(Map map);
	//[emp_no가져오기]
	Map getEMP_NO(Map map);
	
	//[문의게시판 리스트_User]
	List<Map> selectUserAskList(Map map);
	//[문의게시판 리스트_Partner]
	List<Map> selectPartnerAskList(Map map);
	//[공지사항 상세보기]
	Map selectAskView(Map map);
	//[문의게시판 입력,수정,삭제]
	int askWrite(Map map);
	int askEdit(Map map);
	int askDelite(Map map);
	
}
