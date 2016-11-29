<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="utils" tagdir="/WEB-INF/tags/utils" %>


	<script type="text/javaScript" language="javascript" >
		<!--
		
		
		//-->
	</script>   
	<!-- 제목 -->
	<h2 class="sub-header">공통 코드 ID</h2>
	
	<div class="row">
		<!-- 리스트 정보-->
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
			<utils:pagination paginationInfo="${paginationInfo}" type="info"/>
		</div>
		<!-- 검색 폼 -->
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
			<form:form action="cmmnCdList.do" commandName="searchCmd"  cssClass="searchForm" role="form">
				<input type="hidden" name="searching"/>
				
				<div class="input-group">
					<form:input  path="searchKeyword"  cssClass="form-control" placeholder="Search..."/> 
					<form:label path="searchKeyword" cssClass="sr-only">키워드</form:label>                 
					<span class="input-group-btn">
						<button type="submit" class="btn btn-default">검색</button>
					</span>
				</div><!-- /input-group -->
			</form:form>
		</div>	
	</div>
	
	<div class="table-responsive"> 	
		<table class="table table-condensed table-hover" >
			<colgroup>
					<col width="*" />
					<col width="*" />
					<col width="*" />
			</colgroup>
			<thead>
				<tr>
						<th>분류 코드</th>
						<th>코드ID</th>
						<th>코드ID 명</th>
						<th>설명</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cmd" items="${cmdList}" varStatus="status">
					<!-- 수정 링크 주소 -->
					<c:url var="updateFormURL" value="">
					</c:url>
					<!-- 상세 링크 주소 -->
					<c:url var="readURL" value="cmmnCdRead.do">
						<c:param name="cl_cd" value="${cmd.cl_cd}"/>
						<c:param name="cd_id" value="${cmd.cd_id}"/>
					</c:url>
					<tr class="choice ${cmd.cl_cd} ${cmd.cd_id}"> 
						<td><c:out value="${cmd.cl_cd}"/></td>
						<td><c:out value="${cmd.cd_id}"/></td>
						<td><a href="${readURL}" title="상세"><c:out value="${cmd.cd_id_nm}"/></a></td>
						<td><c:out value="${cmd.cd_id_dc}"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="row">
		<div class="col-lg-9 col-md-9 col-sm-9 col-xs-9 ">
			<utils:pagination paginationInfo="${pagenationInfo}"/>
		</div>	
		<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 ">
			<a href="cmmnCdCreateForm.do" class="btn btn-primary btn-sm pull-right" title="등록">등록</a>
		</div>
	</div>
	
	
	
	
	
	

	
