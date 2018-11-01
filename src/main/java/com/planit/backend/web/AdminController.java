package com.planit.backend.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.planit.backend.service.AdminDTO;
import com.planit.backend.service.AdminService;

@Controller
public class AdminController {
	
	//리소스 파일 읽어오기
	//페이지 사이즈
	@Value("${PAGE_SIZE}")
	private int pageSize;
	//블락페이지
	@Value("${BLOCK_SIZE}")
	private int blockPage;
	
	
	@Resource(name="adminService")
	private AdminService service;
	
	@RequestMapping("/Planit/admin/login.do")
	public String login()throws Exception{
		return "admin/Login";// tiles적용안함
	}
	
	@RequestMapping(value="/planit/admin/loginprocess.do", method=RequestMethod.POST)
	public String loginProcess(@RequestParam Map map,   /// id. pwd
								HttpSession session, // 로그인처리
								Model model  // 에러발생시 다시 보여주기 위해서
								)throws Exception{
		//  디비 연결을 했을 시에 
		boolean flag=service.isMember(map);
		// 디비연결 안했을 경우 
		//boolean flag=true;
		if(!flag) {
			model.addAttribute("loginError", "아이디 비번 불일치"); // 비회원
			return "admin/Login";  // 타일즈 적용 안함 
		}
		else {
			session.setAttribute("e_id", map.get("e_id"));  //회원
			
			return "forward:/Planit/admin/Dashboard.do";
		}
	}
	
	@RequestMapping("/Planit/admin/logout.do")
	public String logout(HttpSession session)throws Exception{
		session.invalidate();
		return "forward:/";  //home으로 이동 
	}
	

	
	//profile로 이동
	@RequestMapping("/Planit/admin/Profile.do")
	public String profile(HttpSession session, Model model)throws Exception{
		Map map = new HashMap();
		map.put("e_id", session.getAttribute("e_id"));
		// 서비스 호출] 직원의 정보를 받아온다.
		AdminDTO admin=service.selectOne(map);
		// 데이터저장]
		model.addAttribute("admininfo", admin);
		// 뷰정보반환]
		return "admin/Profile.tiles";
	}
	
	//employee로 이동 
	@RequestMapping("/Planit/admin/Employee.do")
	public String employee(Model model,
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
		// [1] 전체 직원수를 불러온다  - 검색을 할경우에는 map에 searchColums / searchWord가 있다. 
		int totalAdminCount = service.getTotalCount(map);
		// [2] 전체 페이지 수 
		int totalPage = (int)Math.ceil(((double)totalAdminCount/pageSize));
		//시작 및 끝 ROWNUM구하기]
		int start = (nowPage-1)*pageSize+1;
		int end   = nowPage*pageSize;
		map.put("start", start);
		map.put("end", end);
		// 서비스 호출] 직원의 리스트를 받아온다.
		List<AdminDTO> list = service.selectList(map);
		// 데이터저장]
		String pagingString = CommonUtil.pagingBootStrapStyle(totalAdminCount, pageSize, blockPage, nowPage, req.getContextPath()+"/Planit/admin/Employee.do?");
		model.addAttribute("list", list);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalRecordCount", totalAdminCount);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("nowPage", nowPage);
		
		// 뷰정보반환]
		return "admin/Employee.tiles";
	}
	
	
	//통계 상세 페이지 /Planit/Analysis/Details.do
	@RequestMapping("/Planit/Analysis/Details.do")
	public String details()throws Exception{
		//통계 상세 페이지..?
		return "analysis/Details.tiles";
	}
}
