<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
<style>
#dddd{
    border: 1px solid #4195fc; /* some kind of blue border */
    /* other CSS styles */
    /* round the corners */
    -webkit-border-radius: 20px;
       -moz-border-radius: 20px;
            border-radius: 20px;
    /* make it glow! */
    -webkit-box-shadow: 0px 0px 30px #4195fc;
       -moz-box-shadow: 0px 0px 30px #4195fc;
            box-shadow: 0px 0px 30px #4195fc; /* some variation of blue for the shadow */
}
#ddddd{
    border: 1px solid #4195fc; /* some kind of blue border */
    /* other CSS styles */
    /* round the corners */
    -webkit-border-radius: 20px;
       -moz-border-radius: 20px;
            border-radius: 20px;
    /* make it glow! */
    -webkit-box-shadow: 0px 0px 10px #408efc;
       -moz-box-shadow: 0px 0px 10px #408efc;
            box-shadow: 0px 0px 10px #408efc; /* some variation of blue for the shadow */
}

</style>
<!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <div class="row">
          <div class="col-lg-12 main-chart">
            <!--CUSTOM CHART START -->
            <div class="border-head">
              <h3>PLANIT 이용자수 >> <span style="color:red; font-size:2em;">${memberCount }</span> 명</h3>
            </div>
            <ul>
            	<li>
<%--             	<span style="color:red; font-size:2em; font-style:oblique;"> 총 가입자 :&nbsp;${memberCount}명</span> --%>
            	</li>
            </ul>
            <div class="col-md-4col-sm-4 custom-bar-chart" >
                <ul class="y-axis">
                <li><span>100</span></li>
                <li><span>80</span></li>
                <li><span>60</span></li>
                <li><span>40</span></li>
                <li><span>20</span></li>
                <li><span>0</span></li>
               
              </ul>
              
              
              <div class="bar">
                <div class="title" style="font-size:1em;" >MAN</div>
                <div  class="value tooltips" data-original-title="${male }" data-toggle="tooltip" data-placement="top">${male }%</div>
              </div>
              <div class="bar">
                <div class="title" style="font-size:1em">WOMAN</div>
                <div class="value tooltips" data-original-title="${female }" data-toggle="tooltip" data-placement="top">${female }%</div>
              </div>
             
               <div class="col-sm-4 col-xs-2">
                     <div  id="dddd"class="weather pn">
                  <a href="<c:url value='/Planit/Admin/AdminPlan.do'/>">
                  <i class="fa fa-pencil-square-o fa-4x"></i>
                  <h2>planner</h2>
                  <h4>총 ${plannerCount}개 </h4>
                  </a>
                </div>
               </div>

               <div class="col-sm-4 col-xs-2">
                 <div id="dddd"class="weather pn">
                  	<a href="<c:url value='/Planit/Admin/BBS/NoticeList.do'/>">
                  	<i class="fa fa-question-circle fa-4x"></i>
                		  <h2>문의 요청</h2>
                 		 	<h4>총${noticeCount}개</h4>
               		 	</a>
	                </div>
	              </div>
	            </div>
             
            <!--custom chart end-->
