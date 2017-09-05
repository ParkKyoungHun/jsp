<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<title>게시판 작성</title>
</head>
<script>
function callback(result){
	$("#title").val(result.title);
	$("#content").val(result.content);
	$("#writerName").val(result.name);
	$("#writer").val(result.writer);
}
$(document).ready(function(){
	var param = {};
	param["b_num"] = "<%=request.getParameter("b_num")%>";
	param = "?command=view&param=" + JSON.stringify(param);
	param = encodeURI(param);
	var au = new AjaxUtil(param,"write.board");
	au.changeCallBack(callback);
	au.send();
	$("#btnMOdify").click(function(){
		var param = {};
		param["title"] = $("#title").val();
		param["content"] = $("#content").val();
		param["writer"] = $("#writer").val();
		param = "?command=modify&param=" + JSON.stringify(param);
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
			<td><input type="text" name="writerName" id="writerName" readonly ></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" id="btnMOdify" value="게시글 수정"></td>
		</tr>
	</table>
	<input type="hidden" name="command" id="command" value="write">
	<input type="hidden" id="writer" >
</form>
</body>
</html>