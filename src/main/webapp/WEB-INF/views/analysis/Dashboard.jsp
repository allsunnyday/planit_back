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
    -webkit-box-shadow: 0px 0px 4px #4195fc;
       -moz-box-shadow: 0px 0px 4px #4195fc;
            box-shadow: 0px 0px 4px #4195fc; /* some variation of blue for the shadow */
}
</style>
<!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <div class="row">
          <div class="col-lg-12 main-chart">
            <!--CUSTOM CHART START -->
            <div class="border-head">
              <h3>PLANIT </h3>
            </div>
            <ul>
            	<li>총 가입자 :&nbsp;${memberCount}명</li>
            </ul>
            <div class="col-md-4col-sm-4 custom-bar-chart" >
              <ul class="y-axis">
                <li><span>9</span></li>
                <li><span>7</span></li>
                <li><span>5</span></li>
                <li><span>3</span></li>
                <li><span>1</span></li>
                <li><span>0</span></li>
              </ul>
              
              
              <div class="bar">
                <div class="title" style="font-size:1em;" >MAN</div>
                <div id="man" class="value tooltips" data-original-title="M" data-toggle="tooltip" data-placement="top">${gender}</div>
              </div>
              <div class="bar">
                <div class="title" style="font-size:1em">WOMAN</div>
                <div class="value tooltips" data-original-title="W" data-toggle="tooltip" data-placement="top">50%</div>
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
                  	<i class="fa fa-question-circle fa-4x"></i>
                		  <h2>문의 갯수</h2>
                 		 	<h4>총${noticeCount}개</h4>
	                </div>
	              </div>
	            </div>
             
            <!--custom chart end-->
            <div class="row mt">
              <!-- SERVER STATUS PANELS -->
              <div  class="col-md-6 col-sm-6 mb">
                <div class="grey-panel pn donut-chart">
                  <div class="grey-header">
                    <h5>ㅇㅇㅇ</h5>
                  </div>
                  <canvas id="serverstatus01" height="120" width="120"></canvas>
                  <script>
                    var doughnutData = [{
                        value: 70,
                        color: "#FF6B6B"
                      },
                      {
                        value: 30,
                        color: "#fdfdfd"
                      }
                    ];
                    var myDoughnut = new Chart(document.getElementById("serverstatus01").getContext("2d")).Doughnut(doughnutData);
                  </script>
                  <div class="row">
                    <div class="col-sm-6 col-xs-6 goleft">
                      <p>Usage<br/>Increase:</p>
                    </div>
                    <div class="col-sm-6 col-xs-6">
                      <h2>21%</h2>
                    </div>
                  </div>
                </div>
                <!-- /grey-panel -->
              </div>
              <!-- /col-md-4-->
              <!-- /col-md-4 -->
              <div class="col-md-6 col-sm-6 mb">
                <!-- REVENUE PANEL -->
                <div id="ddd"class="green-panel pn">
                  <div class="green-header">
                    <h5>리뷰 조회</h5>
                  </div>
                  <div class="chart mt">
<%--                   <c:forEach items="${review }" var="record"> --%>
                    <div class="sparkline" data-type="line" data-resize="true" 
                    data-height="75" data-width="90%" data-line-width="1" data-line-color="#fff" 
                    data-spot-color="#fff" data-fill-color="" data-highlight-line-color="#fff" 
                    data-spot-radius="4" data-data="[0,9,0,8,0,7,16,5,4]"></div>
