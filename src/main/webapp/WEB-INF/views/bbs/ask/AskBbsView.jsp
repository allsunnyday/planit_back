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
          		<h5>문의게시판</h5>
              </header>
              <div class="panel-body minimal " id="ask-content">
	           <table class="table">
				  <tr>
				  <td>
					${askView.TITLE}[${askView.ID}/${askView.NAME}]				  	
				  </td>
				  <td style="text-align: left;">
					${askView.ASKDATE}			  	
				  </td>
				  </tr>
				  
				  <tr>
				  	<td colspan="2" style="width:300px;height: 200px;">
					${askView.CONTENT}			  	
				  	
				  	
				  	</td>
				  </tr>
				</table>
				
				<a class="btn btn-default" href="<c:url value='/Planit/Admin/BBS/UserReplyWrite.do?ASK_NO=${askView.ASK_NO}'/>">답변</a>
		
                
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
     
