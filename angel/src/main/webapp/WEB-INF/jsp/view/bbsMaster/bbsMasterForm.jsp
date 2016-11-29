<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="utils" tagdir="/WEB-INF/tags/utils" %>


	<script type="text/javascript">
		//벨리데이션
		$(function(){
			var validateConfig = {
				 ignoreTitle: true
				,rules:{ bbs_nm			:{required:true,maxlength:50} 
						,bbs_dc			:{required:true,maxlength:1000} 
						,bbs_ty_cd		:{required:true} 
						//,file_atch_use_at :{required:true}
						,file_atch_posbl_number 	:{ number:true,max:99}
						,file_atch_posbl_size 	:{ number:true,max:300}
						//,answer_use_at	:{required:true}
						//,reply_use_at	:{required:true} 
				}
			}; 
			$("#actionForm").validate(validateConfig);
		});
	</script>

	
	

	<!-- 페이지 공통 처리 플레그값 처리 -->
	<c:set var="registerFlag" value="${empty registerFlag ? 'CREATE' :registerFlag}" />
	<c:if test="${registerFlag eq 'CREATE'}">
		<c:set var ="pageTitle" value="게시판 설정 등록"/>
		<c:set var="formURL" value="bbsMasterCreate.do"/>
		<c:set var="submitBtnLabel" value="등록"/>
	</c:if>
	
	<c:if test="${registerFlag eq 'UPDATE'}">
		<c:set var ="pageTitle" value="분류코드 수정"/>
		<c:set var="formURL" value="bbsMasterUpdate.do"/>
		<c:set var="submitBtnLabel" value="수정"/>
	</c:if>
	
	<h2 class="sub-header">${pageTitle}</h2>
	
	<form:form  id="actionForm" action="${formURL}"  method="post" >
		<!-- 상세 컨텐츠 -->
		<table border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-bordered">
			<colgroup>
					<col width="140" />
					<col width="*" />
			</colgroup>	
			<tr>
				<th> <form:label path="bbs_id">게시판 ID</form:label> </th>
				<td> 
					<c:out value="${command.bbs_id}"/>
					<form:hidden path="bbs_id"/> <form:errors path="bbs_id"/> 
				</td>
			</tr>
			<tr>
				<th> <form:label path="bbs_nm">게시판 이름</form:label> </th>
				<td> <form:input path="bbs_nm"/> <form:errors path="bbs_nm"/> </td>
			</tr>
			<tr>
				<th> <form:label path="bbs_dc">게시판 설명</form:label> </th>
				<td> <form:input path="bbs_dc"/> <form:errors path="bbs_dc"/></td>
			</tr>
			<tr>
				<th> <form:label path="bbs_ty_cd">게시판 유형</form:label> </th>
				<td> <utils:inSelect codeid="ANG002" name="bbs_ty_cd"/> <form:errors path="bbs_ty_cd"/></td>
			</tr>
			
			<tr>
				<th> <form:label path="file_atch_posbl_number">첨부 가능 수</form:label> </th>
				<td> <form:input path="file_atch_posbl_number" size="5"/> <form:errors path="file_atch_posbl_number"/></td>
			</tr>
			<tr>
				<th> <form:label path="file_atch_posbl_size">첨부 파일 크기</form:label> </th>
				<td> <form:input path="file_atch_posbl_size" size="5"/>MB (파일 하나당 크기)<form:errors path="file_atch_posbl_size"/></td>
			</tr>
			<tr>
				<th> 옵션 <%-- <form:label path="answer_use_at">댓글 사용 여부</form:label> --%> </th>
				<td> 
					답글 사용<utils:inSelect codeid="ANG004" name="reply_use_at" />&nbsp;&nbsp; <form:errors path="reply_use_at"/>
					뎃글 사용<utils:inSelect codeid="ANG004" name="answer_use_at" /> <form:errors path="answer_use_at"/>
				</td>
			</tr>
			<tr>
				<th> <form:label path="register_id">등록자 아이디</form:label> </th>
				<td> <c:out value="${command.register_id}"/> </td>
			</tr>
			<tr>
				<th> <form:label path="regist_dt">등록 일시</form:label> </th>
				<td> <fmt:formatDate  value="${command.regist_dt}"  pattern="yyyy-MM-dd hh:mm"/> </td>
			</tr>
			
		</table>
		<!-- /상세 컨텐츠 -->
		
		<%-- 버튼  --%>
		<div class="row pull-right">
			<div class="col-md-12 pull-right">	
				<%--목록 버튼 --%>
				<a href="bbsMasterList.do?searchUse" class="btn btn-primary btn-sm" title="분류코드 목록" >목록</a>
				<%-- 등록 및 수정 서브밋 버튼 --%>	
				<input type="submit" class="btn btn-primary btn-sm submit" value="${submitBtnLabel}" />
				<%-- 수정 모드 일때 삭제 버튼 출력 --%>
				<c:if test="${registerFlag eq 'UPDATE'}">
					<c:url var="deleteURL" value="bbsMasterDelete.do">
						<c:param name="bbs_id" 	  value="${command.bbs_id}"/>
					</c:url>
					<a href="${deleteURL}" title="분류코드 삭제" class="btn btn-primary btn-sm contentDelete">삭제</a>
				</c:if>
			</div>	
		</div>
		<%-- /버튼  --%>
	</form:form>