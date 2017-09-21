<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/bonds/ssi.jsp" %>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String nowPage =request.getParameter("nowPage");
	
	Map map = new HashMap();
	map.put("id",id);
	map.put("passwd",passwd);
	
	boolean flag = dao.updatePw(map);
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

    <link href="<%=root%>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=root%>/css/bootstrap.css" rel="stylesheet">
    <link href="<%=root%>/css/business-casual.css" rel="stylesheet">

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="../menu/top.jsp" flush="false"/>
<!-- *********************************************** -->

<DIV class="title">패스워드 변경처리</DIV>
<div class="content">
<%
	if(flag){
		out.print("패스워드 변경했습니다.<br>");
		out.print("로그인을 해보세요!!<br>");
	}else {
		out.print("패스워드 변경을 실패했습니다.");
	}

%>
</div>
  
  <DIV class='bottom'>
  <%if(flag){ %>
    <input type='submit' value='로그인'>
  <%} else{ %>
    <input type='button' value='다시시도' onclick="history.back()">
  <%} %> 
    <input type='button' value='홈' onclick="location.href='../index.jsp'">
  </DIV>
 
<!-- *********************************************** -->
<jsp:include page="../menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 