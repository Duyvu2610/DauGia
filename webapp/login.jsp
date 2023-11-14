<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/Login.css">
<link rel="stylesheet" type="text/css" href="./css/index.css">
</head>
<body>
	<c:if
		test="${not empty requestScope.status and requestScope.status eq 'failed'}">
		<div class="err">Tài khoản hoặc mật khẩu không chính xác, vui
			lòng nhập lại</div>
	</c:if>



	<div class="form">

		<p class="header-login">Đăng nhập</p>
		<form action="login" method="post" class="form-login">
			<div>
				<label for="userName">Tên đăng nhập</label> <input type="text"
					id="userName" name="userName">
			</div>
			<div class="pass">
				<label for="password">Mật khẩu</label> <input type="text"
					id="password" name="password">
			</div>

			<button type="submit">Đăng nhập</button>
		</form>
	</div>
</body>
</html>