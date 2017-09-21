<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/bonds/ssi.jsp" %>

<%
	
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	
	BondsDTO dto = new BondsDTO();
	
	dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
	dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));
	dto.setBname(UploadSave.encode(upload.getParameter("bname")));
	dto.setEmail(upload.getParameter("email"));
	dto.setId(UploadSave.encode(upload.getParameter("id")));
	dto.setJob(upload.getParameter("job"));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	dto.setTel(upload.getParameter("tel"));
	dto.setZipcode(upload.getParameter("zipcode"));
	
	FileItem fileItem = upload.getFileItem("fname");
	int size = (int)fileItem.getSize();
	String filename = "bonds.jpg";
	if(size>0){
		filename = UploadSave.saveFile(fileItem, upDir); 
	}
	dto.setFname(filename);
	
	//모델사용
	boolean flag = dao.create(dto);
%>

<!DOCTYPE html>
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/bootstrap.css" rel="stylesheet">
    <link href="../css/business-casual.css" rel="stylesheet">

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="../menu/top.jsp" flush="false"/>
<!-- *********************************************** -->


<div class="box">
   <div class="col-lg-12"  align="center">
       <hr>
       <h2 class="intro-text text-center">
           <strong>회원가입</strong>
       </h2>
       <hr><br>
		<div class="content">
		<%
			if (flag) {
				out.print("회원가입을 환영합니다!");
			} else {
				out.print("회원가입에 실패했습니다.");
			}
		%>
	</div>
  
  <DIV class='bottom'>
  <%if(flag){%>
    <input type='button' value='메인으로..' onclick="location.href='../index.jsp'">
   <%} else{ %>
    <input type='button' value='메인으로..' onclick="location.href='../index.jsp'">
    <input type='button' value='다시시도' onclick="history.back()">
   <%}%>
  </DIV>
       
    </div>
</div>



	
  
<!-- *********************************************** -->
<jsp:include page="../menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html>