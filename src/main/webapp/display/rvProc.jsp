
<%@page import="movie.movieBean"%>
<%@page import="movie.movieDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	movieDao mdao = movieDao.getInstance();

//	System.out.println("안녕");

	String mname = request.getParameter("mname");
	String mdate1 = request.getParameter("mdate");
	
	
	String mdate=mdate1.substring(2,10);
	//System.out.println("mname:" + mname);
	//System.out.println("mdate:" + mdate);
	

	 ArrayList<movieBean> mlists = mdao.searchTime(mname,mdate);
	
	String str = "";
	if(mlists.size()==0){
		str = "Null";
		out.println(str);
	}else{
		str = "YES";
		for(int i=0; i<mlists.size(); i++){
			out.println(mlists.get(i).getTime()+"/");
			//System.out.println(mlists.get(i).getTime()+"/");
		}
		

	}

	
%>
