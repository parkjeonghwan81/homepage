<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
 
<style type="text/css">
 #pop{
  width:300px; height:400px; background:#3d3d3d; color:#fff; 
  position:absolute; top:10px; left:450px; text-align:center; 
  border:2px solid #000;
   }
 .close div{float:left; text-align:right;}
 #check{font-size:12px; font-family:'돋움'; padding-left:70px;}
 #close{font-size:13px; padding:5px; font-weight:bold;}
</style>
 
<script language="JavaScript">

  function setCookie( name, value, expiredays ) { 
   var todayDate = new Date(); 
    todayDate.setDate( todayDate.getDate() + expiredays ); 
    document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
   }
  function closePop() { 
   if ( document.pop_form.chkbox.checked ){ 
    setCookie( "maindiv", "done" , 1 ); 
   } 
   document.all['pop'].style.visibility = "hidden";
  }

</script>
</head>
 
<body>
 
<div id="pop">
 <div style="height:375px;">
   안녕하세요 늑대털쓴양입니다.<br>팝업 하루동안<br>안뜨게 하기 강좌 바로가기
 </div>
 
 <div class="close">
  <form name="pop_form">
  <div id="check"><input type="checkbox" name="chkbox" value="checkbox">오늘 하루동안 보지 않기</div>
  <div id="close" style="margin:auto;"><a href="javascript:closePop();">CLOSE</a></div>
  </form>
 </div>
</div>
 
<script language="Javascript">
  cookiedata = document.cookie;    
  if ( cookiedata.indexOf("maindiv=done") < 0 ){      
   document.all['pop'].style.visibility = "visible";
   } 
   else {
    document.all['pop'].style.visibility = "hidden"; 
  }
</script>
 
</body>
<!-- *********************************************** -->
</html>
