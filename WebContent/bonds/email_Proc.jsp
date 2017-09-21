<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/bonds/ssi.jsp" %>
<%
	String email = request.getParameter("email");
	boolean flag = dao.duplicateEmail(email);
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>

    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/bootstrap.css" rel="stylesheet">
    <link href="../css/business-casual.css" rel="stylesheet">

<script type="text/javascript">
function use(){
	opener.frm.email.value="<%=email%>";
	window.close();	
}
</script>

</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->


 <br>
<DIV class="title" style="size:20px; width: 300px">이메일 중복확인</DIV>

<div class="content">


<br><br>
<%
	if(!flag){
%>	
	<b style="color:white">사용 가능한 이메일입니다.</b>
	<input type="button" value="사용" onclick='use()'>
<%
	} else{
%>
	<b style="color:white">중복된 이메일 입니다.<br>다시시도해주세요.</b>
<%
	}
%>
</div>

  <DIV class='bottom' align="center">
    <input type='button' value='다시시도' onclick="location.href='email_Form.jsp'">
    <input type='button' value='취소' onclick="window.close()">
  </DIV>


<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 