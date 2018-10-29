package com.planit.backend.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.planit.backend.service.AskService;
import com.planit.backend.service.PartnerAskDTO;
import com.planit.backend.service.UserAskDTO;

@Controller
public class BbsController {
	
	@Resource(name="askService")
	private AskService askService;
	
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
	@RequestMapping("/Planit/Admin/BBS/NoticeList.do")
	public String gotoNoticeList()throws Exception{
		return "bbs/notice/NoticeBbsList.tiles";
	}
	
	@RequestMapping("/Planit/Admin/BBS/RequestUpList.do")
	public String gotoRequestUp() throws Exception{
		return "bbs/requestup/RequestUpList.tiles";
	}
	
	
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
	}
	
	/////////
	
	
}
