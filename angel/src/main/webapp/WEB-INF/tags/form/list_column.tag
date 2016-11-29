<%@ tag body-content="empty" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/utils" %>


<%-- <%@ attribute name="id"        type="java.lang.String"  required="false" rtexprvalue="true" description="The identifier for this tag" %> --%>
<%@ attribute name="property"  		type="java.lang.String"  required="true"  rtexprvalue="true" description="object of the member field.The property (field name) of the dataset to be displayed in a column (required)." %>
<%@ attribute name="maxLength" 		type="java.lang.Integer" required="false" rtexprvalue="true" description="Max displayed text length (default '10'). Unlimited if negative" %>
<%@ attribute name="label" 			type="java.lang.String"  required="false" rtexprvalue="true" description="The column label to be used in the table (optional)."%>
<%@ attribute name="labelCode" 		type="java.lang.String"  required="false" rtexprvalue="true" description="The column label to be used in the table (optional).used the spring message tag "%>
<%@ attribute name="dateFormat"     type="java.lang.String" required="false" rtexprvalue="true" description="The date / time pattern to use if the field is a date or calendar type" %>


<%@ attribute name="link" 			type="java.lang.String"  required="false" rtexprvalue="true" description="동적인 링크를 구성하는데 사용되는 베이스 URL"%>			
<%@ attribute name="paramName" 		type="java.lang.String"  required="false" rtexprvalue="true" description="생성되는 link URL에 동적으로 추가될  파람 아이디.paramValue와 paramScope가 지정되지 않았을경우  반복(iterated) 중인 현재 객체의 값과 대응된다."%>			
<%@ attribute name="paramValue" 	type="java.lang.String"  required="false" rtexprvalue="true" description="생성되는 link URL에 동적으로 추가되는   파람 아이디의  대응값 ,paramScope 가 지정되지 않았을경우 할당된 텍스트가  paramId 에 값으로 대응된다."%>		
<%-- <%@ attribute name="paramScope" 	type="java.lang.String"  required="false" rtexprvalue="true" description="property,request,session,application"%> --%> 		
<%@ attribute name="target" 		type="java.lang.String"  required="false" rtexprvalue="true" description="동적 링크에 추가될 'target' html 속성"%>			
<%@ attribute name="sort" 			type="java.lang.Boolean" required="false" rtexprvalue="true" description="정렬기능 사용 여부 (기본 false)"%>			
<%@ attribute name="autoLink" 		type="java.lang.Boolean" required="false" rtexprvalue="true" description="컬럼 속에 나타나는 URL들과 email 주소들을 자동적으로 하이퍼링크로 만든다. 디폴트는 'false'. "%>

<%@ attribute name="read" 			type="java.lang.Boolean" required="false" rtexprvalue="true" description="자동 읽기 페이지 링크 생성한다."%>
<%@ attribute name="codeid" 		type="java.lang.String"  required="false" rtexprvalue="true" description="코드 매핑"%>			

<%@ attribute name="replace"        type="java.lang.String" required="false" rtexprvalue="true" description="se char is ',' arg0 oldchar, arg1 is newchar" %>			

	<!-- 모듈(프로그램)아이디 지정 이값을 어디다 지정을 해야할지 추후생각하지 지금은 다른기능 만들어야 하기때문데 임시로 설정한다.-->
	<c:if test="${empty moduleName}">
		<c:set var="moduleName" value="defmod"/>
	</c:if>
	<c:if test="${not empty moduleName}">
		<c:set var="moduleName" value="${fn:toLowerCase(moduleName)}"/>
	</c:if>

	<!-- 라벨설정 라벨속성이 널이면 "메세지 프로퍼티 파일" 에서 참조하고 프로퍼티에서도 없으면 property 속성으로 설정한다.  -->
   	<c:if test="${empty label}">
      <c:catch var="exception">
      	<spring:message  code="label_${moduleName}_${fn:toLowerCase(property)}" var="label" htmlEscape="false" />
      </c:catch>
      <c:if test="${not empty exception }">
      	<c:set var="label" value="${property}"/>
      </c:if>
    </c:if>
	<!-- 라벨코드 속성이 널이 아니면 spring message tag를 사용하여 라벨을 설정 한다.  -->
   	<c:if test="${not empty labelCode}">
      <c:catch var="exception">
      	<spring:message  code="${labelCode}" var="label" htmlEscape="false" />
      </c:catch>
      <c:if test="${not empty exception }">
      	<c:set var="label" value="${property}"/>
      </c:if>
    </c:if>
    
   

    <!-- 컬럼 라벨및 글자수 오토링크 아이디 등 설정 -->
    <c:choose>
      <c:when test="${empty columnProperties}">
        <c:set var="columnProperties"   value="${property}" scope="request" />
        <c:set var="columnLabels" 	    value="${label}" scope="request" />
        <c:set var="columnMaxLengths"   value="${empty maxLength ? 10 : maxLength}" scope="request" />
        <c:set var="columnSorts" 	    value="${empty sort ? false:sort}" scope="request" />			
		<c:set var="columnAutoLinks"    value="${empty autoLink ? false:autoLink}" scope="request" />
		
		<c:set var="columnLinks" 	    value="${empty link ? 'none': link}" scope="request" />		
		<c:set var="columnParamNames" 	value="${empty param ? 'none':param}" scope="request" />		
		<c:set var="columnParamValues"  value="${empty paramValue ?  paramId:paramValue}" scope="request" />		
		<%-- <c:set var="columnParamScopes" value="${empty paramScope ? 'property':paramScope}" scope="request" />	 --%>	
		<c:set var="columnLinkTargets"  value="${empty target ? 'none':target}" scope="request" />	
		
		<c:set var="columnReads" 	    value="${read ? read: false}" scope="request" />	
		<c:set var="columnDateFormats"  value="${empty dateFormat ? 'none': dateFormat}" scope="request" />	
		<c:set var="columnReplaces" 	value="${empty replace ? 'none': replace}" scope="request" />		
      </c:when>
      <c:otherwise>
        <c:set var="columnProperties"   value="${columnProperties},${property}" scope="request" />
        <c:set var="columnLabels"       value="${columnLabels},${label}" scope="request" />
        <c:set var="columnMaxLengths"   value="${columnMaxLengths},${empty maxLength ? 25 : maxLength}" scope="request" />
        <c:set var="columnSorts" 	    value="${columSorts},${empty sort ? false:sort}" scope="request" />			
		<c:set var="columnAutoLinks"    value="${columAutoLinks},${empty autoLink ? false:autoLink}" scope="request" />
		
		 <c:set var="columnLinks" 	    value="${columnLinks},${empty link ? 'none':link}" scope="request" />		
		 <c:set var="columnParams" 	    value="${columnParams},${empty param ? 'none':param}" scope="request" />		
		 <c:set var="columnParamValues" value="${columParamValues},${empty paramValue ?  paramId:paramValue}" scope="request" />		
		 <%--  <c:set var="columnParamScopes" value="${columParamScopes},${empty paramScope ? 'property':paramScope}" scope="request" />		 --%>
		 <c:set var="columnLinkTargets" value="${columnLinkTargets},${empty target ? 'none':target}" 	scope="request" />	
		 
		 <c:set var="columnReads" 	    value="${columnReads},${read ? read:false}" scope="request" />
      	 <c:set var="columnDateFormats" value="${columnDateFormats},${empty dateFormat ? 'none':dateFormat}" scope="request" />
      	 <c:set var="columnReplaces" 	value="${columnReplaces},${empty replace ? 'none':replace}" scope="request" />	
      </c:otherwise>
    </c:choose>
    

	