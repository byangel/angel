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
							,cd_id			:{required:true,maxlength:6} 
							,cd_id_nm		:{required:true,maxlength:60} 
							,cd_id_eng_nm	:{required:true,maxlength:60} 
							,cd_id_dc		:{required:true,maxlength:200} 
					}
				}; 
				$("#actionForm").validate(validateConfig);
			});
	</script>

	
	

	<!-- 페이지 공통 처리 플레그값 처리 -->
	<c:set var="registerFlag" value="${empty registerFlag ? 'CREATE' :registerFlag}" />
	<c:if test="${registerFlag eq 'CREATE'}">
		<c:set var ="pageTitle" value="코드ID 등록"/>
		<c:set var="formURL" value="cmmnCdCreate.do"/>
		<c:set var="submitBtnLabel" value="등록"/>
	</c:if>
	
	<c:if test="${registerFlag eq 'UPDATE'}">
		<c:set var ="pageTitle" value="코드ID 수정"/>
		<c:set var="formURL" value="cmmnCdUpdate.do"/>
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
				<td> 
					<utils:inSelect  name="cl_cd" items="${clCdVoList}" itemLabel="cl_cd_nm" itemValue="cl_cd"  readonly="${registerFlag eq 'CREATE' ? 'false':'true'}" />
				</td>
			</tr>
			<tr>
				<th> <form:label path="cd_id" >코드ID</form:label> </th>
				<td> <form:input path="cd_id" cssStyle="width:50%"/> </td>
			</tr>
			<tr>
				<th> <form:label path="cd_id_nm">코드ID 명</form:label> </th>
				<td> <form:input path="cd_id_nm"  cssStyle="width:80%"/> </td>
			</tr>
			<tr>
				<th> <form:label path="cd_id_dc">코드ID 설명</form:label> </th>
				<td> <form:input path="cd_id_dc" cssStyle="width:80%" /> </td>
			</tr>
			<tr>
				<th> <form:label path="register_id">등록자 아이디</form:label> </th>
				<td> <c:out value="${command.register_id}"/> </td>
			</tr>
			<tr>
				<th> <form:label path="regist_dt">등록 일시</form:label> </th>
				<td> 
					<fmt:formatDate  value="${command.regist_dt}"  pattern="yyyy-MM-dd hh:mm"/>
				</td>
			</tr>
			 
		</table>
		<!-- /상세 컨텐츠 -->
		
		
		
		<%-- 버튼  --%>
		<div class="row">
			<div class="col-md-12 pull-right">	
				<%--목록 버튼 --%>
				<a href="cmmnCdList.do?searchUse" class="btn btn-primary btn-sm" title="공통코드 목록" >목록</a>
				<%-- 등록 및 수정 서브밋 버튼 --%>	
				<input type="submit" class="btn btn-primary btn-sm submit" value="${submitBtnLabel}" />
				<%-- 수정 모드 일때 삭제 버튼 출력 --%>
				<c:if test="${registerFlag eq 'UPDATE'}">
					<c:url var="deleteURL" value="cmmnCdDelete.do">
						<c:param name="cl_cd" 	  value="${command.cl_cd}"/>
						<c:param name="cd_id" 	  value="${command.cd_id}"/>
					</c:url>
					<a href="${deleteURL}" title="공통코드삭제" class="btn btn-primary btn-sm contentDelete">삭제</a>
				</c:if>
			</div>	
		</div>
		<%-- /버튼  --%>
		
	</form:form>