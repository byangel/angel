<%@ tag body-content="scriptless" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ attribute name="name"      type="java.lang.String" required="true" rtexprvalue="true" description="The name exposed from the form backing object" %>
<%@ attribute name="id"        type="java.lang.String" required="false" rtexprvalue="true" description="The identifier for this tag" %>
<%@ attribute name="value"     type="java.lang.Object" required="false" rtexprvalue="true" description="" %>
<%@ attribute name="cssClass"  type="java.lang.String" required="false" rtexprvalue="true" description="Equivalent to 'class' - HTML Optional Attribute" %>

<%@ attribute name="disabled"  type="java.lang.Boolean" required="false" rtexprvalue="true" description="Specify if this name should be enabled" %>
<%@ attribute name="readonly"  type="java.lang.Boolean" required="false" rtexprvalue="true" description="readonly" %>
<%@ attribute name="required"  type="java.lang.Boolean" required="false" rtexprvalue="true" description="Indicates if this name is required (default false)" %>
<%@ attribute name="disableFormBinding" type="java.lang.Boolean" required="false" rtexprvalue="true" description="Set to true to disable Spring form binding" %>

<%@ attribute name="parsePattern"  	type="java.lang.String" required="false" rtexprvalue="true" description="use when value type is String"%>
<%@ attribute name="pattern"   	   	type="java.lang.String" required="false" rtexprvalue="true" description="use when value type is Date"%>

<%@ attribute name="datepicker"   	   	type="java.lang.Boolean" required="false" rtexprvalue="true" description="date picker option"%>

	<%-- 기본 Input 속성 --%>
	<c:set var="id" value="${empty id ? name:id}" /><%--input attribute id ,null value is  name value injection to id attribute--%>
	<c:set var="value" value="${fn:trim(value)}"/>
	<c:set var="disableFormBinding" value="${empty disableFormBinding ? false:disableFormBinding}"/>
	<c:set var="required" value="${empty required ? false:required}" />
	
	<c:set var="disabled" value="${empty disabled ? 'false':disabled}"/>
	<c:set var="readonly" value="${empty readonly ? 'false':readonly}"/>
	
	<%-- value 값 이 있다면 데이타 바인딩 기능을 사용하지 않는다. --%>
	<c:if test="${empty value}">
		<c:if test="${! disableFormBinding}"><%--폼 데이타 바인딩 기능이 fals 면  command(vo) 에서 name 매핑 값을 가져와서 value 에 값을 대입한다."command" 라는 이름은 고정이다.--%>
			<c:set var="value" value="${command[name]}" />
	   		<c:if test="${empty value}">
	   			<c:set var="value" value="${searchCmd[name]}" />
	   		</c:if>
		</c:if> 
	</c:if>
	
	<c:set var="datepicker" value="${empty datepicker ? 'true':datepicker}"/>
	<%-- Default pattern Setting --%>
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
			<fmt:formatDate  var="value" value="${value}"  pattern="${pattern}"/>
		</c:when>
	</c:choose>
	
	
	<%-- 대상 이름 설정 --%>
	
	
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
	
	
	<c:if test="${datepicker }">
		<c:set var="jqueryId" value="#${id}"/>
		<script language="javascript" type="text/javascript">
			$(function() {
				var option = {};
				
				option.dateFormat = "${dateFormat}";
				
				option = $.extend({},dateTimePickerOption, option);
				
				$("${jqueryId}").datepicker(option);
			}); 
		</script>
	</c:if>
	
	<%-- input size 설정 --%>
	<c:set var="maxlength" value="${fn:length(pattern)}"/>
	
	<input type="text" name="${name}"  id="${id}" value="${value}" class="${cssClass}" maxlength="${maxlength}" size="${maxlength}" ${disabled ? 'disabled':''} ${readonly ? 'readonly':''}/>
	
	
	
	