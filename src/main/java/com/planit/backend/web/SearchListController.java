package com.planit.backend.web;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SearchListController {

	private String key ="NCPqTyv3znqjQjXg0mr6tqFnxmLBJcm10iYsAe66egVkZa%2F28tT1iJSvoKaq9Y8P92LAcQaoxcD5I5kTY%2Bn%2Buw%3D%3D";
	
	
	@RequestMapping("/Planit/Admin/Content/List.do")
	public String listlsit(@RequestParam Map map,Model model) throws Exception{
	String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey="+key
			+"&contentTypeId=12"
			+"&defaultYN=Y"
			+"&overviewYN=Y"
			+ "&areaCode="
			+ "&sigunguCode="
			+ "&cat1=A01"
			+ "&cat2="
			+ "&cat3="
			+ "&listYN=Y"
			+ "&MobileOS=ETC"
			+"overviewYN=Y"
			+"&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1";
	

		
		
		return null;
	}

	
	
}////////searchListController
