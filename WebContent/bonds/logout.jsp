<%@ page contentType="text/html; charset=UTF-8" %> 
<%
	session.invalidate(); //세션에 저장되있는 정보(id,passwd등 ) 지움  
	
	response.sendRedirect("../index.jsp");
%>