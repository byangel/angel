<%@ tag body-content="scriptless" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="utils" tagdir="/WEB-INF/tags/utils" %>

	<spring:theme code="styleSheet" var="css" />
	<spring:theme code="bootstrap" var="bootstrapCss" />
	<spring:theme code="bootstrapResponsive" var="bootstrapResponsiveCss" />
 	<spring:url value="${css}" var="css_url" />
 	<spring:url value="${bootstrapCss}" var="bootstrap_css_url" />
 	<spring:url value="${bootstrapResponsiveCss}" var="bootstrapResponsive_css_url" />
 	
 	<%-- <link href="${css_url}" media="screen" rel="stylesheet" type="text/css" /> --%>
 	<link href="${bootstrap_css_url}" media="screen" rel="stylesheet" type="text/css" />
 	<link href="${bootstrapResponsive_css_url}" media="screen" rel="stylesheet" type="text/css" />
	<!-- J-QUERY INCLUDE -->
	<link   href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet"  type="text/css"/>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui-timepicker-addon.js"></script>
	
	<!-- CKEDITOR INCLUDE -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/common/ckeditor_3.4.2/ckeditor.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/common/ckeditor_3.4.2/adapters/jquery.js"></script>	
	<!-- COMMON JS INCLUDE  -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.event.js"></script>
	
	<!-- 부트스트랩 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
	
	<%-- <c:set var="_requestUri" value="${requestScope['javax.servlet.forward.request_uri']}" scope="request"/> --%>
	<c:set var="_requestUri" value="${sessionScope._requestUri}" scope="request"/>
	<c:set var="_menuNm" value="${sessionScope._menuNm}" scope="request"/>
	<c:set var="_contextPath" value="${pageContext.request.contextPath}" scope="request"/>
