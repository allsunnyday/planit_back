<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	
	$(function(){
		console.log('refresh');
		
		$('#user-ask').click(function(){
			showUserAskBbs();
		});
		
		$('#partner-ask').click(function(){
			showPartnerAskBbs();
		});
	});
	
	var showUserAskBbs= function(){
		//사용자의 리스트를 불러온다.
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
		if(data.length==0){
			listString+='<tr><td colspan="6">등록된 문의가 없습니다.</td></tr>';
	      }
	      else{
	    	  
	    	  $.each(data, function(index, content){
	    		  if(content['userAskNum']==null){
		    		  listString+='<tr>'
		    			+'<tr class="">'
		    			+' <td class="inbox-small-cells">'
		    			+' 		<input type="checkbox" class="mail-checkbox">'
		    			+'</td>'
		    			+'<td class="inbox-small-cells"><i class="fa fa-star inbox-started"></i></td>'
		    			+'<td class="view-message dont-show"><a href="#">'
		    			+content['NAME']+'<span class="label label-danger pull-right">urgent</span></a></td>'
		    			+'<td class="view-message"><a href="<c:url value=\'/Planit/Admin/BBS/AskView.do?ask_no='+content['ASK_NO']+'\' />  " > '+content['TITLE']+'</a></td>'
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
	    $('#ask-list').html(listString);
	     
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
         </div>