<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
	*************************************
			일반 사용자 관리 화면
	***********************************	
 -->
<!-- <script> -->
// //전체 체크/해제
// $(function(){ 
// 	  $("#allCheck").click(function(){
// 		   if($("#allCheck").prop("checked")) { 
// 			    $("input[type=checkbox]").prop("checked",true); 
// 			    } 
// 		   else { 
// 			    $("input[type=checkbox]").prop("checked",false); 
// 			    } 
// 		   }) 
// 	  }) 
<!-- </script> -->
 
 
 <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
      <h3> 일반 사용자 즐겨찾기 관리 </h3>
      	<!-- INPUT MESSAGES -->
      	<!-- 결과 를 뿌려주는 곳  -->
        <h3><i class="fa fa-angle-right"></i> 결과 </h3>
        <!-- SORTABLE TO DO LIST -->
         <div class="row mt">
          <div class="col-md-12">
            <div class="content-panel">
              <table class="table table-striped table-advance table-hover">
                <thead>
                  <tr >
<!--                   	<th> -->
<!-- 					<input type="checkbox" class="list-child" id="allCheck" /> -->
<!-- 					</th> -->
                    <th class="col-sm-2" style="text-align: center"><i class="fa fa-star"></i> ID</th>
                    <th class="col-sm-2" style="text-align: center"><i class="fa fa-star-o"></i> Name</th>
                    <th><i calss="fa fa-map"></i>즐겨찾기 목록</th>                    
                  </tr>
                </thead>
                <tbody>
                <c:if test="${empty list}" var="isEmpty">
					<tr>
						<td colspan="30" style="text-align: center; font-size: large; font-weight: bold;">결과가 없습니다</td>
					</tr>
				</c:if>
                <c:if test="${not isEmpty}">
					<c:forEach var="record" items="${list}">
	                  <tr>
<!-- 	                 	 <td><input type="checkbox" class="list-child" name="chklst" value="" /></td> -->
 	                    <td class="col-sm-2" style="text-align: center"> ${record.id}</td>
	                    <td class="col-sm-2" style="text-align: center">${record.name}</td>
	                    <td>${record.title}</td>
	                  </tr>
                  	</c:forEach>
				</c:if>
                </tbody>
              </table>
          
            </div>
            <!-- /content-panel -->
             		
          </div>
          <!-- /col-md-12 -->
            
        </div>
        <!-- /row -->
                <div class="row">
               ${pagingString}
                </div>
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
 