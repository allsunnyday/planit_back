<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
	*************************************
			일반 사용자 관리 화면
	***********************************	
 -->
 
 <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
      <h3><i class="fa fa-angle-right"></i> 일반 사용자 리뷰 관리 </h3>
      	<!-- 결과 를 뿌려주는 곳  -->
        <h3><i class="fa fa-angle-right"></i> 결과 </h3>
        <!-- SORTABLE TO DO LIST -->
        <div class="row mt mb">
          <div class="col-md-12">
            <div class="content-panel">
              <table class="table table-striped table-advance table-hover">
                <thead>
                  <tr>
                  	<th></th>
                    <th><i class="fa fa-star"></i> reviewID</th>
                     <th><i class="fa fa-star"></i> ID</th>
                    <th class="hidden-phone"><i class="fa fa-star-o"></i> Name</th>
                    <th><i calss="fa fa-map"></i>title</th>        
                        <th><i calss="fa fa-map"></i>viewcount</th> 
                        <th><i calss="fa fa-map"></i>postdate</th>         
                  </tr>
                </thead>
                <tbody>
                <c:if test="${empty list}" var="isEmpty">
					<tr>
						<td colspan="3" style="text-align: center; font-size: large; font-weight: bold;">결과가 없습니다</td>
					</tr>
				</c:if>
                <c:if test="${not isEmpty}">
				<form action="/Planit/Admin/AdminUserDelete.do" id="checklist">
					<c:forEach var="record" items="${list}" varStatus="loop">
	                  <tr>
	                 	 <td><input type="checkbox" class="list-child" name="chklst" value="${record.review_id}" /></td>
	                 	 
	                    <td>
	                      <a href="#"  style="text-align: center;">${record.review_id}</a>
	                    </td>
	                    <td class="hidden-phone" >${record.id}</td>
	                    <td class="hidden-phone" >${record.name}</td>
	                    <td class="hidden-phone" >${record.title}</td>
	                    <td class="hidden-phone" >${record.view_count}</td>
	                    <td class="hidden-phone" >${record.postdate}</td>
	                  </tr>
                  	</c:forEach>
				</form>
				</c:if>
                </tbody>
              </table>
          		 <div class="row">
					<div class="col-md-12">${pagingString}</div>
				</div>
            </div>
          </div>
          <!--/col-md-12 -->
        </div>
        <!-- /row -->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
 