<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>

var isDateSelected=false;
var totalContent;	
		$(function(){
			// validate :  관광타입과 지역을 선택해야만 조회가 가능하다 
			/* $('#frm').validate({rules:{
				contenttype:{
					required:true},
				areacode:{
					required:true
				}
			},
			messages:{
				contenttype:{
					required:'관광타입을 선택하세요'
				},
				areacode:{
					required:'지역을 선택하세요'
				}
			}}); */
			console.log('refresh!!!');
			
		});
		
		// tour api를 호출하는 함수 
		var callTourAPI = function(){
			/* if($('#frm').valid()){ */
				$.ajax({
					url:"<c:url value='/tourapi/AjaxJson.do'/>",
					type:"post",
					dataType:"json",
					data:{contenttype:$('#contenttype').val(), areacode:$('#areacode').val()},
					success:displayContent,
					error:function(request,status,error){
						console.log('code:%s,message:%s,error:%s,status:%s'
								,request.status,request.responseText,error,status);
					}
				});
			/* } */
		};
		// 데이터 json을 csv로 저장하기 위한 함수 
		var saveContent=function(){
			if(!isDateSelected){
				alert("데이터를 조회해주세요");
				return;
			}
			if(confirm('데이터를 csv파일로 저장할까요?')){
				location.replace('<c:url value="/tourapi/download/JsonToCsv.do?totalCount='+totalContent
									+'&contenttype='+$('#contenttype').val()
									+'&areacode='+$('#areacode').val()
									+'"/>');
			}
		};
		
		// callback함수 조회 및 다음 페이지 조회시 
		var displayContent = function(data){
			//console.log(JSON.stringify(data));
			isDateSelected=true;
			var displayString = '';
			$.each(data, function(index,element){ 
				//console.log(JSON.stringify(element));
				if(element['pagingString']==null){
					displayString +='<tr>'
					+ '<td>'+element['contenttypeid']+'</td>'
					+ '<td>'+element['contentid']+'</td>'
					+ '<td >'+element['title']+'</td>'
					+ '<td >'+element['areacode']+'</td>'
					+ '<td >'+element['sigungucode']+'</td>'
					+ '<td>'+element['cat1']+element['cat2']+element['cat3']+'</td>'
					+ '<td >'+element['addr1']+'</td>'
					+'</tr>';
				}
				else{
					//페이징
					$('#pagingString').html(element['pagingString']);
					// 페이징된 버튼에 onclick이벤트 부착
					$('button.paging').on('click', function(){
						var page = $(this).attr('title');
						console.log(page);
						$.ajax({
							url:"<c:url value='/tourapi/AjaxJson.do'/>",
							type:"post",
							dataType:"json",
							data:{contenttype:$('#contenttype').val(), areacode:$('#areacode').val(), nowPage:page},
							success:displayContent,
							error:function(request,status,error){
								console.log('code:%s,message:%s,error:%s,status:%s'
										,request.status,request.responseText,error,status);
							}
						});
					});
					 //totalcount를 화면에 노출시킨다. 
					 $('.totalcount').html('총 '+element['totalCount']+'개');
					 totalContent=element['totalCount'];
				}
				
				
			});
			$('#display').html(displayString);
		}
		
		
</script>
<!-- **********************************************************************************************************************************************************
        MAIN CONTENT :: 직원 관리 
        *********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<h3 style="text-align: center">content 등록 </h3>
		<!-- /row -->
		 <div class="row mt">
          <div class="col-lg-12">
            <div class="form-panel">
            	<form class="form-horizontal style-form" id="frm" >
            		
            		<div class="form-group">
	                  <label class="col-sm-2 col-sm-2 control-label">관광타입</label>
	                  <div class="col-sm-5 text-center">
	                    <!-- <select class="form-control " id="contenttype" name="contenttype">
		                  <option value="">타입선택</option>
		                  <option value="12">관광지</option>
		                  <option value="14">문화시설</option>
		                  <option value="15">축제공연</option>
		                  <option value="25">여행코스</option>
		                  <option value="28">레포츠</option>
		                  <option value="32">숙박</option>
		                  <option value="38">쇼핑</option>
		                  <option value="39">음식점</option>
		                </select> -->
		                <input type="text" id="contenttype" name="contenttype" value="${param.contenttype}" disabled>
	                  </div>
	                </div>
	                
            		 <div class="form-group">
		                  <label class="col-sm-2 col-sm-2 control-label">지역</label>
		                  <div class="col-sm-5 text-center">
			                  <!-- <select class="form-control" id="areacode" name="areacode">
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
			                </select> -->
			                <input type="text" id="areacode" name="areacode" value="${param.areacode}" disabled>
		                  </div>
		                </div>
		                
						<button type="button" onclick="callTourAPI();" value="submit" class="btn btn-theme"> 조 회 </button>
						<button type="button" onclick="saveContent();" value="submit" class="btn btn-theme">전체 저장 </button>
						
                </form>
            </div>
            <!-- /form-panel -->
          </div>
          <!-- /col-lg-12 -->
		</div>
		<h3>
			<i class="fa fa-angle-right" ></i><span class="totalcount">검색된 결과가 없습니다</span>
		</h3>
		<div class="row mt">
			<div class="col-lg-12">
				<div class="content-panel">
						<i class="fa fa-angle-right"></i> 
					
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
							<tbody id="display">
								
							</tbody>
						</table>
						
						
						<div class="row">
							<div class="col-md-11" id="pagingString"></div>
						</div>
					</section>
				</div>
				<!-- /content-panel -->
			</div>
			<!-- /col-lg-4 -->
		</div>

	</section>

</section>


