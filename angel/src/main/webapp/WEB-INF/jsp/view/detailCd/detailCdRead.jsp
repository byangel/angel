<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="utils" tagdir="/WEB-INF/tags/utils" %>



	<h2 class="sub-header">상세코드 상세</h2>
	<table class="table table-condensed table-bordered" >
		<colgroup>
				<col width="20%" />
				<col width="*" />
				<col width="20%" />
				<col width="*" />
				
				
		</colgroup>
		<tbody>
		
			<tr>
				<th>분류코드</th>
				<td><c:out value="${command.cl_cd}"/></td>
				<th>공통코드</th>
				<td><c:out value="${command.cd_id}"/></td>
			</tr>
			<tr>
				<th>코드</th>
				<td><c:out value="${command.detail_cd}"/></td>
				<th>코드명</th>
				<td><c:out value="${command.detail_cd_nm}"/></td>
			</tr>
			<tr>
				<th>코드 영문 명</th>
				<td><c:out value="${command.detail_cd_eng_nm}"/></td>
				<th>순서</th>
				<td><c:out value="${command.detail_cd_ordr}"/></td>
			</tr>
			<tr>
				<th>상위코드</th>
				<td><c:out value="${command.upper_cd}"/></td>
				<th>사용여부</th>
				<td><c:out value="${command.use_at}"/></td>
			</tr>
			<tr>
				
				<th>등록자 아이디</th>  
				<td> <c:out value="${command.register_id}"/> </td>
				<th>등록 일시</th> 
				<td><fmt:formatDate  value="${command.regist_dt}"  pattern="yyyy-MM-dd hh:mm"/></td>
			</tr>
			<tr>
				
				<th>상세코드 설명</th>  
				<td> <c:out value="${command.detail_cd_dc}"/> </td>
				
				<th></th> 
				<td></td>
			</tr>
		</tbody>
	</table>
	

	
		<div class="row">
			<div class="col-md-12 pull-right">	
				<c:if test="${not empty command.detail_cd}">
					<c:url var="updateURL" value="detailCdUpdateForm.do">
						<c:param name="detail_cd_id" 	  value="${command.detail_cd_id}"/>
					</c:url>
					<c:url var="deleteURL" value="detailCdDelete.do">
						<c:param name="detail_cd_id" 	  value="${command.detail_cd_id}"/>
					</c:url>
					<!-- <a href="detailCdList.do?searchUse" class="btn btn-primary btn-sm" title="목록">목록</a> -->
					
					<a href="${updateURL}" class="btn btn-primary btn-sm" title="수정">수정</a>
					<a href="${deleteURL}" class="btn btn-primary btn-sm contentDelete" title="삭제">삭제</a>
				</c:if>
				<a href="detailCdCreateForm.do" class="btn btn-primary btn-sm" title="등록">등록</a>
			</div>	
		</div>
	
