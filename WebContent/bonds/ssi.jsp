<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="bonds.*" %>
<%@ page import="utility.*" %>
<%@ page import="java.util.*" %>  <!-- 이거넣으니까 List를 쓸수있게 됐다. -->
<%@ page import="org.apache.commons.fileupload.*" %> <!-- 파일업로드하기 위해 넣었음 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>  <!-- web-inf의 tlds에서 설정해줬다 -->

<jsp:useBean id="dao" class="bonds.BondsDAO"/>

<%
	String upDir = request.getRealPath("/bonds/storage");
	String tempDir = request.getRealPath("/bonds/temp");
	String root = request.getContextPath();
%>