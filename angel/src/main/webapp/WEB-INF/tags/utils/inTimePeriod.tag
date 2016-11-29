<%@ tag body-content="scriptless" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="utils" tagdir="/WEB-INF/tags/utils" %>

<%@ attribute name="name"      type="java.lang.String" required="true" rtexprvalue="true" description="The name exposed from the form backing object" %>
<%@ attribute name="id"        type="java.lang.String" required="false" rtexprvalue="true" description="The identifier for this tag" %>
<%@ attribute name="value"     type="java.lang.String" required="false" rtexprvalue="true" description="" %>
<%@ attribute name="cssClass"  type="java.lang.String" required="false" rtexprvalue="true" description="Equivalent to 'class' - HTML Optional Attribute" %>

<%@ attribute name="disabled"  type="java.lang.Boolean" required="false" rtexprvalue="true" description="Specify if this name should be enabled" %>
<%@ attribute name="readonly"  type="java.lang.Boolean" required="false" rtexprvalue="true" description="readonly" %>
<%@ attribute name="required"  type="java.lang.Boolean" required="false" rtexprvalue="true" description="Indicates if this name is required (default false)" %>
<%@ attribute name="disableFormBinding" type="java.lang.Boolean" required="false" rtexprvalue="true" description="Set to true to disable Spring form binding" %>

<%@ attribute name="title"  type="java.lang.String" required="false" rtexprvalue="true" description="title Attribute of input tag" %>

<%@ attribute name="parsePattern"  	type="java.lang.String" required="false" rtexprvalue="true" description="use when value type is String"%>
<%@ attribute name="pattern"   	   	type="java.lang.String" required="false" rtexprvalue="true" description="use when value type is Date"%>

	<%-- name 속성값이 있다면. --%>
	<c:set var="name"    value="${fn:split(name, ',')}" />
	<c:set var="startName" value="${fn:trim(name[0])}"/>
	<c:set var="endName"   value="${fn:trim(name[1])}"/>
	
	
	<c:if test="${not empty id}"><%-- id 속성 값이 있다면. --%>
		<c:set var="id" value="${fn:split(id, ',')}" />
		<c:set var="startId" value="${id[0]}"/>
		<c:set var="endId" value="${id[1]}"/>
	</c:if>
	<c:if test="${empty id}"><%-- id 속성 없다면. --%>
		<c:set var="startId" value="${startName}"/>
		<c:set var="endId" value="${endName}"/>
	</c:if>
	
	<%-- value 속성값이 있다면. --%>
	<c:if test="${not empty value}">
		<c:set var="value" value="${fn:split(value, ',')}" />
		<c:set var="startValue" value="${value[0]}"/>
		<c:set var="endValue" value="${value[1]}"/>
	</c:if>
	
	<%-- Default pattern Setting --%>
	<c:set var="parsePattern" value="${empty parsePattern ? 'HH:mm':parsePattern}" />
	<c:set var="pattern" value="${empty pattern ? 'HH:mm':pattern}" />
	
	<%-- <c:set var="dateFormat" value="${fn:trim(tmpPattern[0])}"/> --%>
	<c:set var="timeFormat" value="${pattern}"/>
			
	<script language="javascript" type="text/javascript">
		$(function() {
			
			
			var startTarget = $("#${startId}");
			var endTarget = $("#${endId}");
			var option = {};
			
			option.buttonText='시간';//버튼 텍스트 달력->시간 변경
			option.timeFormat = "${timeFormat}";
			
			startOption = $.extend({},dateTimePickerOption, option);
			endOption = $.extend({},dateTimePickerOption, option);
			
			
			$.timepicker.timeRange(
					startTarget,
					endTarget,
					{
						minInterval: (1000*60*60), // 1hr
						start: startOption, // start picker options
						end: endOption // end picker options
					}
				);
		}); 
	</script>
	<utils:inDate name="${startName}" 
				id="${startId}" 
				cssClass="${cssClass}" 
				parsePattern="${parsePattern}" 
				pattern="${pattern}" 
				disabled="${disabled}" 
				disableFormBinding="${disableFormBinding}" 
				readonly="${readonly}" 
				required="${required}" 
				value="${startValue}"
				datepicker="false"
				/>
				~
	<utils:inDate name="${endName}" 
				id="${endId}" 
				cssClass="${cssClass}" 
				parsePattern="${parsePattern}" 
				pattern="${pattern}" 
				disabled="${disabled}" 
				disableFormBinding="${disableFormBinding}" 
				readonly="${readonly}" 
				required="${required}" 
				value="${endValue}"
				datepicker="false"
				/>