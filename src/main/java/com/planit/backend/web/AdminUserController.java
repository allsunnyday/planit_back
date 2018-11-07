package com.planit.backend.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;

import org.json.simple.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
//+++++++++++++++++++++ 회원정보삭제?+++++++++++++++++++++++++++
	@RequestMapping("/Planit/Admin/AdminUserDelete.do")
	public String deleteInfo(@RequestParam Map map) throws Exception{
		AdminUserDTO dto = new AdminUserDTO();
		dto.setId(dto.getId());
		if(service.delete(dto)==1) {
			return "/Planit/Admin/AdminUserInfo.do";
		}
		
		return "/Planit/Admin/AdminUserInfo.do";
	}
	
		
 //+++++++++++++++++++++ 즐겨찾기+++++++++++++++++++++++++++ 
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
		
		
		int totalCount = service.favoritesCount(map);
		int totalPage = (int)Math.ceil(((double)totalCount/pageSize));
		int start = (nowPage-1)*pageSize+1;
		int end  = nowPage*pageSize;
		map.put("start", start);
		map.put("end", end);
		List<AdminUserDTO> list = service.selectFavoriteList(map);
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

	
 //+++++++++++++++++++++ PLANNER GET+++++++++++++++++++++++++++
	@RequestMapping(value="/Planit/Admin/AdminPlan.do",produces="text/plain; charset=UTF-8",method=RequestMethod.GET)
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
	
//+++++++++++++++++++++ PLANNER POST+++++++++++++++++++++++++++
	@ResponseBody
	@RequestMapping(value="/Planit/Admin/AdminPlan.do",produces="text/plain; charset=UTF-8",method=RequestMethod.POST)
	public String userInfoFavorites(@RequestParam Map map,Model model) {
	
		System.out.println("들어오나> "+map.get("days"));
				
		List<Map> collections = new Vector<Map>();
		List<AdminUserDTO> list = new ArrayList();
		//map.put("days", map.get("days"));
		//System.out.println("asdasd: "+map.get("days"));
		list=service.selectPlannerList(map);
		
		for(AdminUserDTO dto :list) {
			Map record = new HashMap();
			record.put("planner_id", dto.getPlanner_id().toString());
			record.put("id", dto.getId());
			record.put("days", dto.getDays().toString());
			record.put("view_count", dto.getViewcount().toString());
			record.put("postdate", dto.getPostdate().toString());
			collections.add(record);
		}
		System.out.println("사이즈:"+list.size());
		
		System.out.println("adsf:"+JSONArray.toJSONString(collections));
		return JSONArray.toJSONString(collections);
	}//////////////////
	
	
//+++++++++++++++++++++ 사용자 리뷰+++++++++++++++++++++++++++
	
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
	

   
//+++++++++++++++++++++ 일반 사용자 검색 조회 GET+++++++++++++++++++++++++++
	
   @RequestMapping(value="/Planit/Admin/AdminUserInfo.do", produces="text/plain; charset=UTF-8", method=RequestMethod.GET)
   public String userInfo(@RequestParam Map map, Model model
			,HttpServletRequest req,
			@RequestParam(required=false,defaultValue="1") int nowPage)throws Exception{
      System.out.println("userInfo호출");
      
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
				req.getContextPath()+"/Planit/Admin/AdminUserInfo.do?");

		model.addAttribute("list", list);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalRecordCount", totalCount);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("nowPage", nowPage);
        model.addAttribute("list", list);
      
      
      return "/user/info/AdminUserInfo.tiles";
   }
   
//+++++++++++++++++++++ 일반 사용자 검색 조회 POST+++++++++++++++++++++++++++
   
   @ResponseBody
   @RequestMapping(value="/Planit/Admin/AdminUserInfo.do", produces="text/plain; charset=UTF-8",method=RequestMethod.POST)
   public String userInfoAjax(@RequestParam Map map /*@RequestParam(value="age") List<String> ages*/) {
   
	   System.out.println("ajax로 들어옴");
      
    
//      System.out.println(ages);
      List<Map> collections = new Vector<Map>(); //파라미터 넘기기용 map
      List<AdminUserDTO> list = new ArrayList();//값 parsing용
      
//       System.out.println("ages"+ages);
//      map.put("gender", map.get("gender").toString());//성별 넣기
//       map.put("ages", map.get("ages").toString());

      System.out.println("ADfad:"+map.get("ages"));
      
      list = service.selectInfoList(map);
      for(AdminUserDTO dto: list) {
         Map record = new HashMap();
         record.put("id", dto.getId());
         record.put("name", dto.getName());
         record.put("email", dto.getEmail());
         record.put("gender", dto.getGender().toString());
         record.put("ages", dto.getAge().toString());
         record.put("regidate", dto.getRegidate().toString());
         collections.add(record);
      }
      System.out.println(list.size());//15
      System.out.println("dd  "+JSONArray.toJSONString(collections));
      return JSONArray.toJSONString(collections);
   }
 
 
   
}
