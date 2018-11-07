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
          		<h5>Notice</h5>
              </header>
              <div class="panel-body minimal " id="ask-content">
	           <table class="table">
				   <tr>
						  <td>제목&nbsp; :&nbsp;&nbsp; ${noticeView.TITLE}</td>
						  <td>등록일 &nbsp; : &nbsp;&nbsp;${noticeView.POSTDATE} </td>
				  </tr>
					  
					  <tr>
					  	<td colspan="5" style="width:300px;height: 200px;">${noticeView.CONTENT}</td>
					  </tr>
				</table>
				
				<c:if test="${SessionScope.id eq noticeView.e_id}">
				<a class="btn btn-default" href="<c:url value='/Planit/Admin/BBS/NoticeEdit.do?no=${noticeView.NO}'/>">수정</a>
				<a onclick="button_event();" class="btn btn-default" href="<c:url value='/Planit/Admin/BBS/NoticeDelete.do?no=${noticeView.NO}'/>">삭제</a>
				</c:if>
                
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
     <script type="text/javascript">

	function button_event(){
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		    document.form.submit();
		}else{   //취소
		    history.back();
		}
	}
	
	</script>
