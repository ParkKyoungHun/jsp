<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<title>테스트 게시판</title>
</head>
<script>
function callback(result){
	var boardList = result.list;
	var str = "<table border='1'>";
	str += "<tr>";
	str += "<td>번호</td>";
	str += "<td>제목</td>";
	str += "<td>내용</td>";
	str += "<td>게시일자</td>";
	str += "<td>게시자</td>";
	str += "<td>수정</td>";
	str += "<td>삭제</td>";
	str += "</tr>";
	for(var i=0, max=boardList.length;i<max;i++){
		var board = boardList[i];
		str += "<tr>";
		str += "<td>" + board.b_num + "</td>";
		str += "<td>" + board.title + "</td>";
		str += "<td>" + board.content + "</td>";
		str += "<td>" + board.reg_date + "</td>";
		str += "<td>" + board.name + "</td>";
		str += "<td><input type='button' value='수정'></td>";
		str += "<td><input type='button' value='삭제'></td>";
		str += "</tr>";
	}
	str += "</table>";
	$("#result_div").html(str);
		
}
$(document).ready(function(){
	var param = "?command=list";
	var au = new AjaxUtil(param,"/list.board");
	au.changeCallBack(callback);
	au.send();
	$("#btnWrite").click(function(){
		location.href="/board/board_write.jsp";
	})
})
</script>
<body>
<div id="result_div"></div>
<input type="button" id="btnWrite" value="게시물작성">
</body>
</html>