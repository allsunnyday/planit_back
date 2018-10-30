package com.planit.backend.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

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
   
   // 일반 사용자 정보 관리 화면
   @RequestMapping(value="/Planit/Admin/AdminUserInfo.do", produces="text/plain; charset=UTF-8", method=RequestMethod.GET)
   public String userInfo(Model model, @RequestParam Map map)throws Exception{
      System.out.println("userInfo호출");
      List<AdminUserDTO> list = service.selectInfoList(map);
      model.addAttribute("list", list);
      
      
      return "/user/info/AdminUserInfo.tiles";
   }
   //일반 사용자 검색 조회
   @ResponseBody
   @RequestMapping(value="/Planit/Admin/AdminUserInfo.do", produces="text/plain; charset=UTF-8",method=RequestMethod.POST)
   public String userInfoAjax(@RequestParam Map map, @RequestParam(value="age") List<String> ages) {
      System.out.println("ajax로 들어옴");
      
      map.put("gender", map.get("gender").toString());//성별 넣기
      System.out.println(ages);
      List<Map> collections = new Vector<Map>(); //파라미터 넘기기용 map
      List<AdminUserDTO> list = new ArrayList();//값 parsing용
      
//      String[] ageArray = ages.spliterator(",");
      /*
      for(int i=0; i<ages.size(); i++) { 
         map.put("age", ages);
      }*/
      
       System.out.println("ages"+ages);
        /* for (String str : ages) {
            System.out.println(str);
            map.put("ages", str);
         }*/
       map.put("ages", ages);

      list = service.selectInfoList(map);
      for(AdminUserDTO dto: list) {
         Map record = new HashMap();
         record.put("id", dto.getId());
         record.put("name", dto.getName());
         record.put("email", dto.getEmail());
         record.put("gender", dto.getGender());
         record.put("age", dto.getAge().toString());
         record.put("regidate", dto.getRegidate().toString());
         collections.add(record);
      }
      System.out.println(list.size());//15
      System.out.println("dd  "+JSONArray.toJSONString(collections));
      return JSONArray.toJSONString(collections);
   }
   
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
   
   // 사용자 즐겨찾기 
   @RequestMapping("/Planit/Admin/AdminFavorites.do")
   public String userFavorite()throws Exception{
      return "/user/favorite/AdminFavorites.tiles";
   }
   
   @RequestMapping("/Planit/Admin/AdminPlan.do")
   public String userPlanner()throws Exception{
      return "/user/planner/AdminPlanner.tiles";
   }

   
   @RequestMapping("/Planit/Admin/AdminReview.do")
   public String userReview()throws Exception{
      return "/user/review/AdminReview.tiles";
   }
   
}