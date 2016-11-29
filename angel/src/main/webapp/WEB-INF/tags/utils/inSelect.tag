<!-- author 김용성 2014.06.25 -->
<%@ tag body-content="scriptless" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ attribute name="name"      type="java.lang.String" required="true"  rtexprvalue="true" description="The name exposed from the form backing object" %>
<%@ attribute name="id"        type="java.lang.String" required="false" rtexprvalue="true" description="The identifier for this tag" %>
<%@ attribute name="value"     type="java.lang.String" required="false" rtexprvalue="true" description="" %>
<%@ attribute name="cssClass"  type="java.lang.String" required="false" rtexprvalue="true" description="Equivalent to 'class' - HTML Optional Attribute" %>

<%@ attribute name="disabled"  type="java.lang.Boolean" required="false" rtexprvalue="true" description="Specify if this name should be enabled" %>
<%@ attribute name="readonly"  type="java.lang.Boolean" required="false" rtexprvalue="true" description="readonly" %>
<%@ attribute name="required"  type="java.lang.Boolean" required="false" rtexprvalue="true" description="Indicates if this name is required (default false)" %>
<%@ attribute name="disableFormBinding" type="java.lang.Boolean" required="false" rtexprvalue="true" description="Set to true to disable Spring form binding" %>
<%-- 기본 input 속성 끝 --%>

<%@ attribute name="title" 		type="java.lang.String"  required="false" rtexprvalue="true" description="HTML Standard Attribute" %>
<%@ attribute name="multiple" 	type="java.lang.Boolean" required="false" rtexprvalue="true" description="Specify if the select box should allow multiple selections" %> 
<%@ attribute name="size" 	    type="java.lang.String" required="false" rtexprvalue="true" description="Data Type Number, multiple size" %> 

<%@ attribute name="emptyMsg" 	type="java.lang.String"  required="false" rtexprvalue="true" description="" %>

<%@ attribute name="codeid" 	type="java.lang.String"  required="false" rtexprvalue="true" description="코드아이디" %>
<%@ attribute name="emptyValue" type="java.lang.String"  required="false" rtexprvalue="true" description="기본값 (아무것도 선택하지 않았을때 기본값 설정)" %>
<%@ attribute name="include" 	type="java.lang.String"  required="false" rtexprvalue="true" description="해당 코드만 포함시킨다.['code1,code2...']" %>
<%@ attribute name="exclude" 	type="java.lang.String"  required="false" rtexprvalue="true" description="해당 코드만 제외시킨다.['code1,code2...']" %>

<%@ attribute name="itemValue" 	type="java.lang.String"  required="false" rtexprvalue="true" description="Name of the property mapped to 'value' attribute of the 'option' tag" %>
<%@ attribute name="itemLabel" 	type="java.lang.String"  required="false" rtexprvalue="true" description="Name of the property mapped to the inner text of the 'option' tag" %>
<%@ attribute name="items" 		type="java.lang.Object"  required="false" rtexprvalue="true" description="The name of the collection displayed in the text" %>

<%-- 상위 코드 --%>
<%@ attribute name="optionClassValue" 	type="java.lang.String"  required="false" rtexprvalue="true" description="Name of the property mapped to 'class' attribute of the 'option' tag" %>


<%@ tag import = "java.util.List" %>
<%@ tag import = "java.util.ArrayList" %>
<%@ tag import = "java.util.Map" %>
<%@ tag import = "java.util.StringTokenizer" %>
<%
	Object items = (Object)jspContext.getAttribute("items");

	if(items == null){
		String codeDataName;
		Map codeListMap = null;
	
		String codeid = (String)jspContext.getAttribute("codeid");
		StringTokenizer codeidTokens = new StringTokenizer(codeid,",");
		
		String tmpCodeid = null;
		String[] strArray;
		List itemsList = new ArrayList();
		while(codeidTokens.hasMoreTokens()){
			codeDataName = "COMMON_CODE";
			tmpCodeid = codeidTokens.nextToken().trim();
			if(tmpCodeid.indexOf(".") >= 0){
				strArray = tmpCodeid.split("\\.");
				codeDataName = strArray[0];
				tmpCodeid    = strArray[1];
			}
			codeListMap = (Map)application.getAttribute(codeDataName);
			if(codeListMap.containsKey(tmpCodeid)){
				itemsList.addAll((List)codeListMap.get(tmpCodeid));
			}
		}
		jspContext.setAttribute("items",itemsList);
	}else{
		String classType = items.getClass().getName();
		jspContext.setAttribute("itemsType",classType);
	}
