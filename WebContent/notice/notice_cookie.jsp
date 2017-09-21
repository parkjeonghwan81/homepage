<%@ page contentType="text/html; charset=UTF-8" %> 
 
 <% 
Cookie cookie = new Cookie("windowOpen", "close");  //new Cookie(String name,String value);
cookie.setMaxAge(1 * 60);    // 60초, 1일: 60 * 60 * 24   응용:하루동안안보기 or 일주일동안 안보기
response.addCookie(cookie);      
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 


<script type="text/javascript"> 
  window.close();     //바로꺼짐
</script> 


<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"></DIV>

 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 