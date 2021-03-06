<%@ tag body-content="scriptless" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="in" tagdir="/WEB-INF/tags/form" %>

<%@ attribute name="id"       type="java.lang.String" required="false" rtexprvalue="true" description="The identifier for this tag" %>
<%@ attribute name="name"    type="java.lang.String" required="true" rtexprvalue="true" description="The name exposed from the form backing object" %>
<%@ attribute name="value"    type="java.lang.String" required="false" rtexprvalue="true" description="The identifier used as value in the select box (defaults to 'id' for non enum types)" %>
<%@ attribute name="disabled" type="java.lang.Boolean" required="false" rtexprvalue="true" description="Specify if this name should be enabled" %>
<%@ attribute name="codeid"   type="java.lang.String"  required="false" rtexprvalue="true" description="전화번호 첫번째 인풋이 코드로 정의 되어있을때 셀레트박스로 표현해준다." %>

	<c:set var="value" value="${fn:trim(value)}"/>
	
	<c:if test="${empty id}">
		<c:set var="id" value="${name}" />
	</c:if>
	
	<c:choose>
	        <c:when test="${empty value}">
	       		<spring:eval var="nameValue" expression="name" />
	       		<c:if test="${nameValue eq name }">
	       			<c:set var="nameValue" value=""/>
	       		</c:if>
	        </c:when>
	        <c:otherwise>
	        	<c:set var="nameValue" value="${value}" />
	        </c:otherwise>
	</c:choose>

	<label for="${name}"></label>

	<c:set var="nameValue" value="${fn:replace(nameValue,',','-')}"  />
	<c:set var="nameValues" value="${fn:split(nameValue, '-')}" />

	
	<c:choose>
		<c:when test="${empty codeid}">
			<input type="text" name="${name}" id="${id}" value="${nameValues[0]}" maxlength="4" size="3" ${disabled ? 'disabled':''}/>
		</c:when>
		<c:otherwise>
			<in:inSelect name="${name}" codeid="${codeid}" value="${nameValues[0]}" disabled="${disabled}" disableFormBinding="true"/>		        	
		</c:otherwise>
	</c:choose>
	-<input type="text" name="${name}" id="${id}" value="${nameValues[1]}" maxlength="4" size="3" ${disabled ? 'disabled':''}/>
	-<input type="text" name="${name}" id="${id}" value="${nameValues[2]}" maxlength="4" size="3" ${disabled ? 'disabled':''}/>
	
	<input type="hidden" name="${name}"/>
	<form:errors cssClass="errors"  path="${name}" />
