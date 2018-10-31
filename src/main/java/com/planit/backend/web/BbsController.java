package com.planit.backend.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.planit.backend.service.AskService;
import com.planit.backend.service.BbsService;
import com.planit.backend.service.PartnerAskDTO;
import com.planit.backend.service.UserAskDTO;

@Controller
public class BbsController {
	
	@Resource(name="askService")
	private AskService askService;
	@Resource(name="bbsService")
	private BbsService bbsService;
	// 이동
	@RequestMapping("/Planit/Admin/BBS/AskList.do")
	public String gotoAskList(@RequestParam Map map	// 데이터를 보내기 위한 모델
													)throws Exception{
		
		//리스트 화면에서는 기본적으로 사용자 문의 게시판이 먼저 보인다.
		return "bbs/AskBbsList.tiles";
	}
	
	// <li><a href="<c:url value='/Planit/Admin/BBS/NoticeList.do'/>">공지사항</a></li>
//    <li><a href="<c:url value='/Planit/Admin/BBS/AskList.do'/> ">문의게시판</a></li>
//    <li><a href="<c:url value='/Planit/Admin/BBS/RequestUpList.do'/>">정보수정건의</a></li>
	
	@RequestMapping("/Planit/Admin/BBS/RequestUpList.do")
	public String gotoRequestUp() throws Exception{
		return "bbs/requestup/RequestUpList.tiles";
	}
	
	
	/////////************************************공지사항

	//[공지사항 리스트 페이지]
	@RequestMapping("/Planit/Admin/BBS/NoticeList.do")
	public String gotoNoticeList(Model model)throws Exception{
		System.out.println("여기들어오긴 하냐");
		
		List<Map> noticeList=bbsService.selectNoticeList();
		for(Map list:noticeList) {
			list.put("POSTDATE", list.get("POSTDATE").toString().subSequence(0, 10));
		}
		System.out.println("noticeList:"+noticeList==null?"없다":"있다");
		model.addAttribute("noticeList", noticeList);
		
		return "bbs/notice/NoticeBbsList.tiles";
	}
	//[공지사항 상세보기 페이지]
	@RequestMapping("/Planit/Admin/BBS/NoticeView.do")
	public String gotoNoticeView(@RequestParam Map map,Model model) throws Exception{
		System.out.println(map.get("no"));		
		Map noticeView=bbsService.selectNoticeView(map);
		
		model.addAttribute("noticeView",noticeView);
		return "bbs/notice/NoticeBbsView.tiles";
	}
//[공지사항 수정 페이지]
	@RequestMapping("/Planit/Admin/BBS/NoticeEdit.do")
	public String gotoNoticeEdit(@RequestParam Map map,Model model) throws Exception{
		System.out.println(map.get("no")==null?"no가 없다":"no가 있다");
		System.out.println(map.get("no"));		
		Map noticeView=bbsService.selectNoticeView(map);
		
		model.addAttribute("noticeView",noticeView);
		return "bbs/notice/NoticeBbsEdit.tiles";
	}
//[공지사항 수정프로세스]
	@RequestMapping("/Planit/Admin/BBS/NoticeEditProcess.do")
	public String noticeEditProcess(@RequestParam Map map,Model model) throws Exception{
		System.out.println("NO파라미터:"+map.get("no")==null?"no가 없다":"no가 있다");
		System.out.println("여기 들어오는거야 ㅜㅜ?"+map.get("no"));
		System.out.println(map.get("no"));
		System.out.println(map.get("title"));
		System.out.println(map.get("content"));
		int editOK=bbsService.noticeEdit(map);
		return "forward:/Planit/Admin/BBS/NoticeView.do";
	}
//[공지사항 작성 페이지]
	@RequestMapping("/Planit/Admin/BBS/NoticeWrite.do")
	public String gotoNoticeWrite() throws Exception{
	
		return "bbs/notice/NoticeBbsWrite.tiles";
	}
//[공지사항 작성프로세스]
	@RequestMapping("/Planit/Admin/BBS/NoticeWriteProcess.do")
	public String noticeWriteProcess(@RequestParam Map map,Model model,HttpSession session) throws Exception{
		map.put("e_id", session.getAttribute("e_id"));
		System.out.println("겟아이디1:"+session.getAttribute("e_id"));
		System.out.println("djdjdjdjdjdjd"+bbsService.getEMP_NO(map));

		map.put("emp_no", (bbsService.getEMP_NO(map)).get("EMP_NO"));
		int noticeWrite=bbsService.noticeWrite(map);
		
		return "forward:/Planit/Admin/BBS/NoticeList.do";
	}
//[공지사항 삭제 페이지]
	@RequestMapping("/Planit/Admin/BBS/NoticeDelete.do")
	public String gotoNoticeDelete(@RequestParam Map map,Model model) throws Exception{
		System.out.println(map.get("no"));		
		int noticeDelete=bbsService.noticeDelite(map);
		return "forward:/Planit/Admin/BBS/NoticeList.do";
	}
	
