<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/bonds/ssi.jsp" %>

<%
	String id = request.getParameter("id");
	String nowPage = request.getParameter("nowPage");
	String oldfile = request.getParameter("oldfile");
	
	BondsDTO dto = dao.read(id);
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8"> 

    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/bootstrap.css" rel="stylesheet">
    <link href="../css/business-casual.css" rel="stylesheet">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
	}
</script>

<script type="text/javascript">
function inputCheck(f){
	if(f.id.value==""){
		alert("아이디를 입력하세요");
		f.id.focus();
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
	if(f.name.value==""){
		alert("이름을 입력해주세요!");
		f.name.focus();
		return false;
	}
	if(f.tel.value==""){
		alert("전화번호를 입력해주세요!");
		f.tel.focus();
		return false;
	}
	if(f.email.value==""){
		alert("이메일을 입력해주세요!");
		f.email.focus();
		return false;
	}
	if(f.zipcode.value==""){
		alert("주소를 검색하세요!");
		f.zipcode.focus();
		return false;
	}
	if(f.address1.value==""){
		alert("주소를 입력하세요!");
		f.address1.focus();
		return false;
	}
	if(f.address2.value==""){
		alert("상세주소를 입력하세요!");
		f.address2.focus();
		return false;
	}
}
</script>

<script type="text/javascript">
function idCheck(id){
	if(id==""){
		alert("아이디를 입력하세요");
		document.frm.id.focus();
	} else{
		var url = "./id_Proc.jsp";
		url +="?id="+id;
		
		wr=window.open(url,"아이디검색","width=500,height=500");
		wr.moveTo((window.screen.width-500)/2, (window.screen.height-500)/2);  //가운데로 오게
		return false;
	}
}
function emailCheck(email){
	if(email==""){
		alert("이메일을 입력하세요");
		frm.email.focus();
	}else{
		var url="./email_Proc.jsp";
		url+="?email="+email;
		
		wr=window.open(url,"아이디검색","width=500,height=500");
		wr.moveTo((window.screen.width-500)/2, (window.screen.height-500)/2);  //가운데로 오게
		
		return false;
	}
}

</script>

</head>

<body>

    <jsp:include page="../menu/top.jsp"/>

        <div class="row">
            <div class="box">
                <div class="col-lg-12"  align="center">
                    <hr>
                    <h2 class="intro-text text-center">
                        <strong>update</strong>
                    </h2>
                    <hr>
					 <form name="frm" 
					 		action="./updateProc.jsp" 
					 		enctype="multipart/form-data" 
					 		method="post"
					 		onsubmit="return inputCheck(this)">
					 <input type="hidden" name="oldfile" value="<%=oldfile %>">
					 <input type="hidden" name="id" value="<%=id %>">
					 <input type="hidden" name="nowPage" value="<%=nowPage%>">
					 
					   <table>
					   
					    <tr>
					    	<td colspan="2">
								<img src="./storage/<%=dto.getFname()%>" width="200px">
								원본파일명 : <%=dto.getFname() %>
					    	</td>
					    </tr>
					   	<tr>
					   		<th>사진등록</th>
					   		<td>
					   			<input type="file" name="fname" >
					   		</td>
					   	</tr>
						<tr>
							<th>패스워드</th>
							<td>
								<input type="password" name="passwd" value="<%=dto.getPasswd()%>">
							</td>
						</tr>
						<tr>
							<th>패스워드 확인</th>
							<td>
								<input type="password" name="repasswd" value="<%=dto.getPasswd()%>">
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>
								<input type="text" name="bname" value="<%=dto.getBname()%>">
							</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>
								<input type="text" name="tel" value="<%=dto.getTel()%>">
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<input type="text" name="email" value="<%=dto.getEmail()%>">
								<button type="button" onclick="emailCheck(document.frm.email.value)">이메일중복확인</button>
							</td>
						</tr>
						<tr>
							<th>우편번호</th>
							<td>
								<input type="text" name="zipcode" id="sample6_postcode" value="<%=dto.getZipcode()%>">
								<button type="button" onclick="sample6_execDaumPostcode()">우편번호찾기</button>
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<input type="text" name="address1" id="sample6_address" value="<%=dto.getAddress1()%>"><br>
								<input type="text" name="address2" id="sample6_address2" value="<%=dto.getAddress2()%>">
							</td>
						</tr>
						<tr>
							<th>직업</th>
							<td>
								<select name="job">
							      	<option selected>선택하세요</option>
							      	<option value="A01">회사원</option>
							      	<option value="A02">전산관련직</option>
							      	<option value="A03">연구전문직</option>
							      	<option value="A04">각종학교학생</option>
							      	<option value="A05">일반자영업</option>
							      	<option value="A06">공무원</option>
							      	<option value="A07">의료인</option>
							      	<option value="A08">법조인</option>
							      	<option value="A09">종교/언론/예술인</option>
							      	<option value="A010">기타</option>
								</select>
								<script type="text/javascript">
								document.frm.job.value="<%=dto.getJob()%>"
								</script>
							</td>
						</tr>
					  </table>
					  <br><br>
					  <div>
					  	<input type="submit" value="수정완료">
					  	<input type="button" value="뒤로" onclick="history.back()">
					  </div>
					  
					</form>
                    
                </div>
            </div>
        </div>
        
<%--     <!-- jQuery -->
    <script src="js/jquery.js"></script>
    
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    
    <jsp:include page="../menu/bottom.jsp"/> --%>

</body>

</html>
