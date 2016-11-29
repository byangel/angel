<%@ tag body-content="scriptless" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="utils" tagdir="/WEB-INF/tags/utils" %>

<%@ attribute name="commandName"  type="java.lang.String"  required="false" rtexprvalue="true" description="collection type data name - request 참조" %>
<%@ attribute name="multipart"    type="java.lang.Boolean" required="false" rtexprvalue="true" description="Indicate if this is a multipart form (default: false)"  %>
<%@ attribute name="label"        type="java.lang.String"  required="false" rtexprvalue="true" description="The label used for this object, will default to a message bundle if not supplied" %>
<%@ attribute name="action"       type="java.lang.String"  required="false" rtexprvalue="true" description="" %>
<%@ attribute name="method"       type="java.lang.String"  required="false" rtexprvalue="true" description="" %>
<%@ attribute name="summary"      type="java.lang.String"  required="false" rtexprvalue="true" description="summary thml태그 " %>
<%@ attribute name="caption"      type="java.lang.String"  required="false" rtexprvalue="true" description="caption html태그 " %>

	<%-- <c:if test="${empty label}">
      	<spring:message code="label_${fn:toLowerCase(fn:substringAfter(id,'_'))}" var="label" htmlEscape="false" />
	</c:if>  --%>
	
	<c:if test="${empty idField}">
      <c:set value="id" var="idField" />
    </c:if> 
    
	<c:set var="enctype" value="application/x-www-form-urlencoded"/>
    <c:if test="${multipart}">
      <c:set var="enctype" value="multipart/form-data"/>
    </c:if>
    
	<c:if test="${empty commandName }">
		<c:set var="commandName" value="command"/>
	</c:if>

	<spring:message arguments="${label}" code="entity_create" var="title_msg" htmlEscape="false" />
	
	 
	<form:form action="${fn:escapeXml(action)}" method ="post" enctype="${enctype}" commandName="${commandName}">
		<form:errors cssClass="errors" delimiter="&lt;p/&gt;"/>
		
        <jsp:doBody />
        
       <div class="submit" id="${fn:escapeXml(id)}_submit">
          <spring:message code="button_save" var="save_button" htmlEscape="false" />
          <input id="proceed" type="submit" value="${fn:escapeXml(save_button)}"/>
        </div> 
	</form:form>
	
	
	${list_form_url }
   <spring:url value="/design/images/common/list.png" var="list_image_url" />
     <spring:message arguments="${label}" code="entity_list_all" var="list_label" htmlEscape="false" />
     <a href="" title="${fn:escapeXml(list_label)}">
       <img alt="${fn:escapeXml(list_label)}" class="image" src="${fn:escapeXml(list_image_url)}" title="${fn:escapeXml(list_label)}" />
     </a>
       
       
       
       
      