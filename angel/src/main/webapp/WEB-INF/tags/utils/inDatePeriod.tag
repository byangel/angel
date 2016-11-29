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
		<c:set var="startValue" value="${value[1]}"/>
	</c:if>
	
	<%-- Default pattern Setting --%>
	<c:set var="parsePattern" value="${empty parsePattern ? 'yyyy-MM-dd':parsePattern}" />
	<c:set var="pattern" value="${empty pattern ? 'yyyy-MM-dd':pattern}" />
	
	
	<%-- timepicker format setting
		jstl date format 는 "yyyy-MM-dd HH:mm:ss"
		datePicker 포맷은 "yy-mm-dd"
		timePicker 포맷은 "HH:mm:ss"
		*datetimepicker 에서 년월일과 시간 부분을 표현하기 위해서는 각각 dateFormat 과 timeFormat 두 옵션에 각각 설정을 해야하낟.
		jstl date format 과 최대한 동일하게 맞추기 위하여 년월일 과 시간부분을 " " 공백으로 구분하기로 한다.
		*년도를 표현하는 'yyyy' -> 'yy' 로 변경하고 'yy' -> 'y' 로 변경한다.
		*월 을 표현하는 대문자 'MM' 은 소문자 'mm' 으로 변경한다.  
	--%>
	<c:choose>
		<c:when test="${fn:indexOf(pattern,'yyyy') >= 0 }">
			<c:set var="tmpPattern" value="${fn:replace(pattern, 'yyyy','yy')}" />
		</c:when>
		<c:when test="${fn:indexOf(pattern,'yyyy') <= 0 }">
			<c:set var="tmpPattern" value="${fn:replace(pattern, 'yy','y')}" />
		</c:when>
	</c:choose>
	
	<%-- 'MM' -> 'mm' --%>
	<c:set var="dateFormat" value="${fn:replace(tmpPattern, 'MM','mm')}" />
	
	<script language="javascript" type="text/javascript">
		$(function() {
			
			
			var startTarget = $("#${startId}");
			var endTarget = $("#${endId}");
			var option = {};
			
			option.dateFormat = "${dateFormat}";
			
			startOption = $.extend({},dateTimePickerOption, option);
			endOption = $.extend({},dateTimePickerOption, option);
			
			startOption.onSelect = function (selectedDateTime){
				if (endTarget.val() != '') {
					var startDate = endTarget.datetimepicker('getDate');
					var endDate = endTarget.datetimepicker('getDate');
					if (startDate > endDate)
						endTarget.datetimepicker('setDate', startDate);
				}
				else {
					endTarget.val(selectedDateTime);
				}
				endTarget.datetimepicker('option', 'minDate', startTarget.datetimepicker('getDate') );
			};
			
			$.timepicker.dateRange(
					startTarget,
					endTarget,
					{
						//minInterval: (1000*60*60*24*4), // 4 days
						//maxInterval: (1000*60*60*24*8), // 8 days
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
				value="${startValue}"
				datepicker="false"
				/>