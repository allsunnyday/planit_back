<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>

$(function(){
	
	$(".container").effect('slide',{},1500);
});
</script>
<!-- **********************************************************************************************************************************************************
  	파트너에게 요청받은 이벤트와 진행중인 이벤트 및 지난 이벤트를 볼 수 있는 곳       
  *********************************************************************************************************************************************************** -->
    <!--main content start-->
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
                  <li><a href="<c:url value='/Planit/Admin/Event/List.do?'/>"> <i class="fa fa-inbox">
                  </i> 이벤트 요청건 
                   </a></li>
                  <li class="active"><a href="<c:url value="/Planit/Admin/Event/Request.do?"/>"> <i class="fa fa-envelope-o"></i> 진행중인 이벤트</a></li>
                </ul>
              </div>
            </section>
         
          </div>
          
          <div class="col-sm-9">
            <section class="panel">
              <header class="panel-heading wht-bg">
                <h4 class="gen-case">
                    이벤트 요청 목록
                    <form action="#" class="pull-right mail-src-position">
                      <div class="input-append">
                      </div>
                    </form>
                  </h4>
              </header>
              <div class="panel-body minimal">
                <div class="mail-option">
                </div>
                
                <!--  선택에 따라 변경될 내용  -->
                <div class="table-inbox-wrap ">
                  <table class="table  table-hover">
                   <tbody>
                      <tr class="">
                        <td > no.</td>
                        <td >파트너사명</td>
                        <td >이벤트명</td>
                        <td ><i class="fa fa-paperclip">status</i></td>
                        <td >승인날짜 </td>
                      </tr>
                      <c:if test="${empty list}" var="isEmpty">
								<tr>
									<td colspan="30"
										style="text-align: center; font-size: large; font-weight: bold;">결과가
										없습니다</td>
								</tr>
							</c:if>
						<c:if test="${not isEmpty}">
							<form action="#" id="eventList">
	                      <c:forEach var="record" items="${list}">
		                      <tr >
		                        <td >${record.req_no }</td>
		                        <td >${record.p_id }</a></td>
		                        <td >${record.title }</td>
		                        <td >${record.status }</td>
		                        <td >${record.reqdate}</td>
		                      </tr>
                      		</c:forEach>
                      		</form>
						</c:if>
                    </tbody>
                  </table>
                </div>
              </div>
            </section>
          </div>
          </div>
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    
    <script>
    console.log('${list}');
    console.log('${totalRecordCount}');
    
    </script>
