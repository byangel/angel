<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="utils" tagdir="/WEB-INF/tags/utils" %>



	<div class="hero-unit">
       <h1>
       		<c:if test="${registerFlag eq 'CREATE'}">
				프로그램 등록
		  	</c:if>
			<c:if test="${registerFlag eq 'UPDATE'}">
				프로그램 수정
		  	</c:if>
       </h1>
	</div> 

	<c:if test="${registerFlag eq 'CREATE'}">
		<c:url var="formURL" value="progrmManageCreate.do"/>
  	</c:if>
	<c:if test="${registerFlag eq 'UPDATE'}">
		<c:url var="formURL" value="progrmManageUpdate.do"/>
  	</c:if>
  	
	<form:form  action="${formURL}" method ="POST" enctype="multipart/form-data">	
		<form:hidden path="progrm_id"/>
		<table border="0" cellspacing="0" cellpadding="0" class="table table-bordered">
			<colgroup>
					<col width="*" />
					<col width="700" />
			</colgroup>				
			  <tr>
				  <th><form:label path="progrm_nm">프로그램 이름</form:label></th>
				  <td>
				  	<form:input path="progrm_nm" size="50"/>
				    <form:errors  path="progrm_nm"/>	
				  </td>
			  </tr>
			  <tr>
				  <th><form:label path="progrm_dc">프로그램 설명</form:label></th>
				  <td>
				  	<form:input path="progrm_dc" size="50"/>
				  	<form:errors  path="progrm_dc"/>
				  </td>
			  </tr>
			  <tr>
				  <th><form:label path="progrm_stre_path">프로그램 저장 경로</form:label></th>
				  <td>
				  	<form:input path="progrm_stre_path" size="50"/>
				  	<form:errors  path="progrm_stre_path"/>
				  </td>
			  </tr>
			  <tr>
				  <th><form:label path="progrm_url">프로그램 URL</form:label></th>
				  <td>
				  	<form:input path="progrm_url" size="50"/>
				  	<form:errors  path="progrm_url"/>
				  </td>
			  </tr>
			  <tr>
				  <th><form:label path="progrm_ty">프로그램 타입</form:label></th>
				  <td>
				  	<utils:inSelect name="progrm_ty" codeid="ANG001" emptyMsg="선택"/>
				  	<form:errors  path="progrm_ty"/>
				  </td>
			  </tr>
			  <tr>
				  <th><form:label path="progrm_cn">프로그램 내용</form:label></th>
				  <td>
				  	<form:input path="progrm_cn" size="50"/>
				  	<form:errors  path="progrm_cn"/>
				  </td>
			  </tr>
		</table>
	
		<div class="row">
			<div class="col-md-12">	
				<div class="pull-right">
					<a href="progrmManageList.do?searchUse" class="btn btn-primary btn-sm" title="목록">목록</a>
					<c:if test="${registerFlag eq 'CREATE' }">
						<input type="submit" class="btn btn-primary btn-sm" value="저장"/>
						
					</c:if>
					<c:if test="${registerFlag eq 'UPDATE' }">
						<button type="submit" class="btn btn-primary btn-sm">수정</button>
						<a href="progrmManageDelete.do" class="btn btn-primary btn-sm contentDelete" title="삭제">삭제</a>
					</c:if>
				</div>
			</div>	
		</div>
			
	</form:form>
