package com.planit.backend.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.planit.backend.service.AskService;
import com.planit.backend.service.BbsService;
import com.planit.backend.service.PartnerAskDTO;
import com.planit.backend.service.UserAskDTO;

@Controller
public class BbsController {
	
	@Resource(name="askService")
	private AskService askService;
	@Resource(name="bbsService")
	private BbsService bbsService;
	@Value("${PAGE_SIZE}")
	private int pageSize;
	//블락페이지
	@Value("${BLOCK_SIZE}")
	private int blockPage;
	
	// 이동
	@RequestMapping("/Planit/Admin/BBS/AskList.do")
	public String gotoAskList(@RequestParam Map map)throws Exception{
		//리스트 화면에서는 기본적으로 사용자 문의 게시판이 먼저 보인다.
		return "forward:/Planit/Admin/BBS/UserAskList.do";
	}
	
	// <li><a href="<c:url value='/Planit/Admin/BBS/NoticeList.do'/>">공지사항</a></li>
//    <li><a href="<c:url value='/Planit/Admin/BBS/AskList.do'/> ">문의게시판</a></li>
//    <li><a href="<c:url value='/Planit/Admin/BBS/RequestUpList.do'/>">정보수정건의</a></li>
	
	@RequestMapping("/Planit/Admin/BBS/RequestUpList.do")
	public String gotoRequestUp() throws Exception{
		return "bbs/requestup/RequestUpList.tiles";
	}
	
	
	/////////************************************공지사항

	//[공지사항 리스트 페이지]
	@RequestMapping("/Planit/Admin/BBS/NoticeList.do")
	public String gotoNoticeList(Model model)throws Exception{
		System.out.println("여기들어오긴 하냐");
		
		List<Map> noticeList=bbsService.selectNoticeList();
//		for(Map list:noticeList) {
//			list.put("POSTDATE", list.get("POSTDATE").toString().subSequence(0, 10));
//		}
		System.out.println("noticeList:"+noticeList==null?"없다":"있다");
		model.addAttribute("noticeList", noticeList);
		
		return "bbs/notice/NoticeBbsList.tiles";
	}
	//[공지사항 상세보기 페이지]
	@RequestMapping("/Planit/Admin/BBS/NoticeView.do")
	public String gotoNoticeView(@RequestParam Map map,Model model) throws Exception{
		System.out.println(map.get("no"));		
		Map noticeView=bbsService.selectNoticeView(map);
		
		model.addAttribute("noticeView",noticeView);
		return "bbs/notice/NoticeBbsView.tiles";
	}
//[공지사항 수정 페이지]
	@RequestMapping("/Planit/Admin/BBS/NoticeEdit.do")
	public String gotoNoticeEdit(@RequestParam Map map,Model model) throws Exception{
		System.out.println(map.get("no")==null?"no가 없다":"no가 있다");
		System.out.println(map.get("no"));		
		Map noticeView=bbsService.selectNoticeView(map);
		
		model.addAttribute("noticeView",noticeView);
		return "bbs/notice/NoticeBbsEdit.tiles";
	}
//[공지사항 수정프로세스]
	@RequestMapping("/Planit/Admin/BBS/NoticeEditProcess.do")
	public String noticeEditProcess(@RequestParam Map map,Model model) throws Exception{
		System.out.println("NO파라미터:"+map.get("no")==null?"no가 없다":"no가 있다");
		System.out.println("여기 들어오는거야 ㅜㅜ?"+map.get("no"));
		System.out.println(map.get("no"));
		System.out.println(map.get("title"));
		System.out.println(map.get("content"));
		int editOK=bbsService.noticeEdit(map);
		return "forward:/Planit/Admin/BBS/NoticeView.do";
	}
//[공지사항 작성 페이지]
	@RequestMapping("/Planit/Admin/BBS/NoticeWrite.do")
	public String gotoNoticeWrite() throws Exception{
	
		return "bbs/notice/NoticeBbsWrite.tiles";
	}
//[공지사항 작성프로세스]
	@RequestMapping("/Planit/Admin/BBS/NoticeWriteProcess.do")
	public String noticeWriteProcess(@RequestParam Map map,Model model,HttpSession session) throws Exception{
		map.put("e_id", session.getAttribute("e_id"));
		System.out.println("겟아이디1:"+session.getAttribute("e_id"));
		System.out.println("djdjdjdjdjdjd"+bbsService.getEMP_NO(map));

		map.put("emp_no", (bbsService.getEMP_NO(map)).get("EMP_NO"));
		int noticeWrite=bbsService.noticeWrite(map);
		
		return "forward:/Planit/Admin/BBS/NoticeList.do";
	}
//[공지사항 삭제 페이지]
	@RequestMapping("/Planit/Admin/BBS/NoticeDelete.do")
	public String gotoNoticeDelete(@RequestParam Map map,Model model) throws Exception{
		System.out.println(map.get("no"));		
		int noticeDelete=bbsService.noticeDelite(map);
		return "forward:/Planit/Admin/BBS/NoticeList.do";
	}
	
