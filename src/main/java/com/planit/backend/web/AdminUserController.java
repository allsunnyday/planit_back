package com.planit.backend.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
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
	@Value("${PAGE_SIZE}")
	private int pageSize;
	@Value("${BLOCK_SIZE}")
	private int blockPage;
	
	//회원 정보 삭제
	@RequestMapping("/Planit/Admin/AdminUserDelete.do")
	public String deleteInfo(@RequestParam Map map) throws Exception{
		AdminUserDTO dto = new AdminUserDTO();
		dto.setId(dto.getId());
		if(service.delete(dto)==1) {
			return "/Planit/Admin/AdminUserInfo.do";
		}
		
		return "/Planit/Admin/AdminUserInfo.do";
	}
	
	
	
	// 일반 사용자 정보 관리 화면
	@RequestMapping(value="/Planit/Admin/AdminUserInfo.do", produces="text/plain; charset=UTF-8")
	public String userInfo(@RequestParam Map map,Model model)throws Exception{
		System.out.println("userInfo호출");
		List<AdminUserDTO> list = service.selectInfoList(map);
		model.addAttribute("list", list);
		
		return "/user/info/AdminUserInfo.tiles";
	}
	
	
	
	// 사용자 즐겨찾기 
	@RequestMapping("/Planit/Admin/AdminFavorites.do")
	public String userFavorite(@RequestParam Map map, Model model
			,HttpServletRequest req,
			@RequestParam(required=false,defaultValue="1") int nowPage)throws Exception{
		
		System.out.println("들어오는지");
		
	
		// 이 페이지에 맞게 바꾸기
		if(map.get("searchColumn")!= null) {
			model.addAttribute("searchColumn",map.get("searchColumn"));
			model.addAttribute("searchWord",map.get("searchWord"));
		}
		
		
		int totalCount = service.getTotalCount(map);
		int totalPage = (int)Math.ceil(((double)totalCount/pageSize));
		int start = (nowPage-1)*pageSize+1;
		int end  = nowPage*pageSize;
		map.put("start", start);
		map.put("end", end);
		List<AdminUserDTO> list = service.selectInfoList(map);
		String pagingString = CommonUtil.pagingBootStrapStyle(
							totalCount,
							pageSize, 
							blockPage, 
							nowPage, 
							req.getContextPath()+"/Planit/Admin/AdminFavorites.do?");
		
		model.addAttribute("list", list);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalRecordCount", totalCount);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("nowPage", nowPage);
		
		model.addAttribute("list",list);
		
		
		return "/user/favorite/AdminFavorites.tiles";
	}
	
	@RequestMapping("/Planit/Admin/AdminPlan.do")
	public String userPlanner(@RequestParam Map map, Model model
			,HttpServletRequest req,
			@RequestParam(required=false,defaultValue="1") int nowPage)throws Exception{
		
		if(map.get("days")!=null)
			System.out.println(map.get("days"));
		if(map.get("searchColumn")!= null) {
			model.addAttribute("searchColumn",map.get("searchColumn"));
			model.addAttribute("searchWord",map.get("searchWord"));
		}
		int totalCount = service.getTotalCount(map);
		int totalPage = (int)Math.ceil(((double)totalCount/pageSize));
		int start = (nowPage-1)*pageSize+1;
		int end  = nowPage*pageSize;
		map.put("start", start);
		map.put("end", end);
		List<AdminUserDTO> list = service.selectPlannerList(map);
		String pagingString = CommonUtil.pagingBootStrapStyle(
							totalCount,
							pageSize, 
							blockPage, 
							nowPage, 
							req.getContextPath()+"/Planit/Admin/AdminPlan.do?");
		
		model.addAttribute("list", list);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalRecordCount", totalCount);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("nowPage", nowPage);
		
		model.addAttribute("list",list);
		
		
		
		
		return "/user/planner/AdminPlanner.tiles";
	}
	
	
	
	@RequestMapping("/Planit/Admin/AdminReview.do")
	public String userReview(@RequestParam Map map, Model model
			,HttpServletRequest req,
			@RequestParam(required=false,defaultValue="1") int nowPage)throws Exception{
		
		if(map.get("review_id")!=null)
			System.out.println("review_id:"+map.get("review_id"));
		if(map.get("searchColumn")!= null) {
			model.addAttribute("searchColumn",map.get("searchColumn"));
			model.addAttribute("searchWord",map.get("searchWord"));
		}
		int totalCount = service.getTotalCount(map);
		int totalPage = (int)Math.ceil(((double)totalCount/pageSize));
		int start = (nowPage-1)*pageSize+1;
		int end  = nowPage*pageSize;
		map.put("start", start);
		map.put("end", end);
		List<AdminUserDTO> list = service.selectReviewList(map);
		String pagingString = CommonUtil.pagingBootStrapStyle(
							totalCount,
							pageSize, 
							blockPage, 
							nowPage, 
							req.getContextPath()+"/Planit/Admin/AdminReview.do?");
		
		model.addAttribute("list", list);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalRecordCount", totalCount);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("nowPage", nowPage);
		
		model.addAttribute("list",list);
		
		
		
		
		
		return "/user/review/AdminReview.tiles";
	}
	
}
