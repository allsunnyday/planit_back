package com.planit.backend.web;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.planit.backend.service.ContentDTO;
import com.planit.backend.service.ContentService;
import com.planit.backend.service.UpdateDTO;

import sun.util.resources.cldr.ar.CalendarData_ar_LB;


@Controller
public class ContentController {

	private String key ="NCPqTyv3znqjQjXg0mr6tqFnxmLBJcm10iYsAe66egVkZa%2F28tT1iJSvoKaq9Y8P92LAcQaoxcD5I5kTY%2Bn%2Buw%3D%3D";
	
	@Resource(name="contentService")
	private ContentService service;
	
	
	@RequestMapping("/Planit/Admin/Content/List.do")
	public String gotoContentList(@RequestParam Map map, Model model)throws Exception{ 
		
		return "contents/UpdateList.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="/tourapi/AjaxJson.do",produces="text/plain; charset=UTF-8")
	public String callTourApi(Model model
								,@RequestParam Map map,
								HttpServletRequest req,
								HttpServletResponse resp,
								@RequestParam(required=false, defaultValue="1") int nowPage
								)throws Exception{
		
		System.out.println(map.get("contenttype")+","+map.get("areacode")+","+nowPage);
		
		// areacode와 contenttype으로 검색하는 주소 
		String addr="http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?"
				+ "ServiceKey="+key  //서비스인증키
				+ "&contentTypeId="+map.get("contenttype")  
				+ "&areaCode="+map.get("areacode")
				+ "&sigunguCode="   //시구군코드
				+ "&cat1=&cat2=&cat3="  //대/중/소분류
				+ "&listYN=Y"   //목록 구분 (Y=목록, N=개수)
				+ "&MobileOS=ETC"  //IOS (아이폰), AND (안드로이드), WIN (윈도우폰), ETC
				+ "&MobileApp=TourAPI3.0_Guide" //서비스명=어플명
				+ "&_type=json"  //json타입으로 결과를 받음 
				+ "&arrange=A"  //정렬구분(A=제목순, B=조회순, C=수정일순, D=생성일순)
				+ "&numOfRows=12"
				+ "&pageNo="+nowPage;
		
		//클라이언트로 보낸 textdata, json에 넣을 떄 쭉 나열하는듯?
		/*PrintWriter out = resp.getWriter();*/
		
		URL url = new URL(addr);
		//URL로부터 자바로 데이터 읽어오도록 URL객체로 스트림열기
		InputStream in = url.openStream();
		// 데이터 읽어 오기 
		StringBuffer result=new StringBuffer();
		BufferedReader reader = new BufferedReader(new InputStreamReader(in, "utf-8"));
		String data;
		//결과값을 한줄씩 읽어옴
		while((data=reader.readLine())!=null) {
			result.append(data); 
		}
		reader.close();
		in.close();
		System.out.println(result.toString());
		// 결과값을 jsonparser를 이용하여
		JSONParser jsonparser = new JSONParser();
		JSONObject jsonobject = (JSONObject) jsonparser.parse(result.toString());
		JSONObject json = (JSONObject) jsonobject.get("response");
		json = (JSONObject) json.get("body");
		//페이징을 위한 값을 저장함 
		String totalCount = JSONValue.toJSONString(json.get("totalCount"));
		String pageNo = JSONValue.toJSONString(json.get("pageNo"));
		String pagingString =
				CommonUtil.pagingForTourContent(Integer.parseInt(totalCount),
												12,
												5,
												nowPage,
												req.getContextPath()+"/tourapi/AjaxJson.do?",
												map.get("contenttype").toString(),
												map.get("areacode").toString());
		System.out.println(pagingString);
		json = (JSONObject) json.get("items");
		
		//페이징 요소 추가 
		Map paging  = new HashMap();
		paging.put("pagingString", pagingString);
		paging.put("totalCount", totalCount);
		paging.put("nowPage", pageNo);
		JSONArray list = (JSONArray) json.get("item");
		list.add(paging);
		System.out.println(list+"입니다");
		
		return list.toJSONString();
	}
	
	
	@RequestMapping("/tourapi/download/JsonToCsv.do")
	public String convertJsonToCsv(@RequestParam Map map, 
									Model model,
									HttpSession session)throws Exception{
		
		System.out.println(map.get("contenttype")+","+map.get("areacode")+","+map.get("totalCount"));
		System.out.println(session.getServletContext().getRealPath("/resources/update"));
		
		// 저장
		String addr="http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?"
				+ "ServiceKey="+key  //서비스인증키
				+ "&contentTypeId="+map.get("contenttype")  
				+ "&areaCode="+map.get("areacode")
				+ "&sigunguCode="   //시구군코드
				+ "&cat1=&cat2=&cat3="  //대/중/소분류
				+ "&listYN=Y"   //목록 구분 (Y=목록, N=개수)
				+ "&MobileOS=ETC"  //IOS (아이폰), AND (안드로이드), WIN (윈도우폰), ETC
				+ "&MobileApp=TourAPI3.0_Guide" //서비스명=어플명
				+ "&_type=json"  //json타입으로 결과를 받음 
				+ "&arrange=A"  //정렬구분(A=제목순, B=조회순, C=수정일순, D=생성일순)
				+ "&numOfRows="+map.get("totalCount")
				+ "&pageNo=1";
		
		//클라이언트로 보낸 textdata, json에 넣을 떄 쭉 나열하는듯?
		
		URL url = new URL(addr);
		//URL로부터 자바로 데이터 읽어오도록 URL객체로 스트림열기
		InputStream in = url.openStream();
		// 데이터 읽어 오기 
		StringBuffer result=new StringBuffer();
		BufferedReader reader = new BufferedReader(new InputStreamReader(in, "utf-8"));
		String data;
		while((data=reader.readLine())!=null) {
			result.append(data);
		}
		reader.close();
		in.close();
		System.out.println(result.toString());
		
		
		JSONParser jsonparser = new JSONParser();

		JSONObject jsonobject = (JSONObject) jsonparser.parse(result.toString());
		JSONObject json = (JSONObject) jsonobject.get("response");
		json = (JSONObject) json.get("body");
		json = (JSONObject) json.get("items");
		JSONArray list = (JSONArray) json.get("item");
		
//		BufferedWriter fw = new BufferedWriter(
//				new FileWriter(session.getServletContext().getRealPath("/resources/update")+File.separator+"test.csv", true));
		BufferedWriter fw = new BufferedWriter(
				new OutputStreamWriter(
				new FileOutputStream(
						session.getServletContext().getRealPath("/resources/update")
						+File.separator+"test.csv"), "UTF-8"));
		for(int i=0; i<list.size(); i++) {
			JSONObject jsonobj = (JSONObject)list.get(i);
			fw.write(jsonobj.get("contentid")+","
					+jsonobj.get("contenttypeid")+","
					+jsonobj.get("title")+","
					+jsonobj.get("tel")+","
					+jsonobj.get("areacode")+","
					+jsonobj.get("addr1")+","
					+jsonobj.get("addr2")+","
					+jsonobj.get("cat1")+","
					+jsonobj.get("cat2")+","
					+jsonobj.get("cat3")+","
					+jsonobj.get("mapx")+","
					+jsonobj.get("mapy")+","
					+jsonobj.get("firstimage")+","
					+jsonobj.get("firstimage2")+","
					+jsonobj.get("sigungucode")+","
					+jsonobj.get("zipcode")
					);
			fw.newLine();
		}
		
		fw.flush();
		fw.close();
		
		return "contents/ConvertComplete.tiles";
	}
	
	// 관광정보를 디비에 업데이트 했는지 확인하는 테이블에서 리스트를 조회한다.
	@ResponseBody
	@RequestMapping(value="/tourapi/update/UpdateList.do",produces="text/plain; charset=UTF-8")
	public String updateList(@RequestParam Map map)throws Exception{
		List<UpdateDTO> list = service.selectUpdateList(map);
		// 날짜 데이터 변경?
		System.out.println(JSONArray.toJSONString(list));
		return JSONArray.toJSONString(list);
	}
	
	
}
