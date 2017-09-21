<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/bonds/ssi.jsp" %>
<%
	String id = request.getParameter("id");
	if(id==null) id=(String)session.getAttribute("id");//메인에서 바로가는경우 정보가 없으니까
	String oldfile = request.getParameter("oldfile");
	if(oldfile==null){
		oldfile=dao.getFname(id);
	}
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

    <link href="<%=root%>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=root%>/css/bootstrap.css" rel="stylesheet">
    <link href="<%=root%>/css/business-casual.css" rel="stylesheet">
    
    <script type="text/javascript">
    
    function inputCheck(f){
    	
    	if(f.passwd.value==""){
    		alert("비밀번호를 입력하세요.");
    		f.passwd.focus();
    		return false;
    	}
    	if(f.rpasswd.value==""){
    		alert("비밀번호를 확인해주세요");
    		f.rpasswd.focus();
    		return false;
    	}else if(f.passwd.value!=f.rpasswd.value){
    			alert("비밀번호가 일치하지 않습니다. \n다시입력하세요!!!!!!!!!!");
    			f.rpasswd.value="";
    			f.rpasswd.focus();
    			return false;
    	}
    	
    }
    
    
    
    </script>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="../menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<div class="box">
   <div class="col-lg-12"  align="center">
       <hr>
       <h2 class="intro-text text-center">
           <strong>회 원 삭 제</strong>
       </h2>
       <hr>
       <FORM name='frm' method='POST' action='./deleteProc.jsp' onsubmit="return inputCheck(this)">
		<input type="hidden" name="id" value="<%=id%>">
		<input type="hidden" name="oldfile" value="<%=oldfile %>">
		<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
		<div class="content">
		한번삭제하면 되돌릴수 없습니다.
		</div>
		비밀번호:<input type="password" name="passwd"><Br>
		비번확인:<input type="password" name="rpasswd">
		  
	  <DIV class='bottom'>
	    <input type='submit' value='회원삭제'>
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