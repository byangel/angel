<%@ tag body-content="scriptless" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ attribute name="names"    type="java.lang.String" required="true" rtexprvalue="true" description="The name exposed from the form backing object ex)'fromName,toName'" %>
<%@ attribute name="id"     type="java.lang.String" required="false" rtexprvalue="true" description="The identifier for this tag ex)'fromId,toId'" %>

<%@ attribute name="cssClass"  type="java.lang.String" required="false" rtexprvalue="true" description="Equivalent to 'class' - HTML Optional Attribute ex)'classFrom,classTo'" %>
<%@ attribute name="values"     type="java.lang.String" required="false" rtexprvalue="true" description="ex)'fromValue,toValue'" %>

<%@ attribute name="type"  type="java.lang.String" required="true" rtexprvalue="true" description="[date|dateTime|time|dateTimeSec|timeSec]" %>
<%@ attribute name="title"  type="java.lang.String" required="true" rtexprvalue="true" description="title Attribute of input tag" %>

<%@ attribute name="disabled"  type="java.lang.Boolean" required="false" rtexprvalue="true" description="Specify if this field should be enabled" %>
<%@ attribute name="readonly"  type="java.lang.Boolean" required="false" rtexprvalue="true" description="readonly" %>
<%@ attribute  name="required" type="java.lang.Boolean" required="false" rtexprvalue="true" description="Indicates if this field is required (default false)" %>

<%@ attribute name="disableFormBinding" type="java.lang.Boolean" required="false" rtexprvalue="true" description="Set to true to disable Spring form binding" %>

<%@ attribute name="parseDate"  type="java.lang.String" required="false" rtexprvalue="true" description="Parses the string representation of a date and/or time" %>
<%@ attribute name="formatDate"  type="java.lang.String" required="false" rtexprvalue="true" description="Formats a date and/or time using the supplied styles and pattern" %>

	
	<c:if test="${empty disableFormBinding}">
		<c:set var="disableFormBinding" value="false"/>
	</c:if>
	
	<c:set var="names"    value="${fn:split(names, ',')}" />
	<c:set var="fromName" value="${fn:trim(names[0])}"/>
	<c:set var="toName"   value="${fn:trim(names[1])}"/>
	
	<!-- value mapping -->
	<c:if test="${! disableFormBinding}">
		<spring:eval var="fromValue" expression="command[fromName]" />
   		<c:if test="${fromValue eq fromName }">
   			<c:set var="fromValue" value=""/>
   		</c:if>
		
		<spring:eval var="toValue" expression="command[toName]" />
   		<c:if test="${toValue eq toName }">
   			<c:set var="toValue" value=""/>
   		</c:if> 
	</c:if>
	
	<c:if test="${not empty values}">
		<c:set var="values" value="${fn:split(values, ',')}" />
		<c:set var="fromValue" value="${values[0]}"/>
		<c:set var="toValue" value="${values[1]}"/>
	</c:if>
	
	<c:if test="${not empty parseDate}">
	    <fmt:parseDate   var="fromValue"  value="${fromValue}"  pattern="${parseDate}"/>
	    <fmt:parseDate   var="toValue"  value="${toValue}"  pattern="${parseDate}"/>
	</c:if>
	<c:if test="${not empty formatDate}">
	    <fmt:formatDate  var="fromValue"  value="${fromValue}"  pattern="${formatDate}"/>
	    <fmt:formatDate  var="toValue"    value="${toValue}"  pattern="${formatDate}"/>
	</c:if>
        
        
				 	
	<c:if test="${empty id}">
		<c:set var="fromId" value="${fromName}" />
		<c:set var="toId" value="${toName}" />
	</c:if>
	
	<c:if test="${not empty id}">
		<c:set var="id" value="${fn:split(id, ',')}" />
		<c:set var="fromId" value="${id[0]}"/>
		<c:set var="toId" value="${id[1]}"/>
	</c:if>
	
	<c:if test="${not empty cssClass}">
		<c:set var="cssClass" value="${fn:split(cssClass, ',')}" />
		<c:set var="cssClassFrom" value="${cssClass[0]}"/>
		<c:set var="cssClassTo" value="${cssClass[1]}"/>
	</c:if>
	
	<c:if test="${empty required}">
	  <c:set var="required" value="false" />
	</c:if>
	
