<%@page import="free.vo.FComVO"%>
<%@page import="free.vo.FreeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
   List<FComVO> freecomList = (List<FComVO>) request.getAttribute("fcv");
   FreeVO fv = (FreeVO) request.getAttribute("fv");
   String memId = (String) session.getAttribute("loginCode");
   String memNick = (String) session.getAttribute("memNick");
   int memPs = (int) session.getAttribute("memP");
   String memP = Integer.toString(memPs);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/sidemain.jsp"></jsp:include>
<jsp:include page="/view/topbar.jsp"></jsp:include>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
<link rel="stylesheet" href="../css/sidemain.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/topbar.css">
<link rel="stylesheet" href="../css/css.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자유게시판</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
textarea {
    display: inline-block;
    width: 80%;
    margin-top: 20px;
    padding: 10px;
    border: 1px solid #000;
    border-radius: 2px;
    font-size: 1.4rem;
    float: left;
    margin-left: -10px;
}

button {
	display: inline-block;
	min-width: 80px;
	margin-left: 10px;
	padding: 10px;
	border: 1px solid #000;
	border-radius: 2px;
	font-size: 1.4rem;
}

#insertFrm{
	background: #e8def747;
    padding: 10px;
    margin: 10px;
    font-size: 15px;
    top: 5px;
    border-top: border-bottom: 1px solid #777;
    border-bottom: 1px solid #777;
    border-top: 1px solid #777;
}

#insertBtn {
    float: right;
    /* display: inline-block; */
    /* min-width: 80px; */
    /* margin-left: 45px; */
    padding: 10px;
    border: 1px solid #000;
    border-radius: 2px;
    font-size: 1.4rem;
    margin-top: 20px;
    margin-right: -10px;
}

.replyNick{
font-weight: bold;
}

.replylist {
padding : 1%;
}

</style>
</head>
<body>
	<script type="text/javascript">


$(document).ready(function () {
   $('#insertBtn').on('click',function () {
      var fNo = $('#insertFrm').find('.info').find('input[name=fNo]').val();
      var memNick = $('#insertFrm').find('.info').find('input[name=memNick]').val();
      var fComCon =$('[name=fComCon]').val();
      
      $.ajax({
         url : "./insertcom.do",
         type : 'post',
         data : {
             "fNo" : fNo,
            "memNick" : memNick,       
            "fComCon" : fComCon
         },
         success : function(data) {
            alert("댓글 등록에 성공하였습니다.");
            location.reload();
           },
         error : function() {
            alert("error");
         }
      });
   });
   
});

</script>

	<form action="./update.do" method="post" style="height:70%">

		<div class="board_wrap">
			<div class="board_title">
				<strong>자유게시판</strong>
				<p>여러분의 이야기를 들려주세요</p>
			</div>
			<div class="board_view_wrap">
				<div class="board_view">
					<div class="title">
						<dd><%=fv.getfTitle()%></dd>
					</div>
					<div class="info">
						<dl>
							<dt>글 번호</dt>
							<dd><%=fv.getfNo()%></dd>
						</dl>
						<dl>
							<dt>닉네임</dt>
							<dd><%=fv.getfNick()%></dd>
						</dl>
						<dl>
							<dt>작성일</dt>
							<dd class="date">
								<fmt:formatDate value="<%=fv.getfDate() %>" pattern="yyyy-MM-dd"
									type="date" />
							</dd>
						</dl>
					</div>
					<div class="cont">
						<dd><%=fv.getfCon()%></dd>
					</div>
				</div>
	</form>

	<div>
		<div class="bt_wrap">
			<a href="./list.do">목록</a>
			<%
                     if (memId.equals(fv.getMemId()) || memP.equals("1")) {
                  %>
			<a href="./update.do?fNo=<%=fv.getfNo()%>">수정</a> <a
				href="./delete.do?fNo=<%=fv.getfNo()%>"
				onclick="return confirm('삭제하시겠습니까?')">삭제</a>
			<%
                     } else {

                  }
                  %>
		</div>
	</div>
	<form action="./insertcom.do" method="post" id="insertFrm" name="insertFrm">
		<%
            int freecomSize = freecomList.size();
            if(freecomSize > 0){
               for(int i=0; i<freecomSize; i++){
            %>
		<div class="replylist">
			<div>번호 : <%=i+1%></div>
			<div class = "replyNick">작성자 : <%=freecomList.get(i).getfComNick()%></div>
			<button style="float:right; margin-top:-3%;" >삭제</button>
			<div>내용 : <%=freecomList.get(i).getfComCon()%></div>
		</div>
		<%
            }
            }else{
           %>
		<div>
			댓글이 존재하지 않습니다.
		</div>
		<%
            }
         %>
		<div class="info">
			<dl>
				<dt></dt>
				<dd>
					<input type="hidden" name="fComNo" />
				</dd>
			</dl>
			<dl>
				<dt></dt>
				<dd>
					<input type="hidden" name="fComNick" value="<%=fv.getfNick()%>"
						readonly />
				</dd>
			</dl>
			<dl>
				<dt></dt>
				<dd>
					<input type="hidden" name="fNo" value="<%=fv.getfNo()%>" readonly />
				</dd>
			</dl>
			<dl>
				<dt></dt>
				<dd>
					<input type="hidden" readonly />
				</dd>
			</dl>
		</div>
		<div>
			<textarea name="fComCon" placeholder="내용 입력"></textarea>
		</div>
		<div>
		<button type="button" id="insertBtn">댓글 작성 완료</button>
		</div>


	</form>
</body>
</html>