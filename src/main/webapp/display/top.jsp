<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<script type="text/javascript" src="./../js/jquery.js">
</script>

    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>

	<link rel="stylesheet" href="/css/jquery-ui.min.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>

    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

    <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>



    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">

    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>

    <script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
<style type="text/css">


body{
 background-image: linear-gradient(to bottom right, #E1BEE7, #B2EBF2);
}

.menu {
	text-align: center;
	padding-left:200px;
	padding-top:20px;
	height:50px;
	margin-top:-20px;
	background-color: white;
}

.menu li {
	display: inline-block;
	text-align: center;
	font-weight: bold;
	margin-left:20px;
	font-family: 'TheJamsil5Bold';
}

a {
  text-decoration: none;
  color:black;
}

@font-face {
    font-family: 'TheJamsil5Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
.ma{
margin-left:47%;
}

.logout {
    background-color: #519d9e;
    color: #9dc8c8;
}
.logout-outline {
    border: 3px solid #519d9e;
    color: darkgray;
}
</style>

<script type="text/javascript" src="./../js/jquery.js"></script>



 <script>
 $(document).ready(function(){
		
		$(".logout").click(function(){
			location.href="./../login.jsp";  
		});
			  
		});
 
</script>

</head>
<%
String sid = (String)session.getAttribute("sid"); 
%>
<header>
<img class="ma" src="./../images/log3.png" width="200" height="150">
<hr>
<div class="log">
		<ul class="menu">
			<li><a href="./../display/main.jsp">메인화면</a></li>
			<li><a href="./../display/cinemas.jsp">영화관</a></li>
			<li><a href="./../display/reservation.jsp">예매</a></li>
			<li><a href="./../ex_display/explain_main.jsp">영화</a></li>
			<div style="float: right">
			<li><%=sid %> 님</li>
			<li style="margin-right:10px"><input type="button" value="로그아웃" class="logout"></li>
			</div>
		</ul>
	

</div>


</header>

</html>
