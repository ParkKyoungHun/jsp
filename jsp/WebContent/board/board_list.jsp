<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<title>테스트 게시판</title>
</head>
<script>
function callback(result){
	alert(result.list);
}
$(document).ready(function(){
	var param = "?command=list";
	var au = new AjaxUtil(param,"/list.board");
	au.changeCallBack(callback);
	au.send();
})
</script>
<body>

</body>
</html>