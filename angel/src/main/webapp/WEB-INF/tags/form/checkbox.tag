<%@ tag body-content="scriptless" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



<%@ attribute  name="id" type="java.lang.String" required="true" rtexprvalue="true" description="The identifier for this tag (do not change!)" %>
<%@ attribute  name="field" type="java.lang.String" required="true" rtexprvalue="true" description="The field exposed from the form backing object" %>
<%@ attribute  name="label" type="java.lang.String" required="false" rtexprvalue="true" description="The label used for this field, will default to a message bundle if not supplied" %>
<%@ attribute  name="labelCode" type="java.lang.String" required="false" rtexprvalue="true" description="Key for label message bundle if label is not supplied" %>
<%@ attribute  name="disableFormBinding" type="java.lang.Boolean" required="false" rtexprvalue="true" description="Set to true to disable Spring form binding" %>

   	<c:if test="${empty label}">
      <c:if test="${empty labelCode}">
        <c:set var="labelCode" value="${fn:substringAfter(id,'_')}" />
      </c:if>
      
      <c:catch var="exception">
      	 <spring:message code="label_${fn:toLowerCase(labelCode)}" var="label" htmlEscape="false" />
      </c:catch>
      <c:if test="${not empty exception }">
      	<c:set var="label" value="${field}"/>
      </c:if>
    </c:if>
    
    <c:set var="sec_field">
      <spring:escapeBody javaScriptEscape="true">${field}</spring:escapeBody>
    </c:set>
    
     <div id="_${fn:escapeXml(id)}_id">
      <label for="_${sec_field}_id">
        <c:out value="${fn:escapeXml(label)}" />:
      </label>
      <c:choose>
        <c:when test="${disableFormBinding}">
          <input id="_${sec_field}_id" name="${sec_field}" type="checkbox"/>
        </c:when>
        <c:otherwise>
          <form:checkbox id="_${sec_field}_id" path="${sec_field}"/>
        </c:otherwise>
      </c:choose>
    </div>
    <br />
