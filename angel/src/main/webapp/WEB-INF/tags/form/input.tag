<%@ tag body-content="scriptless" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="utils" tagdir="/WEB-INF/tags/utils" %>


  <%@ attribute  name="id" type="java.lang.String" required="false" rtexprvalue="true" description="The identifier for this tag" %>
  <%@ attribute  name="name" type="java.lang.String" required="true" rtexprvalue="true" description="The name exposed from the form backing object" %>
  <%@ attribute  name="codeid" type="java.lang.String"  required="false" rtexprvalue="true" description="코드아이디" %>
  <%@ attribute  name="value"  	type="java.lang.String"  required="false"  rtexprvalue="true" description="name value" %>
  <%@ attribute  name="label" type="java.lang.String" required="false" rtexprvalue="true" description="The label used for this name, will default to a message bundle if not supplied" %>
  <%@ attribute  name="labelCode" type="java.lang.String" required="false" rtexprvalue="true" description="Key for label message bundle if label is not supplied" %>
  <%@ attribute  name="required" type="java.lang.Boolean" required="false" rtexprvalue="true" description="Indicates if this name is required (default false)" %>
  <%@ attribute  name="disabled" type="java.lang.Boolean" required="false" rtexprvalue="true" description="Specify if this name should be enabled" %>
  <%@ attribute  name="validationRegex" type="java.lang.String" required="false" rtexprvalue="true" description="Specify regular expression to be used for the validation of the input contents" %>
  <%@ attribute  name="validationMessageCode" type="java.lang.String" required="false" rtexprvalue="true" description="Specify the message (message property code) to be displayed if the regular expression validation fails" %>
  <%@ attribute  name="validationMessage" type="java.lang.String" required="false" rtexprvalue="true" description="Specify the message to be displayed if the regular expression validation fails" %>
  <%@ attribute  name="min" type="java.lang.String" required="false" rtexprvalue="true" description="Specify the minimum length of the input contents" %>
  <%@ attribute  name="max" type="java.lang.String" required="false" rtexprvalue="true" description="Specify the maximum length of the input contents" %>
  <%@ attribute  name="decimalMin" type="java.lang.String" required="false" rtexprvalue="true" description="Specify the minimum size of the input contents" %>
  <%@ attribute  name="decimalMax" type="java.lang.String" required="false" rtexprvalue="true" description="Specify the maximum size of the input contents" %>
  <%@ attribute  name="disableFormBinding" type="java.lang.Boolean" required="false" rtexprvalue="true" description="Set to true to disable Spring form binding" %>
  <%@ attribute  name="type" type="java.lang.String" required="false" rtexprvalue="true" description="Set name type (default 'text', or 'password')" %>
  
 	<c:set var="value" value="${fn:trim(value)}"/>
  	
  	<c:if test="${empty id}">
      <c:set var="id" value="${name}"  />
    </c:if>
    <c:if test="${empty type}">
      <c:set var="type" value="text"  />
    </c:if>
    
    <c:if test="${empty disabled}">
      <c:set value="false" var="disabled" />
    </c:if>
    
    <c:if test="${empty label}">
      <c:if test="${empty labelCode}">
        <c:set var="labelCode" value="label_${id}" />
      </c:if>
      
      <c:catch var="exception">
      	 <spring:message code="${fn:toLowerCase(labelCode)}" var="label" htmlEscape="false" />
      </c:catch>
      <c:if test="${not empty exception }">
      	<c:set var="label" value="${name}"/>
      </c:if>
    </c:if>
    
    <c:if test="${empty validationMessage}">
      <c:choose>
        <c:when test="${empty validationMessageCode}">
          <spring:message arguments="${fn:escapeXml(label)}" code="field_invalid" var="field_invalid" htmlEscape="false" />
        </c:when>
        <c:otherwise>
          <spring:message arguments="${fn:escapeXml(label)}" code="${validationMessageCode}" var="field_invalid" htmlEscape="false" />
        </c:otherwise>
      </c:choose>
    </c:if>
    
    <c:if test="${empty required}">
      <c:set value="false" var="required" />
    </c:if>
    
    <c:set var="name">
      <spring:escapeBody javaScriptEscape="true" >${name}</spring:escapeBody>
    </c:set>
    
    <c:choose>
        <c:when test="${empty value}">
       		<spring:eval expression="name" var="nameValue"/>
       		<c:if test="${nameValue eq name }">
       			<c:set var="nameValue" value=""/>
       		</c:if>
        </c:when>
        <c:otherwise>
        	<c:set var="nameValue" value="${value}" />
        </c:otherwise>
	</c:choose>
	
	<c:if test="${!empty codeid}">
    	
		<c:set var="codeDateName" value="commonCodeMap"/>
		<c:if test="${fn:indexOf(codeid,'.') >= 0 }" >
			<c:set var="tmpArray" 		value="${fn:split(codeid, '.')}" />
			<c:set var="codeDateName" value="${tmpArray[0]}"/>
			<c:set var="codeid" value="${tmpArray[1]}"/>
		</c:if>
    	<c:set var="codeItems" value="${applicationScope[codeDateName][codeid]}"/>
    	<c:forEach items="${codeItems}" var="codeItem">
    		<c:if test="${nameValue eq codeItem.code }">
    			<c:set var="nameValue" value="${codeItem.codeNm }"/>
    		</c:if>
    	</c:forEach>
    </c:if>
    
    
    <div id="${fn:escapeXml(id)}">
      <label for="${name}" ></label>
      <c:choose>
        <c:when test="${disableFormBinding}">
          <input id="${id}" name="${name}" type="${fn:escapeXml(type)}" ${disabled ? 'disabled':''}/>
        </c:when>
        <c:otherwise>
          <c:choose>
            <c:when test="${type eq 'password'}">
              <form:password path="${name}" id="${id}" disabled="${disabled}" />
            </c:when>
            <c:otherwise>
              <form:input path="${name}" id="${id}" disabled="${disabled}" value="${fn:escapeXml(nameValue)}"/>
            </c:otherwise>
          </c:choose>
        </c:otherwise>
      </c:choose>
      
      <c:choose>
        <c:when test="${required}">
          <spring:message code="field_required" var="field_required" htmlEscape="false" />
          <spring:message argumentSeparator="," arguments="${label},(${field_required})" code="field_simple_validation" var="field_validation" htmlEscape="false" />
        </c:when>
        <c:otherwise>
          <spring:message argumentSeparator="," arguments="${label}, " code="field_simple_validation" var="field_validation" htmlEscape="false" />
        </c:otherwise>
      </c:choose>
      <c:set var="sec_field_validation">
        <spring:escapeBody javaScriptEscape="true">${field_validation}</spring:escapeBody>
      </c:set>
      <c:set var="sec_name_invalid">
        <spring:escapeBody javaScriptEscape="true" htmlEscape="true">${field_invalid}</spring:escapeBody>
      </c:set>
      <c:set var="sec_name_required">
        <spring:escapeBody javaScriptEscape="true">${field_required}</spring:escapeBody>
      </c:set>
      <c:set var="sec_validation_regex" value="" />
      <c:if test="${!empty validationRegex}">
        <c:set var="sec_validation_regex" value="regExp : '${validationRegex}', " />
      </c:if>

    </div>

	<form:errors cssClass="errors"  path="${name}" />

