<%@ tag body-content="scriptless" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/utils" %>

<%@ attribute  name="paginationInfo" type="egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo" required="true" rtexprvalue="true" description="" %>
<%@ attribute  name="type"      type="java.lang.String" required="false" rtexprvalue="true" description="" %>
<%@ attribute  name="targetUrl" type="java.lang.String" required="false" rtexprvalue="true" description="" %>
<%@ attribute  name="cssClass"  type="java.lang.String" required="false" rtexprvalue="true" description="ul element for html class attribute" %>

	
	<c:if test="${empty cssClass }">
		<c:set var="cssClass" value="pagination pagination-sm"/>
	</c:if>	
	
	
	<jsp:doBody/>
    <c:set var="parmNames" 		value="${fn:split(parmNames, ',')}" />
    <c:set var="parmValues" 	value="${fn:split(parmValues, ',')}" />
   
	<c:forEach items="${parmNames}"   varStatus="i">
		<!-- 공정이주원에는 에러 안나는데...여기서는 에러나서 추가해줌 -->
		<%-- <c:if test="${not empty parmNames[i.index]}}"> --%>
			<c:choose>
		      <c:when test="${empty appendParam}">
		       	<c:set var="appendParam" value="&amp;${parmNames[i.index]}=${parmValues[i.index]}"/>
		      </c:when>
		      <c:otherwise>
		        <c:set var="appendParam"   value="${appendParam}&amp;${parmNames[i.index]}=${parmValues[i.index]}"  />
		      </c:otherwise>
		    </c:choose>
	    <%-- </c:if> --%>
	</c:forEach>
		
	<!-- 페이징 시작 -->
	<c:if test="${type eq 'info'}">
		총:<span class="Orange">${paginationInfo.totalRecordCount}</span>건  Page:${paginationInfo.currentPageNo}/${paginationInfo.totalPageCount}
	</c:if>
	<c:if test="${type ne 'info'}">
			<ul class="${cssClass}">
				<%-- <c:if test="${groupNo > 1 }"> --%>
				<li><a href="${targetUrl}?pageIndex=1${appendParam}" class='direction' >처음</a></li>
				<li><a href="${targetUrl}?pageIndex=${1 == paginationInfo.currentPageNo ? 1:paginationInfo.currentPageNo-1}${appendParam}">이전</a></li>
				<%-- </c:if> --%>
				<c:forEach begin="${paginationInfo.firstPageNoOnPageList}" end ="${paginationInfo.lastPageNoOnPageList}"  varStatus="i">
					<c:if test="${paginationInfo.currentPageNo eq i.index}">
						<li><a href="${targetUrl}?pageIndex=${i.index}${appendParam}" >${i.index}</a></li>
					</c:if>
					<c:if test="${paginationInfo.currentPageNo ne i.index}">
						<li><a href="${targetUrl}?pageIndex=${i.index}${appendParam}" >${i.index}</a></li>
					</c:if>
					        
			    </c:forEach>    
		   		<%--  <c:if test="${paginationInfo.lastPageNoOnPageList < paginationInfo.totalPageCount }"> --%>
				<li><a href="${targetUrl}?pageIndex=${paginationInfo.currentPageNo == paginationInfo.totalPageCount ?paginationInfo.currentPageNo:paginationInfo.currentPageNo+1}${appendParam}"  >다음</a></li>
				<li><a href="${targetUrl}?pageIndex=${paginationInfo.totalPageCount}${appendParam}" >마지막</a>	</li>
				<%-- </c:if> --%>
			</ul>
	</c:if>


