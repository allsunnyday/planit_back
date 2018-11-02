<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <!-- page start-->
        <div class="row mt">
          <div class="col-sm-3">
            <section class="panel">
              <div class="panel-body">
                <a href="mail_compose.html" class="btn btn-compose">
                  <i class="fa fa-pencil"></i>  문의 게시판  
                </a>
                <ul class="nav nav-pills nav-stacked mail-nav">
                  <li class="user-ask active">
                  	<a href="#" id="user-ask" > <i class="fa fa-inbox"></i> 사용자 문의 게시판  
                  	<span class="label label-theme pull-right inbox-notification new-u-num">${uWatiedNumber}</span></a>
                  </li>
                  <li class="partner-ask ">
                  	<a href="#" id="partner-ask" > <i class="fa fa-envelope-o"></i> 기업 문의 게시판 
                  	<span class="label label-theme pull-right inbox-notification new-p-num">${pWatiedNumber}</span></a>
                  </li>
                  <li>
                  	<a href="#"> <i class="fa fa-file-text-o"></i> 답변 완료 게시판  <span class="label label-info pull-right inbox-notification">8</span></a>
                  </li>
                  <!-- <li>
                  	<a href="#"> <i class="fa fa-exclamation-circle"></i> 이벤트 관련 공지사항 </a>
                  </li> -->
                </ul>
              </div>
            </section>
           </div>

          <div class="col-sm-9 s">
            <section class="panel">
               <header class="panel-heading wht-bg asklist-head">
          		<h2>문의게시판</h2>
              </header>
              <div class="panel-body minimal " id="ask-content">
	           <form action="<c:url value='/Planit/Admin/BBS/NoticeWriteProcess.do'/>">
		           <div>
		           	<input type="text" value=""class="form-control"name="title" placeholder="제목을 입력해주세요">
		           </div>
		           <div>
		           <textarea class="form-control" rows="3" name="content" placeholder="공지사항을 입력해주세요" ></textarea>
		          
		           </div>
		           <%-- <input type="hidden" value="${noticeView.NO}" name="no"/> --%>
		            <button type="submit" class="btn btn-round btn-default">등록</button>
               </form>
              </div>
            </section>
          </div>
          
        </div>
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    
