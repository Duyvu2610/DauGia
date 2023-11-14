<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.AuctionItem"%>
<%@page import="model.User"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="./css/main.css" rel="stylesheet" type="text/css">
<link href="./css/index.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:set var="user" value="${sessionScope.user}" />
	<c:set var="au" value="${requestScope.item}" />
	<c:choose>
	    <c:when test="${au.currentPrice eq 0}">
	        <c:set var="total" value="${au.initialPrice + au.priceStep}" />
	    </c:when>
	    <c:otherwise>
	        <c:set var="total" value="${au.currentPrice + au.priceStep}" />
	    </c:otherwise>
	</c:choose>
	<div class="wrapper">

		<div class="header">
			<span>Chào <c:out value="${user.username}" />|
			</span> <a href="logout">Thoát</a>
		</div>
		<h2>
			<b><c:out value="${au.description}" /></b>
		</h2>
		<table>
			<tr>
				<th></th>
				<th>Thông tin người bán</th>
			</tr>

			<tr>
				<td>
					<span>Giá hiện tại: ${au.currentPrice} VNĐ</span> <br>
					<span>Người đặt: ${au.bids[fn:length(au.bids) - 1].bidder.username}
							(có ${fn:length(au.bids)} lời đặt giá)</span> <br> 
					<span>Giá khởi điểm: ${au.initialPrice} VNĐ</span> <br> 
					<span>Bước giá: ${au.priceStep} VNĐ</span> <br> 
					<span>Bắt đầu lúc: <fmt:formatDate type="time" value="${au.startDate.time}" pattern="HH:mm:ss" /> Ngày: <fmt:formatDate type="date" value="${au.startDate.time}" pattern="dd/MM/yyyy" /></span> <br> 
					<span>Ngày kết thúc: <fmt:formatDate type="time" value="${au.endDate.time}" pattern="HH:mm:ss" /> Ngày: <fmt:formatDate type="date" value="${au.endDate.time}" pattern="dd/MM/yyyy" /></span> <br> 
					<span>Thời gian còn lại: ${au.duration}</span> <br> <br>
					<form action="bid?id=<c:out value="${au.id}" />" method="post" class="form-login">
						<div>
							<span>Giá đặt: <input type="text" name="price">>=${total}</span>
							<input type="hidden" name="priceStep" value="${au.priceStep}">
							<input type="hidden" name="total" value="${total}">
						</div>
						<button type="submit">Đặt giá</button>
					</form>
				</td>

				<td>
					<div style="padding-bottom: 97px;">
						<span>Tên tài khoản: ${au.seller.username}</span> <br>
						<span>Tên cửa hàng: ${au.seller.fullName}</span> <br>
						<span>Điện thoại: ${au.seller.phone}</span> <br>
						<span>Email: ${au.seller.email}</span> <br>
						<span>Địa chỉ: ${au.seller.address}</span>
					</div>
					
				</td>
			</tr>

		</table>
		<div class="list">
			<a href="listAution">Danh sách đấu giá</a>
		</div>
	</div>
</body>
</html>