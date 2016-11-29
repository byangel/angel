<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="utils" tagdir="/WEB-INF/tags/utils" %>


	<script type="text/javaScript" language="javascript" >
		<!--
		
		//-->
	</script>   

	<!-- 검색 폼 -->
	<div class="row">
		<!-- 리스트 정보-->
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
			<utils:pagination paginationInfo="${paginationInfo}" type="info"/>
		</div>
		
		<!-- 검색 폼 -->
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
			<form:form action="bbsMasterList.do" commandName="searchCmd"  cssClass="searchForm" role="form">
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
					<col width="*" />
					
					<col width="*" />
			</colgroup>
			<thead>
				<tr>
					<th>뎃글 아이디</th>
					<th>게시물 아이디</th>
					<th>뎃글</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cmd" items="${cmdList}" varStatus="status">
					<%-- 상세 링크 주소 --%>
					<%-- <c:url var="readURL" value="bbsMasterRead.do">
						<c:param name="bbs_id" value="${cmd.bbs_id}"/>
					</c:url> --%>
					<tr> 
						<td><a href="${readURL}" title="상세"><c:out value="${cmd.answer_id}"/></a></td><!-- 게시판 ID -->
						<td><c:out value="${cmd.ntt_id}"/></td>
						<td><c:out value="${cmd.answer_cn}"/></td>
						<td><c:out value="${cmd.updusr_id}"/></td>
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
			<a href="bbsMasterCreateForm.do" class="btn btn-primary btn-sm pull-right" title="등록">등록</a>
		</div>
	</div>
	
	
	
	
	
	
	

	