%>

	<%-- 기본 Input 속성 --%>
	<c:set var="id" value="${empty id ? name:id}" /><%--input attribute id ,null value is  name value injection to id attribute--%>
	<c:set var="value" value="${fn:trim(value)}"/>
	<c:set var="disableFormBinding" value="${empty disableFormBinding ? false:disableFormBinding}"/>
	<c:set var="required" value="${empty required ? false:required}" />
	
	<c:set var="disabled" value="${empty disabled ? 'false':disabled}"/>
	<c:set var="readonly" value="${empty readonly ? 'false':readonly}"/>
	<c:set var="disabled" value="${readonly ? 'true':disabled}"/><%-- readonly true 이면 disabled true 로 셋팅한다. --%>
	
	<c:set var="multiple" value="${empty multiple ? 'false':multiple}"/>
	
	
	
	
	<%-- value 값 이 있다면 데이타 바인딩 기능을 사용하지 않는다. --%>
	<c:if test="${empty value}">
		<c:if test="${! disableFormBinding}"><%--폼 데이타 바인딩 기능이 fals 면  command(vo) 에서 name 매핑 값을 가져와서 value 에 값을 대입한다."command" 라는 이름은 고정이다.--%>
			<c:set var="value" value="${command[name]}" />
	   		<c:if test="${empty value}">
	   			<c:set var="value" value="${searchCmd[name]}" />
	   		</c:if>
		</c:if> 
	</c:if>
	
	<c:if test="${empty size}">
		<c:set var="size" value="0" />
	</c:if>
	
	<%-- items 객체 타입이 Map 이면 itemValue 와 itemLabel 속성 default 값을 각각 key와 value 로 셋팅 해준다. --%>
	<c:if test="${itemsType eq 'java.util.LinkedHashMap' or itemsType eq 'java.util.HashMap'}">
		<c:set var="itemLabel" value="${empty itemLabel ? 'key':itemLabel}"/>
		<c:set var="itemValue" value="${empty itemValue ? 'value':itemValue}"/>
	</c:if> 
	<%-- itemValue 와 itemLabel 속성값이 없을때 default 값 설정 --%>
	<c:set var="itemLabel" value="${empty itemLabel ? 'detail_cd_nm':itemLabel}"/>
	<c:set var="itemValue" value="${empty itemValue ? 'detail_cd':itemValue}"/>
	
	
	<select  name="${name}" id="${id}" ${disabled ? 'disabled':''} ${multiple ? 'multiple':''}  title="${title}" class="${cssClass}" size="${size}">
		<c:if test="${not empty emptyMsg}">
			<option label="${emptyMsg}" value="${emptyValue}"/>
		</c:if>
		<c:forEach var="result" items="${items}" >
		 	<%-- include --%>
		 	<c:forTokens var="includeItem" items="${include}" delims=","  varStatus="i">
		 		<c:if test="${includeItem eq result[itemValue] or includeItem eq result[itemLabel]}">
		 			<c:set var="sumItemLabel" value=""/>
		 			<c:forTokens var="tokensItemLabel" items="${itemLabel}" delims=","  varStatus="i">
		 				<c:set var="sumItemLabel" value="${sumItemLabel} ${result[tokensItemLabel]}"/>
		 			</c:forTokens>
		 			<option  label="${sumItemLabel}" value="${result[itemValue]}" class="${empty optionClassValue  ? '':result[optionClassValue]}" <c:out value="${result[itemValue] eq value ? 'selected':''}"/> />
		 		</c:if>
			</c:forTokens>
		 	<%-- exclude --%>
		 	<c:if test="${empty include and not empty exclude}">
			 	<c:set var="excludeAt" value="false"/>
			 	<c:forTokens items="${exclude}" delims="," var="excludeItem" varStatus="i">
			 	  		<c:if test="${excludeItem eq result[itemValue] or excludeItem eq result[itemLabel]}">
			 	  			<c:set var="excludeAt" value="true"/>
			 	  		</c:if>
			 	</c:forTokens>
			 	
			 	<c:if test="${!excludeAt}">
			 		<c:set var="sumItemLabel" value=""/>
		 			<c:forTokens var="tokensItemLabel" items="${itemLabel}" delims=","  varStatus="i">
		 				<c:set var="sumItemLabel" value="${sumItemLabel} ${result[tokensItemLabel]}"/>
		 			</c:forTokens>
			 		<option  label="${sumItemLabel}" value="${result[itemValue]}" class="${empty optionClassValue  ? '':result[optionClassValue]}" <c:out value="${result[itemValue] eq value ? 'selected':''}"/> />
			 	</c:if>
		 	</c:if>
		 	
		 	<%-- default --%>  		
		 	<c:if test="${(empty include) and (empty exclude)}">
		 		<c:set var="sumItemLabel" value=""/>
	 			<c:forTokens var="tokensItemLabel" items="${itemLabel}" delims=","  varStatus="i">
	 				<c:set var="sumItemLabel" value="${sumItemLabel} ${result[tokensItemLabel]}"/>
	 			</c:forTokens>
		 		<option  label="${sumItemLabel}" value="${result[itemValue]}" class="${empty optionClassValue  ? '':result[optionClassValue]}" <c:out value="${result[itemValue] eq value ? 'selected':''}"/> />
		 	</c:if>
		 </c:forEach>
		 <jsp:doBody />
	</select>
	<c:if test="${readonly}">
		<input type="hidden" name="${name}" id="${id}" value="${value}"/>
	</c:if>
		
				