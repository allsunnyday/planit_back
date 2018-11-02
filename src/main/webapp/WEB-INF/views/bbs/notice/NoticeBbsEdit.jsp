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
                  	<a href="#" id="user-ask" > <i class="fa fa-inbox"></i> 현재 공지된 게시글  </a>
                  </li>
                  <li class="partner-ask ">
                  	<a href="#" id="partner-ask" > <i class="fa fa-envelope-o"></i> 지난 게시글 </a>
                  </li>
                </ul>
              </div>
            </section>
           </div>
         
          
          <div class="col-sm-9 s">
            <section class="panel">
              <header class="panel-heading wht-bg asklist-head">
          		<h5>Notice Edit/${noticeView.NO}</h5>
              </header>
              <div class="panel-body minimal " id="ask-content">
              <form action="<c:url value='/Planit/Admin/BBS/NoticeEditProcess.do'/>">
		           <div>
		           	<input type="text" value=" ${noticeView.TITLE}"class="form-control"name="title" placeholder="제목을 입력해주세요">
		           </div>
		           <div>
		           <textarea class="form-control" rows="3" name="content" placeholder="공지사항을 입력해주세요" ></textarea>
		          ${noticeView.CONTENT}
		           </div>
		           <input type="hidden" value="${noticeView.NO}" name="no"/>
		            <button type="submit" class="btn btn-round btn-default">수정</button>
               </form> 
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
    
