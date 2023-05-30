<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.reviewBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.reviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript"></script>
<style type="text/css"></style>

<%
String rname=request.getParameter("rname");
int pageSize = 5;
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

String pageNum = request.getParameter("pageNum"); //pageNum:내가 선택한 페이지번호
System.out.println("pageNum : " + pageNum);
if(pageNum == null){
	pageNum = "1";
}
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage-1) * pageSize + 1;
int endRow = currentPage * pageSize;	

reviewDao rdao= reviewDao.getInstance();
ArrayList<reviewBean> lists= null;
int count = rdao.getArticleCount(rname);
if(count > 0) {
	lists = rdao.getArticles(rname,startRow,endRow);  
}
int number = count-(currentPage-1) * pageSize;
System.out.println(rname);
System.out.println(startRow);
System.out.println(endRow);

%>
<body>
<div>
<button>리뷰쓰러가기</button>
<br>
<%
	if(count == 0){
%>
		<table>
			<tr>
				<td align="center">
					게시판에 저장된 글이 없습니다.
				</td>
			</tr>
		</table>
<%		
	}else{
%>
<table border="1">

<%for(reviewBean rb: lists){%>
<tr height="30" align="center">
<td><%=rb.getRid()%> <br>
<%=rb.getReview() %><br>
<%=rb.getRdate() %><br>
</tr>
<% }%>
</table>
<% }%>
</div>
</body>
