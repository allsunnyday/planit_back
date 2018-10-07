<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	
	
		$(function(){
			$('#frm').validate({rules:{
				contenttype:{
					required:true},
				areacode:{
					required:true
				}
			},
			messages:{
				contenttype:{
					required:'지역을 선택하세요'
				},
				areacode:{
					required:'지역을 선택하세요'
				}
			}});
		});
		

		
		var callTourAPI = function(){
			if($('#frm').valid()){
				$.ajax({
					url:"<c:url value='/tourapi/AjaxJson.do'/>",
					type:"post",
					dataType:"json",
					data:$('#frm').serialize(),
					success:function(data){
						console.log(data);
					},
					error:function(request,error){
						console.log('상태코드:',request.status);
						console.log('서버로 부터 받은 데이타:',request.responseText);
						console.log('에러:',error);
					}
				});
			}
		};
</script>
<!-- **********************************************************************************************************************************************************
        MAIN CONTENT :: 직원 관리 
        *********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<h3 style="text-align: center">content 관리 </h3>
		<!-- /row -->
		 <div class="row mt">
          <div class="col-lg-12">
            <div class="form-panel">
            	<form class="form-horizontal style-form" id="frm" >
            		
            		<div class="form-group">
	                  <label class="col-sm-2 col-sm-2 control-label">관광타입</label>
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
		                  <label class="col-sm-2 col-sm-2 control-label">지역</label>
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
			                  <option value="33">충청남도</option>
			                  <option value="33">경상북도</option>
			                  <option value="33">경상남도</option>
			                  <option value="33">전라북도</option>
			                  <option value="33">전라남도</option>
			                  <option value="33">제주도</option>
			                </select>
		                  </div>
		                </div>
		                
						<button onclick="callTourAPI();" class="btn btn-theme"> 조 회 </button>
						
                </form>
            </div>
            <!-- /form-panel -->
          </div>
          <!-- /col-lg-12 -->
		</div>
		<h3>
			<i class="fa fa-angle-right"></i>00으로 검색한 결과
		</h3>
		<div class="row mt">
			<div class="col-lg-12">
				<div class="content-panel">
					<h4>
						<i class="fa fa-angle-right"></i> 직원
					</h4>
					<section id="unseen">
						<table class="table table-bordered table-striped table-condensed table-text-center ">
							<thead>
								<tr>
									<th> contentTypeID</th>
									<th> conetneID</th>
									<th >title</th>
									<th >areacode</th>
									<th >sugungucode</th>
									<th >cat1/cat2/cat3</th>
									<th >GPS</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${list}">
								<tr>
									<td>${item.contenttype }</td>
									<td>${item.contentid}</td>
									<td >${item.title }</td>
									<td >${item.areacode }</td>
									<td >${item.sigungucode }</td>
									<td>${item.cat1 }/${item.cat2 }/${item.cat3 }</td>
									<td >${mapx}, ${mapy }</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						
						
						<div class="row">
							<div class="col-md-11">${pagingString}</div>
						</div>
					</section>
				</div>
				<!-- /content-panel -->
			</div>
			<!-- /col-lg-4 -->
		</div>

	</section>

</section>
