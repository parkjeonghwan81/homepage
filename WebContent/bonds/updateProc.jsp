<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/bonds/ssi.jsp"%>
<%

	UploadSave upload = new UploadSave(request, -1, -1, tempDir);

	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
	String id = UploadSave.encode(upload.getParameter("id"));
	String nowPage = upload.getParameter("nowPage");

	FileItem fileItem = upload.getFileItem("fname");
	int size = (int)fileItem.getSize();
	String filename = null;
	if (size > 0) {
		if (oldfile != null && !oldfile.equals("member.jpg"))
			UploadSave.deleteFile(upDir, oldfile); //지우기
		filename = UploadSave.saveFile(fileItem, upDir);
	}

	BondsDTO dto = new BondsDTO();
	dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
	dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));
	dto.setBname(UploadSave.encode(upload.getParameter("bname")));
	dto.setFname(filename);
	dto.setId(id);
	dto.setEmail(upload.getParameter("email"));
	dto.setJob(upload.getParameter("job"));
	dto.setTel(upload.getParameter("tel"));
	dto.setZipcode(upload.getParameter("zipcode"));

	boolean flag = dao.update(dto);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<script type="text/javascript">
function read(){
	var url = "./read.jsp?id=<%=id%>";
	
	location.href=url;
}
</script>

<link href="<%=root%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=root%>/css/business-casual.css" rel="stylesheet">

</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="../menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">정보수정</DIV>

	<div class="content">
		<%
			if (flag) {
				out.print("정보를 수정했습니다.");
			} else {
				out.print("정보수정을 실패했습니다.");
			}
		%>
	</div>

	<DIV align="center">
		<input type='button' value='정보확인' onclick="read()">
		<input type='button' value='다시시도' onclick="history.back()">
	</DIV>
	
	<!-- *********************************************** -->
	<jsp:include page="../menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
