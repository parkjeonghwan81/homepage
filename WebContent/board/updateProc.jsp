<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/board/ssi.jsp"%>
<jsp:useBean id="dto" class="board.BoardDTO" />
<jsp:setProperty name="dto" property="*" />
<%
	Map map = new HashMap();
	map.put("boardno", dto.getBoardno());
	map.put("passwd",dto.getPasswd());
	
	boolean pflag = dao.passwdCheck(map);
	
	boolean flag = false;
	if(pflag){
		flag = dao.create(dto);
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
	function blist() {
		var url = "./list.jsp";
		url = url + "?nowPage=<%=request.getParameter("nowPage")%>";
		location.href = url;
	}
</script>

</head>
<body>

	<jsp:include page="${root }/menu/top.jsp" />

	<div class="row">
		<div class="box">
			<div class="col-lg-12" align="center">
				<hr>
				<h1 class="intro-text text-center">
					<strong>처리결과</strong>
				</h1>
				<br>

				<%
			  	if(!pflag){  //true가 아닌경우(false인경우)
			  		out.print("비밀번호가 일치하지 않습니다.");
			  	} else if(flag){   //true인 경우
			  		out.print("글 수정 했습니다.");
			  	} else{
			  		out.print("글수정을 실패했습니다.");
			  	}
			  	%>
				<br> <Br>
				
				<% if(!pflag){ %>
			    <input type='button' value='다시 시도' 
			    onclick="history.back()">
			  	<% }%>
			    <input type='button' value='목록' 
			    onclick="blist()">

			</div>
		</div>
	</div>

	<jsp:include page="${root }/menu/bottom.jsp" />

</body>
</html>