<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="utils" tagdir="/WEB-INF/tags/utils" %>

<%-- <sec:authentication property="principal"/> --%>
 <sec:authentication property="principal.objUserVo.author_cd" var="author_cd"/>
<%-- <div class="navbar navbar-inverse navbar-fixed-top">
     <div class="navbar-inner">
      <div class="container">
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
	    	</div>
	    </div>
	</div>	 --%>
			
	<!-- <nav class="navbar navbar-inverse navbar-fixed-top"> -->
	<div class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Project name</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Dashboard</a></li>
					<li><a href="#">Settings</a></li>
					<li><a href="#">Profile</a></li>
					<li><a href="#">Help</a></li>
				</ul>
				<form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="Search...">
				</form>
			</div>
		</div>
	</div>
     
