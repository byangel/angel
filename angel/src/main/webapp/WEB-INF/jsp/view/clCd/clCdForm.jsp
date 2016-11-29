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
				,rules:{ cl_cd			:{required:true,maxlength:3} 
						,cl_cd_nm		:{required:true,maxlength:60} 
						,cl_cd_dc		:{required:true,maxlength:200} 
				}
			}; 
			$("#actionForm").validate(validateConfig);
		});
	</script>

	
	

	<!-- 페이지 공통 처리 플레그값 처리 -->
	<c:set var="registerFlag" value="${empty registerFlag ? 'CREATE' :registerFlag}" />
	<c:if test="${registerFlag eq 'CREATE'}">
		<c:set var ="pageTitle" value="분류코드 등록"/>
		<c:set var="formURL" value="clCdCreate.do"/>
		<c:set var="submitBtnLabel" value="등록"/>
	</c:if>
	
	<c:if test="${registerFlag eq 'UPDATE'}">
		<c:set var ="pageTitle" value="분류코드 수정"/>
		<c:set var="formURL" value="clCdUpdate.do"/>
		<c:set var="submitBtnLabel" value="수정"/>
	</c:if>
	
	<h2 class="sub-header">${pageTitle}</h2>
	
	<form:form  id="actionForm" action="${formURL}"  method="post" >
		<!-- 상세 컨텐츠 -->
		<table border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-bordered">
			<colgroup>
					<col width="120" />
					<col width="*" />
			</colgroup>				
			<tr>
				<th> <form:label path="cl_cd">분류코드</form:label> </th>
				<td> <form:input path="cl_cd"/> </td>
			</tr>
			<tr>
				<th> <form:label path="cl_cd_nm">분류코드 명</form:label> </th>
				<td> <form:input path="cl_cd_nm" size="50"/> </td>
			</tr>
			<tr>
				<th> <form:label path="cl_cd_dc">분류코드 설명</form:label> </th>
				<td> <form:input path="cl_cd_dc" size="50"/> </td>
			</tr>
			<tr>
				<th> <form:label path="register_id">등록자 아이디</form:label> </th>
				<td> <c:out value="${command.register_id}"/> </td>
			</tr>
			<tr>
				<th> <form:label path="regist_dt">등록 일시</form:label> </th>
				<td> <fmt:formatDate  value="${command.regist_dt}"  pattern="yyyy-MM-dd hh:mm"/> </td>
			</tr>
			 
		</table>
		<!-- /상세 컨텐츠 -->
		
		<%-- 버튼  --%>
		<div class="row">
			<div class="col-md-12 pull-right">	
				<%--목록 버튼 --%>
				<a href="clCdList.do?searchUse" class="btn btn-primary btn-sm" title="분류코드 목록" >목록</a>
				<%-- 등록 및 수정 서브밋 버튼 --%>	
				<input type="submit" class="btn btn-primary btn-sm submit" value="${submitBtnLabel}" />
				<%-- 수정 모드 일때 삭제 버튼 출력 --%>
				<c:if test="${registerFlag eq 'UPDATE'}">
					<c:url var="deleteURL" value="clCdDelete.do">
						<c:param name="cl_cd" 	  value="${command.cl_cd}"/>
					</c:url>
					<a href="${deleteURL}" title="분류코드 삭제" class="btn btn-primary btn-sm contentDelete">삭제</a>
				</c:if>
			</div>	
		</div>
		<%-- /버튼  --%>
	</form:form>