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
 <br>
<DIV class="title" style="size:20px; width: 300px">아이디 체크</DIV>
 
 <div class="content" >
 
<FORM name='frm' method='POST' action='./id_Proc.jsp'>

  <TABLE>
    <TR>
      <TD>
      	<input type="text" name="id" placeholder="아이디를 입력하세요.">
      </TD>
    </TR>
  </TABLE>
  <Br>

    <input type='submit' value='중복확인'>
    <input type='button' value='취소' onclick="window.close()">
  
</FORM>
 </div>
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 