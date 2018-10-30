<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- **********************************************************************************************************************************************************
  	파트너에게 요청받은 이벤트와 진행중인 이벤트 및 지난 이벤트를 볼 수 있는 곳       
  *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <!-- page start-->
        <div class="row mt">
          <div class="col-sm-3">
            <section class="panel">
              <div class="panel-body">
                <a href="mail_compose.html" class="btn btn-compose">
                  <i class="fa fa-pencil"></i>  이벤트 폼 작성 
                  </a>
                <ul class="nav nav-pills nav-stacked mail-nav">
                  <li class="active"><a href="inbox.html"> <i class="fa fa-inbox"></i> 진행중인 이벤트  <span class="label label-theme pull-right inbox-notification">3</span></a></li>
                  <li><a href="#"> <i class="fa fa-envelope-o"></i> 이벤트 요청건</a></li>
                  <li><a href="#"> <i class="fa fa-file-text-o"></i> 기한만료 이벤트 <span class="label label-info pull-right inbox-notification">8</span></a></a>
                  </li>
                  <li><a href="#"> <i class="fa fa-exclamation-circle"></i> 이벤트 관련 공지사항 </a></li>
                </ul>
              </div>
            </section>
           <!--  왼쪽 하단 -->
           <!--  <section class="panel">
              <div class="panel-body">
                <a href="#"> + Add More</a>
                <div class="inbox-body text-center inbox-action">
                  <div class="btn-group">
                    <a class="btn mini btn-default" href="javascript:;">
                   		 위치좋음
                      </a>
                  </div>
                  <div class="btn-group">
                    <a class="btn mini btn-default" href="javascript:;">
                      	위치좋음
                      </a>
                  </div>
                </div>
              </div>
            </section> -->
          </div>
          <div class="col-sm-9">
            <section class="panel">
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
                  <div class="chk-all">
                    <li><span>총 :&nbsp ${totalRecordCount }</span></li>
                </div>
                </div>
                
                <!--  선택에 따라 변경될 내용  -->
                <div class="table-inbox-wrap ">
                  <table class="table table-inbox table-hover">
                    <tbody>
                      <tr class="">
                        <td class="inbox-small-cells">
                          <input type="checkbox" class="mail-checkbox">
                        </td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message  dont-show">파트너사명</td>
                        <td class="view-message ">이벤트명</td>
                        <td class="view-message  inbox-small-cells"><i class="fa fa-paperclip"></i></td>
                        <td class="view-message  text-right">기한(18/09-19/09) </td>
                      </tr>
                      
                      <c:forEach var="record" items="${list }">
	                      <tr class="unread">
	                        <td class="inbox-small-cells">
	                          <input type="checkbox" class="mail-checkbox">
	                        </td>
	                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
	                        <td class="view-message dont-show"><a href="mail_view.html">${record.p_id }</a></td>
	                        <td class="view-message"><a href="mail_view.html">${record.title }</a></td>
	                        <td class="view-message inbox-small-cells"></td>
	                        <td class="view-message text-right">${record.reqdate}</td>
	                      </tr>
                      </c:forEach>

                    </tbody>
                  </table>
                </div>
              </div>
            </section>
          </div>
        </div>
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
