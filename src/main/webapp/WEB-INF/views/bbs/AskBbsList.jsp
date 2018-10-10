<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	
	
	var showUserAskBbs= function(){
		//사용자의 리스트를 불러온다.
		$(".mail-nav li").removeClass('active');
		$(".mail-nav .user-ask").addClass('active');
		$.ajax({
			url:"<c:url value='/planit/bbs/asklist.do?whoAsk=user'/> ",
			dataType:'json',
			type:'post',
			success:function(data){
				showAskList(data, 'user');
			}
			
		});
	};
	
	var showPartnerAskBbs = function(){
		$(".mail-nav li").removeClass('active');
		$(".mail-nav .partner-ask").addClass('active');
		$.ajax({
			url:"<c:url value='/planit/bbs/asklist.do?whoAsk=partner'/> ",
			dataType:'json',
			type:'post',
			success:function(data){
				showAskList(data, 'function');
			}
		});
	};

	var showAskList=function(data, who){
		console.log(who+"에서 보냄");
		console.log(JSON.stringify(data));
	};

</script>




<!-- **********************************************************************************************************************************************************
  	사용자로 부터  받은 문의들을 리스트형식으로 보여준다. 
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
                  <i class="fa fa-pencil"></i>  문의 게시판  
                </a>
                <ul class="nav nav-pills nav-stacked mail-nav">
                  <li class="user-ask active">
                  	<a href="javascipt:void(0);" class="user-ask" onclick="showUserAskBbs();"> <i class="fa fa-inbox"></i> 사용자 문의 게시판  <span class="label label-theme pull-right inbox-notification">${uWatiedNumber}</span></a>
                  </li>
                  <li class="partner-ask ">
                  	<a href="javascipt:void(0);" class="partner-ask" onclick="showPartnerAskBbs();"> <i class="fa fa-envelope-o"></i> 기업 문의 게시판 
                  	<span class="label label-theme pull-right inbox-notification">${pWatiedNumber}</span></a>
                  </li>
                  <li>
                  	<a href="#"> <i class="fa fa-file-text-o"></i> 답변 완료 게시판  <span class="label label-info pull-right inbox-notification">8</span></a>
                  </li>
                  <!-- <li>
                  	<a href="#"> <i class="fa fa-exclamation-circle"></i> 이벤트 관련 공지사항 </a>
                  </li> -->
                </ul>
              </div>
            </section>
          
          </div>
          <div class="col-sm-9">
            <section class="panel">
              <header class="panel-heading wht-bg">
                <h4 class="gen-case">
                    		새 문의 (${uWatiedNumber})
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
                    <div class="pull-left mail-checkbox">
                      <input type="checkbox" class="">
                    </div>
                    <div class="btn-group">
                      <a data-toggle="dropdown" href="#" class="btn mini all">
                        All
                        <i class="fa fa-angle-down "></i>
                        </a>
                      <ul class="dropdown-menu">
                        <li><a href="#"> None</a></li>
                        <li><a href="#"> Read</a></li>
                        <li><a href="#"> Unread</a></li>
                      </ul>
                    </div>
                  </div>
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
                <div class="table-inbox-wrap user-ask">
                  <table class="table table-inbox table-hover">
                    
                    <tbody>
                      <tr class="unread">
                        <td class="inbox-small-cells">
                          <input type="checkbox" class="mail-checkbox">
                        </td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message  dont-show"><a href="mail_view.html">사용자 이름</a></td>
                        <td class="view-message "><a href="mail_view.html">제목</a></td>
                        <td class="view-message  inbox-small-cells">status</td>
                        <td class="view-message  text-right">요청일자 </td>
                      </tr>
                    <c:if test="${empty userAsk}" var="hasAsk">
                    	<tr>
                    		<td colspan="6"> 등록된  문의가 없습니다.</td>
                    	</tr>
                    </c:if>
                    <c:if test="${not hasAsk}">
                    <c:forEach var="ask" items="${userAsk}"   >
	                      <tr class="">
	                        <td class="inbox-small-cells">
	                          <input type="checkbox" class="mail-checkbox">
	                        </td>
	                        <td class="inbox-small-cells"><i class="fa fa-star inbox-started"></i></td>
	                        <td class="view-message dont-show"><a href="mail_view.html">${ask['name']} <span class="label label-danger pull-right">urgent</span></a></td>
	                        <td class="view-message"><a href="mail_view.html">${ask['title']}</a></td>
	                        <td class="view-message inbox-small-cells">${ask['status']}</td>
	                        <td class="view-message text-right">${ask['askdate']}</td>
	                      </tr>
                      </c:forEach>
                      </c:if>
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
