<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/bonds/ssi.jsp" %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
	
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/bootstrap.css" rel="stylesheet">
    <link href="../css/business-casual.css" rel="stylesheet">
    
<style type="text/css">
	table{
  	margin:auto;
  	}
</style>

</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
 <Br>
<DIV class="title" style="size:20px; width: 300px">이메일 중복확인</DIV>
 
 <div class="content">
 
 <br>
 <FORM name='frm' method='POST' action='./email_Proc.jsp'>
 
 <div>
  <TABLE>
    <TR >
      <TD>
      	<input type="text" name="email" placeholder="이메일을 적으세요" >
      </TD>
    </TR>
  </TABLE>
 </div>
  <br>
  
    <input type='submit' value='중복확인'>
    <input type='button' value='취소' onclick="window.close()">
    
</FORM>

</div>

<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 