<%@page import="notice.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   NoticeVO nv =(NoticeVO) request.getAttribute("nv");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 수정</title>
<link rel="stylesheet" href="../css/css.css">

<style>
button, input {
	background: white;
	display: inline-block;
	min-width: 80px;
	margin-left: 10px;
	padding: 10px;
	border: 1px solid #000;
	border-radius: 2px;
	font-size: 1.4rem;
}
</style>
</head>
<body>
<form action="./update.do" method="post">
<input type="hidden" name="noticeNo" value="<%=nv.getNoticeNo()%>" />
    <div class="board_wrap">
        <div class="board_title">
            <strong>공지사항</strong>
            <p>공지사항 변경</p>
        </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>글 제목</dt>
                        <dd><input type="text" name="noticeTitle" value="<%=nv.getNoticeTitle() %>"></dd>
                    </dl>
                </div>
               
                <div class="cont" >
                    <textarea name="noticeCon" placeholder="내용 입력">
                    <%=nv.getNoticeCon() %>
               </textarea>
                </div>
            </div>
            <div class="bt_wrap">
                <button>수정</button>
                <a href="./list.do">취소</a>
            </div>
        </div>
    </div>
 </form>
</body>
</html>