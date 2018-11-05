<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 
	*************************************
			일반 사용자 플래너 관리 화면
	***********************************	
 -->
<script>
 $(function(){
		
	 $('#search').click(function(){
		// alert('ttt: '+ $('#searchForm input:checked').val())
		 $.ajax({
			 url:"<c:url value='/Planit/Admin/AdminPlan.do'/>",
			 data: {days:$('#searchForm input:checked').val()},
		     dataType:"json",
		     type:'post',
		     success:function(data){
		    	 displayPlanner(data,'#checklist'); 
		     },
		     error: function(request, status, error){
		    	 console.log('error:'+error);
		     }
		 });
	 });
 });

 	var displayPlanner = function(data){
 		console.log(JSON.stringify(data));
//  		var commentString="";
//  		if(data.length==0){
//  			commentString+='<tr><td colspan="12">해당 데이타가 없습니다</td></tr>';
//  		}
//  		$.each(data,function(index,comment){
//  			commentString+='<tr><td><input type="checkbox" class="list-child" name="checklist"/>'+comment['planner_id']+'</td>';
//  			commentString+='<td>+'comment['planner_id']+'</td>';
//  			commentString+='<td class="hidden-phone">'+comment['id']+'</td>';
//  			commentString+='<td class="hidden-phone">'+comment['days']+'</td>';
//  			commentString+='<td class="hidden-phone">'+comment['view_count']+'</td>';
//  			commentString+='<td class="hidden-phone">'+comment['postdate']+'</td>';
//  			commentString+='</tr>'
//  		});//each
//  		$('#comments').html(commentString);
 	}///////////displayPlanner
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
		<h3>
			<i class="fa fa-angle-right"></i> 일반 사용자 플래너 관리
		</h3>
		<!-- INPUT MESSAGES -->
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
					<h4 class="mb">
						<i class="fa fa-angle-right"></i> 검 색
					</h4>
					<form id="searchForm" action="#">
						<hr>
						<label class="col-sm-2 col-sm-2 control-label">여행 일수</label>
						<label class="checkbox-inline"> <input type="radio" name="days" id="inlineCheckbox1" value="1"> 당일치기</label>
<!-- 					    <label class="checkbox-inline"> <input type="radio" name="days" id="inlineCheckbox2" value="4"> 5일 미만</label>  -->
					    <label class="checkbox-inline"> <input type="radio" name="days" id="inlineCheckbox3" value="9"> 10일 미만</label> 
					    <label class="checkbox-inline"> <input type="radio" name="days" id="inlineCheckbox4" value="10"> 10일 이상</label>
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
		<h3>
			<i class="fa fa-angle-right"></i> 결과
		</h3>
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
								<th><i class="fa fa-rocket"></i> Planner_ID</th>
								<th><i class="fa fa-rocket"></i> ID</th>
								<th><i class="fa fa-star"></i> Days</th>
								<th class="hidden-phone"><i class="fa fa-eye"></i>
									ViewCount</th>
								<th class="hidden-phone"><i class="fa fa-calendar-o"></i>
									PostDate</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty list}" var="isEmpty">
								<tr>
									<td colspan="30"
										style="text-align: center; font-size: large; font-weight: bold;">결과가
										없습니다</td>
								</tr>
							</c:if>
							<c:if test="${not isEmpty}">
								<form action="/Planit/Admin/AdminUserDelete.do" id="checklist">
									<c:forEach var="record" items="${list}" varStatus="loop">
										<tr>
											<td><input type="checkbox" class="list-child"
												name="chklst" value="${record.planner_id}" /></td>
											<td><a href="#" style="text-align: center;">${record.planner_id}</a>
											</td>
											<td class="hidden-phone">${record.id}</td>
											<td class="hidden-phone">${record.days}</td>
											<td class="hidden-phone">${record.viewcount}</td>
											<td class="hidden-phone">${record.postdate}</td>
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