	/////////************************************문의게시판
	
//[문의게시판 유저 문의 페이지]
	@RequestMapping("/Planit/Admin/BBS/UserAskList.do")
	public String gotoUserAskList(Model model,//리퀘스트 영역 저장용
			HttpServletRequest req,//페이징용 메소드에 전달
			@RequestParam Map map,//검색용 파라미터 받기
			@RequestParam(required=false,defaultValue="1") int nowPage//페이징용 nowPage파라미터 받기용
			,HttpSession session)throws Exception{
		System.out.println("gotoUserAskList여기 들어오냐");
		
		//------------[검색 및 페이징]-----------------
		if(map.get("searchColumn")!= null) {
			model.addAttribute("searchColumn",map.get("searchColumn"));
			model.addAttribute("searchWord",map.get("searchWord"));
			}
			
			// 페이징] 
			int totalEventCount = bbsService.getTotalCount(map);
			
			// [2] 전체 페이지 수 
			int totalCount = (int)Math.ceil(((double)totalEventCount/pageSize));
			//시작 및 끝 ROWNUM구하기]
			int start = (nowPage-1)*pageSize+1;
			int end   = nowPage*pageSize;
			map.put("start", start);
			map.put("end", end);
		
		//---------[데이터베이스에서 값 가져오기]-----------
		map.put("status","waited");
		List<Map> userAskList=bbsService.selectUserAskList(map);
		System.out.println(userAskList==null?"userAskList은 null":"userAskList은 null아님");
		for(Map list:userAskList) {
			list.put("ASKDATE", list.get("ASKDATE").toString().subSequence(0, 10));
		}
		String pagingString = CommonUtil.pagingBootStrapStyle(totalEventCount, pageSize,
				blockPage, nowPage,
				req.getContextPath()+"/Planit/Admin/BBS/UserAskList.do?");
		
		//----------[모델저장해서 내보내기]--------------
		model.addAttribute("userAskList", userAskList);
		model.addAttribute("pagingString", pagingString);
	    model.addAttribute("totalRecordCount", totalCount);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("nowPage", nowPage);
		return "bbs/ask/AskBbsList.tiles";
	}
	
	
	
