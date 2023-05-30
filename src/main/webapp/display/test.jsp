<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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



</style>
<title>Insert title here</title>
</head>
<body>
<div>
<h2 align="center">Screen</h2>
<span>
<%
	
		String [][] seatNum= new String[][]	{
		
		{"A[1]","A[2]","A[3]","A[4]","A[5]","A[6]","A[7]","A[8]"},
		{"B[1]","B[2]","B[3]","B[4]","B[5]","B[6]","B[7]","B[8]"},
		{"C[1]","C[2]","C[3]","C[4]","C[5]","C[6]","C[7]","C[8]"},
		{"D[1]","D[2]","D[3]","D[4]","D[5]","D[6]","D[7]","D[8]"},
		{"E[1]","E[2]","E[3]","E[4]","E[5]","E[6]","E[7]","E[8]"},
		{"F[1]","F[2]","F[3]","F[4]","F[5]","F[6]","F[7]","F[8]"}
		
	};

	for(int i=0; i<seatNum.length; i++){
		for(int j=0; j<seatNum[i].length; j++){
		if(j==2||j==6){
		%>
		&nbsp&nbsp&nbsp
		<button><%=seatNum[i][j] %></button>
		
	<%
		}else if(j==0){%>
	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	<button><%=seatNum[i][j] %></button>
	
		
		<%
	}
		
		else{
			%>
		<button><%=seatNum[i][j] %></button>
			<% 
		}
		}
		%>
		<br>
		<% 
	}
	%>
	</span>
	</div>
</body>
</html>