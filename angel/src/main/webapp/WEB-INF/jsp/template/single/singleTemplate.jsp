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
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate  var="currentYear" value="${now}" pattern="yyyy" scope="request"/>
<%-- 
<c:set var="_requestUri" value="${requestScope['javax.servlet.forward.request_uri']}" scope="request"/>
<c:set var="_requestUri" value="${sessionScope._requestUri}" scope="request"/>
<c:set var="_menuNm" value="${sessionScope._menuNm}" scope="request"/> 
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	    <meta name="viewport" content="width=device-width, initial-scale=1"/>
	    <meta name="description" content=""/>
	    <meta name="author" content=""/>
	    <!-- <link rel="shortcut icon" href="../../assets/ico/favicon.ico"/> -->
			
		<title>Single Layout</title>
		
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
		<div class="container-fluid">
			<tiles:insertAttribute name="contents" />
		</div>
	</body>
</html>


