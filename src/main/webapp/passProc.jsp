<%@page import="org.apache.commons.collections.bag.SynchronizedSortedBag"%>
<%@page import="movie.memberBean"%>
<%@page import="movie.memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	memberDao mdao = memberDao.getInstance();

	request.setCharacterEncoding("UTF-8");

	String mname = request.getParameter("name");
	String mtel = request.getParameter("tel");
	String mid = request.getParameter("id");
	
	
	memberBean member = mdao.searchPass(mid,mname,mtel);
	
	if(member == null){
		%>
		<script>
		alert("찾으시는 아이디가 없습니다");
		location.href="searchPass.jsp";
		</script>
		<%
	}
	else{
		String mpass = member.getMpw();
		System.out.print(mpass);
%>
<script>
var mpass="<%=mpass%>"
alert(mpass);
location.href="login.jsp";
</script>
<%
}
%>