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
                <a href="<c:url value='/Planit/Admin/BBS/NoticeWrite.do'/>" id="write-notice" class="btn btn-compose">
                  <i class="fa fa-pencil"></i>  공지사항 작성  
                </a>
                <ul class="nav nav-pills nav-stacked mail-nav">
                  <li class="user-ask active">
                  	<a href="<c:url value='/Planit/Admin/BBS/NoticeList.do'/>" id="user-ask" > <i class="fa fa-inbox"></i> 현재 공지된 게시글  </a>
                  </li>
                  
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
	              	<tr style="text-align: center;">
	              		<td colspan="2" >
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
    
