<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	
	var showUpdateList = function(){
		$.ajax({
			url:"<c:url value='/tourapi/update/UpdateList.do'/> ",
			
			dataType:'json',
			type:'post',
			success:displayList
		});
	};
	
	var displayList = function(data){
		console.log(data);
	};


	$(function(){
		showUpdateList();
	});
		
</script>
<!-- **********************************************************************************************************************************************************
        MAIN CONTENT :: content 관리 > tour api의 내용을 db로 옮겼는지를 확인하는 작업이다. 
*********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
        <h3 style="text-align: center">content 관 리 </h3>
		<!-- /row -->
        <div class="row mt">
          <div class="col-md-12">
            <div class="content-panel">
            <form class="form-inline " id="frm" >
            		<div class="form-group">
	                 <!--  <label class="col-sm-5 control-label"></label> -->
	                  <div class="col-sm-5">
	                    <select class="form-control " id="contenttype" name="contenttype">
		                  <option value="">타입선택</option>
		                  <option value="12">관광지</option>
		                  <option value="14">문화시설</option>
		                  <option value="15">축제공연</option>
		                  <option value="25">여행코스</option>
		                  <option value="28">레포츠</option>
		                  <option value="32">숙박</option>
		                  <option value="38">쇼핑</option>
		                  <option value="39">음식점</option>
		                </select>
	                  </div>
	                </div>
	                
            		 <div class="form-group">
		                 <!--  <label class="col-sm-3 control-label"></label> -->
		                  <div class="col-sm-5">
			                  <select class="form-control" id="areacode" name="areacode">
			                  <option value="">지역선택</option>
			                  <option value="1">서울</option>
			                  <option value="2">인천</option>
			                  <option value="3">대전</option>
			                  <option value="4">대구</option>
			                  <option value="5">광주</option>
			                  <option value="6">부산</option>
			                  <option value="7">울산</option>
			                  <option value="8">세종특별자치시</option>
			                  <option value="31">경기도</option>
			                  <option value="32">강원도</option>
			                  <option value="33">충청북도</option>
			                  <option value="34">충청남도</option>
			                  <option value="35">경상북도</option>
			                  <option value="36">경상남도</option>
			                  <option value="37">전라북도</option>
			                  <option value="38">전라남도</option>
			                  <option value="39">제주도</option>
			                </select>
		                  </div>
		                </div>
		                
						<button type="button" onclick="callTourAPI();" value="submit" class="btn btn-theme"> 조 회 </button>
						
                </form>
              <table class="table table-striped table-advance table-hover">
                <h4><i class="fa fa-angle-right"></i> Advanced Table</h4>
                <hr>
                <thead>
                  <tr>
                    <th><i class="fa fa-bullhorn"></i> content type</th>
                    <th class="hidden-phone"><i class="fa fa-question-circle"></i> areacode</th>
                    <th><i class="fa fa-bookmark"></i>totalCount</th>
                    <th><i class=" fa fa-edit"></i>status</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>
                      <a href="basic_table.html#">Company Ltd</a>
                    </td>
                    <td class="hidden-phone">Lorem Ipsum dolor</td>
                    <td>12000.00$ </td>
                    <td><span class="label label-info label-mini">Due</span></td>
                    <td>
                      <button class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>
                      <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>
                      <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
                    </td>
                  </tr>
                  
                </tbody>
              </table>
            </div>
            <!-- /content-panel -->
          </div>
          <!-- /col-md-12 -->
        </div>
        <!-- /row -->
      </section>

</section>

   