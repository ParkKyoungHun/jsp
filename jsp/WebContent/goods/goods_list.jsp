<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ include file="/common/header.jsp" %>
<title>Insert title here</title>
</head>
<body>

    <div class="container">
	<table id="table" data-height="460"
		class="table table-bordered table-hover">
		<thead>
			<tr>
			<td colspan="11" align="center">
				<form action="test.goods" method="post">
					<input type="hidden" name="command" value="list"/>
					<select name="vendor">
					<c:forEach items="${vendorList}" var="vendor">
						<option value="${vendor.viNum}" >${vendor.viName}</option>
					</c:forEach>
					</select>
					상품명 : <input type="text" id="giName" name="giName">
					<input type="submit" id="btnSearch" value="상품검색"/>
				</form>
			</td>
		</tr>
		</thead>
		<c:forEach items="${goodsList}" var="goods">
			<tr>
				<td><c:out value="${goods.giNum}" /></td>
				<td><c:out value="${goods.giName}" /></td>
				<td><c:out value="${goods.giDesc}" /></td>
				<td><select>
				<c:forEach items="${vendorList}" var="vendor">
					<c:set var="sel" value=""/>
					<c:if test="${vendor.viNum eq goods.viNum}">
						<c:set var="sel" value="selected"/>
					</c:if>
					<option value="${vendor.viNum}" ${sel}>${vendor.viName}</option>
				</c:forEach>
				</select>
				</td>
				<td><c:out value="${goods.viNum}" /></td>
				<td><c:out value="${goods.giCredat}" /></td>
				<td><c:out value="${goods.giCreusr}" /></td>
				<td><c:out value="${goods.name}" /></td>
				<td><c:out value="${goods.giMofdat}" /></td>
				<td><c:out value="${goods.giMofusr}" /></td>
				<td><c:out value="${goods.name2}" /></td>
			</tr>
		</c:forEach>
	</table>
	<button type="button" class="btn btn-primary btn-default" data-toggle="modal" data-target="#modalTable">
            상품입력
        </button>
        <div class="modal fade" id="modalTable" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">상품입력</h4>
                    </div>
                    <div class="modal-body">
                        <table id="table1" data-toggle="table" data-height="299">
                            <tr>
                                <td >상품명</td>
                                <td ><input type="text" name="giName2" id="giName2"/></td>
                            </tr>
                            <tr>
                                <td >상품설명</td>
                                <td ><input type="text" name="giDesc" id="giDesc"/></td>
                            </tr>
                            <tr>
                                <td >회사</td>
                                <td >
									<select name="viNum" id="viNum">
										<c:forEach items="${vendorList}" var="vendor">
											<option value="${vendor.viNum}" >${vendor.viName}</option>
										</c:forEach>
									</select>
								</td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-primary" id="btnSave" >SAVE</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
	</div>
</body>
<script>
var $table = $('#table1');
$(function () {
    $('#modalTable').on('shown.bs.modal', function () {
        $table.bootstrapTable('resetView');
    });
	$("#btnSave").click(function(){
		var param = {};
		param["giName"] = $("#giName2").val();
		param["giDesc"] = $("#giDesc").val();
		param["viNum"] = "" + $("#viNum").val();
		param = "?command=insert&param=" + JSON.stringify(param);
		param = encodeURI(param);
		var au = new AjaxUtil(param, "insert.goods");
		au.send();
	});
});
</script>
</html>