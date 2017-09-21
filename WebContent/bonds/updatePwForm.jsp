<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/bonds/ssi.jsp" %>
 
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
 
 
 
           <div class="box">
               <div class="col-lg-12"  align="center">
                   <hr>
                   <h2 class="intro-text text-center">
                       <strong>패스워드 변경</strong>
                   </h2>
                   <hr>
				 <FORM name='frm' 
					  method='POST' 
					  action='./updatePwProc.jsp'
					  onsubmit="return incheck(this)">
				<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
				<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
				  <TABLE>
				    <TR>
				      <TH>패스워드</TH>
				      <TD><input type="password" name="passwd"></TD>
				    </TR>
				    <TR>
				      <TH>패스워드 확인</TH>
				      <TD><input type="password" name="repasswd"></TD>
				    </TR>
				  </TABLE>
				  
				  <DIV class='bottom'>
				    <input type='submit' value='패스워드 수정'>
				    <input type='button' value='취소' onclick="history.back()">
				  </DIV>
				</FORM>
                   
               </div>
           </div>
 
<!-- *********************************************** -->
<jsp:include page="../menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 