package com.planit.backend.web;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.planit.backend.service.ContentDTO;

@Controller
public class ContentController {

	private String key ="NCPqTyv3znqjQjXg0mr6tqFnxmLBJcm10iYsAe66egVkZa%2F28tT1iJSvoKaq9Y8P92LAcQaoxcD5I5kTY%2Bn%2Buw%3D%3D";
	@RequestMapping("/Planit/Admin/Content/List.do")
	public String gotoContentList(@RequestParam Map map, Model model)throws Exception{ 
		//api호출 
		// 1]파싱할 url 준비
		
		/*String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=NCPqTyv3znqjQjXg0mr6tqFnxmLBJcm10iYsAe66egVkZa%2F28tT1iJSvoKaq9Y8P92LAcQaoxcD5I5kTY%2Bn%2Buw%3D%3D"
				+ "&contentTypeId=12"
				+ "&contentId=" +map.get("contentId").toString().trim()
				+ "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide"
				+ "&defaultYN=Y"
				+ "&firstImageYN=Y"
				+ "&areacodeYN=Y"
				+ "&catcodeYN=Y"
				+ "&addrinfoYN=Y"
				+ "&mapinfoYN=Y"
				+ "&overviewYN=Y"
				+ "&transGuideYN=Y";*/
		
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
		/*
		 * 2] 페이지에 접근해줄 document객체 생성
		 * 여기서 생성한 document객체를  통해 파싱할 url의 요소를 읽는다. 
		 * doc.getDocumentElement().getNodeName())를 출력하면 위 XML의 최상위 tag값을 가져온다. 여기서는 <result>가 최상위 tag값이다.

		 */
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dbuilder = dbFactory.newDocumentBuilder();
		Document doc = dbuilder.parse(url);
		
		//root tag
		doc.getDocumentElement().normalize();
		System.out.println("Root element: "+doc.getDocumentElement().getNodeName());  // Root element: result
		
		//3] 파싱할 정보가 있는 tag에 접근
		NodeList nlist = doc.getElementsByTagName("item");
		System.out.println("파싱할 리스트 수"+nlist.getLength());
		List<ContentDTO> list  = new Vector<ContentDTO>();
		
		for(int temp = 0; temp < nlist.getLength(); temp ++) {
			Node nNode = nlist.item(temp);
			if(nNode.getNodeType() == Node.ELEMENT_NODE) {
				Element eElement = (Element) nNode;
				System.out.println("eElement"+eElement.toString());
				ContentDTO dto = new ContentDTO();
				dto.setContentid(CommonUtil.getTagValue("contentid", eElement));
				dto.setContenttype(CommonUtil.getTagValue("contenttypeid", eElement));
				dto.setCat1(CommonUtil.getTagValue("cat1", eElement));
				dto.setCat2(CommonUtil.getTagValue("cat2", eElement));
				dto.setCat3(CommonUtil.getTagValue("cat3", eElement));
				/*dto.setFirstimage(CommonUtil.getTagValue("firstimage", eElement));
				dto.setFirstimage2(CommonUtil.getTagValue("firstimage2", eElement));*/
				dto.setMapx(CommonUtil.getTagValue("mapx", eElement));
				dto.setMapy(CommonUtil.getTagValue("mapy", eElement));
				dto.setOverview(CommonUtil.getTagValue("overview", eElement));
				dto.setTitle(CommonUtil.getTagValue("title", eElement));
				dto.setZipcode(CommonUtil.getTagValue("zipcode", eElement));
				
				model.addAttribute("mapx", dto.getMapx());
				model.addAttribute("mapy", dto.getMapy());
				list.add(dto);
			}
		}
		model.addAttribute("list", list);
		
		return "contents/List.tiles";
	}
	@ResponseBody
	@RequestMapping(value="/tourapi/AjaxJson.do",produces="text/plain; charset=UTF-8")
	public String callTourApi(@RequestParam Map map,
								HttpServletRequest req,
								@RequestParam(required=false, defaultValue="1") int nowPage
								)throws Exception{
		
		System.out.println(map.get("contenttype")+","+map.get("areacode"));
		return "";
	}
	
	
	
}
