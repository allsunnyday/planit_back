package com.planit.backend.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
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
	

	@RequestMapping("/Planit/Admin/BBS/AskList.do")
	public String gotoAskList(@RequestParam Map map,  // 검색을 설정하기 위한
										Model model		// 데이터를 보내기 위한 모델
													)throws Exception{
		// 서비스 호출 
		// u_ask_planit  -- 리스트 및  새로운 글 개수 
		List<UserAskDTO> userAsks = askService.selectUserAskList(map);
		int uWatiedNumber=0;
		for(UserAskDTO dto: userAsks) {
			if(dto.getStatus().equals("waited"))
				uWatiedNumber++;
		}
		
		// p_ask_planit  -- 새로운 글 새수만 
		map.put("status", "waited");
		List<Map> partnerAsks = askService.selectPartnerAskList(map); 
		System.out.println(partnerAsks.size()+"개 있습니다.");
		
		// 데이터 저장
		model.addAttribute("userAsk", userAsks);
		model.addAttribute("uWatiedNumber", uWatiedNumber);
		model.addAttribute("pWatiedNumber", partnerAsks.size());  
		
		//리스트 화면에서는 기본적으로 사용자 문의 게시판이 먼저 보인다.
		return "bbs/AskBbsList.tiles";
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
	
	
	@RequestMapping("/Planit/Admin/BBS/AskView.do")
	public String askView()throws Exception{
		return "bbs/AskBbsView.tiles";
	}
	
}
