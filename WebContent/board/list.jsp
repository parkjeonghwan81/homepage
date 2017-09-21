<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/board/ssi.jsp"%>
<%
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	if (col.equals("total"))
		word = "";

	int nowPage = 1;
	int recordPerPage = 5;
	if (request.getParameter("nowPage") != null)
		nowPage = Integer.parseInt(request.getParameter("nowPage"));

	int sno = ((nowPage - 1) * recordPerPage) + 1;
	int eno = (nowPage * recordPerPage);

	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	List<BoardDTO> list = dao.list(map);

	int totalRecord = dao.total(map);
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
function read(boardno){
	var url = "./read.jsp";
	url += "?boardno="+boardno;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";

		location.href = url;

	}
</script>


</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="${root }/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<div class="box" align="center">

		<form method="post" action="./list.jsp">
			<select name="col">
				<option value="wname"
					<%if (col.equals("wname"))
				out.print("selected='selected'");%>>성명</option>
				<option value="title"
					<%if (col.equals("title"))
				out.print("selected='selected'");%>>제목</option>
				<option value="content"
					<%if (col.equals("content"))
				out.print("selected='selected'");%>>내용</option>
				<option value="total">전체출력</option>
				<!-- 전체출력하면 like피함 -->
			</select> <input type="text" name="word" value="<%=word%>">
			<!-- 검색하고나서 뭘검색했는지 보여주는 역할 -->
			<button>검색</button>
			<!-- form의 button태그의 타입은 기본값이 submit -->
			<button type="button" onclick="location.href='./createForm.jsp'">글 등록</button>
		</form>

		<div class="container">
			<h2>Board List</h2>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>성명</th>
						<TH>조회수</TH>
						<TH>등록일</TH>
						<TH>grpno</TH>
						<TH>indent</TH>
						<TH>ansum</TH>
					</tr>
				</thead>



				<%
					if (list.size() == 0) {
				%>
				<tbody>
					<tr>
						<td colspan="8">등록된 글이 없습니다.</td>
					</tr>
				</tbody>
				<%
					} else {
						for (int i = 0; i < list.size(); i++) {
							BoardDTO dto = list.get(i);
				%>
				<tbody>
					<tr>
						<td><%=dto.getBoardno()%></td>
						<td>
							<%
								for (int j = 0; j < dto.getIndent(); j++) {
											out.print("&nbsp;&nbsp;&nbsp;");
										}
										/* if(dto.getIndent()>0){
											out.print("<img src='../images/re.jpg'>");
										} */
										if (dto.getIndent() > 0) {
							%> <img src='../images/re.jpg'> <%
 	}
 %> <a href="javascript:read('<%=dto.getBoardno()%>')"> <%=dto.getTitle()%></a>
							<%
								if (Utility.compareDay(dto.getWdate().substring(0, 10))) {
							%> <img src="<%=root%>/images/new.gif"> <%
 	} //제목뒤에 new넣기
 %>

						</td>
						<td><%=dto.getWname()%></td>
						<td><%=dto.getViewcnt()%></td>
						<td><%=dto.getWdate()%></td>
						<td><%=dto.getGrpno()%></td>
						<td><%=dto.getIndent()%></td>
						<td><%=dto.getAnsnum()%></td>
					</tr>
				</tbody>
				<%
					} //for-end		
					} //if-end
				%>
			</TABLE>

			<DIV class='bottom'>
				<%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word)%>
			</DIV>

		</div>
	</div>

	<!-- *********************************************** -->
	<jsp:include page="${root }/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
