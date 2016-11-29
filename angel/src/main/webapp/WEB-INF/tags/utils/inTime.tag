<%@ tag body-content="scriptless" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ attribute name="name"      		type="java.lang.String" required="true" rtexprvalue="true" description="The name exposed from the form backing object" %>
<%@ attribute name="id"        		type="java.lang.String" required="false" rtexprvalue="true" description="The identifier for this tag" %>
<%@ attribute name="value"     		type="java.lang.Object" required="false" rtexprvalue="true" description="" %>
<%@ attribute name="cssClass"  		type="java.lang.String" required="false" rtexprvalue="true" description="Equivalent to 'class' - HTML Optional Attribute" %>

<%@ attribute name="disabled"  		type="java.lang.Boolean" required="false" rtexprvalue="true" description="Specify if this name should be enabled" %>
<%@ attribute name="readonly"  		type="java.lang.Boolean" required="false" rtexprvalue="true" description="readonly" %>
<%@ attribute name="required"  		type="java.lang.Boolean" required="false" rtexprvalue="true" description="Indicates if this name is required (default false)" %>
<%@ attribute name="disableFormBinding" type="java.lang.Boolean" required="false" rtexprvalue="true" description="Set to true to disable Spring form binding" %>

<%@ attribute name="parsePattern"  	type="java.lang.String" required="false" rtexprvalue="true" description="use when value type is String"%>
<%@ attribute name="pattern"   	   	type="java.lang.String" required="false" rtexprvalue="true" description="use when value type is Date"%>

<%@ attribute name="datepicker"   	type="java.lang.Boolean" required="false" rtexprvalue="true" description="date picker option"%>

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
	
	<%-- Default pattern Setting --%>
	<c:set var="parsePattern" value="${empty parsePattern ? 'HH:mm':parsePattern}" />
	<c:set var="pattern" value="${empty pattern ? 'HH:mm':pattern}" />
	
	
	<c:set var="ty" value="${fn:indexOf(pattern,'HH') >= 0 ? ty+1:0}" />
	<c:set var="ty" value="${fn:indexOf(pattern,'mm') >= 0 ? ty+2:ty}" />
	<c:set var="ty" value="${fn:indexOf(pattern,'ss') >= 0 ? ty+4:ty}" />
	
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
	<c:if test="${datepicker }">
	<c:set var="jqueryId" value="#${id}"/>
	<script language="javascript" type="text/javascript">
		$(function() {
			var option = {};
			option.timeOnly=true;
			option.buttonText='시간';//버튼 텍스트 달력->시간 변경
			option.timeFormat = "${pattern}";
			option = $.extend({},dateTimePickerOption, option);
			
			$("${jqueryId}").timepicker(option);
		}); 
	</script>
	</c:if>	
	
	<%-- input size 설정 --%>
	<c:set var="maxlength" value="${fn:length(pattern)}"/>
	
	<input type="text" name="${name}"  id="${id}" value="${value}" class="${cssClass}" maxlength="${maxlength}" size="${maxlength}" ${disabled ? 'disabled':''} ${readonly ? 'readonly':''}/>
	
	
	
	