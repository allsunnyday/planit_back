package com.planit.backend.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.planit.backend.service.AdminDTO;
import com.planit.backend.service.AdminService;
import com.planit.backend.service.AdminUserDTO;
import com.planit.backend.service.AdminUserService;

@Controller
public class DashBoardController {

	
	@Resource(name="adminService")
	private AdminService service;
	
	@Resource(name="adminUserService")
	private AdminUserService userService;
	
	
	//dashboard로 이동 
	@RequestMapping("/Planit/admin/Dashboard.do")
	public String dashboard(HttpSession session, Model model,@RequestParam Map map)throws Exception{
	    map = new HashMap();
		map.put("e_id", session.getAttribute("e_id"));
		// 서비스호출] 회원정보를 받아온다
		//디비연결 한 경우 
		AdminDTO admin=service.selectOne(map);
		System.out.println("admin"+admin.getName()+"deptname"+admin.getDeptname());
		// 데이터저장] position=팀장인 사람일 경우 master
		if(admin.getPosition().equals("대표")) {
			// 직급이 대표일 경우에만 직원관리란이 보인다. 
			session.setAttribute("master", admin.getE_id());
		}
		session.setAttribute("admin", admin.getName());
		//////////////////////////////////////////////////////////////////////////////////////////////
	
		//총가입자수
		int memberCount = userService.memberCount(map);
		model.addAttribute("gender",memberCount);
		
		List<AdminUserDTO> gender = userService.selectGenderList(map);
		if(map.get("gender") == "M") {
			session.setAttribute("man", map.put("gender", gender).toString());
		}
		//System.out.println("dd"+gender);
		model.addAttribute("gender1",gender);
		
		
		//플래너갯수
		int plannerCount = userService.plannerCount(map);
		List<AdminUserDTO> planner = userService.selectPlannerList(map);
		model.addAttribute("plannerCount",plannerCount);
		
		int noticeCount = userService.noticeCount(map);
		model.addAttribute("noticeCount",noticeCount);
		
		//리뷰조회수
		int index=0;
		List<AdminUserDTO> reviews = userService.selectReviewList(map);
		String review[] = new String[reviews.size()];
		for(AdminUserDTO dto : reviews){
			if(index<=reviews.size())
				index++;
		}
//		map.put("review", review[i]);
		System.out.println(review);
		System.out.println(reviews);
		model.addAttribute("review",review);
		
		
		//인기여행지 view_count빼오기
		List<AdminUserDTO> hotTour = userService.hotTourList(map);
		model.addAttribute("hotTour",hotTour);
		List<AdminUserDTO> hotPlanner = userService.hotPlannerList(map);
		model.addAttribute("hotPlanner",hotPlanner);
		List<AdminUserDTO> hotReview = userService.hotReviewList(map);
		model.addAttribute("hotReview",hotReview);
		
		
		
		
		return "analysis/Dashboard.tiles";
	}
	
}
