<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
      <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
      </div>
      <!--logo start-->
      <a href="<c:url value='/Planit/admin/Dashboard.do'/>" class="logo"><b>PLAN<span>IT</span></b></a>
      <!--logo end-->
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
        <c:if test="${not empty sessionScope.e_id }" var="isLogin">
         	 <li><a class="logout" href="<c:url value='/Planit/admin/logout.do'/> " >Logout</a></li>
          </c:if>
        </ul>
      </div>
    </header>
    <!--header end-->
    <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
          <p class="centered"><a href="<c:url value='/Planit/admin/Profile.do'/>"><img src="<c:url value='/theme/img/planit_logo.png'/> " class="img-circle" width="80"></a></p>
          <h5 class="centered">${sessionScope.admin}</h5>
          <li class="mt">
            <a class="active" href="<c:url value='/Planit/admin/Dashboard.do'/>">
              <i class="fa fa-dashboard"></i>
              <span>Dashboard</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-desktop"></i>
              <span>관리자</span>
              </a>
            <ul class="sub">
              <li><a href="<c:url value='/Planit/admin/Profile.do'/>">프로파일</a></li>
              <c:if test="${not empty sessionScope.master}">
              <li><a href="<c:url value='/Planit/admin/Employee.do'/>">직원</a></li>
              </c:if>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-cogs"></i>
              <span>일반회원관리</span>
              </a>
            <ul class="sub">
              <li><a href="<c:url value='/Planit/Admin/AdminUserInfo.do'/> ">회원정보</a></li>
              <li><a href="<c:url value='/Planit/Admin/AdminFavorites.do'/> ">즐겨찾기</a></li>
              <li><a href="<c:url value='/Planit/Admin/AdminPlan.do'/> ">플래너</a></li>
              <li><a href="<c:url value='/Planit/Admin/AdminReview.do'/> ">리뷰</a></li>
              <li><a href="<c:url value='/Planit/Admin/Book/List.do'/>">숙박예약관리</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-book"></i>
              <span>파트너관리</span>
              </a>
            <ul class="sub">
              <li><a href="<c:url value='/Planit/Admin/partner/List.do'/> ">기업회원</a></li>
              <li><a href="<c:url value='/Planit/Admin/Event/List.do'/> ">이벤트관리</a></li>
              <li><a href="<c:url value='/Planit/Admin/Reservation/List.do'/> ">숙박예약관리</a></li>
              
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-book"></i>
              <span>컨텐츠관리</span>
              </a>
            <ul class="sub">
              <li><a href="<c:url value='/Planit/Admin/Content/List.do?search=list'/> ">관광정보</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-tasks"></i>
              <span>게시판관리</span>
              </a>
            <ul class="sub">
              <li><a href="<c:url value='/Planit/Admin/BBS/NoticeList.do'/>">공지사항</a></li>
              <li><a href="<c:url value='/Planit/Admin/BBS/AskList.do'/> ">문의게시판</a></li>
              <li><a href="<c:url value='/Planit/Admin/BBS/RequestUpList.do'/>">정보수정건의</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-th"></i>
              <span>포토북</span>
              </a>
            <ul class="sub">
              <li><a href="<c:url value='/planit/photobook/List.do'/> ">포토북</a></li>
              <li><a href="#">디자인등록</a></li>
            </ul>
          </li>
        </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
    <!--sidebar end-->
