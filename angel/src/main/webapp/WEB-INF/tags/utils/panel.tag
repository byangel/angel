<%@ tag body-content="scriptless" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
  
<%@ attribute name="id" type="java.lang.String" required="true" rtexprvalue="true" description="The identifier for this tag (do not change!)" %>
<%@ attribute name="title" type="java.lang.String" required="true" rtexprvalue="true" description="The page title (required)" %>
<%@ attribute name="openPane" type="java.lang.String" required="false" rtexprvalue="true" description="Control if the title pane is opened or closed by default (default: true)" %>
  
  <c:if test="${empty render or render}">
    <c:if test="${empty openPane}">
      <c:set value="true" var="openPane" />
    </c:if>
  
    <c:set var="sec_id">
      <spring:escapeBody javaScriptEscape="true" >${id}</spring:escapeBody>
    </c:set>
    
    <c:set var="sec_openPane">
      <spring:escapeBody javaScriptEscape="true" >${openPane}</spring:escapeBody>
    </c:set>
    
    <c:set var="sec_title">
      <spring:escapeBody javaScriptEscape="true" >${title}</spring:escapeBody>
    </c:set>
    
    <script type="text/javascript">dojo.require('dijit.TitlePane');</script>
    <div id="_title_${sec_id}_id">
      <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_title_${sec_id}_id', widgetType : 'dijit.TitlePane', widgetAttrs : {title: '${sec_title}', open: ${sec_openPane}}})); </script>
      <jsp:doBody />
    </div>
  </c:if>
