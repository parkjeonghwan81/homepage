<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/board/ssi.jsp"%>
<%
	int boardno = Integer.parseInt(request.getParameter("boardno"));
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
function blist(){
	var url = "./list.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href=url;
}
function inputCheck(s){
	if(s.passwd.value==""){
		alert("비밀번호를 입력하세요");
		s.passwd.focus();
		return false;
	}
}
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
				<FORM 	name='frm' 
						method='POST' 
						action='./deleteProc.jsp'
						onsubmit="return inputCheck(this)">
					<input type="hidden" name="boardno" value="<%=boardno %>">  <!-- 뭐지?? :boardno도 같이 바다줘야한다.-->
					<input type = "hidden" name = "col" value = "<%=request.getParameter("col")%>">
					<input type = "hidden" name = "word" value = "<%=request.getParameter("word")%>">
					<input type = "hidden" name = "nowPage" value = "<%=request.getParameter("nowPage")%>">
					<Div class="content"> 삭제하면 복구할 수 없습니다.</Div><br><br>
					  <TABLE>
					    <TR>
					      <TH>비밀번호</TH>
					      <TD><input type = 'password' name = 'passwd'></TD>
					    </TR>
					  </TABLE>
					  
					  <DIV class='bottom'>
					    <input type='submit' value='확인'>
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