<c:choose>
	<c:when test="${type eq 'date'}">
		<c:set var="maxlength" value="10"/>
		<c:set var="size" value="9"/>
		<script language="javascript" type="text/javascript">
			$(function() {
				$("#${fromId}").datepicker(
						$.extend({},clareCalendar, {
							onSelect: function (selectedDateTime){
								var testStartDate = $("#${fromId}").datepicker('getDate');
								var testEndDate = $("#${toId}").datepicker('getDate');
								if (testStartDate > testEndDate){
									$("#${toId}").datepicker('setDate', testStartDate);
								}
								if (testEndDate != null){
									$("#${toId}").datepicker('setDate', testEndDate);
								}
								
								$("#${toId}").datepicker('option', 'minDate', $("#${fromId}").datepicker('getDate') );
							}	
							,dateFormat: "${formatDate == null ? 'yyyy-mm-dd':formatDate}"
						})
				);
				$("#${toId}").datepicker(
						$.extend({},clareCalendar, {
							onSelect: function (selectedDateTime){
								var testStartDate = $("#${fromId}").datepicker('getDate');
								var testEndDate = $("#${toId}").datepicker('getDate');
								if (testStartDate > testEndDate){
									$("#${fromId}").datepicker('setDate', testEndDate);
								}
								
								if (testStartDate == null){
									$("#${fromId}").datepicker('setDate', testEndDate);
								}else{
									$("#${fromId}").datepicker('setDate', testStartDate);
								}
								
								$("#${fromId}").datepicker('option', 'maxDate', $("#${toId}").datepicker('getDate') );
							}
							,dateFormat: 'yy-mm-dd'
						})
				);
			}); 
		</script>
	</c:when>
	<c:when test="${type eq 'dateTime'}">
		<c:set var="maxlength" value="16"/>
		<c:set var="size" value="15"/>
		<script language="javascript" type="text/javascript">
			$(function() {
				$("#${fromId}").datetimepicker(
						$.extend({},clareCalendar, {
							onSelect: function (selectedDateTime){
								var testStartDate = $("#${fromId}").datetimepicker('getDate');
								var testEndDate = $("#${toId}").datetimepicker('getDate');
								if (testStartDate > testEndDate){
									$("#${toId}").datetimepicker('setDate', testStartDate);
								}
								if (testEndDate != null){
									$("#${toId}").datetimepicker('setDate', testEndDate);
								}
								
								$("#${toId}").datetimepicker('option', 'minDate', $("#${fromId}").datetimepicker('getDate') );
							}	
							,dateFormat: 'yy-mm-dd'
							,timeFormat: 'HH:mm'
						})
				);
				$("#${toId}").datetimepicker(
						$.extend({},clareCalendar, {
							onSelect: function (selectedDateTime){
								var testStartDate = $("#${fromId}").datetimepicker('getDate');
								var testEndDate = $("#${toId}").datetimepicker('getDate');
								if (testStartDate > testEndDate){
									$("#${fromId}").datetimepicker('setDate', testEndDate);
								}
								
								if (testStartDate == null){
									$("#${fromId}").datetimepicker('setDate', testEndDate);
								}else{
									$("#${fromId}").datetimepicker('setDate', testStartDate);
								}
								
								$("#${fromId}").datetimepicker('option', 'maxDate', $("#${toId}").datetimepicker('getDate') );
							}
							,dateFormat: 'yy-mm-dd'
							,timeFormat: 'HH:mm'
						})
				);
			}); 
		</script>
	</c:when>
	<c:when test="${type eq 'dateTimeSec'}">
		<c:set var="maxlength" value="19"/>
		<c:set var="size" value="18"/>
		<script language="javascript" type="text/javascript">
			$(function() {
				$("#${fromId}").datetimepicker(
						$.extend({},clareCalendar, {
							onSelect: function (selectedDateTime){
								var testStartDate = $("#${fromId}").datetimepicker('getDate');
								var testEndDate = $("#${toId}").datetimepicker('getDate');
								if (testStartDate > testEndDate){
									$("#${toId}").datetimepicker('setDate', testStartDate);
								}
								if (testEndDate != null){
									$("#${toId}").datetimepicker('setDate', testEndDate);
								}
								
								$("#${toId}").datetimepicker('option', 'minDate', $("#${fromId}").datetimepicker('getDate') );
							}	
							,timeFormat:'HH:mm:ss'
							,showSecond: true
						})
				);
				$("#${toId}").datetimepicker(
						$.extend({},clareCalendar, {
							onSelect: function (selectedDateTime){
								var testStartDate = $("#${fromId}").datetimepicker('getDate');
								var testEndDate = $("#${toId}").datetimepicker('getDate');
								if (testStartDate > testEndDate){
									$("#${fromId}").datetimepicker('setDate', testEndDate);
								}
								
								if (testStartDate == null){
									$("#${fromId}").datetimepicker('setDate', testEndDate);
								}else{
									$("#${fromId}").datetimepicker('setDate', testStartDate);
								}
								
								$("#${fromId}").datetimepicker('option', 'maxDate', $("#${toId}").datetimepicker('getDate') );
							}
							,timeFormat:'HH:mm:ss'
							,showSecond: true
						})
				);
			}); 
		</script>
	</c:when>
	<c:when test="${type eq 'time'}">
		<c:set var="maxlength" value="5"/>
		<c:set var="size" value="4"/>
		<script language="javascript" type="text/javascript">
			$(function() {
				$("#${fromId}").timepicker(
						$.extend({},clareCalendar, {
							onSelect: function (selectedDateTime){
								var testStartDate = $("#${fromId}").timepicker('getDate');
								var testEndDate = $("#${toId}").timepicker('getDate');
								if (testStartDate > testEndDate){
									$("#${toId}").timepicker('setDate', testStartDate);
								}
								if (testEndDate != null){
									$("#${toId}").timepicker('setDate', testEndDate);
								}
								
								$("#${toId}").timepicker('option', 'minDate', $("#${fromId}").timepicker('getDate') );
							}	
						})
				);
				$("#${toId}").timepicker(
						$.extend({},clareCalendar, {
							onSelect: function (selectedDateTime){
								var testStartDate = $("#${fromId}").timepicker('getDate');
								var testEndDate = $("#${toId}").timepicker('getDate');
								if (testStartDate > testEndDate){
									$("#${fromId}").timepicker('setDate', testEndDate);
								}
								
								if (testStartDate == null){
									$("#${fromId}").timepicker('setDate', testEndDate);
								}else{
									$("#${fromId}").timepicker('setDate', testStartDate);
								}
								
								$("#${fromId}").timepicker('option', 'maxDate', $("#${toId}").timepicker('getDate') );
							}
						})
				);
			}); 
		</script>
	</c:when>
	
	<c:when test="${type eq 'timeSec'}">
		<c:set var="maxlength" value="8"/>
		<c:set var="size" value="7"/>
		<script language="javascript" type="text/javascript">
			$(function() {
				$("#${fromId}").timepicker(
						$.extend({},clareCalendar, {
							onSelect: function (selectedDateTime){
								var testStartDate = $("#${fromId}").timepicker('getDate');
								var testEndDate = $("#${toId}").timepicker('getDate');
								if (testStartDate > testEndDate){
									$("#${toId}").timepicker('setDate', testStartDate);
								}
								if (testEndDate != null){
									$("#${toId}").timepicker('setDate', testEndDate);
								}
								
								$("#${toId}").timepicker('option', 'minDate', $("#${fromId}").timepicker('getDate') );
							}	
							,timeFormat:'HH:mm:ss'
							,showSecond: true
						})
				);
				$("#${toId}").timepicker(
						$.extend({},clareCalendar, {
							onSelect: function (selectedDateTime){
								var testStartDate = $("#${fromId}").timepicker('getDate');
								var testEndDate = $("#${toId}").timepicker('getDate');
								if (testStartDate > testEndDate){
									$("#${fromId}").timepicker('setDate', testEndDate);
								}
								
								if (testStartDate == null){
									$("#${fromId}").timepicker('setDate', testEndDate);
								}else{
									$("#${fromId}").timepicker('setDate', testStartDate);
								}
								
								$("#${fromId}").timepicker('option', 'maxDate', $("#${toId}").timepicker('getDate') );
							}
							,timeFormat:'HH:mm:ss'
							,showSecond: true
						})
				);
			}); 
		</script>
	</c:when>
	<c:otherwise>
		<c:set var="maxlength" value="10"/>
		<c:set var="size" value="9"/>
		<script language="javascript" type="text/javascript">
			$(function() {
				$("#${fromId}").datepicker(
						$.extend({},clareCalendar, {
							onSelect: function (selectedDateTime){
								var testStartDate = $("#${fromId}").datepicker('getDate');
								var testEndDate = $("#${toId}").datepicker('getDate');
								if (testStartDate > testEndDate){
									$("#${toId}").datepicker('setDate', testStartDate);
								}
								if (testEndDate != null){
									$("#${toId}").datepicker('setDate', testEndDate);
								}
								
								$("#${toId}").datepicker('option', 'minDate', $("#${fromId}").datepicker('getDate') );
							}	
						})
				);
				$("#${toId}").datepicker(
						$.extend({},clareCalendar, {
							onSelect: function (selectedDateTime){
								var testStartDate = $("#${fromId}").datepicker('getDate');
								var testEndDate = $("#${toId}").datepicker('getDate');
								if (testStartDate > testEndDate){
									$("#${fromId}").datepicker('setDate', testEndDate);
								}
								
								if (testStartDate == null){
									$("#${fromId}").datepicker('setDate', testEndDate);
								}else{
									$("#${fromId}").datepicker('setDate', testStartDate);
								}
								
								$("#${fromId}").datepicker('option', 'maxDate', $("#${toId}").datepicker('getDate') );
							}
						})
				);
			}); 
		</script>
	</c:otherwise>
