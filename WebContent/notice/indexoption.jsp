<%@ page contentType="text/html; charset=UTF-8" %> 
<% String root = request.getContextPath(); %>
 <% 
Cookie cookie = new Cookie("windowOpen", "close");  
cookie.setMaxAge(1 * 60);    // 60초, 1일: 60 * 60 * 24   응용:하루동안안보기 or 일주일동안 안보기
response.addCookie(cookie);      
%> 
 

 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Welcome!</title> 

<script type="text/javascript"> 
  window.close();     //바로꺼짐
</script> 

</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
<DIV class="content">

<form name="frm" method="post" action="./indexoption.jsp"> 
	<input type="checkbox" value="close" onclick="document.frm.submit();">1분간 창 열지 않기 
</form>

</DIV>
</body>
<!-- *********************************************** -->
</html> 