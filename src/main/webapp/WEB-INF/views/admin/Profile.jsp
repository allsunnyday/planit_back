<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper site-min-height">
        <div class="row mt">
          <div class="col-lg-12">
            <div class="row content-panel">
              <div class="col-md-4 profile-text mt mb centered">
                <div class="right-divider hidden-sm hidden-xs">
                  <h4>1922</h4>
                  <h6>FOLLOWERS</h6>
                  <h4>290</h4>
                  <h6>FOLLOWING</h6>
                  <h4>$ 13,980</h4>
                  <h6>MONTHLY EARNINGS</h6>
                </div>
              </div>
              <!-- /col-md-4 -->
              <div class="col-md-4 profile-text">
                <h3>${admininfo.name}</h3>
                <h6>${admininfo.position }</h6>
                <p>tel  ${admininfo.tel}</p>
                <p>email ${admininfo.email}</p>
                <br>
                <p><button class="btn btn-theme"><i class="fa fa-envelope"></i> Send Message</button></p>
              </div>
              <!-- /col-md-4 -->
              <div class="col-md-4 centered">
                <div class="profile-pic">
                  <p><img src="img/ui-sam.jpg" class="img-circle"></p>
                  <p>
                    <button class="btn btn-theme"><i class="fa fa-check"></i> Follow</button>
                    <button class="btn btn-theme02">Add</button>
                  </p>
                </div>
              </div>
              <!-- /col-md-4 -->
            </div>
            <!-- /row -->
          </div>
          <!-- /col-lg-12 -->
          <div class="col-lg-12 mt">
            <div class="row content-panel">
              <div class="panel-heading">
                <ul class="nav nav-tabs nav-justified">
                  <li class="active">
                    <a data-toggle="tab" href="#overview">Overview</a>
                  </li>
                  <li>
                    <a data-toggle="tab" href="#contact" class="contact-map">Contact</a>
                  </li>
                  <li>
                    <a data-toggle="tab" href="#edit">Edit Profile</a>
                  </li>
                </ul>
              </div>
              <!-- /panel-heading -->
              <div class="panel-body">
                <div class="tab-content">
                <!-- /OVERVIEW -->
                  <div id="overview" class="tab-pane active">
                    	<div class="row">
                      	<header class="panel-heading wht-bg">
			                <h4 class="gen-case">
			                    Inbox (3)
			                    <form action="#" class="pull-right mail-src-position">
			                      <div class="input-append">
			                        <input type="text" class="form-control " placeholder="Search Mail">
			                      </div>
			                    </form>
			                  </h4>
			              </header>
			              <div class="panel-body minimal">
			                <div class="mail-option">
			                  
			                  <div class="btn-group">
			                    <a data-original-title="Refresh" data-placement="top" data-toggle="dropdown" href="#" class="btn mini tooltips">
			                      <i class=" fa fa-refresh"></i>
			                      </a>
			                  </div>
			                  <div class="btn-group hidden-phone">
			                    <a data-toggle="dropdown" href="#" class="btn mini blue">
			                      More
			                      <i class="fa fa-angle-down "></i>
			                      </a>
			                    <ul class="dropdown-menu">
			                      <li><a href="#"><i class="fa fa-pencil"></i> Mark as Read</a></li>
			                      <li><a href="#"><i class="fa fa-ban"></i> Spam</a></li>
			                      <li class="divider"></li>
			                      <li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li>
			                    </ul>
			                  </div>
			                  <div class="btn-group">
			                    <a data-toggle="dropdown" href="#" class="btn mini blue">
			                      Move to
			                      <i class="fa fa-angle-down "></i>
			                      </a>
			                    <ul class="dropdown-menu">
			                      <li><a href="#"><i class="fa fa-pencil"></i> Mark as Read</a></li>
			                      <li><a href="#"><i class="fa fa-ban"></i> Spam</a></li>
			                      <li class="divider"></li>
			                      <li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li>
			                    </ul>
			                  </div>
			                  <ul class="unstyled inbox-pagination">
			                    <li><span>1-50 of 99</span></li>
			                    <li>
			                      <a class="np-btn" href="#"><i class="fa fa-angle-left  pagination-left"></i></a>
			                    </li>
			                    <li>
			                      <a class="np-btn" href="#"><i class="fa fa-angle-right pagination-right"></i></a>
			                    </li>
			                  </ul>
			                </div>
			                
			                
			                <!--  선택에 따라 변경될 내용  -->
			                <div class="table-inbox-wrap ">
			                  <table class="table table-inbox table-hover">
			                    <thead>
			                    	<tr>
			                    		<th colspan="2">
			                    		<div class="mail-option" style="padding:0;margin:0;">
			                    			<div class="chk-all">
						                    <div class="pull-left mail-checkbox">
						                      <input type="checkbox" class="">
						                    </div>
						                    <div class="btn-group">
						                      <a data-toggle="dropdown" href="#" class="btn mini all">
						                        All
						                        <i class="fa fa-angle-down"></i>
						                       </a>
						                      <ul class="dropdown-menu">
						                        <li><a href="#"> None</a></li>
						                        <li><a href="#"> Read</a></li>
						                        <li><a href="#"> Unread</a></li>
						                      </ul>
						                    </div>
						                  </div>
						                  </div>
			                    		</th>
			                    		<th>보낸사람</th>
			                    		<th>제목</th>
			                    		<th >첨부파일</th>
			                    		<th class="text-right">보낸날짜</th>
			                    	</tr>
			                    </thead>
			                    <tbody>
			                      
			                      
			                      <tr class="unread">
			                        <td class="inbox-small-cells">
			                          <input type="checkbox" class="mail-checkbox">
			                        </td>
			                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
			                        <td class="view-message  dont-show"><a href="mail_view.html">보낸사람</a></td>
			                        <td class="view-message "><a href="mail_view.html">제목</a></td>
			                        <td class="view-message  inbox-small-cells"><i class="fa fa-paperclip"></i></td>
			                        <td class="view-message  text-right">보낸날짜 </td>
			                      </tr>
			                      <tr class="">
			                        <td class="inbox-small-cells">
			                          <input type="checkbox" class="mail-checkbox">
			                        </td>
			                        <td class="inbox-small-cells"><i class="fa fa-star inbox-started"></i></td>
			                        <td class="view-message dont-show"><a href="mail_view.html">Mark Webber <span class="label label-danger pull-right">urgent</span></a></td>
			                        <td class="view-message"><a href="mail_view.html">The server is down</a></td>
			                        <td class="view-message inbox-small-cells"></td>
			                        <td class="view-message text-right">March 09</td>
			                      </tr>
			                    </tbody>
			                  </table>
			                </div>
			              </div>
                      </div>
                    </div>
                    <!-- /OVERVIEW -->
                  
                  <!-- /contact -->
                  <div id="contact" class="tab-pane">
                    <div class="row">
                     
                      
                    </div>
                    <!-- /row -->
                  </div>
                   <!-- /contact -->
                  
                  <!-- /edit -->
                  <div id="edit" class="tab-pane">
                    <div class="row">
                      
                      
                     
                    </div>
                    <!-- /row -->
                  </div>
                 <!-- /edit -->
                  
                </div>
                <!-- /tab-content -->
              </div>
              <!-- /panel-body -->
            </div>
            <!-- /col-lg-12 -->
          </div>
          <!-- /row -->
        </div>
        <!-- /container -->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
