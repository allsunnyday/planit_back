package com.planit.backend.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.planit.backend.service.AdminUserDTO;
import com.planit.backend.service.AdminUserService;

@Controller
public class AdminUserController {
	
	@Resource(name="adminUserService")
	private AdminUserService service;
	
	// 일반 사용자 정보 관리 화면
	@RequestMapping(value="/Planit/Admin/AdminUserInfo.do", produces="text/plain; charset=UTF-8")
	public String userInfo(@RequestParam Map map, Model model)throws Exception{
		List<AdminUserDTO> list = service.selectList(map);
		model.addAttribute("list", list);
		
		return "/user/info/AdminUserInfo.tiles";
	}
	// 사용자 즐겨찾기 
	@RequestMapping("/Planit/Admin/AdminFavorites.do")
	public String userFavorite()throws Exception{
		return "/user/favorite/AdminFavorites.tiles";
	}
	
	@RequestMapping("/Planit/Admin/AdminPlan.do")
	public String userPlanner()throws Exception{
		return "/user/planner/AdminPlanner.tiles";
	}
	
	@RequestMapping("/Planit/Admin/Book/List.do")
	public String userReservation()throws Exception{
		return "/user/reservation/AdminReservation.tiles";
	}
	
	@RequestMapping("/Planit/Admin/AdminReview.do")
	public String userReview()throws Exception{
		return "/user/review/AdminReview.tiles";
	}
	
	
	
	
	
}
