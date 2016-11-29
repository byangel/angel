<%@ tag body-content="empty" pageEncoding="utf-8" %>
<%@ attribute name="paginationInfo" type="egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo" required="true" rtexprvalue="true" description="" %>
<%@ attribute name="idxNum"  type="java.lang.Integer" required="true" %>
${paginationInfo.totalRecordCount - (idxNum + ((paginationInfo.currentPageNo - 1) * paginationInfo.recordCountPerPage))}