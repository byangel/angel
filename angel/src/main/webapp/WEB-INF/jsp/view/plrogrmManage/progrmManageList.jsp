<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="utils" tagdir="/WEB-INF/tags/utils" %>


	<script type="text/javaScript" language="javascript" >
		<!--
		
		//부모창 메소드 호출 하여 값 전달
		$(function(){		
			$(".itemSelect").click(function(){
				var progrmId = $(this).attr("id");
			  	$(opener.location).attr("href","javascript:callInPopUp('"+progrmId+"');");
			  	self.close();
			});
		}); 
		
		//-->
	</script>   

	<!-- 제목 -->
	<div class="row">
       <h1>프로그램 목록</h1>
	</div>
	
	<!-- 검색 폼 -->
	<div class="row">
		<div class="col-xs-12">	
           	<form:form action="" commandName="searchCmd" method="GET" cssClass="form-inline pull-right searchForm" role="form">	
				<input type="hidden" name="searching"/>
				
				<div class="form-group">
					<form:label path="searchKeyword" cssClass="sr-only">키워드</form:label>
					<form:input  path="searchKeyword"  cssClass="form-control"/>
					<button type="submit" class="btn btn-default">검색</button>
				</div>
			</form:form>
		</div>
	</div>
		
	<!-- 리스트 -->
	<div class="row">
		<div class="col-md-12">
			<utils:pagination paginationInfo="${paginationInfo}" type="info"/>
		</div>
	</div>		
	<div class="table-responsive"> 	
		<table class="table table-hover  table-condensed">
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
						<th>No</th>
						<th>프로그램 명</th>
						<th>타입</th>
						<th>저장경로</th>
						<th>URL</th>
						<th>수정</th>
						<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cmd" items="${cmdList}" varStatus="status">
					<tr>                      
						<td><utils:listIdx paginationInfo="${paginationInfo}" idxNum="${status.index}"/></td>
						<td><a href="progrmManageRead.do?progrm_id=${cmd.progrm_id}" title="수정"><c:out value="${cmd.progrm_nm }"/></a></td>
						<td><utils:code codeid="ANG001" value="${cmd.progrm_ty}"/></td>
						<td>${cmd.progrm_stre_path }</td>
						<td>${cmd.progrm_url }</td>
						<td>
							<a href="progrmManageUpdateForm.do?progrm_id=${cmd.progrm_id}" class="btn btn-default btn-xs">수정</a>
						</td>
						<td>
							<a href="progrmManageDelete.do?progrm_id=${cmd.progrm_id}" class="btn btn-default btn-xs contentDelete">삭제</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="row">
		<div class="col-md-12">	
			<div class="pull-right">
				<c:if test="${layoutName eq 'single'}">
					<button type="button" class="btn btn-primary  btn-sm itemSelect" >닫기</button>
				</c:if>
				<c:if test="${layoutName ne 'single'}">
					<a href="progrmManageCreateForm.do" class="btn btn-primary btn-sm" >등록</a>
				</c:if>
			</div>
		</div>	
	</div>
	<div class="row">
		<div class="col-md-4 col-xs-push-4">
			<utils:pagination paginationInfo="${pagenationInfo}"/>
		</div>
	</div>
	
	
	
	
	
	
	

	
