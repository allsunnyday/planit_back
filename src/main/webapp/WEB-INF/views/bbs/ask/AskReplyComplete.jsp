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
                <ul class="nav nav-pills nav-stacked mail-nav">
                  <li class="user-ask active">
                  	<a href="<c:url value='/Planit/Admin/BBS/UserAskList.do'/>" id="user-ask" > <i class="fa fa-inbox"></i> 사용자 문의 게시판  
                  	</a>
                  </li>
                  <li class="active">
                  	<a href="<c:url value='/Planit/Admin/BBS/AskReplyComplete.do'/>"> <i class="fa fa-file-text-o"></i> 답변 완료 게시판  </a>
                  </li>
                </ul>
              </div>
            </section>
           </div>
         
          
          <div class="col-sm-9 s">
            <section class="panel">
              <header class="panel-heading wht-bg asklist-head">
          		<h2>답변 완료 게시판</h2>
              </header>
	           
              <div class="panel-body minimal " id="ask-content">
		              <table class="table table-inbox table-hover" style="text-align: center">
	              	<tr>
	              		<td >No.</td>
	              		<td class="col-md-3 col-md-offset-1" style="text-align: center">제목</td>
	              		<td class="col-md-2 col-md-offset-1"  style="text-align: center">작성자</td>
	              		<td class="col-md-1 col-md-offset-1"  style="text-align: center">상 태</td>
	              		<td class="col-md-1 col-md-offset-1"  style="text-align: center">작성일</td>
	              	</tr>
		              	<c:if test="${empty userAskList}" var="isEmpty">
		              	<tr>
		              		<td colspan="5" style="text-align: center">
		              		...
		              		</td>
		              	</tr>
		              	</c:if>
		              	<c:if test="${not isEmpty }">
		              	<c:forEach var="list" items="${userAskList}" varStatus="loop">
		              		<tr>
		              			<td>${list.ask_no}</td>
		              			<td style="text-align: left" class="col-md-5">${list.title}</td>
		              			<td>${list.id}/${list.name}</td>
		              			<td>${list.status}</td>
		              			<td>${list.askdate}</td>
		              			
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
    
