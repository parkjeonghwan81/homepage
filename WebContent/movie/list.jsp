<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/movie/ssi.jsp"%>
<%
	//검색관련
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	if(col.equals("total")) word = "";
	
	//페이지관련
	int nowPage=1;
	int recordPerPage=9;
	if(request.getParameter("nowPage")!=null)
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	
	int sno = ((nowPage-1)*recordPerPage) +1;
	int eno = (nowPage*recordPerPage);
	
	Map map = new HashMap();
	map.put("col",col);
	map.put("word",word);
	map.put("sno",sno);
	map.put("eno",eno);
	
	int total = dao.total(map);
	List<MovieDTO> list = dao.list(map);
	
	String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);
	
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
function read(movieno){
	
}



</script>

</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="${root }/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<div class="box" align="center">

		<div class="container">
			<div class="row">
                <div class="col-lg-12">
                    <hr>
	                    <h2 class="intro-text text-center">share
	                        <strong>moveis!</strong>
	                    </h2>
                    <hr>
                </div>
                
                <FORM name='frm' method='POST' action='./list.jsp'>
					<select name="col">
						<option value="title" 
						<%if(col.equals("title")) out.print("selected='selected'"); %>>제목</option>
						<option value="content"
						<%if(col.equals("content")) out.print("selected='selected'"); %>>내용</option>
						<option value="total">전체출력</option>
						
					</select>	
					<input type="text" name="word" value="<%=word %>">
					<button>검색</button>
					<button type="button" onclick="location.href='./createForm.jsp'">등록</button>
				</FORM><Br><br>
                
                  <% 
  					for(int i = 0;i<list.size();i++){
	 					MovieDTO dto = list.get(i);  
  				  %>
<%--                 <div class="col-sm-4 text-center">
                    <img class="img-responsive" src="./storage/<%=dto.getImgname() %>" onclick="javascript:read(<%=dto.getMovieno()%>)">
                    <a href= "javascript:read(<%=dto.getMovieno()%>)">
                    <h3>
                    	<%=dto.getTitle() %>
                    </h3></a>
                </div> --%>
                <div class="col-sm-4"> 
      <div class="panel panel-primary" style="height:50%">
        <div class="panel-heading"><h4>-Title- <br><%=dto.getTitle()%></h4></div>
        <div class="panel-body"><img src="./storage/<%=dto.getImgname() %>" class="img-responsive" style="width:100%" alt="Image"></div>
      </div>
    </div>
                
                   <% } %>
                
                
                <!-- <div class="col-sm-4 text-center">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                    <h3>John Smith
                    </h3>
                </div>
                <div class="col-sm-4 text-center">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                    <h3>John Smith
                    </h3>
                </div>
                
                <Br>
                
                <div class="col-sm-4 text-center">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                    <h3>John Smith
                    </h3>
                </div>
                <div class="col-sm-4 text-center">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                    <h3>John Smith
                    </h3>
                </div>
                <div class="col-sm-4 text-center">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                    <h3>John Smith
                    </h3>
                </div>
                
                <br>
                
                <div class="col-sm-4 text-center">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                    <h3>John Smith
                    </h3>
                </div>
                <div class="col-sm-4 text-center">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                    <h3>John Smith
                    </h3>
                </div>
                <div class="col-sm-4 text-center">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                    <h3>John Smith
                    </h3>
                </div>
                <div class="clearfix"></div> -->
                
            </div>
        </div>
		<Br><br>
		<%=paging %>
	</div>
	
	
	


	<jsp:include page="${root }/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
