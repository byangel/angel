<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				,rules:{ ntt_sj			:{required:true,maxlength:100} 
						//,ntt_cn		:{required:true} 
				}
			}; 
			$("#actionForm").validate(validateConfig);
		});
		
		$(function(){
			var editor = CKEDITOR.replace('ntt_cn');
			// 에디터에 값이 입력될때마다 textarea 에 업데이트한다. 하지 않을 경우 textarea 의 value 값을 알 수 없다.
			editor.updateElement();
		});
		
		
		$(function(){
			var option = { maxNumberOfFiles: 5
		            //,maxFileSize: 1000000
					 //,maxFileSize: undefined
		            //,minFileSize:undefined
		            //,maxChunkSize: 1000000
		            ,autoUpload:true
						};
			//$('#atch_file_id').fileUpLoad(option);
		});
		
		
		$(function(){
			$("#inputFiles1").click(function (e){
				//alert($(this).size()+"/"+ $(this).file_mg() +"/"+ $(this).name() +"/"+ $(this).file_orignl_nm());
			});
			$("#inputFiles1").change(function (e){
				var propFiles = $(this).prop('files');//파일 멀티선택 익스플로러 10버전부터 사용가능.
				
				if(propFiles == undefined){
					//alert($(this).val().replace(/^.*\\/, ''));
				}else{
					$.each(propFiles, function (index, propFile) {
						//alert(propFile.name+"/"+ propFile.size );
		            });
				}
				//alert(inputFiles.prop('files'));
				//alert($(this)[0].size);
				/* 
				
                if (!files.length) {
                	alert("1");
                	value = fileInput.prop('value');
                    if (!value) {
                        //return $.Deferred().resolve([]).promise();
                    	return [];
                    }
                    files = [{name: value.replace(/^.*\\/, '')}];
                    alert(files);
                } else if (files[0].name === undefined && files[0].fileName) {
                	alert("2");
                	// File normalization for Safari 4 and Firefox 3:
                    $.each(files, function (index, file) {
                        file.name = file.fileName;
                        file.size = file.fileSize;
                        
                        alert(file.fileSize);
                    });
                } */
                
				
				return false;
			});
		});
		
		
    	
	</script>

	

	<!-- 페이지 공통 처리 플레그값 처리 -->
	<c:set var="registerFlag" value="${empty registerFlag ? 'CREATE' :registerFlag}" />
	<c:if test="${registerFlag eq 'CREATE'}">
		<c:set var ="pageTitle" value="${bbsMasterVo.bbs_nm} 등록"/>
		<c:set var="formURL" value="bbsNttCreate.do"/>
		<c:set var="submitBtnLabel" value="등록"/>
	</c:if>
	
	<c:if test="${registerFlag eq 'UPDATE'}">
		<c:set var ="pageTitle" value="${bbsMasterVo.bbs_nm} 수정"/>
		<c:set var="formURL" value="bbsNttUpdate.do"/>
		<c:set var="submitBtnLabel" value="수정"/>
	</c:if>
	
	<h2 class="sub-header">${pageTitle}</h2>
	
	<form:form  id="actionForm" action="${formURL}"  method="post" enctype="multipart/form-data" >
		<input type="hidden" name="bbs_id" value="${command.bbs_id}">
		<input type="hidden" name="ntt_id" value="${command.ntt_id}">
		<!-- 상세 컨텐츠 -->
		<table border="0" cellspacing="0" cellpadding="0" class="table table-condensed table-bordered">
			<colgroup>
					<col width="100" />
					<col width="*" />
			</colgroup>	
			<c:if test="${registerFlag eq 'CREATE'}">			
				<tr>
					<th> <form:label path="ntt_id">작성자</form:label> </th>
					<td> <c:out value="${command.register_id}"/> </td>
				</tr>
			</c:if>
			<tr>
				<th> <form:label path="ntt_sj">제목</form:label> </th>
				<td> <form:input path="ntt_sj" size="70%"/> </td>
			</tr>
			<tr>
				<td colspan="2"> 
					<form:label path="ntt_cn" cssClass="sr-only">컨텐츠</form:label>
					<form:textarea path="ntt_cn"/> 
					<%-- <textarea name="ntt_cn" id="ntt_cntn" rows="7" cols="92%" title="질의내용 입력"><c:out value='${command.ntt_cn}'/></textarea> --%>
				</td>
			</tr>
			<tr>
				<th> <form:label path="atch_file_id">첨부파일</form:label> </th>
				<td> 
					<form:hidden path="atch_file_id"/>
					<!-- <input type='file' name="inputFiles" id='inputFiles' style='display:none' /> -->
					<input type='file' name="inputFiles" id='inputFiles1' multiple="multiple" />
					<label class = 'btn btn-link btn-xs fileSelectButton'  for='inputFiles1'> Select files... </label>
					<input type='file' name="inputFiles" id='inputFiles1' multiple="multiple" />
				</td>
			</tr>
			 
		</table>
		<!-- /상세 컨텐츠 -->
		
		<%-- 버튼  --%>
		<div class="row pull-right">
			<div class="col-md-12 ">	
				<%--목록 버튼 --%>
				<a href="bbsNttList.do?searchUse" class="btn btn-primary btn-sm" title="목록" >목록</a>
				<%-- 등록 및 수정 서브밋 버튼 --%>	
				<input type="submit" class="btn btn-primary btn-sm submit" value="${submitBtnLabel}" />
				<%-- 수정 모드 일때 삭제 버튼 출력 --%>
				<c:if test="${registerFlag eq 'UPDATE'}">
					<c:url var="deleteURL" value="bbsNttDelete.do">
						<c:param name="ntt_id" 	  value="${command.ntt_id}"/>
					</c:url>
					<a href="${deleteURL}" title="삭제" class="btn btn-primary btn-sm contentDelete">삭제</a>
				</c:if>
			</div>	
		</div>
		<%-- /버튼  --%>
	</form:form>