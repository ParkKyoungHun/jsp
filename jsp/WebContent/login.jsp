<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Map user = null;
if(session!=null && session.getAttribute("user")!=null){
	user = (Map)session.getAttribute("user");
}
if(user==null){
%>
<form action="login.user" method="post">
아이디 : <input type="text" name="id"><br>
비밀번호 : <input type="password" name="pwd"><br>
<input type="hidden" name="command" value="login"/>
<input type="submit" value="로그인">
</form>
<%
}else{
	out.println(user.get("name") + "님 환영합니다.");
}
%>
</body>
</html>