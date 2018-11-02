<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
		<!-- page start-->
		<div class="chat-room mt">
			<aside class="mid-side">
				<div class="chat-room-head">
					<h3>파트너 관리 </h3>
					<form action="#" class="pull-right position">
						<input type="text" placeholder="Search"
							class="form-control search-btn ">
					</form>
				</div>
				
				<div class="room-desk">
					<h4 class="pull-left">파워 업체[평점이 높은 업체부터 정렬입니다.] </h4>
					<a href="#" class="pull-right btn btn-theme02">+ Create Room</a>
					<c:forEach var="record" items="${desclist}">
					<div class="room-box">
						<h5 class="text-primary">
							업체명: <a href="<c:url value='#'/>" > ${record.roomtitle } </a>
						</h5>
						<p>${record.address }</p>
						<p>
							<span class="text-muted">Admin :</span> ${record.p_id }  | 
							<span class="text-muted">평점 :</span> ${record.rating } | 
						</p>
					</div>
					</c:forEach>
				</div>
				<div class="row">
					<div class="col-md-12">${pagingString}</div>
				</div>
			
				
				
			</aside>
			<aside class="right-side">
				<div class="user-head">
					<h3>진행중인 이벤트 ▼</h3>
					
				</div>
				<c:if test="${empty list}" var="isEmpty">
				<div style="padding-top:20%; text-align: center">
								<tr>
									<td colspan="3"
										style="text-align: center; font-size: large; font-weight: bold;">진행중인 이벤트가
										없습니다</td>
								</tr>
								</div>
				</c:if>
				<c:if test="${not isEmpty}">
				<div class="invite-row">
					<h4 class="pull-left">진행 이벤트</h4>
				</div>
				<ul class="chat-available-user">
					<li><a href="#"> 
					<c:forEach var="record" items="${list}" varStatus="loop">
					<img class="img-circle"src="img/friends/fr-02.jpg" width="32">
					<span style="font-weight:2em">
					${record.title }
					</span> 
					</c:forEach>
					</a></li>
				</ul>
				</c:if>
			</aside>
		</div>
		<!-- page end-->
	</section>
	<!-- /wrapper -->
</section>
<!-- /MAIN CONTENT -->
<!--main content end-->

