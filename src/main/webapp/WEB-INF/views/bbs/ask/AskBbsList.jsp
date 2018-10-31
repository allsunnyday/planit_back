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
          		<h2>공지사항 게시판</h2>
              </header>
              <div class="panel-body minimal " id="ask-content">
	              <table class="table table-inbox table-hover">
	              	<tr>
	              		<td>No.</td>
	              		<td>제목</td>
	              		<td>작성자</td>
	              		<td>작성일</td>
	              	</tr>
	              	<c:if test="${empty noticeList}" var="isEmpty">
	              	<tr>
	              		<td colspan="4">
	              		등록된 공지사항이 없습니다
	              		</td>
	              	</tr>
	              	</c:if>
	              	<c:if test="${not isEmpty }">
	              	<c:forEach var="list" items="${noticeList}" varStatus="loop">
	              		<tr>
	              			<td>${list.NO}</td>
	              			<td><a href="<c:url value='/Planit/Admin/BBS/NoticeView.do?no=${list.NO}'/>">${list.TITLE}</a></td>
	              			<td>${list.NAME}</td>
	              			<td>${list.POSTDATE}</td>
	              			
	              		</tr>
	              	</c:forEach>
	              	</c:if>
	              </table>
					
                
             <!--  -->
              </div>
            </section>
          </div>
          
        </div>
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    