<!--             <div class="row mt"> -->
<!--               SERVER STATUS PANELS -->
<!--               <div class="col-md-3 col-sm-3 mb"> -->
<!--                 <div class="grey-panel pn donut-chart"> -->
<!--                   <div class="grey-header"> -->
<!--                     <h5>나이별</h5> -->
<!--                   </div> -->
<%--                   <canvas id="serverstatus01" height="120" width="120"></canvas> --%>
<!--                   <script> -->
<!--                      var doughnutData = [{ -->
<!--                          value: 40, -->
<!--                        color: "#FF6B6B" -->
<!-- //                       }, -->
<!-- //                       { -->
<!-- //                         value: 20, -->
<!-- //                         color: "#ff7e6a" -->
<!-- //                       }, -->
<!-- //                       { -->
<!-- //                       value: 30, -->
<!-- //                       color: "#7da5a3" -->
<!-- //                     }, -->
<!-- //                     { -->
<!-- //                       value: 10, -->
<!-- //                       color: "#4a094c" -->
<!-- //                     } -->
<!-- //                     ]; -->
<!-- //                     var myDoughnut = new Chart(document.getElementById("serverstatus01").getContext("2d")).Doughnut(doughnutData); -->
<!--                   </script> -->
<!--                   <div class="row"> -->
<!--                     <div class="col-sm-6 col-xs-6 goleft"> -->
<!--                       <p>Usage<br/>Increase:</p> -->
<!--                     </div> -->
<!--                     <div class="col-sm-6 col-xs-6"> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--                 /grey-panel -->
<!--               </div> -->
<!--               /col-md-4 -->
<!--               <div class="col-md-3 col-sm-3 mb"> -->
<!--                 <div class="darkblue-panel pn"> -->
<!--                   <div class="darkblue-header"> -->
<!--                   </div> -->
<%--                   <canvas id="serverstatus02" height="120" width="120"></canvas> --%>
<!--                   <script> -->
<!-- //                     var doughnutData = [{ -->
<!-- //                         value: 60, -->
<!-- //                         color: "#1c9ca7" -->
<!-- //                       }, -->
<!-- //                       { -->
<!-- //                         value: 40, -->
<!-- //                         color: "#f68275" -->
<!-- //                       } -->
<!-- //                     ]; -->
<!-- //                     var myDoughnut = new Chart(document.getElementById("serverstatus02").getContext("2d")).Doughnut(doughnutData); -->
<!--                   </script> -->
<!--                   <p>April 17, 2014</p> -->
<!-- <!--                   <footer> --> 
<!-- <!--                     <div class="pull-left"> --> 
<!-- <!--                       <h5><i class="fa fa-hdd-o"></i> 17 GB</h5> --> 
<!-- <!--                     </div> -->
<!-- <!--                     <div class="pull-right"> --> 
<!-- <!--                       <h5>60% Used</h5> --> 
<!-- <!--                     </div> --> 
<!-- <!--                   </footer> --> 
<!--                 </div> -->
<!--                  /darkblue panel -->
<!--               </div> -->
<!--               /col-md-4 -->
<!--               <div class="col-md-6 col-sm-6 mb"> -->
<!--                 REVENUE PANEL -->
<!--                 <div id="ddd"class="green-panel pn"> -->
<!--                   <div class="green-header"> -->
<!--                     <h5>????</h5> -->
<!--                   </div> -->
<!--                   <div class="chart mt"> -->
<%-- <%--                   <c:forEach items="${review }" var="record"> --%> 
<!--                     <div class="sparkline" data-type="line" data-resize="true"  -->
<!--                     data-height="75" data-width="90%" data-line-width="1" data-line-color="#fff"  -->
<!--                     data-spot-color="#fff" data-fill-color="" data-highlight-line-color="#fff"  -->
<!--                     data-spot-radius="4" data-data="[0,9,0,8,0,7,16,5,4]"></div> -->
<%-- <%--                     </c:forEach> --%> 
<!--                   </div> -->
<!--                   <p class="mt"><b>? : ?</b><br/>Month Income</p> -->
<!--                 </div> -->
<!--               </div> -->
<!--               /col-md-4 -->
<!--             </div> -->
            <!-- /row -->
            <div class="row">
              <!-- WEATHER PANEL -->
<!--               <div class="col-md-4 mb"> -->
<!--                 <div class="weather pn"> -->
<!--                   <i class="fa fa-cloud fa-4x"></i> -->
<!--                   <h2>11º C</h2> -->
<!--                   <h4>BUDAPEST</h4> -->
<!--                 </div> -->
<!--               </div> -->
              <!-- /col-md-4-->
              <!-- DIRECT MESSAGE PANEL -->
<!--               <div class="col-md-8 mb"> -->
<!--                 <div class="message-p pn"> -->
<!--                   <div class="message-header"> -->
<!--                     <h5>DIRECT MESSAGE</h5> -->
<!--                   </div> -->
<!--                   <div class="row"> -->
<!--                     <div class="col-md-3 centered hidden-sm hidden-xs"> -->
<!--                       <img src="img/ui-danro.jpg" class="img-circle" width="65"> -->
<!--                     </div> -->
<!--                     <div class="col-md-9"> -->
<!--                       <p> -->
<!--                         <name>Dan Rogers</name> -->
<!--                         sent you a message. -->
<!--                       </p> -->
<!--                       <p class="small">3 hours ago</p> -->
<!--                       <p class="message">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p> -->
<!--                       <form class="form-inline" role="form"> -->
<!--                         <div class="form-group"> -->
<!--                           <input type="text" class="form-control" id="exampleInputText" placeholder="Reply Dan"> -->
<!--                         </div> -->
<!--                         <button type="submit" class="btn btn-default">Send</button> -->
<!--                       </form> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--                 /Message Panel -->
<!--               </div> -->
              <!-- /col-md-8  -->
            </div>
            <div class="row">
               <div class="col-lg-4 col-md-4 col-sm-4 mb">
               	 <div  id="ddddd"class="product-panel-2 pn" >
                  	<div class="badge badge-hot">HOT</div>
                  	
                 		<c:forEach var="record" items="${hotTour}">
                  			<img src="${record.firstimage }" width="235" alt=""">
                 			 <h4 class="mt">인기 여행지&nbsp;:&nbsp;${record.title }</h4>
                 			 <h6>TOTAL VIEW: ${record.viewcount}</h6>
                  			</c:forEach>
<!--                   		<button class="btn btn-small btn-theme04">FULL REPORT</button> -->
                	</div>
                </div>
            <div class="col-lg-4 col-md-4 col-sm-4 mb">
                <div  id="ddddd"class="product-panel-2 pn">
                  <div class="badge badge-hot">HOT</div>
                 	 <img src="data:image/png;base64,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" width="235" alt="">
                 		
                  			<h4 class="mt">가장 많이 이용하는 유저&nbsp;:&nbsp;${hotPlanner}</h4>
                  			<c:forEach var="record" items="${hotPlanner}">
                 			 <h6>TOTAL VIEW&nbsp;:&nbsp; ${record.liked}</h6>
                  		 </c:forEach>
<!--                  			 <button class="btn btn-small btn-theme04">FULL REPORT</button> -->
               		 </div>
                </div>
                
                <div class="col-lg-4 col-md-4 col-sm-4 mb">
                	<div  id="ddddd"class="product-panel-2 pn">
                 		 <div class="badge badge-hot">HOT</div>
                  	<c:forEach var="record" items="${hotReview}">
                  			<img src="data:image/jpeg;base64,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" width="185" alt="">
                 					 <h4 class="mt">인기 리뷰&nbsp;:&nbsp;${record.title }</h4>
                  					<h6>TOTAL like&nbsp;:&nbsp;${record.liked } </h6>
                  				 </c:forEach>
<!--                   			<button class="btn btn-small btn-theme04">FULL REPORT</button> -->
                	</div>
             	 </div>
              
              <!-- /col-md-4 -->
<!--               <div class="col-md-3 mb"> -->
<!--                 WHITE PANEL - TOP USER -->
<!--                 <div class="white-panel pn"> -->
<!--                   <div class="white-header"> -->
<!--                     <h5>가장많은 좋아요를 받은 USER</h5> -->
<!--                   </div> -->
<!--                   <p><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfZD4kj1BLbrzo1NyHPmWzfjcAq6BMVgzYsydmxs33UKs-XI2V" class="img-circle" width="50"></p> -->
<!--                   <p><b>Zac Snider</b></p> -->
<!--                   <div class="row"> -->
<!--                     <div class="col-md-6"> -->
<!--                       <p class="small mt" style="color: black">가입일자</p> -->
<!--                       <p>2012-07-07</p> -->
<!--                     </div> -->
<!--                     <div class="col-md-6"> -->
<!--                       <p class="small mt" style="color: black">TOTAL 좋아요 수</p> -->
<!--                       <p>454,684,654</p> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--               /col-md-4 -->
<!--               <div class="col-md-3 col-sm-4 custom-bar-chart" > -->
<!--               <ul class="y-axis"> -->
<!--                 <li><span>9</span></li> -->
<!--                 <li><span>7</span></li> -->
<!--                 <li><span>5</span></li> -->
<!--                 <li><span>3</span></li> -->
<!--                 <li><span>1</span></li> -->
<!--                 <li><span>0</span></li> -->
<!--               </ul> -->
              
              
<!--               <div class="bar"> -->
<!--                 <div class="title" style="font-size:1em;" >MAN</div> -->
<%--                 <div id="man" class="value tooltips" data-original-title="M" data-toggle="tooltip" data-placement="top">${gender}</div> --%>
<!--               </div> -->
<!--               <div class="bar"> -->
<!--                 <div class="title" style="font-size:1em">WOMAN</div> -->
<!--                 <div class="value tooltips" data-original-title="W" data-toggle="tooltip" data-placement="top">50%</div> -->
<!--               </div> -->
<!--               <div class="bar"> -->
<!--                 <div class="title" style="font-size:1em;" >MAN</div> -->
<%--                 <div id="man" class="value tooltips" data-original-title="M" data-toggle="tooltip" data-placement="top">${gender}</div> --%>
<!--               </div> -->
<!--               <div class="bar"> -->
<!--                 <div class="title" style="font-size:1em">WOMAN</div> -->
<!--                 <div class="value tooltips" data-original-title="W" data-toggle="tooltip" data-placement="top">50%</div> -->
<!--               </div> -->
<!--               <div class="bar"> -->
<!--                 <div class="title" style="font-size:1em;" >MAN</div> -->
<%--                 <div id="man" class="value tooltips" data-original-title="M" data-toggle="tooltip" data-placement="top">${gender}</div> --%>
<!--               </div> -->
<!--               <div class="bar"> -->
<!--                 <div class="title" style="font-size:1em">WOMAN</div> -->
<!--                 <div class="value tooltips" data-original-title="W" data-toggle="tooltip" data-placement="top">50%</div> -->
<!--               </div> -->
<!--               /col-md-4 -->
<!--             </div> -->
<!--             </div> -->
<!--             /row -->
<!--             <div class="row" > -->
            
<!--               / col-md-4 -->
<!--               <div class="col-md-4 col-sm-4 mb"> -->
<!--                 <div class="green-panel pn"> -->
<!--                   <div class="green-header"> -->
<!--                     <h5>DISK SPACE</h5> -->
<!--                   </div> -->
<%--                   <canvas id="serverstatus03" height="120" width="120"></canvas> --%>
<!--                   <script> -->
<!-- //                     var doughnutData = [{ -->
<!-- //                         value: 60, -->
<!-- //                         color: "#2b2b2b" -->
<!-- //                       }, -->
<!-- //                       { -->
<!-- //                         value: 40, -->
<!-- //                         color: "#fffffd" -->
<!-- //                       } -->
<!-- //                     ]; -->
<!-- //                     var myDoughnut = new Chart(document.getElementById("serverstatus03").getContext("2d")).Doughnut(doughnutData); -->
<!--                   </script> -->
<!--                   <h3>60% USED</h3> -->
<!--                 </div> -->
<!--               </div> -->
              <!-- /col-md-4 -->
            </div>
            <!-- /row -->
          </div>
          <!-- /col-lg-9 END SECTION MIDDLE -->
         
        </div>
        		<div id="chart_div" ></div>
				<div id="chart_div1" style="width:100%;height:700px"></div>
				
      </section>
    </section>

   
    <!--******************** 구글차트 ************************88-->
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
    <script>
      google.load('visualization', '1.0', {'packages':['corechart']});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['서울', ${seoul}],
          ['경기도',${gyeonggi}],
          ['인천',${incheon}],
          ['강원도',${gangwon}],
          ['경상도',${gyeongsang}],
          ['전라도',${jeolla}],
          ['제주도', ${jeju}],
          ['충청도', ${chungcheong}]
        ]);
        var options = {'title':'PLANIT 사용자들이 다니는 관광지 비율(planner로 직접 다닌)',
                       'width':2500,
                       'height':400,
                       'backgroundColor':'#EAEAEA'};
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
   //*******************************숙박업체 등록현황***********************************************************/////
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        var data = google.visualization.arrayToDataTable([
         ['Month', '아주 좋은 방', '스탠다드 베이직', '아주 아주 좋은 방', '좋은 방'],
         ['2018/09',  165,      938,         522,             998    ],
         ['2018/10',  135,      1120,        599,             1268   ],
         ['2018/11',  157,      1167,        587,             807    ],
         ['2018/12',  139,      1110,        615,             968    ],
      ]);

    var options = {
      title : '파트너 숙소 등록 업체 ',
      vAxis: {title: '등록 현황'},
      hAxis: {title: '숙박업소 등록일'},
      seriesType: 'bars',
      series: {5: {type: 'line'}},
      backgroundColor:"#EAEAEA"
    };

    var chart = new google.visualization.ComboChart(document.getElementById('chart_div1'));
    chart.draw(data, options);
  }

</script>