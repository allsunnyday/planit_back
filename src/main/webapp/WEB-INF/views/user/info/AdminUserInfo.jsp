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
	              <label class="col-sm-2 col-sm-2 control-label">여행 횟수</label>
	              <label class="checkbox-inline ">
	                <input type="checkbox" name="optionsRadios" id="inlineCheckbox1" value="option1"> 1회 미만
	                </label>
	              <label class="checkbox-inline">
	                <input type="checkbox" name="optionsRadios" id="inlineCheckbox2" value="option2"> 5회 이하
	                </label>
	              <label class="checkbox-inline">
	                <input type="checkbox" name="optionsRadios" id="inlineCheckbox3" value="option3"> 10회 이하
	                </label>
	              <label class="checkbox-inline">
	                <input type="checkbox" name="optionsRadios" id="inlineCheckbox4" value="option4"> 15회 이하
	                </label>
	              <label class="checkbox-inline">
	                <input type="checkbox" name="optionsRadios" id="inlineCheckbox4" value="option5"> 20회 이하
	                </label>
                <hr>
                	 <label class="col-sm-2 col-sm-2 control-label">플래너 갯수</label>
	              <label class="checkbox-inline ">
	                <input type="checkbox" name="optionsRadios2" id="inlineCheckbox1" value="option1"> 1회 미만
	                </label>
	              <label class="checkbox-inline">
	                <input type="checkbox" name="optionsRadios2" id="inlineCheckbox2" value="option2"> 5회 이하
	                </label>
	              <label class="checkbox-inline">
	                <input type="checkbox" name="optionsRadios2" id="inlineCheckbox3" value="option3"> 10회 이상
	                </label>
              <hr>
              <!--  
              	사용자 활동지수
              	여성 , 남성
              	나이대 
              	등등 
              	추가하기 
              -->
              <br>
            </div>
            <!-- /form-panel -->
          </div>
          <!-- /col-lg-12 -->
      	</div>
      	<!-- 결과 를 뿌려주는 곳  -->
        <h3><i class="fa fa-angle-right"></i> 결과 </h3>
        <!-- SORTABLE TO DO LIST -->
       <!--  <div class="row mt mb">
          <div class="col-md-12">
            <section class="task-panel tasks-widget">
              <div class="panel-heading">
                <div class="pull-left">
                  <h5><i class="fa fa-tasks"></i> 사용자 </h5>
                </div>
                <br>
              </div>
              
              <div class="panel-body">
                <div class="task-content">
                  <ul id="sortable" class="task-list">
                    <li class="list-primary">
                      <i class=" fa fa-ellipsis-v"></i>
                      <div class="task-checkbox">
                        <input type="checkbox" class="list-child" value="" />
                      </div>
                      <div class="task-title">
                        <span class="task-title-sp">정현선</span>
                        <span class="badge bg-theme">관리자</span>
                        <div class="pull-right hidden-phone">
                          <button class="btn btn-primary btn-xs fa fa-pencil" title="edit"></button>
                          <button class="btn btn-success btn-xs fa fa-check" title="profile"></button>
                          <button class="btn btn-danger btn-xs fa fa-trash-o" title="delete"></button>
                        </div>
                      </div>
                    </li>
                    
                  </ul>
                </div>
                <div class=" add-task-row">
                  <a class="btn btn-success btn-sm pull-left" href="#">Add..</a>
                  <a class="btn btn-default btn-sm pull-right" href="l#">전체보기</a>
                </div>
              </div>
            </section>
          </div>
          /col-md-12
        </div> -->
        <div class="row mt">
          <div class="col-md-12">
            <div class="content-panel">
              <table class="table table-striped table-advance table-hover">
                <thead>
                  <tr>
                    <th><i class="fa fa-bullhorn"></i> ID</th>
                    <th class="hidden-phone"><i class="fa fa-question-circle"></i> Descrition</th>
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
					<c:forEach var="record" items="${list}" varStatus="loop">
	                  <tr>
	                    <td>
	                      <a href="basic_table.html#">${record.id}</a>
	                    </td>
	                    <td class="hidden-phone">${record.name}</td>
	                    <td>
	                      <button class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>
	                      <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>
	                      <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
	                    </td>
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
 