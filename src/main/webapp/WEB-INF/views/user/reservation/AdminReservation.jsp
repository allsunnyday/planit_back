<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
	*************************************
			일반 사용자 관리 화면
	***********************************	
 -->
 <script>
  $(function(){
	  $('#search').click(function(){
		  //alert('ttt: '+$('#searchForm input:checked').val())
		  $.ajax({
			  url:'<c:url value="/Planit/Admin/Book/List.do?"/>',
			  data:{status:$('#searchForm input:checked').val()},
			  datatType:'json',
			  type:'post',
			  success:function(data){
			    	 displayReservation(data,'#checklist'); 
			     },
			  error:function(request, status, error){
			    	 console.log('error:'+error);
			     }
		  })
	  });
  });
		 var displayReservation = function(data){
			 consoloe.log(JSON.stringify(data))
		 }
  //전체 체크/해제
	$(function(){ 
		  $("#allCheck").click(function(){
			   if($("#allCheck").prop("checked")) { 
				    $("input[type=checkbox]").prop("checked",true); 
				    } 
			   else { 
				    $("input[type=checkbox]").prop("checked",false); 
				    } 
			   }) 
		  }) 
 
 </script>
 <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
      <h3><i class="fa fa-angle-right"></i> 일반 사용자 숙박예약 관리 </h3>
      	<!-- INPUT MESSAGES -->
        <div class="row mt">
          <div class="col-lg-12">
            <div class="form-panel">
              <h4 class="mb"><i class="fa fa-angle-right"></i> 검 색</h4>
              		<form id="searchForm" action="#">
						<hr>
						<label class="col-sm-2 col-sm-2 control-label">status별</label>
						<label class="checkbox-inline"> <input type="radio" name="status" id="inlineCheckbox1" value="refund"> refund</label>
					    <label class="checkbox-inline"> <input type="radio" name="status" id="inlineCheckbox2" value="cancel"> cancel</label> 
					    <label class="checkbox-inline"> <input type="radio" name="status" id="inlineCheckbox3" value="paid"> paid</label> 
						<hr>
						<button id="search" class="btn btn-default">조회</button>
						<button id="searchAll" class="btn btn-primary">전체 조회</button>
					</form>
				<br>
            </div>
            <!-- /form-panel -->
          </div>
          <!-- /col-lg-12 -->
      	</div>
      	<!-- 결과 를 뿌려주는 곳  -->
        <h3><i class="fa fa-angle-right"></i> 결과 </h3>
        <!-- SORTABLE TO DO LIST -->
       <div class="row mt">
          <div class="col-md-12">
            <div class="content-panel">
              <table class="table table-striped table-advance table-hover">
                <thead>
                  <tr>
                  	<th>
					<input type="checkbox" class="list-child" id="allCheck" />
					</th>
                    <th><i class="fa fa-bullhorn"></i> Reservation_ID</th>
                    <th><i class="fa fa-bullhorn"></i> Client_ID</th>
                    <th><i class="fa fa-bullhorn"></i> Partner_ID</th>
                    <th class="hidden-phone"><i class="fa fa-question-circle"></i> RoomTitle</th>
                    <th class="hidden-phone"><i class="fa fa-question-circle"></i> Status</th>
                    <th class="hidden-phone"><i class="fa fa-question-circle"></i> Bookdate</th>
                    <th></th>
                  </tr> 
                </thead>
                <tbody>
                <c:if test="${empty list}" var="isEmpty">
					<tr>
						<td colspan="30" style="text-align: center; font-size: large; font-weight: bold;">결과가 없습니다</td>
					</tr>
				</c:if>
				<c:if test="${not isEmpty}">
				<form action="/Planit/Admin/AdminUserDelete.do" id="checklist">
					<c:forEach var="record" items="${list}" varStatus="loop">
	                  <tr>
	                 	<td><input type="checkbox" class="list-child" name="chklst" value="${record.reservation_id}" /></td>
	                    <td >${record.reservation_id}</td>
	                    <td> ${record.id}</td>
	                    <td >${record.p_id}</td>
	                    <td >${record.roomtitle}</td>
	                    <td >${record.status}</td>
	                    <td >${record.bookdate}</td>
	                  </tr>
                  	</c:forEach>
				</form>
				</c:if>
                </tbody>
              </table>
            </div>
            <!-- /content-panel -->
          </div>
          <!-- /col-md-12 -->
        </div>
        <!-- /row -->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
 