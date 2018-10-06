<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!-- tiles 접두어를 사용해서 insert해준다.  -->
<!DOCTYPE html>
<html lang="ko">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>PLAN:IT</title>

<!-- 부트스트랩 -->
<!-- CSS -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway:400,700">
<link rel="stylesheet"
	href="<c:url value='/assets/bootstrap/css/bootstrap.min.css'/> ">
<link rel="stylesheet"
	href="<c:url value='/assets/font-awesome/css/font-awesome.min.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/animate.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>">
<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- Favicon and touch icons -->
<link rel="shortcut icon"
	href="<c:url value='/assets/ico/favicon.png'/>">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="<c:url value='/assets/ico/apple-touch-icon-144-precomposed.png'/> ">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="<c:url value='/assets/ico/apple-touch-icon-114-precomposed.png'/> ">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="<c:url value='/assets/ico/apple-touch-icon-72-precomposed.png'/> ">
<link rel="apple-touch-icon-precomposed"
	href="<c:url value='/assets/ico/apple-touch-icon-57-precomposed.png'/> ">

<!-- Javascript -->
<script src="<c:url value='/assets/js/jquery-1.11.1.min.js'/> "></script>
<script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js'/> "></script>
<script src="<c:url value='/assets/js/jquery.backstretch.min.js'/> "></script>
<script src="<c:url value='/assets/js/wow.min.js'/> "></script>
<script src="<c:url value='/assets/js/retina-1.1.0.min.js'/> "></script>
<script src="<c:url value='/assets/js/scripts.js'/> "></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>

<script>
 console.log('${sessionScope.e_id}님 반갑습니다.');
if('${sessionScope.e_id}'!=""){
	location.replace('<c:url value="/Planit/admin/Dashboard.do"/> ');
} 
	$(function() {
		
		$('.testimonials-container').backstretch(
				"<c:url value='/assets/img/backgrounds/earth.jpg'/>");
		$('html, body').css({'height':'100%', 'width':'100%'});
		
		$('#frm').validate({rules:{
			e_id:{
				required:true
				  //최소문자길이
			},
			pwd:{
				required:true
				
			}
		},
		messages:{
			e_id:{
				required:'아이디를 입력하세요'
				
			},
			pwd:{
				required:'비밀번호를 입력하세요'
				
			}	
		}});
		
		
	})
</script>
</head>
<body>
<!-- Top menu -->
	<nav class="navbar navbar-inverse" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#top-navbar-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<c:url value='/'/> ">PLAN:IT</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="top-navbar-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<c:url value='/'/>">PLANIT!</a></li>
					<c:if test="${not empty sessionScope.e_id}">
						<li><a href="<c:url value='/Planit/admin/logout.do'/> ">LOGOUT</a></li>
					</c:if>
					
				</ul>
			</div>
		</div>
	</nav>	
<div
	class="testimonials-container section-container section-container-image-bg" style="height: 100%; text-align: center;">
	<div class="container">
		<c:if test="${not empty sessionScope.e_id }" var="isLogin">
			<div class="description wow" style="padding-bottom: 20px;padding-top: 10% "></div>
			<div class="col-sm-6 col-sm-offset-3" >
				<h1 style="color:white;font-family: 'Orbitron', sans-serif; font-size: 2em;">HELLO, PLANIT</h1>
				<img alt="우주인" src="<c:url value='/images/wujooin.png'/>" width="140" height="300">
			</div>
		</c:if>
		<c:if test="${not isLogin }">
		<div class="description wow" style="padding-bottom: 20px;padding-top: 25% "></div>
		<div class="col-sm-6 col-sm-offset-3" >
			<form role="form" id="frm" action="<c:url value='/planit/admin/loginprocess.do'/>" method="post">
				<div class="form-group">
					<label class="sr-only login-text" for="r-form-1-first-name">ID</label>
					<input type="text" name="e_id" style="height: 50px;"
						placeholder="admin" class="r-form-1-first-name form-control" id="id">
				</div>
				
				<div class="form-group">
					<label class="sr-only login-text" for="r-form-1-last-name">PWD</label> 
					<input type="password" name="pwd" placeholder="password" style="height: 50px;"
						class="r-form-1-last-name form-control" id="pass">
				</div>
				
				<c:if test="${not empty loginError}"><div style="color:red; font-weight:bold">${loginError}</div></c:if>
				<button type="submit" class="login-btn">Sign me up!</button>
			</form>
		</div>
		</c:if>
	</div>
</div>

</body>