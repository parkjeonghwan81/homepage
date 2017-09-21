<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import = "board.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "utility.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>  <!-- web-inf의 tlds에서 설정해줬다 -->

<jsp:useBean id = "dao" class = "board.BoardDAO"/>
<% 
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
%>

