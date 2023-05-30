<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style type="text/css">
iframe{
margin-left: 450px;
}
@font-face {
    font-family: 'SBAggroB';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

.list{
margin-left:550px;
margin-top:70px;
}

.list{
font-size: 30px;
}

.list_1{
font-family: 'SBAggroB';
}

.mv_list1{
paddint-top:5px;
overflow: hidden;

}

.will_btn{
margin-top: 250px;
}

div>img{
float: left;
margin-left: 10px;
display: block;
}
.mv_list2{
paddint-top:5px;
overflow: hidden;

}
.right{
float : right;
}
.will_btn{
  font-family: 'Pretendard-Regular';
}
.now_btn{
  font-family: 'Pretendard-Regular';
}

.screen {position:relative;overflow:hidden; float: left;}
.top {position:absolute;bottom:150%;left:30px;z-index:2;color:#fff;font-size:26px;font-weight:900;transition:all .35s;}
 .top {position:absolute;bottom:150%;left:30px;z-index:2;color:#fff;font-size:26px;font-weight:900;transition:all .35s;}
 .bottom {position:absolute;top:150%;left:30px;z-index:2;color:#fff;font-size:12px;transition:all .35s;}
 img {width:150px; height: 200px; s display: block;}
 .screen::after {content:'';display:block;position:absolute;top:0;left:0;width:100%;height:100%;background:rgba(0,0,0,.5);z-index:1;opacity:0;transition:all .35s;}
  
 a:hover .top {bottom:52%;}
  a:hover .bottom {top:52%;}
  a:hover .screen::after {opacity:1;}
  

</style>   

<script type="text/javascript" src="./../js/jquery.js"></script>



 <script type="text/javascript">
 
 
</script>
<%@ include file="top.jsp" %> 

<div class="mv"><iframe width="1000" height="500" src="https://www.youtube.com/embed/UUpk0wnNhtU?autoplay=1&mute=1&controls=0" title="YouTube video player" frameborder="0" 
allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
</div>

<div class="list">
<div class="list_1">TOP5 영화 리스트</div>
<div class="now_btn">현재 상영작</div>

<div class="mv_list1">
<a href="./../ex_display/mv1.jsp">
<div class="screen">
<div class="top">아바타</div>
<div class="bottom">
<button style="background: black">설명 보러가기</button>
</div>
<img src="./../images/mv1.jpg">
</div>
</a>
<a href="">
<div class="screen">
<div class="top">알라딘</div>
<div class="bottom"><button style="background: black">설명 보러가기</button></div>
<img src="./../images/mv2.jpg">
</div>
</a>
<a href="">
<div class="screen">
<div class="top">스즈메의 문단속</div>
<div class="bottom"><button style="background: black">설명 보러가기</button></div>
<img src="./../images/mv3.jpg">
</div>
</a>
<a href="">
<div class="screen">
<div class="top">엔드게임</div>
<div class="bottom"><button style="background: black">설명 보러가기</button></div>
<img src="./../images/mv4.jpg">
</div>
</a>
<a href="">
<div class="screen">
<div class="top">인사이드 <br>아웃</div>
<div class="bottom"><button style="background: black">설명 보러가기</button></div>
<img src="./../images/mv5.jpg" >
</div>
</a>

<div class="will_btn">상영 예정작</div>

<div class="mv_list2">
<%
for(int i=1; i<6; i++){
%>
<img src="./../images/wv<%=i%>.jpg">
<%
}
%>


</div>
</div>

<br>

</div>

<%@ include file="bottom.jsp" %> 
