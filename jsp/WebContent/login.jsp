<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<%
String rootPath = request.getContextPath();
%>
<script src="<%=rootPath%>/js/jquery-3.2.1.min.js"></script>
<script src="<%=rootPath%>/ui/common.js?"></script>
<script src="<%=rootPath%>/ui/btsp3.7.7/js/bootstrap.min.js?"></script>
<script src="<%=rootPath%>/ui/btsp3.7.7/js/bootstrap-table.js?"></script>
<script src="<%=rootPath%>/ui/btsp3.7.7/js/bootstrap-table.js?"></script>
<link rel="stylesheet" href="<%=rootPath%>/ui/btsp3.7.7/css/bootstrap-theme.min.css?"/>
<link rel="stylesheet" href="<%=rootPath%>/ui/btsp3.7.7/css/bootstrap.min.css?"/>
<link rel="stylesheet" href="<%=rootPath%>/ui/btsp3.7.7/css/bootstrap-table.css?"/>
<link rel="stylesheet" href="<%=rootPath%>/ui/common.css?"/>

<body>
<%
Map user = null;
if(session!=null && session.getAttribute("user")!=null){
	user = (Map)session.getAttribute("user");
}
if(user==null){
%>

<link rel="stylesheet" href="/ui/signin.css" />
<body>
	<div class="container">
		<form class="form-signin" action="/login.user" method="post">
			<h2 class="form-signin-heading">Please login</h2>
			<label for="inputEmail" class="sr-only">ID</label> <input type="text"
				id="id" name="id" class="form-control" placeholder="ID" required
				autofocus> <label for="inputPassword" class="sr-only">Password</label>
			<input type="password" name="pwd" id="pwd" class="form-control"
				placeholder="Password" required>
			<div class="checkbox">
				<label> <input type="checkbox" value="remember-me">
					Remember me
				</label>
			</div>
			<input type="hidden" name="command" value="login"/>
			<input  class="btn btn-lg btn-primary btn-block"
				type="submit" value="Login">
		</form>

	</div>
	<!-- /container -->
	<script>
	$("#btn2").click(function(){
		var id = $("#id").val();
		var pwd = $("#pwd").val();
		var param = {};
		param["id"] = id;
		param["pwd"] = pwd;
		param["command"] = "login";
		param = JSON.stringify(param);
		var a = { 
		        type     : "POST"
		    	    ,   url      : "/login.user"
		    	    ,   dataType : "json" 
		    	    ,   data     : param
		    	    ,   success : function(result){
		    	    	alert(result.msg);
		    	    	if(result.login=="ok"){
		    	    		location.href = "/main.jsp";
		    	    	}else{
		    	    		$("#id").val("");
		    	    		$("#pwd").val("");
		    	    	}
		    	    }
		    	    ,   error : function(xhr, status, e) {
		    		    	alert("에러 : "+e);
		    		},
		    		done : function(e) {
		    		}
		    		};
		$.ajax(a);
	});
</script>
<%
}else{
	out.println(user.get("name") + "님 환영합니다.");
}
%>
</body>
</html>