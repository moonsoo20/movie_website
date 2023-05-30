<%@page import="org.apache.commons.collections.bag.SynchronizedSortedBag"%>
<%@page import="movie.reservDao"%>
<%@page import="movie.movieBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="movie.movieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
 	String mname=request.getParameter("mname");
	String mdate1=request.getParameter("mdate");
	String mdate=mdate1.substring(2,10);
	String time= request.getParameter("time"); 


	reservDao rdao =reservDao.getInstance();

%>
<style type="text/css">
div{
width:500px;
height:300px;
border: 1px solid black;
display :inline-block;
background-color:#adb5bd;
}

h2{
color:white;
font-weight: bold;
}

.inuse{
background-color: red;
}
span{
border: 1px solid black;
}



</style>
<script type="text/javascript" src="./../js/jquery.js"></script>
 <script>
 $(document).ready(function(){
		
		$(".seatBtn").click(function(){
			
			//alert($(this).css("background-color"));
			
			if($(this).css("background-color")=="rgb(255, 0, 0)"){
				alert('이미 판매된 좌석입니다');
			}
			
			
			else if($(this).css("background-color")=="rgb(0, 128, 0)"){
					
				alert($(this).attr('id')+" 좌석을 취소하였습니다");
					$(this).css("background-color","rgba(0, 0, 0, 0)");
	
					$(this).removeClass('sele');
					
					
			
			}
			else{
				$(this).css("background-color","green");
				alert($(this).attr('id')+" 좌석을 선택하였습니다");
				
				$(this).addClass('sele');
				} 
			
			});
			  
		});
function css_action(seatNum1){
	

	//alert(seatNum1);

	$('#'+seatNum1).css("background-color", "red");
}

 </script>


</head>
<body>
<div>
<h2 align="center">Screen</h2>
<span>
<%
	
		String [][] seatNum= new String[][]	{
		
		{"A1","A2","A3","A4","A5","A6","A7","A8"},
		{"B1","B2","B3","B4","B5","B6","B7","B8"},
		{"C1","C2","C3","C4","C5","C6","C7","C8"},
		{"D1","D2","D3","D4","D5","D6","D7","D8"},
		{"E1","E2","E3","E4","E5","E6","E7","E8"},
		{"F1","F2","F3","F4","F5","F6","F7","F8"}
		
	};
	

			
	for(int i=0; i<seatNum.length; i++){
		for(int j=0; j<seatNum[i].length; j++){
			String seatNum1= seatNum[i][j];
			 int cnt= rdao.searchSeat(seatNum1,mname,mdate,time);
				
				if(j==2||j==6){
				%>
				&nbsp&nbsp&nbsp
			<input type="button" value=<%=seatNum[i][j] %> id="<%=seatNum1 %>" class="seatBtn" >
				
			<%
				}else if(j==0){%>
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp
			<input type="button" value=<%=seatNum[i][j] %> id="<%=seatNum1 %>" class="seatBtn" >
			
				
				<%
			}
				
				else{
					%>
				<input type="button" value=<%=seatNum[i][j] %> id="<%=seatNum1 %>" class="seatBtn" >
					<% 
				}
				
				if(cnt==1){
					%>
					<script type="text/javascript">
					var seatNum1="<%=seatNum1%>"
					css_action(seatNum1);
					</script>
					<% 
				}
				}
				%>
				<br>
				<% 
			}
			%>
				
				
	</span>
	<span><input type="button" value="예약하기" onclick="reserv()"></span>

	</div>
	
</body>
</html>