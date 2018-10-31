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
                  <i class="fa fa-pencil"></i>  이벤트 폼  
                  </a>
                <ul class="nav nav-pills nav-stacked mail-nav">
                  <li class="active"><a href="<c:url value='/Planit/Admin/Event/List.do'/>"> <i class="fa fa-inbox"></i> 진행중인 이벤트  <span class="label label-theme pull-right inbox-notification">${totalRecordCount }</span></a></li>
                  <li><a href="#"> <i class="fa fa-envelope-o"></i> 이벤트 요청건</a></li>
                </ul>
              </div>
            </section>
         
          </div>
          <div class="col-sm-9">
            <section class="panel">
              <header class="panel-heading wht-bg">
                <h4 class="gen-case">
                    이벤트 목록
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
                    <span>총 :&nbsp ${totalRecordCount }개</span>
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
                        <td class="view-message  dont-show">파트너사명</td>
                        <td class="view-message ">이벤트명</td>
                        <td class="view-message  inbox-small-cells"><i class="fa fa-paperclip">status</i></td>
                        <td class="view-message  text-right">기한(18/09-19/09) </td>
                      </tr>
                      
                      <c:forEach var="record" items="${list}">
	                      <tr class="unread">
	                        <td class="inbox-small-cells">
	                          <input type="checkbox" class="mail-checkbox">
	                        </td>
	                        <td class="view-message dont-show"><a href="mail_view.html">${record.p_id }</a></td>
	                        <td class="view-message"><a href="mail_view.html">${record.title }</a></td>
	                        <td class="view-message inbox-small-cells">${record.status }</td>
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
    
    <script>
    console.log('${list}');
    console.log('${totalRecordCount}');
    
    </script>
