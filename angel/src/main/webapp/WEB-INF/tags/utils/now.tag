<%@ tag body-content="empty" pageEncoding="utf-8" %>
<%@ tag import = "java.util.Calendar" %>
<%
Calendar cal = Calendar.getInstance();
%>

오늘은<%=cal.get(Calendar.YEAR) %>년
<%=cal.get(Calendar.MONTH)+1 %>월
<%=cal.get(Calendar.DATE) %>일 입니다.