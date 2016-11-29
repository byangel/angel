<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="utils" tagdir="/WEB-INF/tags/utils" %>

<script type="text/javascript">
</script>


	<!-- 제목 -->
	<h2 class="sub-header"><c:out value="${bbsMasterVo.bbs_nm}"/></h2>
	<!-- 검색 폼 -->
	<table border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-bordered">
		<colgroup>
				<col width="120" />
				<col width="*" />
		</colgroup>				
		<tr>
			<td colspan="2">
				작성자 : <c:out value="${command.register_id}"/>  
				<span class="pull-right">등록일 : <fmt:formatDate  value="${command.regist_dt}"  pattern="yyyy-MM-dd hh:mm"/></span> 
			</td>
		</tr>
		<tr>
			<td colspan="2">제목 : <b><c:out value="${command.ntt_sj}"/></b> </td>
		</tr>
		<tr>
			<td colspan="2"> <c:out value="${command.ntt_cn}" escapeXml="false"/> </td>
		</tr>
		 
	</table>

	<div class="row pull-right">
		<div class="col-md-12">	
				<c:url var="updateURL" value="bbsNttUpdateForm.do">
					<c:param name="ntt_id" 	  value="${command.ntt_id}"/>
				</c:url>
				<c:url var="deleteURL" value="bbsNttDelete.do">
					<c:param name="ntt_id" 	  value="${command.ntt_id}"/>
				</c:url>
				<a href="bbsNttList.do?searchUse" class="btn btn-primary btn-sm" title="목록">목록</a>
				<a href="${updateURL}" class="btn btn-primary btn-sm" title="수정">수정</a>
				<a href="${deleteURL}" class="btn btn-primary btn-sm contentDelete" title="삭제">삭제</a>
		</div>	
	</div>
	
	
	
	<!-- 뎃글 -->
	<c:if test="${sessionScope.bbsMasterVo.answer_use_at eq 'Y'}">
		<script type="text/javascript">
			
			$(function(){
				//iframe 자동 높이 조절
				$("#ifm_bbsAnswer").load(function(){
					$(this).iframeAutoHeight();
				});
			});
		
		</script>
		<div class="row">
			<c:url var="bbsAnswerUrl" value="/single/bbsAnswerList.do">
					<c:param name="ntt_id" 	  value="${command.ntt_id}"/>
				</c:url>
			<iframe name="ifm_bbsAnswer" id="ifm_bbsAnswer" src="${bbsAnswerUrl}" width="100%" height="" frameborder="0px" scrolling="no" title="뎃글"></iframe>
		</div>	
	</c:if>