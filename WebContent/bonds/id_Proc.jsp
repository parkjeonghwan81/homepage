<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/bonds/ssi.jsp" %>
<%
	String id = request.getParameter("id");

	boolean flag = dao.duplicated(id);
%>
<!DOCTYPE html> 
<html> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function use(){
	opener.frm.id.value="<%=id%>";
	window.close();
}
</script>



    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/bootstrap.css" rel="stylesheet">
    <link href="../css/business-casual.css" rel="stylesheet">

</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
<br>
<DIV class="title" style="size:20px; width: 300px">중복확인</DIV>

<br><br>
<div class="content">
<%
	if(!flag){
%>	
	<b style="color:white">사용 가능한 아이디입니다.</b>
	<input type="button" value="사용" onclick='use()'>
<%
	} else{
%>
	<b style="color:white">중복된 아이디 입니다.<br>다시시도해주세요.</b>
<%
	}
%>
</div>

  <DIV class='bottom' align="center">
    <input type='button' value='다시시도' onclick="location.href='id_Form.jsp'">
    <input type='button' value='닫기' onclick="window.close()">
  </DIV>
  
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 