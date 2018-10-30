<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
		<h3>
			<i class="fa fa-angle-right"></i> Photobook
		</h3>
		<hr>
	
		<div class="row mt">
			<c:forEach var="record" items="${list }">
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
				<div class="project-wrapper">
					<div class="project">
						<div class="photo-wrapper">
							<div class="photo">
							
								<a class="fancybox" href="img/portfolio/port04.jpg">
								<img class="img-responsive" src="${record.sampleimage }" alt="${record.name }"></a>
							
							</div>
							<div class="overlay"></div>
						</div>
					</div>
				</div>
			</div>
					</c:forEach>
		</div>
		
		<!-- /row -->
	</section>
	<!-- /wrapper -->
</section>
<!-- /MAIN CONTENT -->
<!--main content end-->
