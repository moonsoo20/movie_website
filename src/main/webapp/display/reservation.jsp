<%@page import="movie.movieDao"%>
<%@page import="movie.movieBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>

<script type="text/javascript" src="./../js/jquery.js">
</script>

    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>

    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

    <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>

    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>

    <script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
    <script type='text/javascript'>

    $(function(){
    	$(".seatview").css('display','none');
        $('.input-group.date').datepicker({

            calendarWeeks: false,

            todayHighlight: true,

            autoclose: true,

            format: "yyyy/mm/dd",

            language: "kr"

        });

    });

    </script>

<script type="text/javascript">
	$(document).ready(function(){
		var mname=null;
		var mdate=null;
		var time= null;
		var seat=null;

		
		$(".mname").click(function(){
			
			 $('.mname').removeClass("active1"); //선택한 항목 제외 핑크색 배경 효과 제거
			  $(this).addClass("active1");	
			
			  if(document.getElementById("mdate").value!=null){ //만약에 date값이 비어있지 않다면 함수 실행해라
				 timecheck();
				  
			  }
			  
		});
		
		$(".seatviewbtn").click(function(){
		
			$(".seatview").css('display','block'); //실행하면서 안보이던 div영역 보이게 하기
			$.ajax({
						url :  "seatProc.jsp",
						data : ({
							mname : $('.active1').val(),	
							time : $('.active2').val(),
							mdate :  document.getElementById("mdate").value
							
						}),
							
						success : function(result){
			                var refine = $(".seatview").html(result).find('div');  //div에 있는 값 갖고오기
			                console.log(result);
			                console.log(refine);
			                console.log(typeof(refine));
			                $(".seatview").html(refine);
						}
					});
			  
		});
		

		
		
	});
	
	function change(){
		const mdate = document.getElementById("mdate").value
	
		if($(".acitve1").val()!="undefined"){ //만약에 name값이 비어있지 않다면 함수 실행해라
			timecheck();
		}
	}
	
	
	
	function timecheck(){
		
		
	
		var arr=new Array();
		$("#idmessage *").remove();

		$.ajax({
			url :  "rvProc.jsp",
			data : ({
				mname : $('.active1').val(),	
				mdate :  document.getElementById("mdate").value
			}),
				
			success : function(data){
				
				if($.trim(data) != 'Null'){
		
					const str=$.trim(data);
				
					const arr = str.split("/"); //가져온 시간대를 "/"로 나눠서 저장
					
					
				
					for(var i=0; i<arr.length-1; i++){ 
					
					if(arr[i]!=null){

					var bt=document.createElement('button');
					var btText=document.createTextNode(arr[i]);
					
					bt.setAttribute('value',arr[i]); 
					bt.classList.add("timebtn");
					
					bt.appendChild(btText);
					
					
					$('#idmessage').append(bt);
				
					
					bt.onclick = function() {

						 $('.timebtn').removeClass("active2");
						  $(this).addClass("active2");
						  
					}

					}
				}		
					

	
	
				}else{ 
					var sp=document.createElement('span')
					var spText=document.createTextNode('찾으시는 날짜가 없습니다');
					sp.appendChild(spText);
					
					$('#idmessage').append(sp);

				}
			}
		
		
		
		
		});

		
}
	
	function reserv(){	
		var ex= $('.sele').map((_,el) => el.value).get();
		
		
		
		alert(ex); 
		
		 $.ajax({

			url :  "check.jsp",
			data : ({
				mname : $('.active1').val(),	
				time : $('.active2').val(),
				seat : JSON.stringify(ex),
				mdate : document.getElementById("mdate").value	
			}),
			
			success : function(result){
				alert(result);
				location.reload();
			}
		}); 
	}

</script>


<style type="text/css">
.main {
	margin-left: 620px;
	overflow: auto;
	height: 400px;
	text-align: center;
}
.active1{background-color:#FFCCCC;}
.active2{background-color:#FFCCCC;}
input{background-color:white;}
input {
	text-align: left;
	background: rgba(0, 0, 0, 0);
	padding: 5px;
}
.seatview{
border: 1px solid black;
width:500px;
height:300px;
margin-left:750px;
background-color:#adb5bd;
padding-left:30px;
}


.seatviewbtn{
background-color:white;
}

.mname{

width:150px;
outline: none;
text-align: center;
}
h2{
color:white;
font-weight: bold;
}


th{
text-align: center;
}
</style>


<table class="main" border="1" style="overflow: auto;">
	<tr>
		<th>영화</th>
		<th style="width:300px;">날짜</th>
		<th style="width:300px;">시간</th>
	</tr>

	<tr style="overflow: auto;">
		<td>
			<%
			movieDao mdao = movieDao.getInstance();
			ArrayList<movieBean> mlists = mdao.searchMovieName();
			for (int i = 0; i < mlists.size(); i++) {
			%> 
			<input type="button" class="mname"
			value="<%=mlists.get(i).getMname()%>">
			<br>
			<%
			}
			%>
		</td>
		<td>
			<h3 align="center">4월</h3>
			 <div class="input-group date">
            <input type="text" id="mdate" class="form-control" onchange="change()" value="날짜를 선택하세요" ><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>

        </div>

		</td>
		
		<td><span id="idmessage"></span>
		</td>
	</tr>
	<tr>
	<td colspan="3">
	<input type="button" value="좌석 선택" onclick="show()" class="seatviewbtn">
	</td>
	</tr>
	

</table>

<br><br>
<div class="seatview">

</div>
<br><br>

<%@ include file="bottom.jsp" %> 

