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
	<h2 class="sub-header">분류 코드</h2>
	<!-- 검색 폼 -->
	<div class="row">
		<!-- 리스트 정보-->
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
			<utils:pagination paginationInfo="${paginationInfo}" type="info"/>
		</div>
		
		<!-- 검색 폼 -->
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
			<form:form action="clCdList.do" commandName="searchCmd"  cssClass="searchForm" role="form">
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
					<col width="*" />
			</colgroup>
			<thead>
				<tr>
					<th>분류코드</th>
					<th>코드명</th>
					<th>분류코드 설명</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cmd" items="${cmdList}" varStatus="status">
					<%-- 수정 링크 주소 --%>
					<c:url var="updateFormURL" value="">
					</c:url>
					<%-- 상세 링크 주소 --%>
					<c:url var="readURL" value="clCdRead.do">
						<c:param name="cl_cd" value="${cmd.cl_cd}"/>
					</c:url>
					<tr> 
						<td><c:out value="${cmd.cl_cd}"/></td>
						<td><a href="${readURL}" title="상세"><c:out value="${cmd.cl_cd_nm}"/></a></td>
						<td><a href="${readURL}" title="상세"><c:out value="${cmd.cl_cd_dc}"/></a></td>
						<td><fmt:formatDate  value="${cmd.regist_dt}"  pattern="yyyy-MM-dd hh:mm"/></td>
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
			<a href="clCdCreateForm.do" class="btn btn-primary btn-sm pull-right" title="등록">등록</a>
		</div>
	</div>
	
	
	
	
	
	
	

	
