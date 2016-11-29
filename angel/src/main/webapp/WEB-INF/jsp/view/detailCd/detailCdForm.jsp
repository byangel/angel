<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="utils" tagdir="/WEB-INF/tags/utils" %>


	<script type="text/javascript">
			//벨리데이션
			$(function(){
				var validateConfig = {
					 ignoreTitle: true
					,rules:{ cd_id				:{required:true,maxlength:6} 
							,detail_cd			:{required:true,maxlength:15} 
							,detail_cd_nm		:{required:true,maxlength:60} 
							,detail_cd_eng_nm	:{required:true,maxlength:60} 
							,detail_cd_dc		:{required:true,maxlength:200} 
							,detail_cd_ordr		:{required:true,maxlength:2,number:true} 
							,use_at				:{required:true} 
					}
				}; 
				$("#actionForm").validate(validateConfig);
			});
	</script>

	
	

	<!-- 페이지 공통 처리 플레그값 처리 -->
	<c:set var="registerFlag" value="${empty registerFlag ? 'CREATE' :registerFlag}" />
	<c:if test="${registerFlag eq 'CREATE'}">
		<c:set var ="pageTitle" value="상세코드 등록"/>
		<c:set var="formURL" value="detailCdCreate.do"/>
		<c:set var="submitBtnLabel" value="등록"/>
	</c:if>
	
	<c:if test="${registerFlag eq 'UPDATE'}">
		<c:set var ="pageTitle" value="상세코드 수정"/>
		<c:set var="formURL" value="detailCdUpdate.do"/>
		<c:set var="submitBtnLabel" value="수정"/>
	</c:if>
	
	<h2 class="sub-header">${pageTitle}</h2>
	<form:form  id="actionForm" action="${formURL}"  method="post" >
		<form:hidden path="detail_cd_id" value="${command.detail_cd_id }"/>
		<!-- 상세 컨텐츠 -->
		<table border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-bordered">
			<colgroup>
				<col width="20%" />
				<col width="*" />
				<col width="20%" />
				<col width="*" />
			</colgroup>				
			
			<tr>
				<th>분류코드</th>
				<td><c:out value="${command.cl_cd}"/></td>
				<th> <form:label path="cd_id">코드ID</form:label> </th>
				<td> <form:input  path="cd_id"  title="공통코드" /> </td>
			</tr>
			<tr>
				<th> <form:label path="detail_cd">코드</form:label> </th>
				<td> <form:input path="detail_cd" title="상세코드"/> </td>
				<th> <form:label path="detail_cd_nm">상세코드명</form:label> </th>
				<td> <form:input path="detail_cd_nm" /> </td>
			</tr>
			<tr>
				<th> <form:label path="detail_cd_eng_nm">코드 영문 명</form:label> </th>
				<td> <form:input path="detail_cd_eng_nm" /> </td>
				<th> <form:label path="detail_cd_ordr">상세코드 순서</form:label> </th>
				<td> <form:input path="detail_cd_ordr" size="3"/> </td>
			</tr>
			<tr>
				<th> <form:label path="use_at">상위코드</form:label></th>
				<td> <form:input path="upper_cd"/></td>
				<th> <form:label path="use_at">사용여부</form:label> </th>
				<td> <utils:inSelect name="use_at" codeid="ANG004" /></td>
			</tr>
			<tr>
				<th> <form:label path="register_id">작성자</form:label> </th>
				<td> <c:out value="${command.register_id}"/> </td>
				<th> <form:label path="regist_dt">등록 일시</form:label> </th>
				<td><fmt:formatDate  value="${command.regist_dt}"  pattern="yyyy-MM-dd hh:mm"/></td>
			</tr>
			<tr>
				<th> <form:label path="detail_cd_dc">코드 설명</form:label> </th>
				<td> <form:input path="detail_cd_dc" /> </td>
				<th></th> 
				<td></td>
			</tr>
			 
		</table>
		<!-- /상세 컨텐츠 -->
		
		<%-- 버튼  --%>
		<div class="row">
			<div class="col-md-12 pull-right">	
				<%--목록 버튼 --%>
				<!-- <a href="detailCdList.do?searchUse" class="btn btn-primary btn-sm" title="공통코드 목록" >목록</a> -->

				<%-- 등록 및 수정 서브밋 버튼 --%>	
				<input type="submit" class="btn btn-primary btn-sm submit" value="${submitBtnLabel}" />
			
				<%-- 수정 모드 일때 삭제 버튼 출력 --%>
				<c:if test="${registerFlag eq 'UPDATE'}">
					<c:url var="deleteURL" value="detailCdDelete.do">
						<c:param name="detail_cd_id" 	  value="${command.detail_cd_id}"/>
					</c:url>
					
					<a href="${deleteURL}" title="상세코드 삭제" class="btn btn-primary btn-sm contentDelete">삭제</a>
				</c:if>
				<c:url var="readURL" value="detailCdRead.do">
					<c:param name="detail_cd_id" value="${command.detail_cd_id}"/>
				</c:url>
				<a href="${readURL}" class="btn btn-primary btn-sm" title="등록/수정 취소">취소</a>
			</div>	
		</div>
		<%-- /버튼  --%>
	</form:form>