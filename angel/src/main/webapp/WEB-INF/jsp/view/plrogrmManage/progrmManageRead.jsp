<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="utils" tagdir="/WEB-INF/tags/utils" %>



	<div class="hero-unit">
       <h1>프로그램 상세</h1>
	</div> 

	
	<form:form  action="${formURL}" method ="POST">	
		<table border="0" cellspacing="0" cellpadding="0" class="table table-bordered">
			<colgroup>
					<col width="*" />
					<col width="700" />
			</colgroup>				
			  <tr>
				  <th><form:label path="progrm_nm">프로그램 이름</form:label></th>
				  <td>
				  	<c:out value="${command.progrm_nm}"/>
				  </td>
			  </tr>
			  <tr>
				  <th><form:label path="progrm_dc">프로그램 설명</form:label></th>
				  <td>
				  	<c:out value="${command.progrm_dc}"/>
				  </td>
			  </tr>
			  <tr>
				  <th><form:label path="progrm_stre_path">프로그램 저장 경로</form:label></th>
				  <td>
				  	<c:out value="${command.progrm_stre_path}"/>
				  </td>
			  </tr>
			  <tr>
				  <th><form:label path="progrm_url">프로그램 URL</form:label></th>
				  <td>
				  	<c:out value="${command.progrm_url}"/>
				  </td>
			  </tr>
			  <tr>
				  <th><form:label path="progrm_ty">프로그램 타입</form:label></th>
				  <td>
				  	<utils:code codeid="AP_COMMON_CODE_MAP.ANG001" value="${command.progrm_ty}"/>
				  </td>
			  </tr>
			  <tr>
				  <th><form:label path="progrm_ty">프로그램 내용</form:label></th>
				  <td>
				  	<c:out value="${command.progrm_cn}"/>
				  </td>
			  </tr>
		</table>

		<div class="row">
			<div class="col-md-12">	
				<div class="pull-right">
					<a href="progrmManageList.do?searchUse" class="btn btn-primary btn-sm" title="목록">목록</a>
					<a href="progrmManageUpdateForm.do?progrm_id=${command.progrm_id}" class="btn btn-primary btn-sm" title="수정">수정</a>
					<a href="progrmManageDelete.do?progrm_id=${command.progrm_id}" class="btn btn-primary btn-sm contentDelete" title="삭제">삭제</a>
				</div>
			</div>	
		</div>
	</form:form>
