<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/bonds/ssi.jsp" %>
<%
	String id = request.getParameter("id");
	String oldfile = request.getParameter("oldfile");
	boolean flag = dao.delete(id);
	if(flag){ 
		if(oldfile!=null && !oldfile.equals("member.jpg")){
			UploadSave.deleteFile(upDir, oldfile);
		}
		session.invalidate(); //회원탈퇴 후 로그아웃.
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

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="../menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<div class="box">
   <div class="col-lg-12"  align="center">
       <hr>
       <h2 class="intro-text text-center">
           <strong>삭제확인</strong>
       </h2>
       <hr><br>
		<%
			if(flag){
				out.print("탈퇴됐습니다. 자동로그아웃 됩니다.");
			} else{
				out.print("탈퇴 실패했습니다.");
			}
		%>
	  <DIV class='bottom'>
	  	<input type='button' value='다시시도' onclick="history.back()">
	    <input type='button' value='홈으로' onclick="...index.jsp">
	  </DIV>
       
    </div>
</div>
 
<!-- *********************************************** -->
<jsp:include page="../menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 