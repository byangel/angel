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
			
		<title>Rest Layout</title>
		
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
		<div class="container"><!-- class="container-fluid" -->
			<tiles:insertAttribute name="header" />
			
			<div class="row">
				<div class="col-sm-3 col-md-2 sidebar">
					<tiles:insertAttribute name="left" />
				</div>
				<!-- <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main"> -->
				<div class="col-sm-9  col-md-10  main">
						<tiles:insertAttribute name="contents" />
				</div>
			</div>
					<tiles:insertAttribute name="footer" />
		</div>
	</body>
	
</html>














    <!-- <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
            <li><a href="#">Reports</a></li>
            <li><a href="#">Analytics</a></li>
            <li><a href="#">Export</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item</a></li>
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
            <li><a href="">More navigation</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">Dashboard</h1>

          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
          </div>

          <h2 class="sub-header">Section title</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Header</th>
                  <th>Header</th>
                  <th>Header</th>
                  <th>Header</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1,001</td>
                  <td>Lorem</td>
                  <td>ipsum</td>
                  <td>dolor</td>
                  <td>sit</td>
                </tr>
                <tr>
                  <td>1,002</td>
                  <td>amet</td>
                  <td>consectetur</td>
                  <td>adipiscing</td>
                  <td>elit</td>
                </tr>
                <tr>
                  <td>1,003</td>
                  <td>Integer</td>
                  <td>nec</td>
                  <td>odio</td>
                  <td>Praesent</td>
                </tr>
                <tr>
                  <td>1,003</td>
                  <td>libero</td>
                  <td>Sed</td>
                  <td>cursus</td>
                  <td>ante</td>
                </tr>
                <tr>
                  <td>1,004</td>
                  <td>dapibus</td>
                  <td>diam</td>
                  <td>Sed</td>
                  <td>nisi</td>
                </tr>
                <tr>
                  <td>1,005</td>
                  <td>Nulla</td>
                  <td>quis</td>
                  <td>sem</td>
                  <td>at</td>
                </tr>
                <tr>
                  <td>1,006</td>
                  <td>nibh</td>
                  <td>elementum</td>
                  <td>imperdiet</td>
                  <td>Duis</td>
                </tr>
                <tr>
                  <td>1,007</td>
                  <td>sagittis</td>
                  <td>ipsum</td>
                  <td>Praesent</td>
                  <td>mauris</td>
                </tr>
                <tr>
                  <td>1,008</td>
                  <td>Fusce</td>
                  <td>nec</td>
                  <td>tellus</td>
                  <td>sed</td>
                </tr>
                <tr>
                  <td>1,009</td>
                  <td>augue</td>
                  <td>semper</td>
                  <td>porta</td>
                  <td>Mauris</td>
                </tr>
                <tr>
                  <td>1,010</td>
                  <td>massa</td>
                  <td>Vestibulum</td>
                  <td>lacinia</td>
                  <td>arcu</td>
                </tr>
                <tr>
                  <td>1,011</td>
                  <td>eget</td>
                  <td>nulla</td>
                  <td>Class</td>
                  <td>aptent</td>
                </tr>
                <tr>
                  <td>1,012</td>
                  <td>taciti</td>
                  <td>sociosqu</td>
                  <td>ad</td>
                  <td>litora</td>
                </tr>
                <tr>
                  <td>1,013</td>
                  <td>torquent</td>
                  <td>per</td>
                  <td>conubia</td>
                  <td>nostra</td>
                </tr>
                <tr>
                  <td>1,014</td>
                  <td>per</td>
                  <td>inceptos</td>
                  <td>himenaeos</td>
                  <td>Curabitur</td>
                </tr>
                <tr>
                  <td>1,015</td>
                  <td>sodales</td>
                  <td>ligula</td>
                  <td>in</td>
                  <td>libero</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div> -->


