<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
	*************************************
			일반 사용자 관리 화면
	***********************************	
 -->
<script>
	 $(function() {
		$("#search").click(function() {
			$.ajax({
				url: "<c:url value='/Planit/Admin/AdminUserInfo.do'/>",
				data: $('#searchForm').serialize(),
				dataType: "json",
				type:'post',
				success: function(data) {
					console.log('success');
					searchAjax(data, '#checklist');
				},
				error: function(request, status, error) {
					console.log('error입니다'+error);
				}
			});
		});
	}); 
	 function searchAjax(data, target) {
			console.log('서버로부터 받은 데이터:', data);
			/* $.each(data, function(index, element) {
				$.each(data, function(key, value) {
					tableString+='<tr> <td><input type="checkbox" class="list-child" name="chklst" value="'+id+'"/></td>';
				});
				
			});
			tableString +="";
			$(target).html(tableString); */
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
		<h3>
			<i class="fa fa-angle-right"></i> 일반 사용자 관리
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
						<label class="col-sm-2 col-sm-2 control-label">나이대별</label> <label
							class="checkbox-inline "> <input type="checkbox"
							name="age" id="inlineCheckbox1" value="10"> 10대
						</label> <label class="checkbox-inline"> <input type="checkbox"
							name="age" id="inlineCheckbox2" value="20"> 20대
						</label> <label class="checkbox-inline"> <input type="checkbox"
							name="age" id="inlineCheckbox3" value="30"> 30대
						</label> <label class="checkbox-inline"> <input type="checkbox"
							name="age" id="inlineCheckbox4" value="40"> 40대
						</label> <label class="checkbox-inline"> <input type="checkbox"
							name="age" id="inlineCheckbox5" value="50"> 50대
						</label>
						<hr>
						<label class="col-sm-2 col-sm-2 control-label">성별</label> <label
							class="checkbox-inline "> <input type="checkbox"
							name="gender" id="inlineCheckbox1" value="W"><i
							class="fa fa-female"></i> 여성
						</label> <label class="checkbox-inline"> <input type="checkbox"
							name="gender" id="inlineCheckbox2" value="M"><i
							class="fa fa-male"></i> 남성
						</label>
						<hr>
						<button id="search" class="btn btn-primary">search</button>
						<button id="all" type="button" class="btn btn-primary">show
						All</button>
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
								<th><i class="fa fa-rocket"></i> ID</th>
								<th class="hidden-phone"><i class="fa fa-user"></i> Name</th>
								<th class="hidden-phone"><i class="fa fa-envelope-o"></i>
									Email</th>
								<th class="hidden-phone"><i class="fa fa-female"></i>
									Gender</th>
								<th class="hidden-phone"><i class="fa fa-rocket"></i> Age</th>
								<th class="hidden-phone"><i class="fa fa-calendar-o"></i>
									Regidate</th>
								<!--  <th></th> -->
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty list}" var="isEmpty">
								<tr>
									<td colspan="3"
										style="text-align: center; font-size: large; font-weight: bold;">결과가
										없습니다</td>
								</tr>
							</c:if>
							<c:if test="${not isEmpty}">
								<form action="/Planit/Admin/AdminUserDelete.do" id="checklist">
									<c:forEach var="record" items="${list}" varStatus="loop">
										<tr>
											<td><input type="checkbox" class="list-child"
												name="chklst" value="${record.id}" /></td>
											<td><a href="#" style="text-align: center;">${record.id}</a>
											</td>
											<td class="hidden-phone">${record.name}</td>
											<td class="hidden-phone">${record.email}</td>
											<td class="hidden-phone">${record.gender}</td>
											<td class="hidden-phone">${record.age}</td>
											<td class="hidden-phone">${record.regidate}</td>
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
