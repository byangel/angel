<%@ tag body-content="scriptless" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/utils" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/form" %>

<%@ attribute name="id"              type="java.lang.String"     required="false" rtexprvalue="true" description="The identifier for this tag " %>
<%@ attribute name="cssClass"        type="java.lang.String" required="false" rtexprvalue="true" description="Equivalent to 'class' - HTML Optional Attribute" %>
<%@ attribute name="items"           type="java.util.Collection" required="true"  rtexprvalue="true" description="collection type items name - request 참조" %>
<%-- crud url 자동생성은 util:path 태그에 위임한다. <%@ attribute name="path" 		     type="java.lang.String" required="false" rtexprvalue="true" description="Specify the URL path,정렬, 내보내기, 페이징이나. 링크들 requestURI 속성의 값을 사용하여 형성된다. " %> --%>
<%@ attribute name="typeIdFieldName" type="java.lang.String"     required="false" rtexprvalue="true" description="The identifier field name for the type (defaults to 'id')" %>
<%@ attribute name="paramFieldNames" type="java.lang.String"     required="false" rtexprvalue="true" description="기본 crudl url자동생성시 추가 파라메타" %>

<%-- 
<%@ attribute name="summary"   type="java.lang.String" required="false"  rtexprvalue="true" description="table summary " %>
<%@ attribute name="caption"   type="java.lang.String" required="false"  rtexprvalue="true" description="table caption " %>