<%--                     </c:forEach> --%>
                  </div>
                  <p class="mt"><b>인기많은 리뷰 : abc</b><br/>Month Income</p>
                </div>
              </div>
              <!-- /col-md-4 -->
            </div>
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
               <div   class="col-lg-4 col-md-4 col-sm-4 mb">
                <div  id="dddd"class="product-panel-2 pn">
                  <div class="badge badge-hot">HOT</div>
                 
                  <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASsAAACpCAMAAABEdevhAAABnlBMVEUAUYZw3vUDtvT///8PnWxnZ/+/zc0AtPQDt/Vz4PUPn2sASn8ATYcAT4UAUYUATIcAufT/ywABaJ5nYv8AtfsAtf8Aot5qY/8AUH3CzMticP4ASH1qaP8AuvMDr+wAR4Bn2vVhZfYyu+sOmm0AQn1U0fQASYjvyQABdKsEYoG27fm4z9FLudzk+P1JueMLhnVOYNyJvqnSxXYfVJompfcNk3DmyEQMinMGan9Xcvi7w3k6xfU0Wbdcwt4DW4MfXY3Y4+QNkHEHcH2m09sKfnghbZs7irGVg9c+kvlCyfQCjsgKf3jQ3+CPqbcnVqVWfp5qi6aswMWjydR+wt8wgapOdJd4vbBIp8h3lapHXc/N7PwNhr+O5PeQ1vknf5Rty/ervM4bcrgukZkANHhvg6d1cO/tv0eDed5KgfU0m/isk7XbsXKZh8jGpI6Vv6HluVPwyTBQe/gfoOtqu8t5cunetGydircMn40IrssLpqYHr9Nxu/7Vx0Lctli6nLCBsrfBuY67w4har9//2ADGpYOMxNtetJEhhc+w2cjW6+MeK4CqAAANUElEQVR4nO2d+UPbRhaAbQVbsqSRZcvYBlu+nZoASSgQDscYwhFwISUNCUlMN+1uWEKXNFe3abtt0+217X+9c0iyfEB8aNeMme+H0BjHlr++9/Q0Mxq7XAwGg8FgMBgMBoPBYDAYDAajPYBkA/T7aM4xiqQUKmGLShBISr+P6bwSrCQ4GwIXrgb7fUznE2U6HffUE4+nAYusFijTnmaYq5YYrjRNIz+Yq9bg0x92Ffn6xRdQk/briyPmqhkgJdc3IFUcTz/+8ity9eKX28xVE5K8V/IhnuCsO/oaB9Ttrw+ZqyaQKTfEcOWJkD8jrF41AoKCwPEI7nUrV/hJSanPR3k+gK444kp4bc/BE5KDoyji3KV1mdkyXE1gfm5R2xd8hNSGwq4OsavvP0C8ID3DD7hneP4DDq/RjEExzFxhV8OYmRa96KiRoDyf6PeR9h/sKoSZaXGNM8rpJZXjShmBuSKu/v0h4qdWrvg3gau8+sGXIeaKuHowhXhn1PbnuLYHbhNXpZcZXv1+irlqzkHtxwB29YPhCtYrDtUsISHj4n6RKzx2dRXzM8m6w1H04/AwTVzxw9DVcEhI3Brzy35X1OXv9yH3DVvPcKNlvZr4MMMLi294XRTnbn2UFbNrF1YWyUHUMuAcjEQ0DV3emD9rtV0fGhJFcQj+uSb3+6D7BHZFhtdfa6Ovnm0eH89gjo83ny144lzmHewZ3k3w0JXJ0gUtWjVXsIBzqoqkqaqKH4RX1SGztnM1V+L8RXeFTBW38vlUCl8uu1OpfL6oq+hxjM3V2IV2BcNmK5/CV8luC/y3VH5Lx6Gli5asC+pKAlWB54vYk7sl2JcOo+tbUbzIOSi5Kryg592near5Sm2pIdWwJV67eF0DcFU5oZh/nyhDlzuvh3RiSxy7aF1DrJDgi6n2TFm2vptFsrIXSxZwhXm9zZiqpWJe4EloXaQWK1bgha3OTJHYKoYyMLQuUnmXKrye6tgUtoVDayh6UVwBEOaL7q5UodDSQ980Xz9LyZycG7y5MSmYEPJdmsK2tkLhhnEskMRz16WNZJ8+0/8IKcgL3eWfJSsvNMhK7uPa5/NNDI4s4L+cDPJqb6qQLD7hsk3eQ1Xmb/Zz/ft0jiIvfZR9y/WsCkdWwh5ZtRf0rQ9G1fevieKs0GMCmrJsE4bShs3V/kBkIVKVVXknVGFZ4Zjxwsl92y9Kg9DSgzHYQ2b4Xs6AdbK2hIrRIuQmbA+XqO8bgCxfnhPFb0JbDqmCVnShSrzUSvsg5KCs3Lq1lBW/5XXHVEE4IYgLubJkc7VHeVyBsawImeX5lIOqUH1HrqL+9L+snqFEe88gZ/GwU4Z3LgOxmKJQiSnRm/H4oxJ5YV+K9olp+RZWBTPQSVPIDMxC//V4+k4U7ONR6H1AuSqgZJGqLOfYOdCSVeTC6fgjBbbwSdf6xp5CfV2P4rFM8TtnCzsmxamb01FytQNov4cOyJfHiKq3vONhhQKL5xTbm/kxFDqDnvzK/ByZqYKFXXXaFCTFWx0p8C+tzc3Ozs59NA9o693l6NpsdsiY1BPfhhw+CRJ8OmcEFoiuGGtD4JXUmkxVbMGTX22mGFUro7dyssPCPRbp3kE0a3+7FZqWeJM+wTr2tzynug+uTE5OXjlwVBZsG3BDevma/f2oWngElKG6Q/+G5z+9ZDB5xUlZOicUYGCBOlVDQ7P0xFV9WA1lE8XJSzUmnYst3xYnhIELLNHryl+XEuK3n16qx7HQggWLE8rRaIMrmnLw8lydqz8vNTLplKwUx6n/eZRO17vKUlTb7XEl/t5kCuFz6IzIccKwlk6v2E+DQzQteADz1qGLUy1VwTx0RJZPhYE1rSi2AilmlyhSBWVlyWGLQ835Z+WhE6GFulGhAKu7GViieI2yGXwwhhpo8fc/TjVF2oeDg4MrhIOD7hY4FKGrsOQCYA69oZi9tkTZBaGcK7/7488/J8801UJd55GGXaF2FMhja2tr81HKTIHk7nZnliwedxpcyBXHkbeVZZm2wT65/FmXphAd9qnYlTFJQR/Jj71ebw+yVrtwVaVz9kZGqrze5f+TLHQe5KxBLMooew26trXcSRr68G0p1nw9Vci7XovtLnWNdxJYPEeaBgoB9712utI10kEWprArSu/wtQeW6auzPmu7A1donIFeV65k+W6jLe94+8KWvd6R9gsWaa8Ert8fultA8v5Oky2ibHt7+YyknFzehk8aGe+ktuvklrl+f+buAcnybnNw1SfmNvJmAP/beHikM1No+AoHVr8/cS8AOSnff0h8jZxtzWQEehrvrBF1+7aMWzEp3yYLgGSufH93Z2d8fIRwiiH8q/HV1YMuhuFVYytSyl1hYHy5BFXPXL3322+r45C68gVZXUWSur2JIk/CitrzYCNlfJcuxJh4Jnfqdn7jUitXRmUnc4SDAGfeKu+AnXpVRlhxfDhJrSwg+2WAxpPwXxLmrfJOr2ggYcXz6pN7T8s5qsbYTcDl6K1rK9lsdmUNDb1JYWu7CscXM8AXDT15THrY3Rx1sSWD+VnRXB4zq0QVqWJtV1F0NrDgSZBXH9eujcqUrevzz8/aZ+r+cj3t2VStrT2cXK6GFqrxT+oaf7pCC91IYp9x/mv60c3PrbhyMgtRBvKNc/+fUSSrYc3HkDgnRZWybQN7x9aM+lICLzy+1MhymZoF7vJKg6t5eHaKJWqB1fO50AzMlC40BhXhoZyTqJjNkevXx5DlKrbi3mPJSh1ceTxJeNwcU2Zo7Tx9Wv7b+U9GMvtLPIniClmCYdu3qTdZV04fzmlk8rPy+W9P/Uuwt5qdXZmzTQEDjnNA1kH7pkgynv9MNFeZ+5O5nPG/ttaN9iCrU1Ve793yuZdFkJIbE6V9fFZSogWhPrK6KPC+ziY58NjhXTqWbkvrbh8aUdiHPcOd6/HhBlmdb2Ux3oGoZXPQZ5eGa0RQNlz49m+m4+mblXpXXMdbpKy2vZhkebs2QPYxDa5yJevux/j1O9FoucEVpLOtd1ZH2slBuycUVlRcHyrWh/RtoC/laqjunYeWb3zkrHnZ5eVlbyM7dFxKg3VLA7lZu77FsqpWJ7ZWx9GovNc+/WPOALWYMrr7sHz+u1EMKNcCYh8vy4g1BxaUJWy1X+N9qav3PvGeNsVR52nn4zI4/52oSc6KGGPTkpaBhTbLbG8bOp8vVURj9kIGCvvEnBdqEnf37s7u/bKcpOq2S2nPPA+aN7ZLjafCWt3Kv0cXFJVXefPp+Pth9MzVq0/uIXYeQnZ3n95fL7vkZC5JR0tVh7G/hC9l9c4Kd4osmIqnbzCKvsPE2I214R8RwkmILEsA0ddP3APJvZLbnbLd2C4VTnOFc1GFvty+euAL5ItqC1EWwnS0nx/SKUAOKDn7WTsWVk//0BzZEVlHWyJjtraKusrzZ3iC6JuRO4Mw49xI9GacPyOyasZM3v9cdUaLbK5TuaTvTKCqyLOzA6tTBG40ssBxwUGTBVV5PNqm7qQr9VUkElKFQZOFVUFZM21kVrvom5p2LPDcgMkyVHm0o1LIMVXHmrYpLD4YMFmWqq8CH2Qciix1JhJ5xS/e0EMDJasWVYFA4KUzstQZD1bFDX/5ZWgwZKFWFKnC3/r2VSDglCwUVQtQlTA8FSiFoCyeelm5iXUJq3p+BG3F/0lklXqWpcOoWhhevKFCVRPDpYGILMXnXseqAgH01YvaP7CsH2d67LPUY81IQKwqMDUANQtvkrqgeSIngcBJxJT1hRY57qXPEvRnEe2ZpWoiMDWsT2FZ1F48u9CoOxppgLK0kxNNi0eQrF/wV3w+E7oOLTW0AJsFm6oHw/zLRZjW6muaA0shwzIosiLaSeAIhdYJLvOR0ZDQxsVhi6BSjz2R9IxKyjpRxd1YDKFy/4jiMQdjn2Isy3MIs+/Q+vrm+PVY5dTxrLNUJQo3Pa844cEN3kpA9cbiMD4zTlM85BDbN3eyHMU167n1VXnx64oiBcOdhpYgVBRJ+RxeAqpqyFQFo4pHZ8ZImmJVLhAsmrJQzTrSIodHGlGF9iMEsUKiE1uCEManOqmAvmr8TUMCavGbFKcgGt2zy4J5+HfcOhBVLrR1Y/u2sCljKQmSpWZC+AxoqIp40jLNceUCBcGUhVoHz+1A4IWGE9B8hiQVYCa+Vxd8RjgYsw9Hw8jKkAQM4QT0xGmuVgipItSl4cnL0TpVLhRbwUriLF3wd0KiqtRNY2FZ3JsQqVUwAT0e2lXBLKzwdlkRrZaAFkCKBSth7KSVJy5cLccau0wSWZx5BvSk6VflUhoiqzGqDIAEyoVKGMWXHS4RrgYVSWrxL0hkPeCJKuoTkBCzyRrVWqvCAElylYOFarWCqVYLQfTYadctWJZRqwYgAQkwDTNWZDUlYAMA2jF439woiSxUqwYkqhCSrWY5OUGFZMEEjA9CrbKwp6GzstQZz6PpU7OaSuwF3skPJhXuKO9JavqQqokiWu4ysefsAjIwWDFFkFyFn/f3FHoWkPUVEBu8bwdkMBgMBoPBYDAYDAaDwWAwGAwGg8FgMGjjv3it6qle2aqrAAAAAElFTkSuQmCC" width="200" alt="">
                   <c:forEach var="record" items="${hotTour}">
                  <h4 class="mt">인기 여행지&nbsp;:&nbsp;${record.title }</h4>
                  <h6>TOTAL VIEW: ${record.liked_t_id}</h6>
                  </c:forEach>
                  <button class="btn btn-small btn-theme04">FULL REPORT</button>
                </div>
                <div  id="dddd"class="product-panel-2 pn">
                  <div class="badge badge-hot">HOT</div>
                  <img src="data:image/png;base64,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" width="200" alt="">
                   <c:forEach var="record" items="${hotPlanner}">
                  <h4 class="mt">인기 플래너:${record.planner_id }</h4>
                  <h6>TOTAL VIEW: ${record.liked}</h6>
                   </c:forEach>
                  <button class="btn btn-small btn-theme04">FULL REPORT</button>
                </div>
                <div  id="dddd"class="product-panel-2 pn">
                  <div class="badge badge-hot">HOT</div>
                  <img src="data:image/png;base64,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" width="200" alt="">
                  <h4 class="mt">인기 리뷰:</h4>
                  <h6>TOTAL VIEW: </h6>
                  <button class="btn btn-small btn-theme04">FULL REPORT</button>
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
        <!-- /row -->
      </section>
    </section>
    <!--main content end-->
