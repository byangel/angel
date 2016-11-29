<%@ tag body-content="scriptless" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="utils" tagdir="/WEB-INF/tags/utils" %>


<%@ attribute name="id" type="java.lang.String" required="true" rtexprvalue="true" description="The identifier for this tag (do not change!)" %>
<%@ attribute name="object" type="java.lang.Object" required="true" rtexprvalue="true" description="The form backing object" %>
<%@ attribute name="path" type="java.lang.String" required="true" rtexprvalue="true" description="Specify the URL path" %>
<%@ attribute name="list" type="java.lang.Boolean" required="false" rtexprvalue="true" description="Include 'list' link into table (default true)" %>
<%@ attribute name="create" type="java.lang.Boolean" required="false" rtexprvalue="true" description="Include 'create' link into table (default true)" %>
<%@ attribute name="update" type="java.lang.Boolean" required="false" rtexprvalue="true" description="Include 'update' link into table (default true)" %>
<%@ attribute name="delete" type="java.lang.Boolean" required="false" rtexprvalue="true" description="Include 'delete' link into table (default true)" %>
<%@ attribute name="label" type="java.lang.String" required="false" rtexprvalue="true" description="The label used for this object, will default to a message bundle if not supplied" %>
<%@ attribute name="render" type="java.lang.Boolean" required="false" rtexprvalue="true" description="Indicate if the contents of this tag and all enclosed tags should be rendered (default 'true')" %>

    <c:if test="${empty label}">
      <spring:message code="label_${fn:toLowerCase(fn:substringAfter(id,'_'))}" var="label" htmlEscape="false" />
    </c:if>

    <c:if test="${empty list}">
      <c:set var="list" value="true" />
    </c:if>

    <c:if test="${empty create}">
      <c:set var="create" value="true" />
    </c:if>

    <c:if test="${empty update}">
      <c:set var="update" value="true" />
    </c:if>

    <c:if test="${empty delete}">
      <c:set var="delete" value="true" />
    </c:if>

    <spring:message var="typeName" code="menu_item_${fn:toLowerCase(fn:split(id,'_')[fn:length(fn:split(id,'_')) - 1])}_new_label" htmlEscape="false" />
    <spring:message var="typeNamePlural" code="menu_item_${fn:toLowerCase(fn:split(id,'_')[fn:length(fn:split(id,'_')) - 1])}_list_label" htmlEscape="false" />

    <spring:message arguments="${label}" code="entity_show" var="title_msg" htmlEscape="false" />
      <c:choose>
        <c:when test="${not empty object}">
          <jsp:doBody />
          <div class="quicklinks">
            <span>
              <c:if test="${delete}">
                <spring:url value="${path}/${itemId}" var="delete_form_url" />
                <spring:url value="/resources/images/delete.png" var="delete_image_url" />
                <form:form action="${fn:escapeXml(delete_form_url)}" method="DELETE">
                  <spring:message arguments="${typeName}" code="entity_delete" var="delete_label" htmlEscape="false" />
                  <c:set var="delete_confirm_msg">
                    <spring:escapeBody javaScriptEscape="true">
                      <spring:message code="entity_delete_confirm" />
                    </spring:escapeBody>
                  </c:set>
                  <input alt="${fn:escapeXml(delete_label)}" class="image" src="${fn:escapeXml(delete_image_url)}" title="${fn:escapeXml(delete_label)}" type="image" value="${fn:escapeXml(delete_label)}" onclick="return confirm('${fn:escapeXml(delete_confirm_msg)}');" />
                </form:form>
              </c:if>
            </span>
            <span>
              <c:if test="${update}">
                <spring:url value="${path}/${itemId}" var="update_form_url">
                  <spring:param name="form" />
                </spring:url>
                <spring:url value="/resources/images/update.png" var="update_image_url" />
                <spring:message arguments="${typeName}" code="entity_update" var="update_label" htmlEscape="false" />
                <a href="${fn:escapeXml(update_form_url)}" title="${fn:escapeXml(update_label)}">
                  <img alt="${fn:escapeXml(update_label)}" class="image" src="${fn:escapeXml(update_image_url)}" title="${fn:escapeXml(update_label)}" />
                </a>
              </c:if>
            </span>
            <span>
              <c:if test="${create}">
                <spring:url value="${path}" var="create_form_url">
                  <spring:param name="form" />
                </spring:url>
                <spring:url value="/resources/images/create.png" var="create_image_url" />
                <spring:message arguments="${typeName}" code="entity_create" var="create_label" htmlEscape="false" />
                <a href="${fn:escapeXml(create_form_url)}" title="${fn:escapeXml(create_label)}">
                  <img alt="${fn:escapeXml(create_label)}" class="image" src="${fn:escapeXml(create_image_url)}" title="${fn:escapeXml(create_label)}" />
                </a>
              </c:if>
            </span>
            <span>
              <c:if test="${list}">
                <spring:url value="${path}" var="list_form_url" />
                <spring:url value="/resources/images/list.png" var="list_image_url" />
                <spring:message arguments="${typeNamePlural}" code="entity_list_all" var="list_label" htmlEscape="false" />
                <a href="${fn:escapeXml(list_form_url)}" title="${fn:escapeXml(list_label)}">
                  <img alt="${fn:escapeXml(list_label)}" class="image" src="${fn:escapeXml(list_image_url)}" title="${fn:escapeXml(list_label)}" />
                </a>
              </c:if>
            </span>
          </div>
        </c:when>
        <c:otherwise>
          <spring:message arguments="${label}" code="entity_not_found_single" />
        </c:otherwise>
      </c:choose>
