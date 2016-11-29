<%@ tag body-content="scriptless" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ attribute name="locale" type="java.lang.String" required="true" rtexprvalue="true" description="The locale for the language to be added." %>
<%@ attribute name="label" type="java.lang.String" required="true" rtexprvalue="true" description="The country label for the language to be added." %>

    <spring:url var="img" value="/resources/images/${locale}.png" />
    <spring:url var="url" value="">
      <c:if test="${null ne param.form}">
        <spring:param name="form" />
      </c:if>
      <c:if test="${not empty param.find}">
        <spring:param name="find" value="${param.find}" />
      </c:if>
      <spring:param name="lang" value="${locale}" />
      <c:if test="${not empty param.page}">
        <spring:param name="page" value="${param.page}" />
      </c:if>
      <c:if test="${not empty param.size}">
        <spring:param name="size" value="${param.size}" />
      </c:if>
    </spring:url>
    <spring:message code="global_language_switch" arguments="${label}" var="lang_label" htmlEscape="false" />
    <a href="${url}" title="${fn:escapeXml(lang_label)}">
    	 ${locale}
    </a>
    <c:out value=" " />