	@RequestMapping("/Planit/Admin/BBS/AskReplyComplete.do")
	public String AskReplyColplete(Model model,@RequestParam Map map) throws Exception{
		//---------[데이터베이스에서 값 가져오기]-----------
		List<UserAskDTO> reply = askService.selectAskReply(map);
		//----------[모델저장해서 내보내기]--------------
		model.addAttribute("userAskList", reply);
		return "bbs/ask/AskReplyComplete.tiles";
	}
//[문의게시판 파트너 문의 페이지]
	@RequestMapping("/Planit/Admin/BBS/PartnerAskList.do")
	public String gotoPartnerAskList(Model model,//리퀘스트 영역 저장용
			HttpServletRequest req,//페이징용 메소드에 전달
			@RequestParam Map map,//검색용 파라미터 받기
			@RequestParam(required=false,defaultValue="1") int nowPage//페이징용 nowPage파라미터 받기용
			,HttpSession session)throws Exception{
		if(map.get("searchColumn")!= null) {
			model.addAttribute("searchColumn",map.get("searchColumn"));
			model.addAttribute("searchWord",map.get("searchWord"));
			}
			
			// 페이징] 
			int totalEventCount = bbsService.getTotalCount(map);
			
			// [2] 전체 페이지 수 
			int totalCount = (int)Math.ceil(((double)totalEventCount/pageSize));
			//시작 및 끝 ROWNUM구하기]
			int start = (nowPage-1)*pageSize+1;
			int end   = nowPage*pageSize;
			map.put("start", start);
			map.put("end", end);
		
	
		map.put("status","waited");
		List<Map> partnerAskList=bbsService.selectPartnerAskList(map);
		for(Map list:partnerAskList) {
			list.put("ASKDATE", list.get("ASKDATE").toString().subSequence(0, 10));
		}
		System.out.println(partnerAskList==null?"userAskList은 null":"userAskList은 null아님");

		String pagingString = CommonUtil.pagingBootStrapStyle(totalEventCount, pageSize,
				blockPage, nowPage,
				req.getContextPath()+"/Planit/Admin/BBS/PartnerAskList.do?");
		model.addAttribute("partnerAskList", partnerAskList);
		model.addAttribute("pagingString", pagingString);
	    model.addAttribute("totalRecordCount", totalCount);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("nowPage", nowPage);
		return "bbs/ask/AskBbsPartnerList.tiles";
	}
//[문의게시판 유저-파트너 상세보기 페이지]
	@RequestMapping("/Planit/Admin/BBS/UserAskView.do")
	public String gotoUserAskView(@RequestParam Map map,Model model)throws Exception{
		map.put("status","waited");
		System.out.println(map.get("ASK_NO"));
		int ask_no = Integer.parseInt(map.get("ASK_NO").toString());
		System.out.println(ask_no); 
		Map userAskView=bbsService.selectAskUserView(ask_no);
		userAskView.put("ASKDATE", userAskView.get("ASKDATE").toString().subSequence(0, 10));
	
		model.addAttribute("askView", userAskView);
		return "bbs/ask/AskBbsView.tiles";
	}
	@RequestMapping("/Planit/Admin/BBS/PartnerAskView.do")
	public String gotoPartnerAskView(@RequestParam Map map,Model model)throws Exception{
		map.put("status","waited");
		System.out.println(map.get("ASK_NO"));
		int ask_no = Integer.parseInt(map.get("ASK_NO").toString());
		Map partnerAskView=bbsService.selectAskPartnerView(ask_no);
		partnerAskView.put("ASKDATE", partnerAskView.get("ASKDATE").toString().subSequence(0, 10));
		
		model.addAttribute("askView", partnerAskView);
		return "bbs/ask/AskBbsPartnerView.tiles";
	}
	@RequestMapping("/Planit/Admin/BBS/UserReplyWrite.do")
	public String gotoUserReplyWrite(@RequestParam Map map,Model model)throws Exception{
		int ask_no = Integer.parseInt(map.get("ASK_NO").toString());
		System.out.println(ask_no); 
		Map userAskView=bbsService.selectAskUserView(ask_no);
		model.addAttribute("askView", userAskView);
		return "bbs/ask/AskReplyWrite.tiles";
	}
	@RequestMapping("/Planit/Admin/BBS/PartnerReplyWrite.do")
	public String gotoPartnerReplyWrite(@RequestParam Map map,Model model)throws Exception{
		int ask_no = Integer.parseInt(map.get("ASK_NO").toString());
		Map partnerAskView=bbsService.selectAskPartnerView(ask_no);
		partnerAskView.put("ASKDATE", partnerAskView.get("ASKDATE").toString().subSequence(0, 10));
		
		model.addAttribute("askView", partnerAskView);
		return "bbs/ask/PartnerAskReplyWrite.tiles";
	}
	@RequestMapping("/Planit/Admin/BBS/AskReplyProcess.do")
	public String AskReplyProcess(@RequestParam Map map,Model model)throws Exception{
		
			int successFail = askService.update(map);
			model.addAttribute("successFail",successFail);
			model.addAttribute("WHERE","SUCCESS");
			
			return "bbs/ask/Message";
	
		
	}
	@RequestMapping("/Planit/Admin/BBS/AskPartnerReplyProcess.do")
	public String AskPartnerReplyProcess(@RequestParam Map map,Model model)throws Exception{
		int ask_no = Integer.parseInt(map.get("ask_no").toString());
		map.put("ask_no", ask_no);
		map.put("status","replied");
		int isUpdate=bbsService.askPartnerReply(map);
		return "forward:/Planit/Admin/BBS/PartnerAskList.do";
		
		
	}

	
}

