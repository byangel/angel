<!-- author 김용성 2014.06.25 -->
<%@ tag body-content="empty" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
				
<%@ attribute name="codeid" type="java.lang.String"  required="true" rtexprvalue="true" description="코드아이디" %>
<%@ attribute name="value"  type="java.lang.String"  required="true"  rtexprvalue="true" description="코드아이디에 속한 코드값" %>
<%@ attribute name="defMsg" type="java.lang.String"  required="false"  rtexprvalue="true" description="매핑되는 코드가 없을때" %>
<%@ attribute name="items" 		type="java.lang.Object" required="false" rtexprvalue="true" description="The name of the collection and map displayed in the Object" %>
<%@ attribute name="itemValue" 	type="java.lang.String"  required="false"  rtexprvalue="true" description="Name of the property mapped to 'value' attribute of the 'code' tag" %>
<%@ attribute name="itemLabel" 	type="java.lang.String"  required="false"  rtexprvalue="true" description="Name of the property mapped to the inner text of the 'code' tag" %>

	<c:set var="value" value="${fn:trim(value)}"/>
	<c:set var="defMsg" value="${empty defMsg ? value:defMsg}"/>
	<c:set var="itemValue" value="${empty itemValue ? 'detail_cd':itemValue}"/>
	<c:set var="itemLabel" value="${empty itemLabel ? 'detail_cd_nm':itemLabel}"/>
	
	<c:set var="isMaping" value="true"/>
	<c:if test="${empty items and not empty value}">
		<c:forTokens var="tmpCodeid" items="${codeid}" delims=","  varStatus="i">
	 		
	 		<c:if test="${isMaping}">
		 		<c:set var="codeDataName" value="COMMON_CODE"/>
				<c:if test="${fn:indexOf(tmpCodeid,'.') >= 0 }" >
					<c:set var="tmpArray" 		value="${fn:split(tmpCodeid, '.')}" />
					<c:set var="codeDataName" value="${tmpArray[0]}"/>
					<c:set var="tmpCodeid" value="${tmpArray[1]}"/>
				</c:if>
				
				<c:set var="items" value="${applicationScope[codeDataName][tmpCodeid]}"/>
				
				<c:forEach var="result" items="${items}" varStatus="status" >	
					
					<c:if test="${isMaping}">
						<c:if test="${result[itemValue] eq value}">
							<c:set var="isMaping" value="false"/>
							<c:out value="${result[itemLabel]}"/>
						</c:if>
					</c:if>
				</c:forEach>
			</c:if>	
		</c:forTokens>
	</c:if>
	
	<c:if test="${not empty items and not empty value}">
		<c:forEach var="result" items="${items}" varStatus="status" >	
			<c:if test="${isMaping}">
				<c:if test="${result[itemValue] eq value}">
					<c:set var="isMaping" value="false"/>
					<c:out value="${result[itemLabel]}"/>
				</c:if>
			</c:if>
		</c:forEach>
	</c:if>
	
	<c:if test="${isMaping}">
		<c:out value="${defMsg}"/>
	</c:if>
		
	<c:if test="${empty value}">
		<c:out value="${defMsg}"/>
	</c:if>
	
	