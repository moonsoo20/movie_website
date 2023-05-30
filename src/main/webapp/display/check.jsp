<%@page import="movie.reservDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
	request.setCharacterEncoding("utf-8");
	String mname=request.getParameter("mname");
	String mdate=request.getParameter("mdate");
	String time= request.getParameter("time");
	String sid = (String)session.getAttribute("sid"); 
	reservDao rdao =reservDao.getInstance();

	
	String seat1=request.getParameter("seat");

	
	ArrayList<String> list = new ArrayList<>(); //seat에서 좌석 받아와서 저장하는 배열
	
	int j=0;
	for(int i=2; i<seat1.length()-2; i+=5){
		String str = seat1.substring(i, i+2); //잘라서 변수에 저장
		//System.out.println("i:"+i);
		//System.out.println("j:"+j);rmfja
		//System.out.println("str:"+str);
		
		list.add(str);
		System.out.println(list.get(j)); //리스트에 잘라놓은거 저장
		j++;
	} 
	int cnt=-1;
	String str="";
	
	for(int i=0; i<list.size(); i++){
		
	 cnt=rdao.insertReserv(sid,mname,mdate,time,list.get(i));
	}
	if(cnt==-1){
		str = sid+" 님 예약에 실패했습니다 다시 시도해주세요";
		out.println(str);
	}else{
		str = sid+" 님 "+mname+" 영화 예약에 성공하였습니다 ";
		out.println(str);
	}

	
	%>
