package com.planit.backend.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.planit.backend.service.AskService;
import com.planit.backend.service.PartnerAskDTO;
import com.planit.backend.service.UserAskDTO;

@Controller
public class BbsController {
	
	@Resource(name="askService")
	private AskService askService;
	

	@RequestMapping("/Planit/Admin/BBS/AskList.do")
	public String gotoAskList(@RequestParam Map map,  // 검색을 설정하기 위한
							Model model		// 
													)throws Exception{
		// 서비스 호출 
		// u_ask_planit  -- 리스트 및  새로운 글 개수 
		List<UserAskDTO> userAsks = askService.selectUserAskList(map);
		// p_ask_planit  -- 새로운 글 새수만 
		System.out.println(userAsks.size()+"개 있습니다.");
		map.put("status", "waited");
		List<PartnerAskDTO> partnerAsks = askService.selectPartnerAskList(map); 
		System.out.println(partnerAsks.size()+"개 있습니다.");
		
		// 데이터 저장
		model.addAttribute("userAsk", userAsks);
		model.addAttribute("pWatiedNumber", partnerAsks.size());  
		
		//리스트 화면에서는 기본적으로 사용자 문의 게시판이 먼저 보인다.
		return "bbs/AskList.tiles";
	}
}
