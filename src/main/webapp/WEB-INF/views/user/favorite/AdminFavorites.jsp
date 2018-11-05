<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
	*************************************
			일반 사용자 관리 화면
	***********************************	
 -->
<script>
//전체 체크/해제
$(function(){ 
	  $("#allCheck").click(function(){
		   if($("#allCheck").prop("checked")) { 
			    $("input[type=checkbox]").prop("checked",true); 
			    } 
		   else { 
			    $("input[type=checkbox]").prop("checked",false); 
			    } 
		   }) 
	  }) 
</script>
 
 
 <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
      <h3><i class="fa fa-angle-right"></i> 일반 사용자 즐겨찾기 관리 </h3>
      	<!-- INPUT MESSAGES -->
      	<!-- 결과 를 뿌려주는 곳  -->
        <h3><i class="fa fa-angle-right"></i> 결과 </h3>
        <!-- SORTABLE TO DO LIST -->
         <div class="row mt">
          <div class="col-md-12">
            <div class="content-panel">
              <table class="table table-striped table-advance table-hover">
                <thead>
                  <tr>
                  	<th>
					<input type="checkbox" class="list-child" id="allCheck" />
					</th>
                    <th><i class="fa fa-star"></i> ID</th>
                    <th class="hidden-phone"><i class="fa fa-star-o"></i> Name</th>
                    <th><i calss="fa fa-map"></i>즐겨찾기 목록</th>                    
                  </tr>
                </thead>
                <tbody>
                <c:if test="${empty list}" var="isEmpty">
					<tr>
						<td colspan="3" style="text-align: center; font-size: large; font-weight: bold;">결과가 없습니다</td>
					</tr>
				</c:if>
                <c:if test="${not isEmpty}">
					<c:forEach var="record" items="${list}">
	                  <tr>
	                 	 <td><input type="checkbox" class="list-child" name="chklst" value="" /></td>
	                    <td>
	                      <a href="#"  style="text-align: center;">${record.id}</a>
	                    </td>
	                    <td class="hidden-phone" >${record.name}</td>
	                    <td class="hidden-phone" >${record.title}</td>
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
                <div class="col-md-11">${pagingString}</div>
                </div>
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
 