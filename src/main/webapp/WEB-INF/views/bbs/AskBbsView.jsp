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
        
          
          <!--  -->
           <div class="col-sm-9">
            <section class="panel">
              <header class="panel-heading wht-bg">
                <h4 class="gen-case">
                    View Message
                    <form action="#" class="pull-right mail-src-position">
                      <div class="input-append">
                        <input type="text" class="form-control " placeholder="Search Mail">
                      </div>
                    </form>
                  </h4>
              </header>
              <div class="panel-body ">
                <div class="mail-header row">
                  <div class="col-md-8">
                    <h4 class="pull-left"> Dashio, New Admin Dashboard & Front-end </h4>
                  </div>
                  <div class="col-md-4">
                    <div class="compose-btn pull-right">
                      <a href="mail_compose.html" class="btn btn-sm btn-theme"><i class="fa fa-reply"></i> Reply</a>
                      <button class="btn  btn-sm tooltips" data-original-title="Print" type="button" data-toggle="tooltip" data-placement="top" title=""><i class="fa fa-print"></i> </button>
                      <button class="btn btn-sm tooltips" data-original-title="Trash" data-toggle="tooltip" data-placement="top" title=""><i class="fa fa-trash-o"></i></button>
                    </div>
                  </div>
                </div>
                
                <div class="mail-sender">
                  <div class="row">
                    <div class="col-md-8">
                      <img src="img/ui-zac.jpg" alt="사용자이미지">
                      <strong>Zac Doe</strong>
                      <span>[zac@youremail.com]</span> to
                      <strong>me</strong>
                    </div>
                    <div class="col-md-4">
                      <p class="date"> 10:15AM 02 FEB 2014</p>
                    </div>
                  </div>
                </div>
                <div class="view-mail">
                  <p>As he bent his head in his most courtly manner, there was a secrecy in his smiling face, and he conveyed an air of mystery to those words, which struck the eyes and ears of his nephew forcibly. At the same time, the thin straight lines
                    of the setting of the eyes, and the thin straight lips, and the markings in the nose, curved with a sarcasm that looked handsomely diabolic. </p>
                  <p>"Yes," repeated the Marquis. "A Doctor with a daughter. Yes. So commences the new philosophy! You are fatigued. Good night!"</p>
                  <p>It would have been of as much avail to interrogate any stone face outside the chateau as to interrogate that face of his. The nephew looked at him, in vain, in passing on to the door. </p>
                  <p>"Good night!" said the uncle. "I look to the pleasure of seeing you again in the morning. Good repose! Light Monsieur my nephew to his chamber there!--And burn Monsieur my nephew in his bed, if you will," he added to himself, before
                    he rang his little bell again, and summoned his valet to his own bedroom.</p>
                </div>
                
                <div class="compose-btn pull-left">
                  <a href="mail_compose.html" class="btn btn-sm btn-theme"><i class="fa fa-reply"></i> Reply</a>
                  <button class="btn btn-sm "><i class="fa fa-arrow-right"></i> Forward</button>
                  <button class="btn  btn-sm tooltips" data-original-title="Print" type="button" data-toggle="tooltip" data-placement="top" title=""><i class="fa fa-print"></i> </button>
                  <button class="btn btn-sm tooltips" data-original-title="Trash" data-toggle="tooltip" data-placement="top" title=""><i class="fa fa-trash-o"></i></button>
                </div>
              </div>
            </section>
          </div>
          
          
          <!--  -->
        </div>
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
