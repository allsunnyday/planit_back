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
        <h3><i class="fa fa-angle-right"></i> 결과 </h3>
        <!-- SORTABLE TO DO LIST -->
       <div class="row mt">
          <div class="col-md-12">
            <div class="content-panel">
              <table class="table table-striped table-advance table-hover">
                <thead>
                  <tr>
                  	<th></th>
                    <th><i class="fa fa-bullhorn"></i> Partner_ID </th>
                    <th><i class="fa fa-bullhorn"></i> Client_ID</th>
                    <th><i class="fa fa-bullhorn"></i> Reservation_ID</th>
                    <th class="hidden-phone"><i class="fa fa-question-circle"></i> RoomTitle</th>
                    <th class="hidden-phone"><i class="fa fa-question-circle"></i> Status</th>
                    <th class="hidden-phone"><i class="fa fa-question-circle"></i> Bookdate</th>
                    <th></th>
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
	                 	<td><input type="checkbox" class="list-child" name="chklst" value="${record.p_id}" /></td>
	                    <td class="hidden-phone" >${record.p_id}</td>
	                    <td> <a href="#"  style="text-align: center;">${record.reservation_id}</a></td>
	                    <td class="hidden-phone" >${record.reservation_id}</td>
	                    <td class="hidden-phone" >${record.roomtitle}</td>
	                    <td class="hidden-phone" >${record.status}</td>
	                    <td class="hidden-phone" >${record.bookdate}</td>
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
      		   <div class=" add-task-row">
                  <a class="btn btn-success btn-sm pull-left" href="#">Add..</a>
                  <a class="btn btn-default btn-sm pull-right" href="l#">전체보기</a>
                </div>
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
 