<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- **********************************************************************************************************************************************************
  	파트너에게 요청받은 이벤트와 진행중인 이벤트 및 지난 이벤트를 볼 수 있는 곳       
  *********************************************************************************************************************************************************** -->
    <section id="main-content">
      <section class="wrapper">
        <!-- page start-->
        <div class="row mt">
          <div class="col-sm-3">
            <section class="panel">
              <div class="panel-body">
                <a href="mail_compose.html" class="btn btn-compose">
                  <i class="fa fa-pencil"></i>  이벤트 폼  
                  </a>
               		 <ul class="nav nav-pills nav-stacked mail-nav">
                 		 <li class="active"><a href="<c:url value='/Planit/Admin/Event/List.do?'/>"> 
                 			 <i class="fa fa-inbox"></i> 이벤트 요청건 
                 			 
                 			  <span class="label label-theme pull-right inbox-notification">${totalRecordCount }</span>
                 			  </a></li>
                		  <li><!--id="click_"--><a href="<c:url value='/Planit/Admin/Event/Request.do'/>"> 
                		  <i class="fa fa-envelope-o"></i>진행중인 이벤트 </a></li>
              		  </ul>
              </div>
            </section>
          </div>
          <div class="container">
          
          	<div class="col-sm-9 s">
            	<section class="panel">
              		<header class="panel-heading wht-bg asklist-head">
          				<h5>이벤트 상세페이지</h5>
             	    </header>
             	 <div class="panel-body minimal " id="ask-content">
	           		<table class="table">
	           			<tr>
		           			<td >No.</td>
	                        <td >파트너id</td>
	                        <td >이벤트명</td>
	                        <td ><i class="fa fa-paperclip">status</i></td>
	                        <td >이벤트 요청일 </td>
	          			 </tr>
				 		 <tr>
							  <td>${list.req_no}</td>
							  <td>${list.p_id}</td>
							  <td>${list.title}</td>
							  <td>${list.status}</td>
							  <td>${list.reqdate}</td>
						 </tr>
				 		 <tr>
		 				  	<td colspan="50" style="width:300px;height: 200px;"> 
		 					${list.content}			  	 
		 				  	</td> 
 				  		</tr> 
			 				<a href="<c:url value='/Planit/Admin/Event/eventSuccess.do?req_no=${list.req_no}'/>"class="btn btn-default">수락</a>
			<!-- 			<a href="javascript:isDelete()" class="btn btn-default">삭제</a> -->
							<a href="<c:url value='/Planit/Admin/Event/List.do'/>" class="btn btn-danger">목록</a>
 						</table>
             		 </div>
            	</section>
          	</div>
          </div>
        </div>
      </section>
    </section>
    
    
    
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
    	$(function(){
					$(".container").effect('slide',{},1500);
		});
    </script>
