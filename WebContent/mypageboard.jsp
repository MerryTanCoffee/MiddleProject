<%@page import="ask.vo.AskVO"%>
<%@page import="free.vo.FreeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	List<FreeVO> freeList = 
	(List<FreeVO>) request.getAttribute("freeList");

	List<AskVO> askList =
	(List<AskVO>) request.getAttribute("askList");

	String memId = (String) session.getAttribute("memId");
	String memNick = (String) session.getAttribute("memNick");
	
	String msg = session.getAttribute("msg") == null ?
			 "" : (String)session.getAttribute("msg");
	session.removeAttribute("msg");
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

@font-face { /* 애플산돌고딕 폰트 적용 */
  font-family:"jua";
  src: url("css/fonts/BMJUA_ttf.ttf") format("truetype");
  font-weight: normal;
	} /* 이후 "SDGothic"으로 폰트 적용 가능 */
     
     *{
     font-family: jua;
     }
</style>
  <jsp:include page="sidemain.jsp"></jsp:include>
  <jsp:include page="topbar.jsp"></jsp:include>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
  <link rel="stylesheet" href="css/sidemain.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/topbar.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자유게시판</title>
<link rel="stylesheet" href="css/css.css">


</head>
<body>
<section style="width:60%; margin-top:100px;">
<!-- 	<div class="board_wrap"> -->
		<div class="board_title">
			<strong>내가쓴 게시물</strong>
			<p>내가쓴게시물</p>
			<div class="board_input">
			<select id="datas" label="검색종류">
				<option value="글제목">글제목</option>
				<option value="작성자">닉네임</option>
			</select>
				<input type="text" class="searchinput" placeholder="검색어 입력">
				<button class="searchbtn">검색</button>
				</div>
		</div>
		
		
		<div class="board_list_wrap">
<!-- 			<div class="board_list"> -->
			<table border="1" margin="auto">
				<tr class="top">
					<th class="num">번호</th>
					<th class="title2">제목</th>
					<th class="writer">닉네임</th>
					<th class="date">작성일</th>
					<th class="board">작성게시판</th>
				</tr>
			
			<%
			 	int freeSize = freeList.size();
				int askSize = askList.size();
				if(freeSize+askSize>0){
					for(int i=0; i<freeSize; i++){
			%>
<!-- 			<div class="board_list"> -->
				<tr class="top" style="text-align:center">
					<td class="num"><a href= "free/detail.do?fNo=<%=freeList.get(i).getfNo()%>"><%=freeList.get(i).getfNo()%></a></td>
					<td class="title2"><%=freeList.get(i).getfTitle()%></td>
					<td class="writer"><%=freeList.get(i).getfNick()%></td>
					<td class="date"><fmt:formatDate value="<%=freeList.get(i).getfDate() %>" pattern="yyyy-MM-dd" type="date"/></td>
					<td class="board">자유게시판</td>
				</tr>
<!-- 			</div> -->
			
				<%
				}
				%>
				
				
				
				<%
			 	
					for(int i=0; i<askSize; i++){
			%>
<!-- 			<div class="board_list"> -->
				<tr class="top" style="text-align:center">
					<td class="num"><a href= "free/detail.do?fNo=<%=askList.get(i).getAskNo()%>"><%=askList.get(i).getAskNo()%></a></td>
					<td class="title2"><%=askList.get(i).getAskTitle()%></td>
					<td class="writer"><%=askList.get(i).getAskNick()%></td>
					<td class="date"><fmt:formatDate value="<%=askList.get(i).getAskDate() %>" pattern="yyyy-MM-dd" type="date"/></td>
					<td class="board">문의게시판</td>
				</tr>
<!-- 			</div> -->
			
				<%
				}}else {%>
					<tr>
					<td colspan="5">글이 존재하지 않습니다.</td>
					</tr>
				<% 	
				}
				%>
				</table>
				
				
			
			<div class="board_page">
				<a href="#" class="bt first"><<</a> <a href="#" class="bt prev"><</a>
				<a href="#" class="num on">1</a> <a href="#" class="num">2</a> <a
					href="#" class="num">3</a> <a href="#" class="num">4</a> <a
					href="#" class="num">5</a> <a href="#" class="bt next">></a> <a
					href="#" class="bt last">>></a>
			</div>
			<div class="bt_wrap">
				<a href="./insert.do" class="on">등록</a>
			</div>
			
		</div>
<!-- 	</div> -->
</section>
</body>
</html>
