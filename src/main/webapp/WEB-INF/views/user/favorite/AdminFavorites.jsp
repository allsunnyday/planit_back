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
      <h3><i class="fa fa-angle-right"></i> 일반 사용자 관리 </h3>
      	<!-- INPUT MESSAGES -->
        <div class="row mt">
          <div class="col-lg-12">
            <div class="form-panel">
              <h4 class="mb"><i class="fa fa-angle-right"></i> 검 색</h4>
             
                <hr>
                	 <label class="col-sm-2 col-sm-2 control-label">즐겨찾기 갯수</label>
	              <label class="checkbox-inline ">
	                <input type="checkbox" name="optionsRadios2" id="inlineCheckbox1" value="option1"> 1개 미만
	                </label>
	              <label class="checkbox-inline">
	                <input type="checkbox" name="optionsRadios2" id="inlineCheckbox2" value="option2"> 5개 이하
	                </label>
	              <label class="checkbox-inline">
	                <input type="checkbox" name="optionsRadios2" id="inlineCheckbox3" value="option3"> 10개 이상
	                </label>
              <hr>
              <br>
            </div>
            <!-- /form-panel -->
          </div>
          <!-- /col-lg-12 -->
      	</div>
      	<!-- 결과 를 뿌려주는 곳  -->
        <h3><i class="fa fa-angle-right"></i> 결과 </h3>
        <!-- SORTABLE TO DO LIST -->
         <div class="row mt">
          <div class="col-md-12">
            <div class="content-panel">
              <table class="table table-striped table-advance table-hover">
                <thead>
                  <tr>
                  	<th></th>
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
				<form action="/Planit/Admin/AdminUserDelete.do" id="checklist">
					<c:forEach var="record" items="${list}" varStatus="loop">
	                  <tr>
	                 	 <td><input type="checkbox" class="list-child" name="chklst" value="${record.id}" /></td>
	                    <td>
	                      <a href="#"  style="text-align: center;">${record.id}</a>
	                    </td>
	                    <td class="hidden-phone" >${record.name}</td>
	                    <td class="hidden-phone" >${record.title}</td>
	                  </tr>
                  	</c:forEach>
				</form>
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
                <div class="row">
                <div class="col-md-11">${pagingString}</div>
                </div>
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
 