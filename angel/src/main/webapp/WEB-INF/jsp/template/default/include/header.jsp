<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="utils" tagdir="/WEB-INF/tags/utils" %>

<%-- <sec:authentication property="principal"/>
<%--  <sec:authentication property="principal.objUserVo.author_cd" var="author_cd"/>
     
	<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
		<span class="icon-bar"></span>
      	<span class="icon-bar"></span>
      	<span class="icon-bar"></span>
    </button>
    <a class="brand" href="#">Project name</a>
    <div class="nav-collapse collapse">
    	<sec:authentication property="principal.objUserVo.author_cd" var="author_cd"/>
		${applicationScope.frontMenuMap[author_cd]}
		
		<p class="navbar-text pull-right">
			<sec:authorize ifAnyGranted="ROLE_USER">
            	Logged in as <a href="#" class="navbar-link"><sec:authentication property="principal.objUserVo.user_nm"/></a>
            	&nbsp;&nbsp;&nbsp;<a href="/logout" class="navbar-link">logOut</a>
            </sec:authorize>
        </p>
		
    </div>
 --%>  
    
	<div class="navbar navbar-inverse" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Project name</a>
			</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="/codeMng.do">코드관리</a></li>
				<li><a href="/bbsMasterList.do">게시판 관리</a></li>
				<li><a href="#contact">Contact</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li class="dropdown-header">Nav header</li>
						<li><a href="#">Separated link</a></li>
						<li><a href="#">One more separated link</a></li>
					</ul>
				</li>
			</ul>
		</div><!--/.nav-collapse -->
		</div>
	</div>
