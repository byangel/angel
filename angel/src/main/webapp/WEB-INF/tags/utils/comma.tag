<%@ tag body-content="empty" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
				

<%@ attribute name="value" type="java.lang.String" required="true" rtexprvalue="true" description="" %>
<c:set var="value" value="${fn:replace(value,',','')}"/>
<c:if test="${empty value }">
	<c:set var="value" value="0"/>
</c:if>
<fmt:formatNumber  value="${value}" pattern="#,###"/>
