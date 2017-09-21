<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "../bonds/ssi.jsp" %>
<%
	
	//검색
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	if(col.equals("total")) word="";
	
	int nowPage = 1;
	int recordPerPage= 5;
	if(request.getParameter("nowPage")!=null)
		nowPage = Integer.parseInt(request.getParameter("nowPage")); //페이지유지
	
	int sno = ((nowPage-1)*recordPerPage) + 1;
	int eno = (nowPage*recordPerPage);
	
	Map map = new HashMap();
	
	map.put("sno",sno);
	map.put("eno",eno); 
	map.put("col",col);
	map.put("word",word);
	
	int total = dao.total(map);
	List<BondsDTO> list = dao.list(map);
	
	String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);
	
	
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <link href="<%=root %>/css/bootstrap.css" rel="stylesheet">
    <link href="<%=root %>/css/business-casual.css" rel="stylesheet">
    
    <script type="text/javascript">
    function read(id){
    	var url = "<%=root%>/bonds/read.jsp";
    	url += "?id="+id;
    	url += "&nowPage=<%=nowPage%>";
    	url += "&col=<%=col%>";
    	url += "&word=<%=word%>";
    	
    	location.href = url;
    }
    </script>
    
</head>

<body>
    <jsp:include page="${root }/menu/top.jsp"/>

    <div class="container">

        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">
                        <strong>회 원 목 록</strong>
                    </h2>
                    <hr>
                    <div align="center">
						<form name = "frm" method="post" action = "./list.jsp">
							<select name = "col">
								<option value="id" <%if(col.equals("id")) out.print("selected='selected'"); %>>아이디</option>
								<option value="bname" <%if(col.equals("bname")) out.print("selected='selected'");%>>성명</option>
								<option value="email" <%if(col.equals("email")) out.print("selected='selected'");%>>이메일</option>							
								<option value="total">전체출력</option>
							</select>
							<input type="text" name="word" value="<%=word %>">
							<button>검색</button>
							<input type="button" onclick="location.href='<%=root%>/bonds/agreement.jsp'" value="회원가입">
						</form>
                    </div>
                    <br>
                </div>
					
             		<table align="center">
      				<%for(int i = 0; i<list.size(); i++){
      					BondsDTO dto = list.get(i);
      				%>
      				    <TR>
					      <td rowspan="4" >
					       <img src="<%=root %>/bonds/storage/<%=dto.getFname()%>" width="70px">
					      </td>
					      <TH width="20%">아이디</TH>
					      <TD width="50%">
					      <a href="javascript:read('<%=dto.getId()%>')"><%=dto.getId()%></a>
					      </TD>
					    </TR>
					    <TR>
					      <TH>성명</TH>
					      <TD><%=dto.getBname()%></TD>
					    </TR>
					    <TR>
					      <TH>이메일</TH>
					      <TD><%=dto.getEmail()%></TD>
					    </TR>
					    <TR>
					      <TH>등록날짜</TH>
					      <TD><%=dto.getJdate()%></TD>
					    </TR>
					    <% } %>
             		
             		</table>
               
            </div>
        </div>
    </div>
    
  <DIV>
  <%=paging %>
  </DIV>
    
    <jsp:include page="${root }/menu/bottom.jsp"/>
</body>
</html>
