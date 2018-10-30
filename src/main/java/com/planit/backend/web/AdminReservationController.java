package com.planit.backend.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.planit.backend.service.AdminReservationDTO;
import com.planit.backend.service.AdminReservationService;

@Controller
public class AdminReservationController {
	
	@Resource(name="adminReservationService")
	private AdminReservationService service;
	
	@RequestMapping("/Planit/Admin/Book/List.do")
	public String userReservation(Model model, HttpSession session)throws Exception{
		List<AdminReservationDTO> list = service.selectReservationList();
		model.addAttribute("list", list);
		return "/user/reservation/AdminReservation.tiles";
	}
	
}
