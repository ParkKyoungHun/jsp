<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<title>유저리스트</title>
<script>
	var AjaxUtil = function(params) {
		this.params = params;

		getHttpXmlObj = function() {
			if (window.XMLHttpRequest) {
				return new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				return new ActiveXObject("Microsoft.XMLHTTP");
			}
			alert("해당 브라우져가  Ajax를 지원하지 않습니다.");
		}
		this.xhr = getHttpXmlObj();
		var method = "post";
		var url = "test.user";
		var aSync = true;
		this.xhr.callback = null;
		this.xhr.onreadystatechange = function() {
			if (this.readyState == 4) {
				if (this.status == 200) {
					var result = decodeURIComponent(this.responseText);
					result = JSON.parse(result);
					$('#table').bootstrapTable('destroy');
					$('#table').bootstrapTable({
						data : result
					}); 
					/* var str = "";
					for(var i=0, max=result.length;i<max;i++){
						var map = result[i];
						str += "<tr>";
						str += "<td>" + map.user_no +"</td>";
						str += "<td>" + map.id +"</td>";
						str += "<td>" + map.name +"</td>";
						str += "<td>" + map.hobby +"</td>";
						str += "</tr>";
					}
					$("#result_tbody").html(str); */
					setEvent();
				}
			}
		}
		this.changeCallBack = function(func) {
			this.xhr.callback = func;
		}
		this.xhr.open(method, url + params, aSync);
		this.send = function() {
			this.xhr.send.arguments = this;
			this.xhr.send(params);
		}
	}
	function setEvent() {
		$("input[type='button']").click(function() {
			var url = this.getAttribute("data-url");
			if(url){
				if(url.split(".")[1]=="user"){
					var param = "?command=list2&name="+$("#name").val();
					var au = new AjaxUtil(param);
					au.send();
				}
			}else{
				var userNo = this.getAttribute("data-num");
				if(this.getAttribute("value")=="수정"){
					location.href="/modify.jsp?userNo=" + userNo; 	
				}else if(this.getAttribute("value")=="삭제"){
					var param = "?command=delete&userNo="+userNo;
					var au = new AjaxUtil(param);
					au.send();
				}
			}
		});
	}

	$(document).ready(function() {
		var param = "?command=list2";
		var au = new AjaxUtil(param);
		au.send();
	})
		
	$(document).ready(function(){
		$("#btnHome").click(function(){
			location.href="/main.jsp";
		})
	})
</script>
</head>
<body>

    <div class="container">
	<table id="table" data-height="460"
		class="table table-bordered table-hover">
		<thead>
			<tr>
				<th data-field="user_no" class="text-center">번호</th>
				<th data-field="id"  class="text-center">아이디</th>
				<th data-field="name"  class="text-center">이름</th>
				<th data-field="hobby"  class="text-center">취미</th>
			</tr>
		</thead>
		<tbody id="result_tbody">
		</tbody>
	</table>
	이름 : <input type="text" name="name" id="name">
	<input type="button" value="검색" data-url="search.user">
	</div>
</body>
</html>