</c:choose>

<input type="text" name="${fromName}" id="${fromId}" value="${fromValue}" class="${cssClassFrom}" maxlength="${maxlength}" size="${size}" ${disabled ? 'disabled':''} ${readonly ? 'readonly':''}   title="${title}"/>
~
<input type="text" name="${toName}"   id="${toId}"   value="${toValue}" class="${cssClassTo}" maxlength="${maxlength}" size="${size}" ${disabled ? 'disabled':''} ${readonly ? 'readonly':''}    title="${title}"/>
      
<%-- <c:choose>
		<c:when test="${disableFormBinding}">
					<input type="text" name="${fromName}" id="${fromId}" value="${fromValue}" class="${cssClassFrom}" maxlength="${maxlength}" size="${size}" ${disabled ? 'disabled':''} ${readonly ? 'readonly':''}/>
		    	   ~
		    	    <input type="text" name="${toName}"   id="${toId}"   value="${toValue}" class="${cssClassTo}" maxlength="${maxlength}" size="${size}" ${disabled ? 'disabled':''} ${readonly ? 'readonly':''}/>
        </c:when>
        <c:otherwise>
					 <form:input path="${fromName}"  id="${fromId}" cssClass="${cssClassFrom}" maxlength="${maxlength}" size="${size}" disabled="${disabled}"  readonly="${readonly}" />
	       			~
	       			 <form:input path="${toName}"   id="${toId}"   cssClass="${cssClassTo}" maxlength="${maxlength}" size="${size}" disabled="${disabled}"  readonly="${readonly}" />
	       
        </c:otherwise>
</c:choose> --%>
