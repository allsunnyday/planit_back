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
import com.planit.backend.service.PhotoBookDTO;
import com.planit.backend.service.PhotoBookService;

@Controller
public class PhotoBookController {
	@Value("${PAGE_SIZE}")
	private int pageSize;
	@Value("${BLOCK_SIZE}")
	private int blockPage;
	@Resource(name="photoBookService")
	private PhotoBookService service;
	
	@RequestMapping("/planit/photobook/List.do")
	public String photobookList(@RequestParam Map map, Model model
			,HttpServletRequest req,
			@RequestParam(required=false,defaultValue="1") int nowPage)throws Exception{
		
		System.out.println("들어오는지");
		
	
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
		List<PhotoBookDTO> list = service.selectPhotoList(map);
		String pagingString = CommonUtil.pagingBootStrapStyle(
							totalCount,
							pageSize, 
							blockPage, 
							nowPage, 
							req.getContextPath()+"/planit/photobook/List.do?");
		
		model.addAttribute("list", list);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalRecordCount", totalCount);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("nowPage", nowPage);
		
		model.addAttribute("list",list);
		
		
		
		return "photobook/PhotobookList.tiles";
	}
}
