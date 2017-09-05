<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<title>게시판 작성</title>
</head>
<script>
$(document).ready(function(){
	$("#btnWrite").click(function(){
		var param = {};
		param["title"] = $("#title").val();
		param["content"] = $("#content").val();
		param = "?command=write&param=" + JSON.stringify(param);
		param = encodeURI(param);
		var au = new AjaxUtil(param,"write.board");
		au.send();
	})
})

</script>
<body>
<form action="write.board" method="post">
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" id="title"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content" id="content"></textarea></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="writer" id="writer" readonly value="<%=user.get("name")%>"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" id="btnWrite" value="게시글 올리기"></td>
		</tr>
	</table>
	<input type="hidden" name="command" value="write">
</form>
</body>
</html>