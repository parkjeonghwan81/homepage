<%@ page contentType="text/html; charset=UTF-8" %> 
 <%
 	String root = request.getContextPath();
 	String id = (String)session.getAttribute("id");
 	String grade = (String)session.getAttribute("grade");
 %>
<!DOCTYPE html>
<html lang="en">
<head>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  
</head>

<body>
    <div class="brand">Illegal file-sharing!</div>
    <div class="address-bar">music | movies | up/download</div>

    <!-- Navigation -->
    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
                <a class="navbar-brand" href="<%=root%>/index.jsp">file-sharing!</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="<%=root %>/index.jsp">Home</a>
                    </li>
                    <li>
                        <a href="<%=root %>/music/list.jsp">music♬</a>
                    </li>
                    <li>
                        <a href="<%=root %>/movie/list.jsp">movies♨</a>
                    </li>
                    <li>
                        <a href="<%=root %>/board/list.jsp">게시판</a>
                    </li>

           
                     <%if(id==null) {%>
				      <li><a href="<%=root %>/bonds/agreement.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				      <li><a href="<%=root %>/bonds/loginForm.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
				     <%}else{ %>
				      <li><a href="<%=root %>/bonds/read.jsp"><span class="glyphicon glyphicon-user"></span> My Info</a></li>
				      <li><a href="<%=root %>/bonds/logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				     <%}%> 
				     <%if(id!=null && grade.equals("A")){%> 
				     <li><a href="<%=root %>/admin/list.jsp"><span class="glyphicon glyphicon-list"></span> 회원목록</a></li>
				     <% }%>
                
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>



</body>

</html>
