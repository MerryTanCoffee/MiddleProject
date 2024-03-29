<%@page import="message.vo.MessageVO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<MessageVO> msgSendList = (List<MessageVO>) request.getAttribute("msgSendList");

String loginCode = session.getAttribute("memNick") == null ? "" : (String) session.getAttribute("memNick");
// 	session.removeAttribute("msg");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style>
table {
	border-collapse:collapse;
	border-left: 0px;
	border-right: 0px;
}
table th{
	background-color: #edecf58f;
	font-size:20px; 
/* 	width:40%;  */
	height:70px;
	border-right:0px;
	border-left:0px;
}
table td{
	font-size:15px; 
	height:65px; 
	border-top:0px;
	border-right:0px;
	border-left:0px;
}
.b1{
	margin-right:10px;
	border: 0px;
	border-radius:8px;
	background-color: #d5d1f18f;
	height: 40px;
	width: 90px;
}
.b2{
	border: 0px;
	border-radius:8px;
	background-color: #d5d1f18f;
	height: 40px;
	width: 70px;
}
</style>
<jsp:include page="/sidemain.jsp"></jsp:include>
<jsp:include page="/view/topbar.jsp"></jsp:include>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
<link rel="stylesheet" href="../css/sidemain.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/topbar.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>보낸 쪽지함</title>
<link rel="stylesheet" href="../css/css.css">
</head>
<body>
<section style="width:60%; margin-top:500px;">
	<div>
		<div class="board_title">
		<img alt="message" src="../img/mail.png" width="150px" style="margin-bottom:40px"><br>
			<strong>보낸 쪽지함</strong>
		</div>
		<div class="board_list_wrap">
			<table border="1" margin="auto">
				<tr class="top" style="text-align:center">
					<th class="number">순번</th>
					<th class="" width=40%>내용</th>
					<th class="date">보낸날짜</th>
					<th class="writer">수신자</th>
					<th class="choose">선택</th>
				</tr>
			
		</div>

		<%
			int count = 0;
			int messageSize = msgSendList.size();
		if (messageSize > 0) {
			for (int i = 0; i < messageSize; i++) {
				count++;
			%>
<!-- 		<div class="board_list"> -->
			<tr style="text-align:center">
				
				<td class="MessageCount"><%=count%></td>
				<td><%=msgSendList.get(i).getMsgCon()%></td>
				<td><fmt:formatDate
						value="<%=msgSendList.get(i).getMsgDate()%>" pattern="yyyy-MM-dd"
						type="date" /></td>
				<td><%=msgSendList.get(i).getReceiverNick()%></td>
				<td><a href="<%=request.getContextPath()%>/chatdetail?msgNo=<%=msgSendList.get(i).getMsgNo()%>" onClick="window.open(this.href, '', 'width=730, height=600'); return false;"><button class="b1">채팅하기</button></a>
				<a href="<%=request.getContextPath()%>/message/delete.do?msgNo=<%=msgSendList.get(i).getMsgNo()%>"><button class="b2">삭제</button></a></td>
				<td>
				<input type="hidden" value="<%=msgSendList.get(i).getMsgNo()%>" name="msgNo">
				<input type="hidden" value="<%=msgSendList.get(i).getMemId()%>" name="fromId">
				<input type="hidden" value="<%=msgSendList.get(i).getMemNick()%>" name="fromNick">
				</td>
			</tr>
<!-- 		</div> -->
		<%
			}
		} else {
		%>
		<tr>
			<td colspan="5">보낸 쪽지가 없습니다.</td>
		</tr>
		<%
			}
		%>


	</div>
	</table>
	</section>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 	<script src="js/bototstrap.js"></script> -->
</body>
</html>