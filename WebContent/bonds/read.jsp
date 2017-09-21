<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/bonds/ssi.jsp" %>

<%
	String id = request.getParameter("id");
	if(id==null) id=(String)session.getAttribute("id");
	BondsDTO dto = dao.read(id);
	
	String nowPage = request.getParameter("nowPage");
	String col = request.getParameter("col");	
	String word = request.getParameter("word");	
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<link href="<%=root %>/css/bootstrap.css" rel="stylesheet">
<link href="<%=root %>/css/business-casual.css" rel="stylesheet">

<style type="text/css">
td{
	text-align:"center";
}
</style>

<script type="text/javascript">
    
    function update(){
    	url = "./updateForm.jsp";
    	url += "?id=<%=id%>";
    	url += "&nowPage=<%=nowPage%>";
    	url += "&oldfile=<%=dto.getFname()%>";
    	
    	location.href=url;
    }
    
    function mlist(){
    	var url = "./list.jsp";
    	url += "?nowPage=<%=nowPage%>";
    	url += "&col=<%=col%>";
    	url += "&word=<%=word%>";
    	
    	location.href=url;
    }


    function updatePw(){
    	var url = "updatePwForm.jsp";
    	url += "?id=<%=id%>";
    	url += "&nowPage=<%=nowPage%>";
    	
    	location.href = url;
    }

    function del(){
    	var url = "./deleteForm.jsp";
    	url += "?id=<%=id%>";
    	url += "&oldfile=<%=dto.getFname()%>";
    	url += "&col=<%=col%>";
    	url += "&word=<%=word%>";
    	url += "&nowPage=<%=nowPage%>";
    	location.href = url;
    }    
</script>

</head> 
<body>
<jsp:include page="../menu/top.jsp" flush ="false"/>

 <div class="container">
 
        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">
                        <strong><%=dto.getBname()%>님의 정보</strong>
                    </h2>
                    <hr>
                    <br>
                </div>
					
             		 <TABLE align="center">
					    <TR>
					      <Td colspan="2">
					      <img src="./storage/<%=dto.getFname()%>" width="300px"></Td>
					    </TR>
					    <TR>
					      <TH>아이디</TH>
					      <TD><%=dto.getId() %></TD>
					    </TR>
					    <TR>
					      <TH>성명</TH>
					      <TD><%=dto.getBname() %></TD>
					    </TR>
					    <TR>
					      <TH>전화번호</TH>
					      <TD><%=dto.getTel() %></TD>
					    </TR>
					    <TR>
					      <TH>이메일</TH>
					      <TD><%=dto.getEmail() %></TD>
					    </TR>
					    <TR>
					      <TH>우편번호</TH>
					      <TD><%=dto.getZipcode() %></TD>
					    </TR>
					    <TR>
					      <TH>주소</TH>
					      <TD>
					      	<%=Utility.checkNull(dto.getAddress1()) %>
					      	<%=Utility.checkNull(dto.getAddress2()) %>
					      </TD>
					    </TR> 
					    <TR>
					      <TH>직업</TH>
					      <TD>
					      	<%=Utility.checkNull( Utility.getCodeValue(dto.getJob())) %>
					      </TD>
					    </TR>
					    <TR>
					      <TH>등록날짜</TH>
					      <TD><%=dto.getJdate() %></TD>
					    </TR>
					    
					</TABLE>
             		<br>
             		
             		<DIV align="center">
					    <input type='button' value='정보수정' onclick="update()">
					    <input type='button' value='패스워드변경' onclick="updatePw()">
					    <input type='button' value='회원삭제' onclick="del()">
  					</DIV>
  					
            </div>
        </div>
    </div>
    
<jsp:include page="../menu/bottom.jsp" flush="false"/>
</body>
</html> 