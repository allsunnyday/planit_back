<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	var whichAsk;	
	$(function(){
		console.log('refresh');

		$('#user-ask').click(function(){
			showUserAskBbs();
		});
		
		$('#partner-ask').click(function(){
			showPartnerAskBbs();
		});
		showUserAskBbs();
	});
	
	
	function setAskHeader(){
		var headerString=''
		+'<h4 class="gen-case">'
		+'새문의 (<span class="new-num"></span>)'
		+'<form action="#" class="pull-right mail-src-position">'
		+'<div class="input-append">'
		+'<input type="text" class="form-control " placeholder="Search Mail">'
		+'</div></form></h4>';
		
		$('.asklist-haed').html(headerString);
		
	}
	
	var showUserAskBbs= function(){
		// header 설정
		setAskHeader();
		
		//사용자의 리스트를 불러온다.
		whichAsk='user';
		$(".mail-nav li").removeClass('active');
		$(".mail-nav .user-ask").addClass('active');
		console.log("user에서 보냄");
		$.ajax({
			url:"<c:url value='/planit/bbs/asklist.do'/> ",
			data:{whoAsk:'user'},
			dataType:'json',
			type:'post',
			success:function(data){
				console.log(data);
				showAskList(data, 'user'); 
			},
			error: function(request, status, error){
				console.log('error',error, request, status);
			}
			
		});
		
	};
	
	var showPartnerAskBbs = function(){
		setAskHeader();
		whichAsk='partner';
		$(".mail-nav li").removeClass('active');
		$(".mail-nav .partner-ask").addClass('active');
		console.log("partner에서 보냄");
		$.ajax({
			url:"<c:url value='/planit/bbs/asklist.do'/> ",
			data:{whoAsk:'partner'},
			dataType:'json',
			type:'post',
			success:function(data){
				console.log(data);
				 showAskList(data, 'partner');
			},
			error: function(request, status, error){
				console.log('error',error, request, status);
			}
		});
		
		
	};

	var showAskList=function(data, who){
		
		console.log(JSON.stringify(data));
		var listString ='';
		var userNewNum=0;
		var userNewNum=0;
		//데이터가 없다면 
		listString+='<div class="mail-option">'
	              +'<div class="chk-all">'
	              +'<div class="pull-left mail-checkbox">'
	              +'<input type="checkbox" class=""></div>'
	              +'<div class="btn-group">'
	              +'<a data-toggle="dropdown" href="#" class="btn mini all">All'
	              +'<i class="fa fa-angle-down "></i></a>'
	              +'<ul class="dropdown-menu">'
	              +'  <li><a href="#"> None</a></li>'
	              +'<li><a href="#"> Read</a></li>'
	              +'  <li><a href="#"> Unread</a></li>'
	              +' </ul></div></div>'
	              +'<div class="btn-group">'
	              +'<a data-original-title="Refresh" data-placement="top" data-toggle="dropdown" href="#" class="btn mini tooltips">'
	              +'<i class=" fa fa-refresh"></i></a> </div>'
	              +'<ul class="unstyled inbox-pagination">'
	              +'<li><span>1-50 of 99</span></li><li>'
	              +' <a class="np-btn" href="#"><i class="fa fa-angle-left  pagination-left"></i></a>'
	              +'</li> <li>'
	              +'<a class="np-btn" href="#"><i class="fa fa-angle-right pagination-right"></i></a>'
	              +'</li> </ul> </div>'
	              +' <div class="table-inbox-wrap user-ask">'
	              +'<table class="table table-inbox table-hover">'
	              +'<thead>'
	              +'<tr class="unread">'
	              +'   <td class="inbox-small-cells">'
	              +'    <input type="checkbox" class="mail-checkbox">'
	              +'  </td>'
	              +'  <td class="inbox-small-cells"><i class="fa fa-star"></i></td>'
	              +'  <td class="view-message  dont-show"><a href="mail_view.html">사용자 이름</a></td>'
	              +'  <td class="view-message "><a href="mail_view.html">제목</a></td>'
	              +'  <td class="view-message  inbox-small-cells">status</td>'
	              +'  <td class="view-message  text-right">요청일자 </td>'
	              +'</tr></thead>';
		if(data.length==0){
			listString+='<tr><td colspan="6">등록된 문의가 없습니다.</td></tr>';
	      }
	      else{
	    	  
	    	  $.each(data, function(index, content){
	    		  if(content['userAskNum']==null){
	    			  
		    		  listString+='<tr>'
		    			+' <td class="inbox-small-cells">'
		    			+' 		<input type="checkbox" class="mail-checkbox">'
		    			+'</td>'
		    			+'<td class="inbox-small-cells"><i class="fa fa-star inbox-started"></i></td>'
		    			+'<td class="view-message dont-show"><a href="#">'
		    			+content['NAME']+'<span class="label label-danger pull-right">urgent</span></a></td>'
		    			+'<td class="view-message"><a href="#" class="ask-title" title="'+content['ASK_NO']+'" > '+content['TITLE']+'</a></td>'
		    			+' <td class="view-message inbox-small-cells">'+content['STATUS']+'</td>'
		    			+' <td class="view-message text-right">'+content['ASKDATE']+'</td>'
		             	+'</tr>';
		        
		               
	    		  }
	    		  else{
	    			  
	    			if(who=='user'){
	    				$('.new-num').html(content['userAskNum']);
	    			}
	    			else{  //partner
	    				$('.new-num').html(content['partnerAskNum']);  
	    			}
	    			$('.new-u-num').html(content['userAskNum']);
	    	  		$('.new-p-num').html(content['partnerAskNum']);
	    			  
	    		  }
	    		  
	    		  
	    		  
	    		  
	            });  //each()
	     }//else
	     listString+=' </tbody>'
             + '</table> </div>';
	    $('#ask-content').html(listString);
	     // 동적으로 추가된 테이블의 a 태그에 클릭이벤트 추가 하기 
	     // 클릭하면 ask_no과 함께 값이 넘어가도록 한다. 
		$('.ask-title').click(function(){
	    	 // 클릭한 a태그의 title값을 ajax할 때 사용할 값으로 보내줌 (ask_no);
	    	 callOneAsk($(this).attr('title'));
	     });
		
	};
	
	var callOneAsk  = function(askno){
		//console.log(whichAsk+"에서"+askno+"을 조회합니다.");
		$.ajax({
			url:"<c:url value='/Planit/Admin/BBS/AskView.do'/> ",
			data:{ask_no:askno, whoAsk:whichAsk}, // ask_no 글번호, whoAsk 어느 테이블에서 가지고 올건지 
			dataType:'json',
			type:'post',
			success:showOneAsk,
			error: function(request, status, error){
				console.log('error',error, request, status);
			}
			
		});
	};

	
	var showOneAsk = function(data){
		console.log(JSON.stringify(data));
		var oneAskString=''
			 +'<div class="mail-header row">'
			 +'<div class="col-md-8">'
			 +'<h4 class="pull-left"> '+data.title+' </h4></div>'
			 +'<div class="col-md-4">'
			 +'<div class="compose-btn pull-right">'
			 +'<a href="#" class="btn btn-sm btn-theme"><i class="fa fa-reply"></i> Reply</a>'
			 +'</div> </div> </div>'
			 +'<div class="mail-sender">'
			 +'<div class="row">'
			 +'<div class="col-md-8">'
			 +'<img src="img/ui-zac.jpg" alt="">'
			 +'<strong> '+data.name+' </strong>'
			 +'<span> ['+data.id+'] </span>'
			 +'<strong></strong>'
			 +'</div>'
			 +'<div class="col-md-4">'
			 +'<p class="date"> '+data.askdate+' </p>'
			 +'</div>'
			 +'</div></div>'
			 +'<div class="view-mail">'
			 +'<p>'+data.content+'</p>'
			 +'      </div>'
			 +'      <div class="compose-btn pull-left"> </div>';
    
		 $('#ask-content').html(oneAskString);
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
                  	<a href="#" id="user-ask" > <i class="fa fa-inbox"></i> 사용자 문의 게시판  
                  	<span class="label label-theme pull-right inbox-notification new-u-num">${uWatiedNumber}</span></a>
                  </li>
                  <li class="partner-ask ">
                  	<a href="#" id="partner-ask" > <i class="fa fa-envelope-o"></i> 기업 문의 게시판 
                  	<span class="label label-theme pull-right inbox-notification new-p-num">${pWatiedNumber}</span></a>
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
         
          
          <div class="col-sm-9 s">
            <section class="panel">
              <header class="panel-heading wht-bg asklist-head">
                
              </header>
             <div class="panel-body minimal " id="ask-content">
	              <table class="table table-inbox table-hover">
	              	<tr>
	              		<td>No.</td>
	              		<td>제목</td>
	              		<td>작성자</td>
	              		<td>작성일</td>
	              	</tr>
	              	<c:if test="${empty noticeList}" var="isEmpty">
	              	<tr>
	              		<td colspan="4">
	              		등록된 공지사항이 없습니다
	              		</td>
	              	</tr>
	              	</c:if>
	              	<c:if test="${not isEmpty }">
	              	<c:forEach var="list" items="${noticeList}" varStatus="loop">
	              		<tr>
	              			<td>${list.NO}</td>
	              			<td>${list.TITLE}</td>
	              			<td>${list.NAME}</td>
	              			<td>${list.POSTDATE}</td>
	              			
	              		</tr>
	              	</c:forEach>
	              	</c:if>
	              </table>
					
                
             <!--  -->
              </div>
            </section>
          </div>
        </div>
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
