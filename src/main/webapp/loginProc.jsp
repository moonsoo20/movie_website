<%@page import="movie.memberBean"%>
<%@page import="movie.memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id= request.getParameter("id");
String pw= request.getParameter("pw");

String viewPage = null;


memberDao mdao = memberDao.getInstance();
memberBean member = mdao.getMemberInfo(id, pw);
	
	if(member != null){ // 존재한다.(찾았다, 등록한 회원)
		String _id = member.getMid();
		
		if(_id.equals("admin")){ // 관리자
			viewPage = request.getContextPath()+"/display/main.jsp";
		}else{ // 일반사용자
			viewPage = request.getContextPath()+"/display/main.jsp";
		}
	}else{ 
		viewPage =  "login.jsp";
	%>
		<script type="text/javascript">
			alert("가입하지 않은 회원입니다.");
		</script>
	<%
	}
%>

<script type="text/javascript">
	location.href="<%=viewPage%>";
</script>


<%
session.setAttribute("sid",id);

%>
