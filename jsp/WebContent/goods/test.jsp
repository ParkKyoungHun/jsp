<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<title>Insert title here</title>
</head>
<script>
function callback(result){
	var str ="";
	for(var i=0, max=result.length;i<max;i++){
		var re = result[i];
		str += "<option value='" + re.viNum + "'>" + re.viName + "</option>";
	}
	$("#vendor").html(str);
}
$(document).ready(function(){
	var param = {};
	param["command"] = "vendorcombo";
	param = "?param=" + JSON.stringify(param);
	param = encodeURI(param);
	var au = new AjaxUtil(param,"test.goods");
	au.changeCallBack(callback);
	au.send();
})
</script>
<body>
<form action="test.goods" method="post">
<select name="vendor" id="vendor">
</select>
<input type="hidden" name="command" value="list">
<input type="submit" value="리퀘스트디스패쳐 테스트">
</form>
</body>
</html>