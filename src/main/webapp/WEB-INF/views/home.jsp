<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
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
<script type="text/javascript">
	/** airport 글자움직이는 script ***/
	$(document)
			.ready(
					function() {
						var $randomNumber = $('.nbr');
						var $timer = 30;
						var $it;
						var $data = 0;
						var index;
						var change;
						var letters = [ "P", "L", "A", "N", ":", "I", "T" ];

						$randomNumber.each(function() {
							change = Math.round(Math.random() * 100);
							$(this).attr('data-change', change);
						});

						function random() {
							return Math.round(Math.random() * 9);
						}
						;

						function select() {
							return Math.round(Math.random()
									* $randomNumber.length + 1);
						}
						;

						function value() {
							$('.nbr:nth-child(' + select() + ')').html(
									'' + random() + '');
							$('.nbr:nth-child(' + select() + ')').attr(
									'data-number', $data);
							$data++;

							$randomNumber
									.each(function() {
										if (parseInt($(this)
												.attr('data-number')) > parseInt($(
												this).attr('data-change'))) {
											index = $('.ltr').index(this);
											$(this).html(letters[index]);
											$(this).removeClass('nbr');
										}
									});
						}
						;
						$it = setInterval(value, $timer);
					});
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
				<a class="navbar-brand" href="#">PLAN:IT</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="top-navbar-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a class="scroll-link" href="#features">PLANIT?</a></li>
					<li><a class="scroll-link" href="#how-it-works">How?</a></li>
					<li><a class="scroll-link" href="#testimonials">Who?</a></li>
					<li><a class="scroll-link" href="#faq">FAQ</a></li>
					<c:if test="${empty sessionScope.e_id}" var="isLogin">
						<li><a href="<c:url value='/Planit/admin/login.do'/> ">LOGIN</a></li>
					</c:if>
					<%-- <c:if test="${not empty sessionScope.e_id}">
						<li><a href="<c:url value="/Planit/admin/Dashboard.do"/> ">관리자 페이지 </a></li>
					</c:if> --%>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Top content -->
	<div class="top-content">
		<div class="container">

			<div class="row">
				<div class="col-sm-8 col-sm-offset-2 text">
					<!-- <h1 class="wow fadeInLeftBig">Newsletter Sign Up Template</h1> -->
					<!-- <div class="description wow fadeInLeftBig">
							<p>
								This is a free responsive newsletter sign-up landing page made with Bootstrap. 
								Download it on <a href="http://azmind.com/free-bootstrap-themes-templates/">AZMIND</a> and customize it as you like!
							</p>
						</div> -->
					<div class="content wow fadeInLeftBig">
						<div class="random">
							<h1 class="wow fadeInLeftBig"
								style="font-family: 'Orbitron', sans-serif; color: black; font-size: 2em;">
								<span class="span nbr ltr">0</span> <span class="span nbr ltr">0</span>
								<span class="span nbr ltr">0</span> <span class="span nbr ltr">0</span>
								<span class="span nbr ltr">0</span> <span class="span nbr ltr">0</span>
								<span class="span nbr ltr">0</span>
							</h1>
						</div>
					</div>
					
				</div>
			</div>


		</div>
	</div>

	<!-- Features -->
	<div class="features-container section-container">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 features section-description wow fadeIn">
					<h2>What You Get By PLAN:IT?</h2>
					<div class="divider-1 wow fadeInUp">. . . . . . . . . .</div>
					<p>PLANIT은 블로그와 각종 여행사 사이트에 흩어져있는 국내 관광정보를 한데 모아줄 뿐만아니라 직접 모은
						정보를 가지고 국내여행을 계획할 수 있게 만들고, 여행 중에는 여행의 순간을 기록할 수 있는 서비스를 제공하는 국내
						여행 솔루션 서비스입니다.</p>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 features-box wow fadeInUp">
					<div class="features-box-icon">
						<i class="fa fa-cog"></i>
					</div>
					<h3>SEARCH</h3>
					<p>국내 관광 정보를 쉽고 간편하게 구경하세요</p>
				</div>
				<div class="col-sm-4 features-box wow fadeInDown">
					<div class="features-box-icon">
						<i class="fa fa-magic"></i>
					</div>
					<h3>PLANNER</h3>
					<p>나만의 국내여행 플랜을 짜보세요, 간편한 UI로 누구나 쉽고 빠르게 만들 수 있습니다.</p>
				</div>
				<div class="col-sm-4 features-box wow fadeInUp">
					<div class="features-box-icon">
						<i class="fa fa-commenting"></i>
					</div>
					<h3>REVIEW</h3>
					<p>실제 여행자들의 리뷰를 보여드릴게요. 알고싶은 내용이 모두 담겨있는 리뷰로 색다른 여행
					정보를 얻어보세요 </p>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12 section-bottom-button wow fadeInUp">
					<a class="btn btn-link-1 scroll-link" href="#top-content">Sign
						Up Now <i class="fa fa-angle-right"></i>
					</a>
				</div>
			</div>
		</div>
	</div>

	<!-- How it works -->
	<div
		class="how-it-works-container section-container section-container-gray-bg">
		<div class="container">
			<div class="row">
				<div class="col-sm-5 how-it-works-box">
					<div class="embed-responsive embed-responsive-16by9">
						<iframe class="embed-responsive-item"
							src="https://player.vimeo.com/video/115014610?title=0&amp;byline=0&amp;portrait=0&amp;badge=0&amp;color=89cc2d"
							webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
					</div>
				</div>
				<div
					class="col-sm-6 col-sm-offset-1 how-it-works-box how-it-works-box-right wow fadeInUp">
					<h3>우리의 파트너가 되어주세요</h3>
					<p>PLANIT과 함께라면 국내 여행객들에게 색다른 여행을 선사할 수 있습니다.</p>
					<p>플래너에서 바로바로 예약이 가능한 서비스를 통해 고객들에게 직접적인 추천이 가능합니다. 
					파트너로 등록하시면 더욱더 많은 혜택을 보실 수 있습니다. </p>
					<p>
						<a class="learn-more scroll-link" href="#top-content">REGISTER</a>
					</p>
				</div>
			</div>
		</div>
	</div>

	
	<!-- FAQ -->
	<div class="faq-container section-container">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 faq section-description wow fadeIn">
					<h2>Frequently Asked Questions</h2>
					<div class="divider-1 wow fadeInUp">. . . . . . . . . .</div>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad
						minim veniam, quis nostrud tempor incididunt ut labore et.</p>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1 faq-box wow fadeInUp">
					<div class="faq-number">1</div>
					<h3>Do you have a premium version?</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et.</p>
					<p>Exerci tation ullamcorper suscipit lobortis nisl ut aliquip
						ex ea commodo consequat.</p>
				</div>
				<div class="col-sm-4 col-sm-offset-2 faq-box wow fadeInDown">
					<div class="faq-number">2</div>
					<h3>Can I download your tutorials?</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et.</p>
					<p>Exerci tation ullamcorper suscipit lobortis nisl ut aliquip
						ex ea commodo consequat.</p>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1 faq-box wow fadeInUp">
					<div class="faq-number">3</div>
					<h3>Types of payments you accept?</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et.</p>
					<p>Exerci tation ullamcorper suscipit lobortis nisl ut aliquip
						ex ea commodo consequat.</p>
				</div>
				<div class="col-sm-4 col-sm-offset-2 faq-box wow fadeInDown">
					<div class="faq-number">4</div>
					<h3>Do you have a refund policy?</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et.</p>
					<p>Exerci tation ullamcorper suscipit lobortis nisl ut aliquip
						ex ea commodo consequat.</p>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12 section-bottom-button wow fadeInUp">
					<a class="btn btn-link-1 scroll-link" href="#top-content">Sign
						Up Now <i class="fa fa-angle-right"></i>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Testimonials -->
	<div
		class="testimonials-container section-container section-container-image-bg">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 testimonials section-description wow fadeIn">
					<h2>Testimonials</h2>
					<p>Take a look below to read what our clients have said about
						us:</p>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1 testimonial-list wow fadeInUp">
					<div role="tabpanel">
						<!-- Tab panes -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active" id="tab1">
								<div class="testimonial-image">
									<img src="assets/img/testimonials/1.jpg" alt=""
										data-at2x="assets/img/testimonials/1.jpg">
								</div>
								<div class="testimonial-text">
									<p>
										"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
										do eiusmod tempor incididunt ut labore et. Lorem ipsum dolor
										sit amet, consectetur adipisicing elit, sed do eiusmod tempor
										incididunt ut labore et. Lorem ipsum dolor sit amet,
										consectetur..."<br> <a href="#">Lorem Ipsum,
											dolor.co.uk</a>
									</p>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="tab2">
								<div class="testimonial-image">
									<img src="assets/img/testimonials/2.jpg" alt=""
										data-at2x="assets/img/testimonials/2.jpg">
								</div>
								<div class="testimonial-text">
									<p>
										"Ut wisi enim ad minim veniam, quis nostrud exerci tation
										ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo
										consequat. Ut wisi enim ad minim veniam, quis nostrud exerci
										tation ullamcorper suscipit lobortis nisl ut aliquip ex ea
										commodo consequat..."<br> <a href="#">Minim Veniam,
											nostrud.com</a>
									</p>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="tab3">
								<div class="testimonial-image">
									<img src="assets/img/testimonials/3.jpg" alt=""
										data-at2x="assets/img/testimonials/3.jpg">
								</div>
								<div class="testimonial-text">
									<p>
										"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
										do eiusmod tempor incididunt ut labore et. Lorem ipsum dolor
										sit amet, consectetur adipisicing elit, sed do eiusmod tempor
										incididunt ut labore et. Lorem ipsum dolor sit amet,
										consectetur..."<br> <a href="#">Lorem Ipsum,
											dolor.co.uk</a>
									</p>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="tab4">
								<div class="testimonial-image">
									<img src="assets/img/testimonials/4.jpg" alt=""
										data-at2x="assets/img/testimonials/4.jpg">
								</div>
								<div class="testimonial-text">
									<p>
										"Ut wisi enim ad minim veniam, quis nostrud exerci tation
										ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo
										consequat. Ut wisi enim ad minim veniam, quis nostrud exerci
										tation ullamcorper suscipit lobortis nisl ut aliquip ex ea
										commodo consequat..."<br> <a href="#">Minim Veniam,
											nostrud.com</a>
									</p>
								</div>
							</div>
						</div>
						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#tab1"
								aria-controls="tab1" role="tab" data-toggle="tab"></a></li>
							<li role="presentation"><a href="#tab2" aria-controls="tab2"
								role="tab" data-toggle="tab"></a></li>
							<li role="presentation"><a href="#tab3" aria-controls="tab3"
								role="tab" data-toggle="tab"></a></li>
							<li role="presentation"><a href="#tab4" aria-controls="tab4"
								role="tab" data-toggle="tab"></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	

	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-sm-4 footer-about wow fadeInUp">
					<h3>About Us</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad
						minim veniam, quis nostrud exerci tation ullamcorper.</p>
					<p>
						<a href="#">Learn More</a>
					</p>
				</div>
				<div class="col-sm-4 footer-contact-info wow fadeInDown">
					<h3>Contact Info</h3>
					<p>
						<i class="fa fa-map-marker"></i> Via Rossini 10, 10136 Turin Italy
					</p>
					<p>
						<i class="fa fa-phone"></i> Phone: (0039) 333 12 68 347
					</p>
					<p>
						<i class="fa fa-envelope"></i> Email: <a
							href="mailto:contact.azmind@gmail.com">contact.azmind@gmail.com</a>
					</p>
					<p>
						<i class="fa fa-skype"></i> Skype: planit_online
					</p>
				</div>
				<div class="col-sm-4 footer-social wow fadeInUp">
					<h3>We're Social</h3>
					<p>
						<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
							class="fa fa-twitter"></i></a> <a href="#"><i
							class="fa fa-google-plus"></i></a> <a href="#"><i
							class="fa fa-instagram"></i></a> <a href="#"><i
							class="fa fa-pinterest"></i></a>
					</p>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6 footer-copyright">
					&copy; Nedy Bootstrap Template by <a
						href="http://azmind.com/free-bootstrap-themes-templates/">AZMIND</a>
				</div>
				<div class="col-sm-6 footer-menu">
					<ul>
						<li><a class="scroll-link" href="#top-content">Top</a></li>
						<li><a class="scroll-link" href="#features">What?</a></li>
						<li><a class="scroll-link" href="#how-it-works">How?</a></li>
						<li><a href="#">Terms</a></li>
						<li><a href="#">Privacy</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>

</body>
</html>
