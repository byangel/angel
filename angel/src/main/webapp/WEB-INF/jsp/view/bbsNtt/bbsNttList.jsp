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

	<!-- 제목 -->
	<h2 class="sub-header"><c:out value="${bbsMasterVo.bbs_nm}"/></h2>
	<!-- 검색 폼 -->
	<div class="row">
		<!-- 리스트 정보-->
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
			<utils:pagination paginationInfo="${paginationInfo}" type="info"/>
		</div>
		
		<!-- 검색 폼 -->
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
			<form:form action="bbsNttList.do" commandName="searchCmd"  cssClass="searchForm" role="form">
				<input type="hidden" name="searching" value="">
				<input type="hidden" name="bbs_id" value="${searchCmd.bbs_id}">
				<div class="input-group">
					<form:select path="searchCondition" id="searchCondition" cssClass="form-control">
						<option value="" selected>전체</option>
						<option value="NTT_SJ">제목</option>
						<option value="NTT_CN">내용</option>
						<option value="SJ_CN">내용+내용</option>
						<option value="REGISTER">작성자</option>
					</form:select>
					<form:label path="searchKeyword" cssClass="sr-only">검색 컨디션</form:label>
					
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
					<col width="50" />
					<col width="*" />
					<col width="100" />
					<col width="150" />
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cmd" items="${cmdList}" varStatus="status">
					<%-- 수정 링크 주소 --%>
					<c:url var="updateFormURL" value="">
					</c:url>
					<%-- 상세 링크 주소 --%>
					<c:url var="readURL" value="bbsNttRead.do">
						<c:param name="ntt_id" value="${cmd.ntt_id}"/>
					</c:url>
					<tr> 
						<td><c:out value="${paginationInfo.totalRecordCount - (status.index + ((paginationInfo.currentPageNo - 1) * paginationInfo.recordCountPerPage))}"/></td>		<%-- 번호 --%>
						<td class="left">
							<c:set var="ntt_sj" value="${cmd.ntt_sj}" />
							<a href="<c:out value='${readURL}'/>" title="상세">
								<c:if test="${fn:length(cmd.ntt_sj) > 31 }">
									<c:set var="ntt_sj" value="${fn:substring(cmd.ntt_sj, 0, 31)}..."/>		<%-- 제목 --%>
								</c:if>
								<c:out value="${ntt_sj}"/>		
							</a>
						</td>
						<td><c:out value="${cmd.register_id}"/></td>
						<td>
							<fmt:formatDate  value="${cmd.regist_dt}"  pattern="yyyy-MM-dd hh:mm"/>
						</td>
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
			<a href="bbsNttCreateForm.do" class="btn btn-primary btn-sm pull-right" title="작성페이지 이동">작성</a>
		</div>
	</div>
	
	
	
	
	
	
	

	
