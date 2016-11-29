<%@ tag body-content="scriptless" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ attribute name="id"     type="java.lang.String" required="false" rtexprvalue="true" description="The identifier for this tag" %>
<%@ attribute name="cssClass"  type="java.lang.String" required="false" rtexprvalue="true" description="Equivalent to 'class' - HTML Optional Attribute" %>
<%@ attribute name="name"     type="java.lang.String" required="true" rtexprvalue="true" description="The name exposed from the form backing object" %>
<%@ attribute name="value"     type="java.lang.String" required="false" rtexprvalue="true" description="" %>
<%@ attribute name="type"      type="java.lang.String" required="true" rtexprvalue="true" description="[date|dateTime|time|dateTimeSec|timeSec]" %>

<%@ attribute name="disabled"  type="java.lang.Boolean" required="false" rtexprvalue="true" description="Specify if this name should be enabled" %>
<%@ attribute name="readonly"  type="java.lang.Boolean" required="false" rtexprvalue="true" description="readonly" %>
<%@ attribute  name="required" type="java.lang.Boolean" required="false" rtexprvalue="true" description="Indicates if this name is required (default false)" %>
<%@ attribute name="disableFormBinding" type="java.lang.Boolean" required="false" rtexprvalue="true" description="Set to true to disable Spring form binding" %>

<%@ attribute name="datePattern"  type="java.lang.String" required="false" rtexprvalue="true" description="value fmt:formatDate 날자값이 Date값일때 쓴다." %>
<%@ attribute name="strDatePatterns"  type="java.lang.String" required="false" rtexprvalue="true" description="first value fmt:parseDate , last value fmt:formatDate 날자 값이 Strgin 타입일때 쓴다." %>


	<c:if test="${empty disableFormBinding}">
		<c:set var="disableFormBinding" value="false"/>
	</c:if>
	
	<c:if test="${empty required}">
	  <c:set value="false" var="required" />
	</c:if>
	    
	<c:if test="${empty id}">
		<c:set var="id" value="${name}" />
	</c:if>  
	
	<c:if test="${! disableFormBinding}">
		<spring:eval var="value" expression="command[name]" />
   		<c:if test="${value eq name }">
   			<c:set var="value" value=""/>
   		</c:if>
	</c:if>
	
	<c:if test="${not empty strDatePatterns}">
		<c:set var="strDatePatterns" value="${fn:split(strDatePatterns, ',')}"/> 
	    <fmt:parseDate   var="value"  value="${value}"  pattern="${strDatePatterns[0]}"/>
		<fmt:formatDate  var="value"  value="${value}"  pattern="${strDatePatterns[1]}"/>
	    
	</c:if>
	<c:if test="${not empty datePattern}">
	    <fmt:formatDate  var="value"  value="${value}"  pattern="${datePattern}"/>
	</c:if>
	
	
	<c:set var="jqueryId" value="#${id}"/>
	
	<c:choose>
		<c:when test="${type eq 'date'}">
			<c:set var="maxlength" value="10"/>
			<c:set var="size" value="9"/>
			<script language="javascript" type="text/javascript">
				$(function() {
					$("${jqueryId}").datepicker(clareCalendar);
				}); 
			</script>
		</c:when>
		
		<c:when test="${type eq 'dateTime'}">
			<c:set var="maxlength" value="16"/>
			<c:set var="size" value="15"/>
			<script language="javascript" type="text/javascript">
				$(function() {
					$("${jqueryId}").datetimepicker(clareCalendar);
				}); 
			</script>
		</c:when>
		
		<c:when test="${type eq 'dateTimeSec'}">
			<c:set var="maxlength" value="19"/>
			<c:set var="size" value="18"/>
			<script language="javascript" type="text/javascript">
				$(function() {
					$("${jqueryId}").datetimepicker($.extend({},clareCalendar, {timeFormat: 'HH:mm:ss',showSecond: true}));
				}); 
			</script>
		</c:when>
		
		<c:when test="${type eq 'time'}">
			<c:set var="maxlength" value="5"/>
			<c:set var="size" value="4"/>
			<script language="javascript" type="text/javascript">
				$(function() {
					$("${jqueryId}").timepicker(clareCalendar);
				}); 
			</script>
		</c:when>
		
		<c:when test="${type eq 'timeSec'}">
			<c:set var="maxlength" value="8"/>
			<c:set var="size" value="7"/>
			<script language="javascript" type="text/javascript">
				
				$(function() {
					$("${jqueryId}").timepicker($.extend({},clareCalendar, {timeFormat: 'HH:mm:ss',showSecond: true}));
				}); 
			</script>
		</c:when>
		<c:otherwise>
			<c:set var="maxlength" value="10"/>
			<c:set var="size" value="9"/>
			<script language="javascript" type="text/javascript">
				$(function() {
					$("${jqueryId}").datepicker(clareCalendar);
				}); 
			</script>
		</c:otherwise>
	</c:choose>
	
	<input type="text" name="${name}"  id="${id}" value="${value}" class="${cssClass}" maxlength="${maxlength}" size="${size}" ${disabled ? 'disabled':''} ${readonly ? 'readonly':''}/>
	<%-- <c:choose>
		<c:when test="${disableFormBinding}">
			<input type="text" name="${name}"  id="${id}" value="${value}" class="${cssClass}" maxlength="${maxlength}" size="${size}" ${disabled ? 'disabled':''} ${readonly ? 'readonly':''}/>
		</c:when>
		<c:otherwise>
			<form:input  path="${name}" id="${id}" cssClass="${cssClass}" maxlength="${maxlength}" size="${size}" disabled="${disabled}"  readonly="${readonly}" />
		</c:otherwise>
	</c:choose> --%>
