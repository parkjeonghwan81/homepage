<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/movie/ssi.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8"> 

    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/bootstrap.css" rel="stylesheet">
    <link href="../css/business-casual.css" rel="stylesheet">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<script type="text/javascript">
function inputCheck(f){
	if(f.title.value==""){
		alert("제목을 입력하세요");
		f.title.focus();
		return false;
	}
	if(f.content.value==""){
		alert("내용을 입력하세요");
		f.content.focus();
		return false;
	}
	if(f.passwd.value==""){
		alert("비밀번호를 입력하세요.");
		f.passwd.focus();
		return false;
	}
	if(f.repasswd.value==""){
		alert("비밀번호를 확인해주세요");
		f.repasswd.focus();
		return false;
	}else if(f.passwd.value!=f.repasswd.value){
			alert("비밀번호가 일치하지 않습니다. \n다시입력하세요!!!!!!!!!!");
			f.repasswd.value="";
			f.repasswd.focus();
			return false;
	}
	
}
</script>

</head>

<body>

    <jsp:include page="${root }/menu/top.jsp"/>


        <div class="row">
            <div class="box">
                <div class="col-lg-12"  align="center">
                    <hr>
                    <h2 class="intro-text text-center">insert
                        <strong>movie</strong>
                    </h2>
                    <hr>
					 <form name="frm" 
					 		action="./createProc.jsp" 
					 		enctype="multipart/form-data" 
					 		method="post"
					 		onsubmit="return inputCheck(this)">
					 
					   <table>
					   
					   	<tr>
					   		<th>영화등록</th>
					   		<td>
					   			<input type="file" name="movname">
					   		</td>
					   	</tr>
					   	<tr>
					   		<th>포스터등록</th>
					   		<td>
					   			<input type="file" name="imgname">
					   		</td>
					   	</tr>
						<tr>
							<th>제목</th>
							<td>
								<input type="text" name="title">
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea rows="10" cols="45" name="content"></textarea>
							</td>
						</tr>
						
						<tr>
							<th>패스워드</th>
							<td>
								<input type="password" name="passwd">
							</td>
						</tr>
						
						<tr>
							<th>패스워드 확인</th>
							<td>
								<input type="password" name="repasswd">
							</td>
						</tr>
						
					
					  </table>
					  <br><br>
					  <div>
					  	<input type="submit" value="등록완료">
					  	<input type="button" value="뒤로" onclick="history.back()">
					  </div>
					  
					</form>
                    
                </div>
            </div>
        </div>
        

    
    <jsp:include page="${root }/menu/bottom.jsp"/>

</body>

</html>
