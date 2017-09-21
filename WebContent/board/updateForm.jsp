<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/board/ssi.jsp"%>
<%
	int boardno = Integer.parseInt(request.getParameter("boardno"));
	BoardDTO dto = dao.read(boardno);
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
	function inCheck(f) {
		if (f.wname.value == "") {
			alert("이름을 입력하세요");
			f.wname.focus(); //포커스옮겨줌(이름으로)
			return false;
		}
		if (f.title.value == "") {
			alert("제목을 입력하세요");
			f.title.focus();
			return false;
		}
		if (CKEDITOR.instances['content'].getData() == '') {
			window.alert('내용을 입력해 주세요.');
			CKEDITOR.instances['content'].focus();
			return false;
		}
		if (f.passwd.value == "") {
			alert("비번을 입력하세요");
			f.passwd.focus();
			return false;
		}
	}
</script>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">
	window.onload = function() {
		CKEDITOR.replace('content'); // <TEXTAREA>태그 id 값
	};
</script>

</head>
<!-- *********************************************** -->
<body>


	<jsp:include page="${root }/menu/top.jsp" />

	<div class="row">
		<div class="box">
			<div class="col-lg-12" align="center">
				<hr>
				<h1 class="intro-text text-center">
					<strong>글 수정</strong>
				</h1>
				<br>


				<FORM name='frm' method='POST' action='./updateProc.jsp'
					onsubmit="return inCheck(this)">
					
					<input type = "hidden" name = "boardno" value = "<%=boardno%>">
					<input type = "hidden" name = "nowPage" value = "<%=request.getParameter("nowPage")%>">

					<div class="container">
						<TABLE class="table table-bordered">
							<TR>
								<TH>성명</TH>
								<TD><input type="text" name="wname" value = "<%=dto.getWname()%>"></TD>
							</TR>
							<TR>
								<TH>제목</TH>
								<TD><input type="text" name="title" value = "<%=dto.getTitle()%>"></TD>
							</TR>
							<TR>
								<TD colspan="2">
									<textarea rows="10" cols="45" name="content"><%=dto.getContent() %></textarea>
								</TD>
							</TR>
							<TR>
								<TH>비밀번호</TH>
								<TD><input type='password' name='passwd'></TD>
							</TR>
						</TABLE>
					</div>
					<DIV class='bottom'>
						<input type='submit' value='등록'>
						<!-- submit이어서 proc로 넘어감 -->
						<input type='button' value='취소' onclick="history.back()">
					</DIV>
				</FORM>
			</div>

		</div>
	</div>

	<jsp:include page="${root }/menu/bottom.jsp" />

</body>
<!-- *********************************************** -->
</html>
