<%@ tag body-content="scriptless" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/utils" %>

<%@ attribute  name="id" type="java.lang.String" required="true" rtexprvalue="true" description="The identifier for this tag (do not change!)" %>
<%@ attribute  name="items" type="java.util.Collection" required="true" rtexprvalue="true" description="The form backing object name" %>
<%@ attribute  name="label" type="java.lang.String" required="false" rtexprvalue="true" description="The label used for this object, will default to a message bundle if not supplied" %>


  
    <c:if test="${empty label}">
      <spring:message code="label_${fn:toLowerCase(fn:substringAfter(id,'_'))}" var="label" htmlEscape="false" />
    </c:if>
  
  	<div class="listFindForm">
  		<!-- 검색 필드 출력  태그 만들자.-->
		<!-- 검색 필드 출력 끝-->
	</div>
    
    <c:choose>
      <c:when test="${not empty items}">
        <jsp:doBody />
      </c:when>
      <c:otherwise>
        <spring:message arguments="${label}" code="entity_not_found" />
      </c:otherwise>
    </c:choose>
		
		
  	 <!-- 페이지 네이션은  -->
	<div class="paginate">
		<%-- <util:pagination commandName="command" pageNo="pageNo" pageSize="pageSize" groupSize="groupSize" totalCount="totalCount"/> --%>
	</div> 
