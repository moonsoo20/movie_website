<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>

* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
 
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

h2{
 font-family: 'SBAggroB';
}
body{
 background-image: linear-gradient(to bottom right, #E1BEE7, #B2EBF2);
}
:root {
  --padding: 60px;
}
.box {
  position: relative;
  margin: 50px auto;
  width: 400px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: var(--padding);
  background-color: #F8E0E0;
  border-radius: 7px;
  
}
.sub{
background-color: white;
width:300px;
height: 20px;
margin:50px auto;
font-family: 'Pretendard-Regular';
}

.box input,
.box button {
  padding: 15px;
  font-size: 1.2em;
  border: none;
}
.box input {
  margin-bottom: 25px;
  font-family: 'Pretendard-Regular';
}
 .register_btn{
  background-color: #F2F5A9;
  color: #547fb2;
  border-radius: 4px;
}
.regist_btn{
  background-color: #F2F5A9;
  color: #547fb2;
  border-radius: 4px;
}


</style>
</head>
<body class="text-center">
<form action="registProc.jsp" method="post">
<div class="box">
<img src="images/log3.png">
<h2> REGISTER</h2>
<br>
  <input type="text" name="id" placeholder="아이디를 입력하세요" />
  <input type="text" name="name" placeholder="이름를 입력하세요" />
  <input type="password" name="pw" placeholder="비밀번호를 입력하세요" />
  <input type="text" name="tel" placeholder="010********" />
  <input type="submit" value="회원가입" class="regist_btn">
</div>

</form>
</body>
</html>