	/////////************************************문의게시판
	
//[문의게시판 리스트 페이지]
	@RequestMapping("/Planit/Admin/BBS/AskList.do")
	public String gotoAskList(@RequestParam Map map, HttpServletRequest req)throws Exception{
		

		return "bbs/notice/NoticeBbsList.tiles";
	}
}
/*
 * 
	
	@ResponseBody
	@RequestMapping(value="/planit/bbs/asklist.do", produces="text/plain; charset=UTF-8")
	public String askList(@RequestParam Map map, HttpServletRequest req) throws Exception{
			System.out.println(map.get("whoAsk"));
		
			if(map.get("whoAsk").equals("user")) {
				List<Map> userAsks = askService.selectAskList(map);
				int userAskNum = 0;
				for(Map record: userAsks) {
					record.put("ASKDATE", record.get("ASKDATE").toString());
					if(record.get("STATUS").toString().equals("waited")) userAskNum++;
				}
				Map numMap = new HashMap();
				numMap.put("userAskNum", userAskNum);
				map.put("status", "waited");
				numMap.put("partnerAskNum", askService.selectPartnerAskList(map).size());
				userAsks.add(numMap);
				return JSONArray.toJSONString(userAsks);
			}
			else {
				List<Map> partnerAsk = askService.selectPartnerAskList(map);
				int partnerAskNum = 0;
				for(Map record: partnerAsk) {
					record.put("ASKDATE", record.get("ASKDATE").toString());
					if(record.get("STATUS").toString().equals("waited")) partnerAskNum++;
				
				}
				Map numMap = new HashMap();
				numMap.put("partnerAskNum", partnerAskNum);
				map.put("status", "waited");
				numMap.put("userAskNum", askService.selectAskList(map).size());
				partnerAsk.add(numMap);
				return JSONArray.toJSONString(partnerAsk);
			}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/Planit/Admin/BBS/AskView.do", produces="text/plain; charset=UTF-8")
	public String askView(@RequestParam Map map)throws Exception{
		System.out.println(map.get("whoAsk")+"가"+map.get("ask_no")+"을 물었습니다.");
		JSONObject json = new JSONObject();
		if("user".equals(map.get("whoAsk").toString())) {
			UserAskDTO record = askService.selectUserAskOne(map);
			json.put("ask_no", record.getAsk_no());
			json.put("title", record.getTitle());
			json.put("id", record.getId());
			json.put("name", record.getName());
			json.put("content", record.getContent());
			json.put("askdate", record.getAskdate().toString());
		
		}else {  //partner
			PartnerAskDTO record = askService.selectPartnerAskOne(map);
			json.put("ask_no", record.getAsk_no());
			json.put("title", record.getTitle());
			json.put("id", record.getP_id());
			json.put("name", record.getName());
			json.put("content", record.getContent());
			json.put("askdate", record.getAskdate().toString());
		}
		
		return json.toJSONString();
	}*/
