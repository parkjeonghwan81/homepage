<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/board/ssi.jsp"%>
<jsp:useBean id="dto" class="board.BoardDTO" />
<jsp:setProperty name="dto" property="*" />
<%
	boolean flag = dao.create(dto);
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
				  	if(flag){
				  		out.print("글이 등록되었습니다.");
				  	} else{
				  		out.print("글 등록이 실패했습니다.");
				  	}
  			 	%>
				<br> <Br>
				
				<input type='button' value='계속등록' onclick="location.href = 'createForm.jsp'"> 
				<input type='button' value='목록' onclick="blist()">

			</div>
		</div>
	</div>

	<jsp:include page="${root }/menu/bottom.jsp" />

</body>
</html>