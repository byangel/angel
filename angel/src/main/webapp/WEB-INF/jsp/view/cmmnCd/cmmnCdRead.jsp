<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="utils" tagdir="/WEB-INF/tags/utils" %>


	<h2 class="sub-header">코드ID 상세</h2>
	<table border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-bordered">
		<colgroup>
				<col width="120" />
				<col width="*" />
		</colgroup>				
		<tr>
			<th>분류코드</th>
			<td> <c:out value="${command.cl_cd}"/> </td>
		</tr>
		<tr>
			<th>코드ID</th>
			<td> <c:out value="${command.cd_id}"/> </td>
		</tr>
		<tr>
			<th>코드ID 명</th>
			<td> <c:out value="${command.cd_id_nm}"/> </td>
		</tr>
		<tr>
			<th>코드ID 설명</th>
			<td> <c:out value="${command.cd_id_dc}"/> </td>
		</tr>
		<tr>
			<th>등록자 아이디</th>
			<td> <c:out value="${command.register_id}"/> </td>
		</tr>
		<tr>
			<th>등록 일시</th>
			<td> <fmt:formatDate  value="${command.regist_dt}"  pattern="yyyy-MM-dd hh:mm"/></td>
		</tr>
		 
	</table>

	<div class="row">
		<div class="col-md-12 pull-right">	
				<c:url var="updateURL" value="cmmnCdUpdateForm.do">
					<c:param name="cl_cd" 	  value="${command.cl_cd}"/>
					<c:param name="cd_id" 	  value="${command.cd_id}"/>
				</c:url>
				<c:url var="deleteURL" value="cmmnCdDelete.do">
					<c:param name="cl_cd" 	  value="${command.cl_cd}"/>
					<c:param name="cd_id" 	  value="${command.cd_id}"/>
				</c:url>
				<a href="cmmnCdList.do?searchUse" class="btn btn-primary btn-sm" title="목록">목록</a>
				<c:if test="${not empty command.cl_cd}">
					<a href="cmmnCdCreateForm.do" class="btn btn-primary btn-sm" title="등록">등록</a>
					<a href="${updateURL}" class="btn btn-primary btn-sm" title="수정">수정</a>
					<a href="${deleteURL}" class="btn btn-primary btn-sm contentDelete" title="삭제">삭제</a>
				</c:if>
				
		</div>	
	</div>
