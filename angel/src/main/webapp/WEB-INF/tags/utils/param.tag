<%@ tag body-content="empty" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/utils" %>


<%@ attribute name="name"  		type="java.lang.String"  required="true"  rtexprvalue="true" description="" %>
<%@ attribute name="value" 		type="java.lang.String" required="true" rtexprvalue="true" description="" %>
    <!-- 컬럼 라벨및 글자수 오토링크 아이디 등 설정 -->
    <c:choose>
      <c:when test="${empty parmNames}">
        <c:set var="parmNames"   		value="${name}" scope="request" />
        <c:set var="parmValues" 	    value="${value}" scope="request" />
      </c:when>     
      <c:otherwise>
        <c:set var="parmNames"   value="${parmNames},${name}" scope="request" />
        <c:set var="parmValues"  value="${parmValues},${value}" scope="request" />
      </c:otherwise>
    </c:choose>