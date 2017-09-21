<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/bonds/ssi.jsp" %>
<%
/*----쿠키설정 내용시작----------------------------*/
String c_id = "";     // ID 저장 여부를 저장하는 변수, Y
String c_id_val = ""; // ID 값
 
Cookie[] cookies = request.getCookies(); //쿠키읽어옴 
Cookie cookie=null; 
 
if (cookies != null){ 
 for (int i = 0; i < cookies.length; i++) { 
   cookie = cookies[i]; 
 
   if (cookie.getName().equals("c_id")){ 
     c_id = cookie.getValue();     // Y 
   }else if(cookie.getName().equals("c_id_val")){ 
     c_id_val = cookie.getValue(); // user1... 
   } 
 } 
} 

/*----쿠키설정 내용 끝----------------------------*/

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
 
<DIV class="title">로그인</DIV>
 <br>
 <div align="center">
<FORM name='frm' method='POST' action='<%=request.getContextPath() %>/bonds/loginProc.jsp'>
  <TABLE>
    <TR>
      <TH>아이디</TH>
      <TD >
      	<input type="text" name="id" value='<%=c_id_val %>'>
      	
      	 <% 
       if (c_id.equals("Y")){  // id 저장 상태라면 
       %>   
         <input type='checkbox' name='c_id' value='Y' checked='checked'> ID 저장 
       <% 
       }else{ %> 
         <input type='checkbox' name='c_id' value='Y' > ID 저장 
       <% 
       } 
       %> 
      	
      </TD>
    </TR>
     <TR>
      <TH>비밀번호</TH>
      <TD>
      	<input type="password" name="passwd">
      </TD>
    </TR>
  </TABLE>
  <br>

  
  <DIV class='bottom'>
    <input type='submit' value='로그인'>
    <input type='button' value='회원가입' onclick="location.href='agreement.jsp'">
  </DIV>
</FORM>
  </div>
 
 
<!-- *********************************************** -->
<jsp:include page="../menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 