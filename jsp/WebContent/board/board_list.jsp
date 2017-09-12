<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<title>테스트 게시판</title>
</head>
<script>
function callback(result){
	var boardList = result.list;

	$('#table').bootstrapTable('destroy');
	$('#table').bootstrapTable({
		data : boardList
	}); 
	
	$("input[type='button']").click(function(){
		var b_num = this.getAttribute("data-num");
		if(this.value=="수정"){
			location.href="/board/board_modify.jsp?b_num=" + b_num;
		}else if(this.value="삭제"){
			var param = {};
			param["b_num"] = b_num;
			param["command"] = "delete"
			param = JSON.stringify(param);
			$.ajax({ 
		        type     : "POST"
		    	    ,   url      : "/write.board"
		    	    ,   dataType : "json" 
		    	    ,   beforeSend: function(xhr) {
		    	        xhr.setRequestHeader("Accept", "application/json");
		    	        xhr.setRequestHeader("Content-Type", "application/json");
		    	    }
		    	    ,   data     : param
		    	    ,   success : function(result){
		    	    	alert(result.msg);
		    	    	location.href=result.url;
		    	    }
		    	    ,   error : function(xhr, status, e) {
		    		    	alert("에러 : "+e);
		    		},
		    		complete : function(e) {
		    		}
			    });
		}
	})
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
<div class="container">
	<table id="table" data-height="460"
		class="table table-bordered table-hover">
		<thead>
			<tr>
				<th data-field="b_num" class="text-center">번호</th>
				<th data-field="title"  class="text-center">제목</th>
				<th data-field="content"  class="text-center">내용</th>
				<th data-field="reg_date"  class="text-center">작성일자</th>
				<th data-field="name"  class="text-center">작성자</th>
			</tr>
		</thead>
		<tbody id="result_tbody">
		</tbody>
	</table>
	</div>
<input type="button" id="btnWrite" value="게시물작성">
</body>
</html>