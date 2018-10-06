<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	
		var search=function(){
			$('#frm').submit();
		};
		
		$(function(){
			$('#frm').validate({rules:{
				searchWord:{
					required:true
					  //최소문자길이
				}
			},
			messages:{
				searchWord:{
					required:'검색어를 입력하세요'
					
				}
			}});
		});
		
		$(function(){
			<c:if test="${not empty searchColumn}">
			$(".chooseColumn").html($("option[value=${searchColumn}").html());
			</c:if>
			
		});
		
	
</script>


<!-- **********************************************************************************************************************************************************
        MAIN CONTENT :: 직원 관리 
 *********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<h3 style="text-align: center">직 원 관 리</h3>
		<!-- /row -->
		<!-- INLINE FORM ELELEMNTS -->
		<div class="row mt">
			<div class="col-lg-6 col-lg-offset-3">
				<div class="form-panel center-block">
					<div class="center-block">
					<h4 class="mb"> 검 색</h4>
					</div>
					<form class="form-inline" role="form"  action="<c:url value='/Planit/admin/Employee.do'/> " id="frm" >
						<div class="form-group">
							<label class="sr-only" for="searchColumn">분류</label> 
							<select class="form-control" id="searchColumn" name="searchColumn">
								<option value="emp_no">사번</option>
								<option value="name">이름</option>
								<option value="deptname">부서</option>
								<option value="tel">전화번호</option>
							</select>
						</div>
						<div class="form-group">
							<label class="sr-only" for="searchWord"></label>
							<input type="text" name="searchWord" class="form-control"	id="searchWord" placeholder="키워드를 입력하세요">
						</div>
						<a href="javascript:search()" class="btn btn-theme">검색</a>
					</form>
				</div>
				<!-- /form-panel -->
			</div>
			<!-- /col-lg-12 -->
		</div>
		<!-- /row -->
		<c:if test="${empty searchWord}" var="result">
		<h3><i class="fa fa-angle-right"></i>전체조회</h3>
		</c:if>
		<c:if test="${not result}">
		<h3><i class="fa fa-angle-right"></i><span class="chooseColumn"></span>: ${searchWord} 으로 검색한 결과</h3>
		</c:if>
		<div class="row mt">
			<div class="col-lg-12">
				<div class="content-panel">
					<h4>
						<i class="fa fa-angle-right"></i> 
					</h4>
					<section id="unseen">
						<table class="table table-bordered table-striped table-condensed table-text-center ">
							<thead>
								<tr>
									<th>사원번호</th>
									<th>부서명</th>
									<th >이름</th>
									<th >직무</th>
									<th >전화번호</th>
									<th >e-mail</th>
									<th colspan="2">관리</th>
								</tr>
							</thead>
							<tbody>
							<c:if test="${not empty list}" var="isNotEmpty">
								<c:forEach items="${list}" var="record" varStatus="loop">
								<tr>
									<td>${record.emp_no }</td>
									<td>${record.deptname }</td>
									<td >${record.name }</td>
									<td >${record.position }</td>
									<td >${record.tel }</td>
									<td>${record.email }</td>
									<td colspan="2">
									<button type="button" class="btn btn-round btn-info">정보</button>
									<button type="button" class="btn btn-round btn-success">수정</button>
									<button type="button" class="btn btn-round btn-danger">삭제</button></td>
								</tr>
								</c:forEach>
							</c:if>
							<c:if test="${not isNotEmpty}">
								<tr>
									<td colspan="6">No posts have been submitted.</td>
								</tr>
							</c:if>
							</tbody>
						</table>
						<div class="row">
							<div class="col-md-11">${pagingString}</div>
						</div>
					</section>
				</div>
				<!-- /content-panel -->
			</div>
			<!-- /col-lg-4 -->
		</div>

	</section>

</section>


