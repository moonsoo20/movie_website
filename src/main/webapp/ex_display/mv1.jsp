<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../display/top.jsp" %> 
<style type="text/css">
@font-face {
    font-family: 'SBAggroB';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.im{
margin: auto;
}
.mvsub{
width: 800px;
height: 700px;
text-align: center;
border: 1px solid black;
 background-color: #ffffff;
 background-color: rgba( 255, 255, 255, 0.5 );
margin: auto;
}
iframe{
margin-top: 100px;
}

.ac img{
width:400px;
height:300px;
}
</style>
<script type="text/javascript" src="./../js/jquery.js"></script>



<script type="text/javascript">
 
$(document).ready(function(){	
});

function button1(){
	var a= document.getElementById('mvsub');
	var str="<div><h2>소개</h2><br> 아바타: 물의 길은 판도라 행성에서 제이크 설리와 네이티리가 이룬 가족이 겪게 되는 무자비한 위협과 살아남기 위해 떠나야 하는 긴 여정과 전투, 그리고 견뎌내야 할 상처에 대한 이야기를 그렸다. 월드와이드 역대 흥행 순위 1위를 기록한 전편 <아바타>에 이어 제임스 카메론 감독이 13년만에 선보이는 영화로, 샘 워싱턴, 조 샐다나,시고니 위버, 스티븐 랭, 케이트 윈슬렛이 출연하고 존 랜도가 프로듀싱을 맡았다.</div><div><h2>수상내력</h2><br><ol><li>95회 미국 아카데미 시상식(시각효과상)</li><li>50회 애니어워드(실사 촬영: 캐릭터 애니메이션상, 장편 애니메이션: FX상)</li><li>76회 영국 아카데미 시상식(특수시각효과상)</li><li>38회 산타바바라 국제영화제(버라이어티 상)</li><li>28회 크리틱스 초이스 시상식(시각효과상)</li><li>48회 LA 비평가 협회상(미술상)</li></div>";
	
	str+= ""
	a.innerHTML=str;
	
}
function button2(){
	var a= document.getElementById('mvsub');
	a.innerHTML='<iframe width="700" height="450" src="https://www.youtube.com/embed/kihrFxwdMb4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>';
}
function button3(){
	var a= document.getElementById('mvsub');
	
 	var str='<table class="ac"><tr><td><img src="images/mv1sub1.jpg"></td><td><img src="images/mv1sub2.jpg"></td></tr><tr><td><img src="images/mv1sub3.jpg"></td><td><img src="images/mv1sub4.jpg"></td></tr><tr><td><img src="images/mv1sub5.jpg"></td><td><img src="images/mv1sub6.jpg"></td></tr></table>';

	a.innerHTML=str;
}

function button4(){
			$.ajax({
						url :  "review.jsp",
						data : ({
							rname : "아바타"	
						}),
							
						success : function(result){
			                var refine = $(".mvsub").html(result).find('div');  //div에 있는 값 갖고오기
			                console.log(result);
			                console.log(refine);
			                console.log(typeof(refine));
			                $(".mvsub").html(refine);
						}
					});
}
</script>



<table  class="im" border="1">

<tr> 
<td><img alt="아바타사진" src="./../images/mv1.jpg" height="320px" width="200px"></td>
<td><p style=" font-family: 'SBAggroB'; font-size:30px;"> 물의 길</p><br>
Avatar: The Way of Water<br>
감독:제임스 카메론<br>
장르:액션, 모험, SF, 스릴러<br>
개봉:2022.12.14</td>
</tr>
</table>

<br>

<div style="text-align: center">
<input type="button" value="영화소개" onclick="button1()">
<input type="button" value="영화 예고편" onclick="button2()">
<input type="button" value="포토" onclick="button3()">
<input type="button" value="리뷰" onclick="button4()">
</div>

<br>
<div class="mvsub" id="mvsub">


</div>

<div style="margin-top:300px;">

<%@ include file="./../display/bottom.jsp" %> 
</div>