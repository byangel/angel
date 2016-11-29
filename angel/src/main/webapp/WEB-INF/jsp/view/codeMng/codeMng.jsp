<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="utils" tagdir="/WEB-INF/tags/utils" %>
	
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
	<script type="text/javaScript" language="javascript" >
		$(function(){
			//코드ID
			$("#cmmnCdList").load(function(){
				$(this).iframeAutoHeight();
				
				$(this).contents().delegate('.choice','click', function(){
					var params = $(this).attr("class").split(" ");
					var cmmnCdViewURL = "<c:url value='/single/cmmnCdRead.do'/>?cl_cd="+params[1]+"&cd_id="+params[2];
					var detailListURL = "<c:url value='/single/detailCdList.do'/>?searching&cl_cd="+params[1]+"&cd_id="+params[2];
					$("#cmmnCdView").attr("src",cmmnCdViewURL);
					$("#detailCodeList").attr("src",detailListURL);
					return false;
				});
			});
			
			$("#cmmnCdView").load(function(){
				$(this).iframeAutoHeight();
			});
			
			
			//상세코드
			$("#detailCodeList").load(function(){
				$(this).iframeAutoHeight();
				
				$(this).contents().delegate('.choice','click', function(){
					var params = $(this).attr("class").split(" ");
					var detailCdViewURL = "<c:url value='/single/detailCdRead.do'/>?cl_cd="+params[1]+"&cd_id="+params[2]+"&detail_cd="+params[3];
					$("#detailCdView").attr("src",detailCdViewURL);
					return false;
				});
				
			});
			
			$("#detailCdView").load(function(){
				$(this).iframeAutoHeight();
			});
		});
	</script>					

	<div class="row">
		<a href="/single/clCdList.do" target="_blank" id="clCdBtn">클래스코드 관리</a>
		<div class="col-md-6 col-sm-6">
			<iframe name="cmmnCdList" 	  id="cmmnCdList"       src="<c:url value='/single/cmmnCdList.do'/>" 		 width="100%" height="" frameborder="0px" scrolling="no" title="코드ID"></iframe>
		</div>
		<div class="col-md-1 col-sm-1"> <span class="glyphicon glyphicon-chevron-right" ></span> </div>
			
		<div class="col-md-5 col-sm-5">
			<iframe name="cmmnCdView" 	  id="cmmnCdView"       src="<c:url value='/single/cmmnCdRead.do'/>" 		 width="100%" height="" frameborder="0px" scrolling="no" title="코드ID"></iframe>
		</div>
	</div>																   
	<div class="row">
		<div class="col-md-6 col-sm-6">
			<iframe name="detailCodeList" id="detailCodeList" src="<c:url value='/single/detailCdList.do'/>" width="100%" height="" frameborder="0px" scrolling="no" title="상세코드"></iframe>
		</div>
		<div class="col-md-1 col-sm-1"> <span class="glyphicon glyphicon-chevron-right" ></span> </div>
		
		<div class="col-md-5 col-sm-5">
			<iframe name="detailCdView" id="detailCdView" src="/single/detailCdRead.do" width="100%" height="" frameborder="0px" scrolling="no" title="상세코드"></iframe>
		</div>
	</div>																   
	

	<br/>	<br/>	<br/>