<%@ attribute name="style"     type="java.lang.String" required="false" rtexprvalue="true" description="style 속성에  전달되는 html" %>
<%@ attribute name="cssClass"  type="java.lang.String" required="false" rtexprvalue="true" description="class 속성에 전달되는 html" %> 
--%>
<%@ attribute name="create"   type="java.lang.Boolean" required="false" rtexprvalue="true" description="테이블에 'create' 링크  포함 여부(기본값  true)" %>
<%@ attribute name="read"     type="java.lang.Boolean" required="false" rtexprvalue="true" description="테이블에 'read' 링크  포함 여부(기본값  true)" %>
<%@ attribute name="update"   type="java.lang.Boolean" required="false" rtexprvalue="true" description="테이블에 'update' 링크  포함 여부 (기본값 true)" %>
<%@ attribute name="delete"   type="java.lang.Boolean" required="false" rtexprvalue="true" description="테이블에 'delete' 링크  포함 여부 (기본값 true)" %>
<%@ attribute name="serial"   type="java.lang.Boolean" required="false" rtexprvalue="true" description="테이블에 'serial' 컬럼  포함 여부 (기본값 false)" %>
<%@ attribute name="checkbox" type="java.lang.Boolean" required="false" rtexprvalue="true" description="테이블에 'checkbox' 컬럼  포함 여부 (기본값 false)" %>


    <spring:message code="label_${fn:toLowerCase(fn:substringAfter(id,'_'))}" var="label" htmlEscape="false" />
    <spring:message var="typeName" code="menu_item_${fn:toLowerCase(fn:split(id,'_')[fn:length(fn:split(id,'_')) - 1])}_new_label" htmlEscape="false" />
	<%-- <c:if test="${empty summary}">
      <spring:message arguments="${typeName}" code="entity_list" var="summary" htmlEscape="false" />
    </c:if>
	
	<c:if test="${empty caption}">
      <spring:message arguments="${typeName}" code="entity_list" var="caption" htmlEscape="false" />
    </c:if> --%>
	
	<c:if test="${empty typeIdFieldName}">
      <c:set var="typeIdFieldName" value="id" />
    </c:if>

    <c:if test="${empty update}">
      <c:set var="update" value="true" />
    </c:if>

    <c:if test="${empty read}">
      <c:set var="read" value="true" />
    </c:if>
    <c:if test="${empty delete}">
      <c:set var="delete" value="true" />
    </c:if>
    <c:if test="${empty serial}">
      <c:set var="serial" value="true" />
    </c:if>
    <c:if test="${empty checkbox}">
      <c:set var="checkbox" value="true" />
    </c:if>

    
    
	<c:set var="columnProperties" 	scope="request" />
    <c:set var="columnLabels" 		scope="request" />
   
    
    <c:set var="columnLinks" 		scope="request" />
    <c:set var="columnParamNames" 	scope="request" />
    <c:set var="columnParamValues" 	scope="request" />
    <c:set var="columnLinkTargets" 	scope="request" />
    <%-- <c:set var="columnParamScopes" 	scope="request" /> --%>
    
    <c:set var="columnMaxLengths" 	scope="request" />
    <c:set var="columnDateFormats"  scope="request" />
    <c:set var="colummSorts" 		scope="request" />
    <c:set var="colummAutoLinks" 	scope="request" />  
    <c:set var="colummReads" 		scope="request" />
    <c:set var="columnReplaces" 	scope="request" />
	
    <jsp:doBody/>
   
    <c:set var="links" 		value="${fn:split(columnLinks, ',')}" />
    <c:set var="paramNames" 	value="${fn:split(columnParamNames, ',')}" />
    <c:set var="paramValues" 	value="${fn:split(columnParamValues, ',')}" />
    <c:set var="columnLinkTargets" 	value="${fn:split(columnLinkTargets, ',')}" />
    <%-- <c:set var="columnParamScopes" 	scope="request" /> --%>
    
    <c:set var="maxLengths" 	value="${fn:split(columnMaxLengths, ',')}" />
    <c:set var="dateFormats"  value="${fn:split(columnDateFormats, ',')}" />
    <c:set var="sorts" 		value="${fn:split(colummSorts, ',')}" />
    <c:set var="autoLinks" 	value="${fn:split(colummAutoLinks, ',')}" />  
    <c:set var="reads" 		value="${fn:split(colummReads, ',')}" />
    
    <c:set var="replaces" 	value="${fn:split(columnReplaces, ',')}" />

	<c:set var="colCounter" value="0" />
 	<table summary="${summary}" class="${cssClass}">
 		<%-- <util:pagination type="info" commandName="command" pageNo="pageNo" pageSize="pageSize" groupSize="groupSize" totalCount="totalCount"/> --%>
		<caption>${caption}</caption>

		<thead>
        	<tr>
				<%-- <!-- 커맨드객체값참조하여 오름차순 내림차순 반대 속성 설정해준다. -->
				<c:set var="oderType" value="asc"/>
				<c:if test="${command.oderType eq 'asc'}">
					<c:set var="oderType" value="desc"/>
				</c:if> --%>
				<c:if test="${serial}">
		            <th></th>
		            <c:set var="colCounter" value="${colCounter+1}" />
		    	</c:if>
				<c:forTokens items="${columnLabels}" delims="," var="columnHeading">
					<th>
						<%-- <c:if test="${sort}"><!-- 전체리스트 정렬 -->
							<c:url var="sort_url" value="/">
								<c:param name="sortFieldName">${property}</c:param>
								<c:param name="oder">${oderType}</c:param>
							</c:url>
							<a href="${fn:escapeXml(sort_url)}" title="${oderType == 'desc'? '오름차순':'내림차순'}정렬"><c:out value='${title}'/></a>
						</c:if> --%>
		              	<c:out value="${columnHeading}" />
		              	<c:set var="colCounter" value="${colCounter+1}" />
		            </th>
				</c:forTokens>
				<c:if test="${read}">
		            <th></th>
		            <c:set var="colCounter" value="${colCounter+1}" />
		    	</c:if>
				<c:if test="${update}">
		            <th></th>
		            <c:set var="colCounter" value="${colCounter+1}" />
		    	</c:if>
				<c:if test="${delete}">
	            	<th></th>
	            	<c:set var="colCounter" value="${colCounter+1}" />
				</c:if>
        	</tr>
		</thead>
		<tbody>
		<c:forEach items="${items}" var="item"  varStatus="i">
			<tr>
				<c:if test="${serial}">
					<td><%-- <util:listIdx toCnt="${command.totalCount}" pgNo="${command.pageNo}" pgSize="${command.pageSize}" idxNum="${i.index}"/> --%> </td>
				</c:if>
				<c:forTokens items="${columnProperties}" delims="," var="column" varStatus="num">
			  		<c:set var="columnMaxLength"  value="${maxLengths[num.count-1] eq 'none' ? '':maxLengths[num.count-1]}" />
			  		<c:set var="dateFormat" 	  value="${dateFormats[num.count-1]eq 'none' ? '':dateFormats[num.count-1]}" />
			  		<c:set var="replace" 	      value="${replaces[num.count-1]   eq 'none' ? '':replaces[num.count-1]}" />
			  		<c:set var="typeIdField" 	  value="${typeIdFields[num.count-1]eq 'none' ? '':typeIdFields[num.count-1]}" />
			  		<td>
			  			<util:dispOut value="${item[column]}" dateFormat="${dateFormat}" replace="${replace}" maxLength="${columnMaxLength}"/>
					</td>
				</c:forTokens>
		
		
		 		<c:set var="typeIdFieldValue"><spring:eval expression="item[typeIdFieldName]"/></c:set>
				<%-- 나중에 파람을 축가해야하면 paramNames 와 paramValues 속성을 이용하여 처리하자...파람 이름과 값을 한번에 처리할 방법도 찾아보자--%>
				<c:set var="paramFieldValues" value=""/>
				<c:forTokens items="${paramFieldNames}" delims="," var="paramFieldName" varStatus="i">
					<c:choose>
				      	<c:when test="${empty paramFieldValues}">
							 <c:set var="paramFieldValues"><spring:eval expression="item[paramFieldName]"/></c:set>
						</c:when>
						<c:otherwise>
							<c:set var="paramFieldValues">${paramFieldValues},<spring:eval expression="item[paramFieldName]"/></c:set>
				      	</c:otherwise>
					</c:choose>
				</c:forTokens>
				
	          	
	          	
	          	<!-- 읽기버튼 추가 -->
	          	<c:if test="${read}">
	          		<spring:message var="read_label" arguments="${typeName}" code="entity_read"  htmlEscape="false" />
	            	<c:url var="read_image_url" value="/design/images/common/read.png" />
	            	<%-- <util:path var="read_url" action="read" idValue="${typeIdFieldValue}" paramNames="${typeIdFieldNames}" paramValues="${paramFieldValues}"/> --%>
		          	<td>
						<a href="${typeIdFieldValue}"  title="${fn:escapeXml(read_label)}">
	              			<img alt="${fn:escapeXml(read_label)}" class="image" src="${fn:escapeXml(read_image_url)}" title="${fn:escapeXml(read_label)}" />
	            		</a>
		          	</td>
          		</c:if>
          		<!-- 수정버튼 추가 -->
	          	<c:if test="${update}">
	          		<spring:message var="update_label" arguments="${typeName}" code="entity_update"  htmlEscape="false" />
	              	<c:url var="update_image_url" value="/design/images/common/update.png"  />
	            	<%-- <util:path var="update_form_url" action="update" idValue="${typeIdFieldValue}"/> --%>
	            	<td>
		            	<a href="${typeIdFieldValue}?form"  title="${fn:escapeXml(update_label)}" >
							<img  src="${fn:escapeXml(update_image_url)}" class="image" title="${fn:escapeXml(update_label)}" alt="${fn:escapeXml(update_label)}"/>
		            	</a>
		            </td>
				</c:if>
          		<!-- 삭제버튼 추가 -->
	          	<c:if test="${delete}">
	          		<spring:message var="delete_label" arguments="${typeName}" code="entity_delete"  htmlEscape="false" />
	            	<c:url var="delete_image_url" value="/design/images/common/delete.png"  />
	            	
	            	<c:set var="delete_confirm_msg">
	                    <spring:escapeBody javaScriptEscape="true">
	                      <spring:message code="entity_delete_confirm" />
	                    </spring:escapeBody>
                  	</c:set>
	            	<td>
						<form:form action="${typeIdFieldValue}" method="DELETE">
							 <input type="image" alt="${fn:escapeXml(delete_label)}" class="image" src="${fn:escapeXml(delete_image_url)}" title="${fn:escapeXml(delete_label)}"  value="${fn:escapeXml(delete_label)}" onclick="return confirm('${fn:escapeXml(delete_confirm_msg)}');" />
						</form:form>
	            	</td>
				</c:if>
			</tr>
		</c:forEach>
		</tbody>
		<!-- 리스트 테이블 하단 "작성버튼" 및 "체크박스 삭제 버튼" -->
		<tfoot>
			<tr>
				<td colspan="${colCounter}">
					<spring:message var="create_label" arguments="${typeName}" code="entity_create"  htmlEscape="false" />
					<%-- <util:path var="create_form_url" action="create" idValue="${typeIdFieldValue}"/> --%>
					<a href="?form" target="${target}"  title="${fn:escapeXml(create_label)}" >
						<i class="icon-pencil" ></i>등록
					</a>
				</td>
			</tr>
		</tfoot>

	</table>
