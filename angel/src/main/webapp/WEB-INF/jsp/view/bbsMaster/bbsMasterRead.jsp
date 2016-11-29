<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="utils" tagdir="/WEB-INF/tags/utils" %>

<script type="text/javaScript" language="javascript" >
		<!--
		$(function(){		
			//삭제 이벤트 메세지
			$(".contentDeleteEx").click(function(){
				var sub = confirm("삭제 하시면 등록된 게시물도 같이 삭제가 됩니다. 정말 삭제 하시겠습니까?");
				if(sub){ 
					return true;
				}else{
					return false;
				}
			});
		});
		//-->
</script> 
	


	<!-- 제목 -->
	<h2 class="sub-header">게시판설정 상세</h2>
	<!-- 검색 폼 -->
	<table border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-bordered">
		<colgroup>
				<col width="140" />
				<col width="*" />
		</colgroup>				
		<tr>
				<th> 게시판 ID</th>
				<td> 
					<c:out value="${command.bbs_id}"/>
				</td>
			</tr>
			<tr>
				<th>게시판 이름 </th>
				<td> <c:out value="${command.bbs_nm}"/> </td>
			</tr>
			<tr>
				<th> 게시판 설명 </th>
				<td> <c:out value="${command.bbs_dc}"/></td>
			</tr>
			<tr>
				<th> 게시판 유형 </th>
				<td> <utils:code codeid="ANG002" value="${command.bbs_ty_cd}"/></td>
			</tr>
			
			<%-- <tr>
				<th> 첨부파일 사용 여부 </th>
				<td> <utils:code codeid="ANG004" value="${command.file_atch_use_at}"/></td>
			</tr> --%>
			<tr>
				<th> 첨부 가능 수 </th>
				<td> <c:out value="${command.file_atch_posbl_number}"/></td>
			</tr>
			<tr>
				<th> 첨부 파일 크기 </th>
				<td> <c:out value="${command.file_atch_posbl_size}"/>MB (파일 하나당 크기)</td>
			</tr>
			<tr>
				<th> 답장 사용 여부 </th>
				<td> <utils:code codeid="ANG004" value="${command.reply_use_at}"/></td>
			</tr>
			<tr>
				<th> 댓글 사용 여부 </th>
				<td>  <utils:code codeid="ANG004" value="${command.answer_use_at}"/>
				</td>
			</tr>
			
			<tr>
				<th> 등록자 아이디 </th>
				<td> <c:out value="${command.register_id}"/> </td>
			</tr>
			<tr>
				<th> 등록 일시 </th>
				<td><fmt:formatDate  value="${command.regist_dt}"  pattern="yyyy-MM-dd hh:mm"/></td>
			</tr>
		 
	</table>

	<div class="row pull-right">
			<div class="col-md-12 pull-right">	
				<c:url var="updateURL" value="bbsMasterUpdateForm.do">
					<c:param name="bbs_id" 	  value="${command.bbs_id}"/>
				</c:url>
				<c:url var="deleteURL" value="bbsMasterDelete.do">
					<c:param name="bbs_id" 	  value="${command.bbs_id}"/>
				</c:url>
				<a href="bbsMasterList.do?searchUse" class="btn btn-primary btn-sm" title="목록">목록</a>
				<a href="${updateURL}" class="btn btn-primary btn-sm" title="수정">수정</a>
				<a href="${deleteURL}" class="btn btn-primary btn-sm contentDeleteEx" title="삭제">삭제</a>
		</div>	
	</div>
