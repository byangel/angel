<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="utils" tagdir="/WEB-INF/tags/utils" %>

<c:set var="ctxPath" value="${pageContext.request.contextPath}" scope="request"/>
<%-- 
<c:set var="_requestUri" value="${requestScope['javax.servlet.forward.request_uri']}" scope="request"/>
<c:set var="_requestUri" value="${sessionScope._requestUri}" scope="request"/>
<c:set var="_menuNm" value="${sessionScope._menuNm}" scope="request"/> 
--%>
<c:out value="${sessionScope._requestUri}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	    <meta name="viewport" content="width=device-width, initial-scale=1"/>
	    <meta name="description" content=""/>
	    <meta name="author" content=""/>
	    <!-- <link rel="shortcut icon" href="../../assets/ico/favicon.ico"/> -->
			
		<title>Systme Layout</title>
		
		<!-- CSS INCLUDE-->
	 	<spring:url value="/css/system/css/bootstrap.css" var="bootstrapCssUrl" />
	 	<spring:url value="/css/system/css/custom-bootstrap.css" var="customBootstrapCssUrl" />
	 	<link href="${bootstrapCssUrl}" media="screen" rel="stylesheet" type="text/css" />
	 	<link href="${customBootstrapCssUrl}" media="screen" rel="stylesheet" type="text/css" />
	 	
	 	<!-- 
	 		html5shiv.js 는 익스플로러가 html5 의 구문을 모르기때문에 알려주는 역할.
	 		respond.min.js 는 익스플로러가 미디어쿼리를 지원하지 않기때문에 지원할하고 넣어준다.
	 	 -->
	 	<!-- Just for debugging purposes. Don't actually copy this line! -->
	    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
	
	    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
	    
	 	<!-- JS INCLUDE -->
		<link   type="text/css"        href="${ctxPath}/css/default/css/bootstrap.css"              rel="stylesheet" media="screen"/>
	 	<link   type="text/css"        href="${ctxPath}/css/default/css/custom-bootstrap.css"       rel="stylesheet"   media="screen"/>
	 	<link   type="text/css"        href="${ctxPath}/css/default/css/jquery-ui-timepicker-addon.css" rel="stylesheet"/><!-- TIMEPICKER -->
		<link   type="text/css"        href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"  rel="stylesheet"/><!-- JQUERY INCLUDE -->
		<script type="text/javascript" src ="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script><!-- JQUERY INCLUDE -->
		<script type="text/javascript" src ="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script><!-- JQUERY INCLUDE -->
		<script type="text/javascript" src ="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.js"></script><!-- 벨리데이션 -->
		<script type="text/javascript" src ="http://malsup.github.com/jquery.form.js"></script><!-- 벨리데이션 -->
		<script type="text/javascript" src ="http://cdnjs.cloudflare.com/ajax/libs/json3/3.3.2/json3.min.js"></script>
		<script type="text/javascript" src ="${ctxPath}/css/default/js/bootstrap.js"></script>
		<script type="text/javascript" src ="${ctxPath}/js/jquery-ui-timepicker-addon.js"></script>
		<script type="text/javascript" src ="${ctxPath}/js/common-event.js"></script><!-- 시스템 공통 -->
		<script type="text/javascript" src ="${ctxPath}/js/common-plugin.js"></script><!-- 시스템 공통 -->
		<script type="text/javascript" src ="${ctxPath}/js/jQuery.print.js"></script><!-- 프린트 -->
		<script type="text/javascript" src ="${ctxPath}/jsp/ckeditor/ckeditor.js"></script><!-- 웹에디터 -->
	
		<!-- CKEDITOR INCLUDE -->
		<%-- <script type="text/javascript" src="${ctxPath}/common/ckeditor_3.4.2/ckeditor.js"></script>
		<script type="text/javascript" src="${ctxPath}/common/ckeditor_3.4.2/adapters/jquery.js"></script>	 --%>
		
		<!-- ALERT MESSAGE -->
		<c:if test="${!empty sessionScope.RETURN_MSG}">
		    <spring:message var="msg" code="${sessionScope.RETURN_MSG}" text="${sessionScope.RETURN_MSG}"/>
	        <script type="text/javascript">
				$(function(){
					alert("${msg}");
				});
			</script>
			<c:remove var="RETURN_MSG" scope="session"/>
			<c:remove var="msg"/>
		</c:if> 
		
	</head>
	
	<body>
		<tiles:insertAttribute name="header" />
	    <div class="container">
			<tiles:insertAttribute name="contents" />
	    </div> 
	     <tiles:insertAttribute name="footer" />
	</body>
	
</html>


