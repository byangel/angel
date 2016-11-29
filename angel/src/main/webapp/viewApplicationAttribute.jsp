<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import ="java.util.Enumeration" %>
<%@ page import ="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<body>
<%
	InetAddress inet = InetAddress.getLocalHost();
	Enumeration test = application.getAttributeNames();
	while(test.hasMoreElements()){
		String name = (String)test.nextElement();
		Object value = application.getAttribute(name);
%>
	
    <b><%=name %></b> = <%=value %> <br/>
<% } %>
<b>server ip:</b> <%=inet.getHostAddress()%>
</body>

</html>



