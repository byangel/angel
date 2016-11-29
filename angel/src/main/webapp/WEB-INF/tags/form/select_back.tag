<%@ tag body-content="scriptless" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="field" uri="/WEB-INF/tags/form" %>

<%@ attribute name="id" type="java.lang.String" required="true" rtexprvalue="true" description="The identifier for this tag (do not change!)" %>
<%@ attribute name="field" type="java.lang.String" required="true" rtexprvalue="true" description="The field exposed from the form backing object" %>
<%@ attribute name="path" type="java.lang.String" required="true" rtexprvalue="true" description="The relative path to the referenced resource" %>
<%@ attribute name="items" type="java.util.Collection" required="true" rtexprvalue="true" description="The name of the collection displayed in the select box" %>
<%@ attribute name="label" type="java.lang.String" required="false" rtexprvalue="true" description="The label used for this field, will default to a message bundle if not supplied" %>
<%@ attribute name="itemLabel" type="java.lang.String" required="false" rtexprvalue="true" description="Name of the property mapped to the inner text of the 'option' tag (will override the configured converter)" %>
<%@ attribute name="itemValue" type="java.lang.String" required="false" rtexprvalue="true" description="The identifier used as value in the select box (defaults to 'id' for non enum types)" %>
<%@ attribute name="required" type="java.lang.Boolean" required="false" rtexprvalue="true" description="Indicates if this field is required (default false)" %>
<%@ attribute name="disabled" type="java.lang.Boolean" required="false" rtexprvalue="true" description="Specify if this field should be enabled" %>
<%@ attribute name="multiple" type="java.lang.Boolean" required="false" rtexprvalue="true" description="Specify if the select box should allow multiple selections" %>
<%@ attribute name="disableFormBinding" type="java.lang.Boolean" required="false" rtexprvalue="true" description="Set to true to disable Spring form binding" %>


    <c:if test="${empty disabled}">
      <c:set value="false" var="disabled" />
    </c:if>

    <c:if test="${empty label}">
      <spring:message code="label_${fn:toLowerCase(fn:substringAfter(id,'_'))}" var="label" htmlEscape="false" />
    </c:if>

    <c:if test="${empty required}">
      <c:set value="false" var="required" />
    </c:if>

    <c:if test="${empty multiple}">
      <c:set value="false" var="multiple" />
    </c:if>
    
    <c:set var="sec_field">
      <spring:escapeBody javaScriptEscape="true" >${field}</spring:escapeBody>
    </c:set>

    <c:set var="sec_itemLabel">
      <spring:escapeBody htmlEscape="true" >${itemLabel}</spring:escapeBody>
    </c:set>

    <div id="_${fn:escapeXml(id)}_id">
      <c:choose>
        <c:when test="${not empty items}">
          <label for="_${sec_field}_id">
            <c:out value="${fn:escapeXml(label)}" />
            :
          </label>
          <c:choose>
            <c:when test="${empty itemValue}">
              <c:choose>
                <c:when test="${disableFormBinding}">
                  <c:choose>
                    <c:when test="${multiple}">
                      <select id="_${sec_field}_id" name="${sec_field}" multiple="${multiple}">
                      <c:forEach items="${items}" var="item">
                        <option value="${item}">
                        <c:choose>
                          <c:when test="${empty itemLabel}">
                            <spring:eval expression="item" />
                          </c:when>
                          <c:otherwise>
                            <spring:eval expression="item[sec_itemLabel]"/>
                          </c:otherwise>
                        </c:choose>
                        </option>
                      </c:forEach>
                      </select>
                    </c:when>
                    <c:otherwise>
                      <select id="_${sec_field}_id" name="${sec_field}">
                      <c:forEach items="${items}" var="item">
                        <option value="${item}">
                        <c:choose>
                          <c:when test="${empty itemLabel}">
                            <spring:eval expression="item" />
                          </c:when>
                          <c:otherwise>
                            <spring:eval expression="item[sec_itemLabel]"/>
                          </c:otherwise>
                        </c:choose>
                        </option>
                      </c:forEach>
                      </select>
                    </c:otherwise>
                  </c:choose>
                </c:when>
                <c:otherwise>
                  <c:choose>
                    <c:when test="${empty itemLabel}">
                      <c:choose>
                        <c:when test="${multiple}">
                          <form:select id="_${sec_field}_id" items="${items}" path="${sec_field}" disabled="${disabled}" multiple="${multiple}" />
                        </c:when>
                        <c:otherwise>
                          <form:select id="_${sec_field}_id" items="${items}" path="${sec_field}" disabled="${disabled}" />
                        </c:otherwise>
                     </c:choose>
                    </c:when>
                    <c:otherwise>
                      <c:choose>
                        <c:when test="${multiple}">
                          <form:select id="_${sec_field}_id" items="${items}" path="${sec_field}" disabled="${disabled}" multiple="${multiple}" itemLabel="${sec_itemLabel}"/>
                        </c:when>
                        <c:otherwise>
                          <form:select id="_${sec_field}_id" items="${items}" path="${sec_field}" disabled="${disabled}" itemLabel="${sec_itemLabel}"/>
                        </c:otherwise>
                      </c:choose>
                    </c:otherwise>
                  </c:choose>
                  <br />
                  <form:errors cssClass="errors" id="_${sec_field}_error_id" path="${sec_field}" />
                </c:otherwise>
              </c:choose>
            </c:when>
            <c:otherwise>
              <c:choose>
                <c:when test="${disableFormBinding}">
                  <c:choose>
                    <c:when test="${multiple}">
                      <select id="_${sec_field}_id" name="${sec_field}" multiple="${multiple}">
                        <c:forEach items="${items}" var="item">
                          <option value="${item[fn:escapeXml(itemValue)]}">
                            <c:choose>
                              <c:when test="${empty itemLabel}">
                                <spring:eval expression="item" />
                              </c:when>
                              <c:otherwise>
                                <spring:eval expression="item[sec_itemLabel]"/>
                              </c:otherwise>
                            </c:choose>
                          </option>
                        </c:forEach>
                      </select>
                    </c:when>
                    <c:otherwise>
                      <select id="_${sec_field}_id" name="${sec_field}" multiple="${multiple}">
                        <c:forEach items="${items}" var="item">
                          <option value="${item[fn:escapeXml(itemValue)]}">
                            <c:choose>
                              <c:when test="${empty itemLabel}">
                                <spring:eval expression="item" />
                              </c:when>
                              <c:otherwise>
                                <spring:eval expression="item[sec_itemLabel]"/>
                              </c:otherwise>
                            </c:choose>
                          </option>
                        </c:forEach>
                      </select>
                    </c:otherwise>
                  </c:choose>
                </c:when>
                <c:otherwise>
                  <c:choose>
                    <c:when test="${empty itemLabel}">
                      <c:choose>
                        <c:when test="${multiple}">
                          <form:select id="_${sec_field}_id" items="${items}" path="${sec_field}" disabled="${disabled}" multiple="${multiple}" itemValue="${fn:escapeXml(itemValue)}" />
                        </c:when>
                        <c:otherwise>
                          <form:select id="_${sec_field}_id" items="${items}" path="${sec_field}" disabled="${disabled}" itemValue="${fn:escapeXml(itemValue)}" />
                        </c:otherwise>
                      </c:choose>
                    </c:when>
                    <c:otherwise>
                      <c:choose>
                        <c:when test="${multiple}">
                          <form:select id="_${sec_field}_id" items="${items}" path="${sec_field}" disabled="${disabled}" multiple="${multiple}" itemValue="${fn:escapeXml(itemValue)}" itemLabel="${sec_itemLabel}"/>
                        </c:when>
                        <c:otherwise>
                          <form:select id="_${sec_field}_id" items="${items}" path="${sec_field}" disabled="${disabled}" itemValue="${fn:escapeXml(itemValue)}" itemLabel="${sec_itemLabel}"/>
                        </c:otherwise>
                      </c:choose>
                    </c:otherwise>
                  </c:choose>
                  <br />
                  <form:errors cssClass="errors" id="_${sec_field}_error_id" path="${sec_field}" />
                </c:otherwise>
              </c:choose>
            </c:otherwise>
          </c:choose>
          <c:choose>
            <c:when test="${multiple == false}">
              <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_${sec_field}_id', widgetType: 'dijit.form.FilteringSelect', widgetAttrs : {hasDownArrow : true}})); </script>
            </c:when>
          </c:choose>
        </c:when>
        <c:otherwise>
          <field:reference field="${label}" id="${id}" path="${path}" required="${required}" />
        </c:otherwise>
      </c:choose>
    </div>
    <br />
