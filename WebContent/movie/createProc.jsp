<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/movie/ssi.jsp" %>

<%
	
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	
	MovieDTO dto = new MovieDTO();
	
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	
	
	//영화등록
	FileItem fileItem1 = upload.getFileItem("movname");
	int size1 = (int)fileItem1.getSize();
	String filename1 = "bonds.jpg"; //기본이름
	if(size1>0){
		filename1 = UploadSave.saveFile(fileItem1, upDir); 
	}
	dto.setMovname(filename1);
	
	//포스터등록
	FileItem fileItem2 = upload.getFileItem("imgname");
	int size2 = (int)fileItem2.getSize();
	String filename2 = "noimage.jpg"; //기본이름
	if(size2>0){
		filename2 = UploadSave.saveFile(fileItem2, upDir); 
	}
	dto.setImgname(filename2);
	
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
<jsp:include page="${root }/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->


<div class="box">
   <div class="col-lg-12"  align="center">
       <hr>
       <h2 class="intro-text text-center">
           <strong>등록확인</strong>
       </h2>
       <hr><br>
		<div class="content">
		<%
			if (flag) {
				out.print("등록이 완료됐습니다!");
			} else {
				out.print("등록이 실패했습니다.");
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
<jsp:include page="${root }/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html>