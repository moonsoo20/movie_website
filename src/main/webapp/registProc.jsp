
<%@page import="movie.memberDao"%>
<%@page import="org.apache.commons.collections.bag.SynchronizedSortedBag"%>


<head>

 <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

</head>
<%
	
	memberDao mdao=	memberDao.getInstance();
	request.setCharacterEncoding("utf-8");
 	String name=request.getParameter("name");
 	String id=request.getParameter("id");
 	String pw =request.getParameter("pw");
	String tel =request.getParameter("tel");

	
	System.out.println(name);
	System.out.println(id);
	System.out.println(pw);
	System.out.println(tel);

	int cnt=mdao.insertMember(name,id,pw,tel);
	
	if(cnt!=-1){
		%>
		<script>
		alert("회원가입에 성공하였습니다");
		location.href="login.jsp";
		</script>
		<%
	}
	else{
		%>
		<script>
		alert("회원가입에 실패하였습니다 다시 시도해주세요");
		location.reload();
		</script>
		<%
	}
%>