<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../display/top.jsp" %> 
<style type="text/css">

div{
text-align: center;
}
@font-face {
    font-family: 'SBAggroB';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'SDSamliphopangche_Outline';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Outline.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'Dovemayo_gothic';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.1/Dovemayo_gothic.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
table{

float: left;
}

tr:first-child{
font-family: 'SDSamliphopangche_Outline';
color:white;
with:200px;
height: 40px;
font-size: 35px;
border: none;
}

.mv1 tr:first-child{
background-color: #FF6666;
}

.mv2 tr:first-child{
background-color: #808080;
}

tr:last-child{
background-color:white;
font-family: 'Dovemayo_gothic';

}

h2{
font-family: 'SBAggroB';
}

.mv1{
margin-left: 600px;
}

.mv2{
margin-top:450px;
margin-left: 600px;
}
</style>
<!-- 아바타 알라딘 스즈메 엔드게임 인사이드아웃-->

<div>
<h2>영화 차트</h2>
<hr>
<div class="mv1">
<table border="1"  style="margin-right: 15px;">
<tr>
<td>No.1</td>
</tr>
<tr>
<td><a href="mv1.jsp"><img src="./../images/mv1.jpg"  height="300px;" width="180px;" style="margin-left: 0px;"></a></td>
</tr>
<tr>
<td>아바타<br> 2023.05.10일 개봉</td>
</tr>
</table>

<table border="1"  style="margin-right: 15px;" >
<tr>
<td>No.2</td>
</tr>
<tr>
<td><a href="mv2.jsp"><img src="./../images/mv2.jpg"  height="300px;" width="180px;" style="margin-left: 0px;"></a></td>
</tr>
<tr>
<td>알라딘<br> 2023.05.10일 개봉</td>
</tr>
</table>

<table border="1"  style="margin-right: 15px;">
<tr>
<td>No.3</td>
</tr>
<tr>
<td><a href="mv3.jsp"><img src="./../images/mv3.jpg"  height="300px;" width="180px;" style="margin-left: 0px;"></a></td>
</tr>
<tr>
<td>스즈메의 문단속<br> 2023.05.10일 개봉</td>
</tr>
</table>

<table border="1"  style="margin-right: 15px;">
<tr>
<td>No.4</td>
</tr>
<tr>
<td><a href="mv4.jsp"><img src="./../images/mv4.jpg"  height="300px;" width="180px;" style="margin-left: 0px;"></a></td>
</tr>
<tr>
<td>엔드게임<br> 2023.05.10일 개봉</td>
</tr>
</table>

</div>
<!-- 두번쨰 창  -->

<div class="mv2">
<table border="1"  style="margin-right: 15px;">
<tr>
<td>No.5</td>
</tr>
<tr>
<td><a href="mv5.jsp"><img src="./../images/mv5.jpg"  height="300px;" width="180px;" style="margin-left: 0px;"></a></td>
</tr>
<tr>
<td>아바타<br> 2023.05.10일 개봉</td>
</tr>
</table>

<table border="1"  style="margin-right: 15px;" >
<tr>
<td>No.6</td>
</tr>
<tr>
<td><a href="mv6.jsp"><img src="./../images/mv6.jpg"  height="300px;" width="180px;" style="margin-left: 0px;"></a></td>
</tr>
<tr>
<td>알라딘<br> 2023.05.10일 개봉</td>
</tr>
</table>

<table border="1"  style="margin-right: 15px;">
<tr>
<td>No.7</td>
</tr>
<tr>
<td><a href="mv7.jsp"><img src="./../images/mv7.jpg"  height="300px;" width="180px;" style="margin-left: 0px;"></a></td>
</tr>
<tr>
<td>스즈메의 문단속<br> 2023.05.10일 개봉</td>
</tr>
</table>

<table border="1"  style="margin-right: 15px;">
<tr>
<td>No.8</td>
</tr>
<tr>
<td><a href="mv8.jsp"><img src="./../images/mv8.jpg"  height="300px;" width="180px;" style="margin-left: 0px;"></a></td>
</tr>
<tr>
<td>엔드게임<br> 2023.05.10일 개봉</td>
</tr>
</table>

</div>

</div>

<div style="margin-top: 900px">
<%@ include file="./../display/bottom.jsp" %> 
</div>
