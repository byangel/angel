<%@ tag body-content="scriptless" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ attribute  name="render" type="java.lang.Boolean" required="false" rtexprvalue="true" description="Indicate if the contents of this tag and all enclosed tags should be rendered (default 'true')" %>

    <span>
      <c:out value=" | " />
      <spring:message code="global_theme" />
      <c:out value=": " />
      <spring:url var="url_theme1" value="">
        <spring:param name="theme" value="standard" />
        <c:if test="${not empty param.page}">
          <spring:param name="page" value="${param.page}" />
        </c:if>
        <c:if test="${not empty param.size}">
          <spring:param name="size" value="${param.size}" />
        </c:if>
      </spring:url>
      <spring:message code="global_theme_standard" var="theme_standard" htmlEscape="false" />
      <a href="${url_theme1}" title="${fn:escapeXml(theme_standard)}">${fn:escapeXml(theme_standard)}</a>
      <c:out value=" | " />
      <spring:url var="url_theme2" value="">
        <spring:param name="theme" value="alt" />
        <c:if test="${not empty param.page}">
          <spring:param name="page" value="${param.page}" />
        </c:if>
        <c:if test="${not empty param.size}">
          <spring:param name="size" value="${param.size}" />
        </c:if>
      </spring:url>
      <spring:message code="global_theme_alt" var="theme_alt" htmlEscape="false" />
      <a href="${url_theme2}" title="${fn:escapeXml(theme_alt)}">${fn:escapeXml(theme_alt)}</a>
    </span>
