<%@ tag body-content="empty" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="utils" tagdir="/WEB-INF/tags/utils" %>


	<%@ attribute name="value"      type="java.lang.String"  required="true"  rtexprvalue="true" description="field value" %>
	<%@ attribute name="formatDate" type="java.lang.String" required="false" rtexprvalue="true" description="value 객체가 Date 타입일 경우 사용 가능하다.attribute 'pattern' of fmt:formatDate tag " %>
	<%@ attribute name="strDate"    type="java.lang.String" required="false" rtexprvalue="true" description="string date parse 후 formatDate - ex)'yyyy/MM/dd,yyyy-mm-dd'" %>
	<%@ attribute name="codeid"     type="java.lang.String"  required="false" rtexprvalue="true" description="코드 매핑" %>
	<%@ attribute name="replace"    type="java.lang.String" required="false" rtexprvalue="true" description="se char is ',' arg0 oldchar, arg1 is newchar-&comma" %>			
	<%@ attribute name="maxLength" 	type="java.lang.Integer" required="false" rtexprvalue="true" description="Max displayed text length (default '10'). Unlimited if negative" %>
	
	<%@ attribute name="href" 	    type="java.lang.String"  required="false" rtexprvalue="true" description="a태그로 감싼다.동적인 링크를 구성하는데 사용되는 베이스 URL"%>			
	<%@ attribute name="title" 	    type="java.lang.String"  required="false" rtexprvalue="true" description=" a tag of attribute 'target' "%>			
	<%@ attribute name="cssClass"   type="java.lang.String"  required="false" rtexprvalue="true" description=" a tag of attribute 'class' "%>			
	<%@ attribute name="target"     type="java.lang.String"  required="false" rtexprvalue="true" description=" a tag of attribute 'title' "%>
			
	<%@ attribute name="formatNumber"   type="java.lang.String"  required="false" rtexprvalue="true" description=" attribute 'pattern' of fmt:formatNumber tag   "%>
	
	<%@ attribute name="autolink" 		type="java.lang.Boolean" required="false" rtexprvalue="true" description="컬럼 속에 나타나는 URL들과 email 주소들을 자동적으로 하이퍼링크로 만든다. 디폴트는 'false'. "%>


		<c:if test="${!empty formatDate}">
         	<fmt:formatDate var="value" value="${fn:escapeXml(value)}" pattern="${fn:escapeXml(formatDate)}" /> 
        </c:if>
		<%-- <c:if test="${!empty strDate}">
         	<utils:strDate var="value" value="${fn:escapeXml(value)}" pattern="${fn:escapeXml(strDate)}" /> 
        </c:if> --%>
 		
		<c:if test="${!empty codeid}">
			<utils:code value="${value}" codeid="${codeid}"/>
		</c:if>
		
		<c:if test="${!empty formatNumber}">
			<fmt:formatNumber  var="value" value="${value}" pattern="${fn:escapeXml(formatNumber)}"/>
		</c:if>
 		
 		<c:if test="${not empty replace}">
			<c:set var="oldNewChar" 	value="${fn:split(replace, ',')}" />
 			<c:set var="oldChar" 	value="${oldNewChar[0] eq '&comma' ? ',':oldNewChar[0]}" />
 			<c:set var="newChar" 	value="${oldNewChar[1] eq '&comma' ? ',': oldNewChar[1]}" />
         	<c:set value="${fn:replace(value,oldChar,newChar)}" var="value" />
		</c:if>
      
		<c:if test="${maxLength ge 0}">
			<c:set value="${fn:substring(value, 0, maxLength)}" var="value" />
		</c:if>
	
		<c:if test="${not empty href}">
			<c:if test="${empty target}">
				<c:set var="target" value="_self"/>
			</c:if>
			<c:if test="${empty title}">
				<c:set var="title" value="${value}"/>
			</c:if>
			<a href="${fn:escapeXml(href)}" target="${target}" title="${title}" class="${cssClass}">
				<c:out value="${fn:escapeXml(value)}" />
			</a>
		</c:if>
		<c:if test="${empty href}">
			<c:out value="${fn:escapeXml(value)}" />
		</c:if>
	
