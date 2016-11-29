<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="utils" tagdir="/WEB-INF/tags/utils" %>


	<script type="text/javaScript" language="javascript" >
		//<!--
		//검색
		$(function(){
			//$("#cd_id, #cl_cd").click(function(){
			$("#cd_id").click(function(){
				//alert($(this).val());
				$(".searchForm").submit();
				return false;
			});
			
			//상세 클릭시 iframe 트렌젝션 처리
			//$(this).contents().delegate('.choice','click', function(){
			$(".choice").click(function(){
				var detail_cd_id = $(this).attr("id");
				var detailCdViewURL = "<c:url value='/systemSingle/detailCdRead.do'/>?detail_cd_id="+detail_cd_id;
				$("#ifm_detailCdRead").attr("src",detailCdViewURL);
				return false;
			});
		
			$("#ifm_detailCdRead").load(function(){
				$(this).iframeAutoHeight();
			});
		
			//검색 조건 상위 코드 변경 이벤트시 자신의 코드목록 변경
			$("#cd_id").upperObj($("#cl_cd"));
		
			//코드 추가 버튼 클릭 
			var addCodeCnt = 0;
			$("#btnAddCode").click(function(){
				//공통코드가 선택되어있다면 공통코드 ID를 자동으로 넣어주자.
				var cd_id = $("#cd_id").val()||"";
				var html =  "<tr>"
					       +"	<td><input  name='detailCdVoList["+addCodeCnt+"].cd_id'  value='"+cd_id+"'	size='7'   /> </td>"
					       +"	<td><input  name='detailCdVoList["+addCodeCnt+"].detail_cd'  			    size='15'  /> </td>"
					       +"	<td><input  name='detailCdVoList["+addCodeCnt+"].detail_cd_nm' 				size='10'  /> </td>"
					       +"	<td><input  name='detailCdVoList["+addCodeCnt+"].detail_cd_ordr' 			size='3'   /> </td>"
					       +"	<td><input  name='detailCdVoList["+addCodeCnt+"].upper_cd'  				size='15'  /> </td>"
					       +"	<td><a href='#' class='btn btn-primary btn-xs rowDelete' title='로우 삭제'>삭제</a>			  </td>"
					       +"</tr>";
				//$(".searchForm").submit();
				$(html).appendTo('#listTbody');
				addCodeCnt = addCodeCnt+1;
				return false;
			});
			
			
			//로우삭제
			$(this).contents().delegate('.rowDelete','click', function(){
				$(this).parent().parent().remove();
				return false;
			});
			
			//변경여부 - 리스트에서 변경이되면 해당 로우 변경여부 프로퍼티에 Y 를 넣어준다.
			$(".listInput").change(function(){
				$(this).parent().parent().find(".changeAt").val('Y');
				return false;
			});
			
			
			//저장 벨리데이션
			var validateConfig = {
				 ignoreTitle: true
				,rules:{ cd_id				:{required:true,maxlength:6} 
						,detail_cd			:{required:true,maxlength:15} 
						,detail_cd_nm		:{required:true,maxlength:60} 
						,detail_cd_ordr		:{required:true,maxlength:2,number:true} 
				}
			}; 
			$("#actionForm").validate(validateConfig);
			
		});
		
		
		//-->
	</script>   
	
	<!-- 제목 -->
	<h2 class="sub-header">상세 코드</h2>
	<!-- 검색 폼 -->
	
		<div class="row">
			<form:form  action="detailCdList.do" commandName="searchCmd"  cssClass="searchForm" >
				<input type="hidden" name="searching"/>
				<div class="col-md-3">
					<table border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-bordered">
						<colgroup>
								<col width="*" />
						</colgroup>	
						<tr>
							<td> <form:input  path="searchKeyword"/><button type="submit" class="btn btn-default btn-sm">검색</button>  </td>	
						</tr>
						<tr>
							<td>
								<utils:inSelect  name="cl_cd" items="${clCdVoList}" itemLabel="cl_cd_nm" itemValue="cl_cd"  emptyMsg="전체" size="3"/>
							</td>
						</tr>
						<tr>
							<th>공통 코드</th>
						</tr>
						<tr>
							<td>
								<utils:inSelect  name="cd_id" items="${cmmnCdVoList}" itemLabel="cl_cd,cd_id,cd_id_nm" itemValue="cd_id" emptyMsg="전체" size="17"  optionClassValue="cl_cd"/>
							</td>
						</tr>			
						
						
					</table>
				</div>
			</form:form>
			<form:form  action="detailCdCreate.do" id="actionForm" method="post">
				<div class="col-md-9 ">
					<div class="row">
						<utils:pagination paginationInfo="${paginationInfo}" type="info"/>
						<a href="/systemSingle/clCdList.do" target="_blank" class="btn btn-primary btn-sm popup" title="클래스코드 관리">클래스코드 관리</a>
						<a href="/systemSingle/cmmnCdList.do" target="_blank" class="btn btn-primary btn-sm popup" title="공통코드 관리">공통코드 관리</a>
					</div>
					<!-- 리스트 -->
					<div class="table-responsive"> 	
						<table class="table table-condensed table-hover" >
							<colgroup>
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="5%" />
									<col width="10%" />
									<col width="10%" />
							</colgroup>
							<thead>
								<tr>
										<th>공통코드</th>
										<th>코드</th>
										<th>코드명</th>
										<th>순서</th>
										<th>상위코드</th>
										<th>사용여부</th>
								</tr>
							</thead>
							<tbody id="listTbody">
								<c:forEach var="cmd" items="${cmdList}" varStatus="status">
									
									<%-- 수정 링크 주소 --%>
									<c:url var="updateFormURL" value="">
									</c:url>
									<%-- 상세 링크 주소 --%>
									<c:url var="readURL" value="detailCdRead.do">
										<c:param name="detail_cd_id" value="${cmd.detail_cd_id}"/>
									</c:url>
									<tr> 
										<form:hidden 		 path="upDetailCdVoList[${status.index}].detail_cd_id"  value="${cmd.detail_cd_id}" />
										<form:hidden 		 path="upDetailCdVoList[${status.index}].changeAt" cssClass="changeAt"/>
										<td><a  href="${readURL}" class="choice" id="${cmd.detail_cd_id}" title="상세 페이지로 이동"> 
												<c:out 	 value="${cmd.cd_id}"/> 
											</a> 
										</td>
										<td> <form:input 	 path="upDetailCdVoList[${status.index}].detail_cd"  	 cssClass="listInput"	size="15" 		value="${cmd.detail_cd}"		/> </td>
										<td> <c:out 		 value="${cmd.detail_cd_nm}"/></td>
										<td> <form:input 	 path="upDetailCdVoList[${status.index}].detail_cd_ordr" cssClass="listInput"	size="3"  		value="${cmd.detail_cd_ordr}" /> </td>
										<td> <form:input 	 path="upDetailCdVoList[${status.index}].upper_cd"  	 cssClass="listInput"	size="15" 		value="${cmd.upper_cd}" 		/> </td>
										<td> <utils:inSelect name="upDetailCdVoList[${status.index}].use_at" 		 cssClass="listInput" 	codeid="ANG004" value="${cmd.use_at}" 	/> </td>
									</tr>
								</c:forEach>
								
							</tbody>
						</table>
						</div>
					
					<div class="row">
						<div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
								<utils:pagination paginationInfo="${pagenationInfo}"/>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
								<input type="submit" class="btn btn-primary btn-sm submit" value="저장" />
								<a href="#"  class="btn btn-primary btn-sm" id="btnAddCode" title="코드폼 추가">추가</a>
						</div>
								
						<!-- <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">	
								<a href="detailCdCreateForm.do" class="btn btn-primary btn-sm" title="등록">등록</a>
						</div> -->
					</div>
				
				
					<div class="row">
						<iframe name="ifm_detailCdRead" id="ifm_detailCdRead" src="/systemSingle/detailCdRead.do" width="100%" height="" frameborder="0px" scrolling="no" title="상세코드"></iframe>
					</div>	
				</div>
			</form:form>
		</div>
	
	
	
	
	
	
	

	
