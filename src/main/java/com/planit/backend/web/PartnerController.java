package com.planit.backend.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.planit.backend.service.AdminDTO;
import com.planit.backend.service.AdminReservationDTO;
import com.planit.backend.service.AdminUserDTO;
import com.planit.backend.service.PartnerDTO;
import com.planit.backend.service.PartnerService;
import com.planit.backend.service.impl.PartnerDAO;


@Controller
public class PartnerController {

	@Value("${PAGE_SIZE}")
	private int pageSize;
	//블락페이지
	@Value("${BLOCK_SIZE}")
	private int blockPage;
	
	@Resource(name="partnerService")
	private PartnerService service;
	
//	@Resource(name="adminService")
//	private AdminService service;
	

	
	@RequestMapping("/Planit/Admin/Event/List.do")
	public String eventList(Model model,
			HttpServletRequest req, //페이징용 메소드 전달
			@RequestParam Map map,  //검색용 파라미터 전달
			@RequestParam(required=false, defaultValue="1") int nowPage //페이징용 파라미터 받기   
			)throws Exception{

			//데이터 확인용
			if(map.get("searchColumn")!= null) {
			model.addAttribute("searchColumn",map.get("searchColumn"));
			model.addAttribute("searchWord",map.get("searchWord"));
			}
			
			// 페이징] 
			int totalEventCount = service.getTotalCount(map);
			// [2] 전체 페이지 수 
			int totalPage = (int)Math.ceil(((double)totalEventCount/pageSize));
			//시작 및 끝 ROWNUM구하기]
			int start = (nowPage-1)*pageSize+1;
			int end   = nowPage*pageSize;
			map.put("start", start);
			map.put("end", end);
			// 서비스 호출] 직원의 리스트를 받아온다.
			List<PartnerDTO> list = service.selectEventList(map);
			// 데이터저장]
			String pagingString = CommonUtil.pagingBootStrapStyle(totalEventCount, pageSize,
								blockPage, nowPage,
								req.getContextPath()+"/Planit/Admin/Event/List.do?");
			model.addAttribute("list", list);
			model.addAttribute("pagingString", pagingString);
			model.addAttribute("totalRecordCount", totalEventCount);
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("nowPage", nowPage);
		
		
		return "partner/event/EventList.tiles";
	}
	
	/******************기업회원 리스트 ********************/
	@RequestMapping("/Planit/Admin/partner/List.do")
	public String partnerList(Model model,
			HttpServletRequest req, //페이징용 메소드 전달
			@RequestParam Map map,  //검색용 파라미터 전달
			@RequestParam(required=false, defaultValue="1") int nowPage)throws Exception{
		
			
			//데이터 확인용
			if(map.get("searchColumn")!= null) {
			model.addAttribute("searchColumn",map.get("searchColumn"));
			model.addAttribute("searchWord",map.get("searchWord"));
			}
			
			// 페이징] 
			//int totalEventCount = service.getTotalCount(map);
			int totalEventCount = 8;
			// [2] 전체 페이지 수 
			int totalPage = (int)Math.ceil(((double)totalEventCount/pageSize));
			//시작 및 끝 ROWNUM구하기]
			int start = (nowPage-1)*pageSize+1;
			int end   = nowPage*pageSize;
			map.put("start", start);
			map.put("end", end);
			// 서비스 호출] 직원의 리스트를 받아온다.
			List<PartnerDTO> desclist = service.selectPartnerDescList(map);
			// 데이터저장]
			String pagingString = CommonUtil.pagingBootStrapStyle(totalEventCount, pageSize,
								blockPage, nowPage,
								req.getContextPath()+"/Planit/Admin/Event/List.do?");
			model.addAttribute("desclist", desclist);
			model.addAttribute("pagingString", pagingString);
			model.addAttribute("totalRecordCount", totalEventCount);
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("nowPage", nowPage);
			
			// 데이터저장]
		return "partner/partnerinfo/PartnerList.tiles";
	}
	
	@RequestMapping(value="/Planit/Admin/Reservation/List.do",produces="text/plain; charset=UTF-8", method=RequestMethod.GET)
	public String reservateion(Model model,Map map
			)throws Exception{
		System.out.println("예약:"+map.get("roomtitle"));
		List<PartnerDTO> list = service.selectReservationList(map);
		model.addAttribute("list", list);
		return "partner/partnerinfo/PartnerReservation.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="/Planit/Admin/Reservation/List.do",produces="text/plain; charset=UTF-8", method=RequestMethod.POST)
	public String ajaxReservation(@RequestParam Map map, @RequestParam(value="status") String sta)throws Exception{
		
		  System.out.println("들들들?:"+map.get("status"));
		  
	      map.put("status", map.get("status").toString());
	      System.out.println(sta);
	      List<Map> collections = new Vector<Map>(); 
	      List<PartnerDTO> list = new ArrayList();
	      System.out.println("sta"+sta);
	      map.put("status", sta);
	      list = service.selectReservationList(map);
	      for(PartnerDTO dto : list) {
				Map record = new HashMap();
				record.put("p_id",dto.getP_id());
				record.put("planner_id",dto.getPlanner_id().toString());
				record.put("Reservation_id",dto.getReservation_id().toString());
				record.put("roomtitle", dto.getRoomtitle());
				record.put("status", dto.getStatus());
				record.put("bookdate",dto.getBookdate().toString());
				
				
			}
	      System.out.println(list.size());
	      System.out.println("dd  "+JSONArray.toJSONString(collections));
	      return JSONArray.toJSONString(collections);
	}
	
	
	@RequestMapping("/Planit/Admin/Event/Request.do")
	public String userEventRequest(Model model,HttpServletRequest req, @RequestParam Map map)throws Exception{
			int totalEventCount = service.getTotalCount(map);
			int totalPage = (int)Math.ceil(((double)totalEventCount/pageSize));
			List<PartnerDTO> list = service.selectEventRequestList(map);
			// 데이터저장]
			String pagingString = req.getContextPath()+"/Planit/Admin/Event/Request.do?";
			model.addAttribute("list", list);
			model.addAttribute("pagingString", pagingString);
			model.addAttribute("totalRecordCount", totalEventCount);
		return "partner/event/EventRequest.tiles";
	}
	
	@RequestMapping("/Planit/Admin/partner/View.do")
	public String partnerView()throws Exception{
		return "partner/partnerinfo/PartnerView.tiles";
	}
	
}
