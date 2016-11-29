<%@ tag body-content="empty" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="utils" tagdir="/WEB-INF/tags/utils" %>


	<%@ attribute name="value"      type="java.lang.Object"  required="true"  rtexprvalue="true" description="field value" %>
	<%@ attribute name="parsePattern"  type="java.lang.String"  required="false" rtexprvalue="true" description="use when value type is String"%>
	<%@ attribute name="pattern"   	type="java.lang.String"  required="false" rtexprvalue="true" description="use when value type is Date"%>
	
	<c:set var="parsePattern" value="${empty parsePattern ? 'yyyy-MM-dd':parsePattern}" />
	<c:set var="pattern" value="${empty pattern ? 'yyyy-MM-dd':pattern}" />
	
	<c:choose>
		<%--  데이타 객체 타입이 Date 일때 value 값 설정 --%>
		<c:when test="${value.class.name eq 'java.util.Date'}">
			<fmt:formatDate  var="value" value="${value}"  pattern="${pattern}"/>
		</c:when>
		<%--  데이타 객체 타입이 String 일때 value 값 설정 --%>
		<c:when test="${value.class.name eq 'java.lang.String'}">
			<fmt:parseDate   var="value" value="${value}"  pattern="${parsePattern}"/>
			<fmt:formatDate  			 value="${value}"  pattern="${pattern}"/>
		</c:when>
	</c:choose>
	
	
	<%-- 	
		h : 1~12
		H : 0~ 23
		k : 1~ 24
		K :0 ~11 --%>