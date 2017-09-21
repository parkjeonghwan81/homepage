<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/board/ssi.jsp"%>
<%
	int boardno = Integer.parseInt(request.getParameter("boardno"));
	dao.upViewcnt(boardno); //조회수증가
	BoardDTO dto = dao.read(boardno);
	String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link href="<%=root%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=root%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=root%>/css/business-casual.css" rel="stylesheet">

<script type = "text/javascript">

function bdelete(){
	var url ="./deleteForm.jsp";
	url += "?boardno=<%=boardno%>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>"; //다시 목록으로 갈때 페이지 유지위해서
	
	location.href = url;
}

function bupdate(){
	var url = "./updateForm.jsp";
	url += "?boardno=<%=boardno%>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	
	location.href= url;
	
}

function blist(){
	var url = "./list.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	
	location.href=url;
}

</script>

</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="${root }/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title"></DIV>

	<div class="row">
		<div class="box">
			<div class="col-lg-12" align="center">
				<hr>
				<h1 class="intro-text text-center">
					<strong>조회</strong>
				</h1>
				<br>

				<TABLE>
					<TR>
						<TH>제목</TH>
						<TD><%=dto.getTitle()%></TD>
					</TR>
					<TR>
						<TD colspan="2"><%=content%></TD>
					</TR>
					<TR>
						<TH>성명</TH>
						<TD><%=dto.getWname()%></TD>
					</TR>
					<TR>
						<TH>등록날짜</TH>
						<TD><%=dto.getWdate()%></TD>
					</TR>
					<TR>
						<TH>조회수</TH>
						<TD><%=dto.getViewcnt()%></TD>
					</TR>
				</TABLE>
				<br> <Br> 
				
				<input type='button' value='목록' onclick="blist()"> 
				<input type='button' value='수정' onclick="bupdate()"> 
				<input type='button' value='삭제' onclick="bdelete()"> 
				<input type='button' value='답변' onclick="breply()">

			</div>
		</div>
	</div>

	<jsp:include page="${root }/menu/bottom.jsp" flush="false" />
</body>
</html>
