package com.planit.backend.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.planit.backend.service.AdminDTO;
import com.planit.backend.service.AdminReservationDTO;
import com.planit.backend.service.AdminReservationService;
import com.planit.backend.service.AdminUserDTO;

@Controller
public class AdminReservationController {
	
	@Resource(name="adminReservationService")
	private AdminReservationService service;
	
	@RequestMapping(value="/Planit/Admin/Book/List.do",produces="text/plain; charset=UTF-8", method=RequestMethod.GET)
	public String userReservation(@RequestParam Map map, Model model)throws Exception{
		List<AdminReservationDTO> list = service.selectReservationList(map);
		model.addAttribute("list", list);
		return "/user/reservation/AdminReservation.tiles";
	}
	
//	@ResponseBody
//	@RequestMapping(value="/Planit/Admin/Book/List.do",produces="text/plain; charset=UTF-8", method=RequestMethod.POST)
//	public String ajaxReservation(@RequestParam Map map, Model model)throws Exception{
//		System.out.println("들들들?:"+map.get("status"));
//		
//		List<Map> collections = new Vector<Map>();
//		List<AdminReservationDTO> list = new ArrayList();
//		list = service.selectReservationList(map);
//		for(AdminReservationDTO dto :list) {
//			Map record = new HashMap();
//			record.put("id",dto.getId());
//			record.put("p_id",dto.getP_id());
//			record.put("reservation_id",dto.getReservation_id().toString());
//			record.put("roomtitle",dto.getRoomtitle());
//			record.put("status",dto.getStatus());
//			record.put("bookdate",dto.getBookdate().toString());
//		}
//		System.out.println("사이즈: "+list.size());
//		System.out.println("adsfadsf:"+JSONArray.toJSONString(collections));
				
	@ResponseBody
	@RequestMapping(value="/Planit/Admin/Book/List.do",produces="text/plain; charset=UTF-8", method=RequestMethod.POST)
	public String ajaxReservation(@RequestParam Map map, @RequestParam(value="status") String sta)throws Exception{
		
		  System.out.println("들들들?:"+map.get("status"));
		  
	      map.put("status", map.get("status").toString());
	      System.out.println(sta);
	      List<Map> collections = new Vector<Map>(); 
	      List<AdminReservationDTO> list = new ArrayList();
	      System.out.println("sta"+sta);
	      map.put("status", sta);
	      list = service.selectReservationList(map);
	      for(AdminReservationDTO dto :list) {
				Map record = new HashMap();
				record.put("id",dto.getId());
				record.put("p_id",dto.getP_id());
				record.put("reservation_id",dto.getReservation_id().toString());
				record.put("roomtitle",dto.getRoomtitle());
				record.put("status",dto.getStatus());
				record.put("bookdate",dto.getBookdate().toString());
			}
	      System.out.println(list.size());
	      System.out.println("dd  "+JSONArray.toJSONString(collections));
	      return JSONArray.toJSONString(collections);
	}
	
}
