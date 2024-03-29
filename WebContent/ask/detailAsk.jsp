<%@page import="ask.vo.AskVO"%>
<%@page import="ask.vo.AComVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<AComVO> askcomList = (List<AComVO>) request.getAttribute("acv");
	AskVO av =(AskVO) request.getAttribute("av");
	String memId = (String) session.getAttribute("loginCode");
	String memNick = (String) session.getAttribute("memNick");
	int memPs = (int) session.getAttribute("memP");
	String memP = Integer.toString(memPs);

%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>문의사항</title>
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
<title>문의게시판</title>
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

#insertArm{
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
		var askNo = $('#insertArm').find('.info').find('input[name=askNo]').val();
		var memNick = $('#insertArm').find('.info').find('input[name=memNick]').val();
		var aComCon =$('[name=aComCon]').val();
		
		$.ajax({
			url : "./insertcom.do",
			type : 'post',
			data : {
	 			"askNo" : askNo,
				"memNick" : memNick,		 
				"aComCon" : aComCon
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
				<strong>문의게시판</strong>
				<p>관리자에게 문의해주세요.</p>
			</div>
			<div class="board_view_wrap">
				<div class="board_view">
					<div class="title">
						<dd><%=av.getAskTitle() %></dd>
					</div>
					<div class="info">
						<dl>
							<dt>글 번호</dt>
							<dd><%=av.getAskNo() %></dd>
						</dl>
						<dl>
							<dt>닉네임</dt>
							<dd><%=av.getAskNick()%></dd>
						</dl>
						<dl>
							<dt>작성일</dt>
							<dd><%=av.getAskDate()%></dd>
						</dl>
					</div>
					<div class="cont">
						<dd><%=av.getAskCon() %></dd>
					</div>
				</div>
	</form>
	
		<div>
			<div class="bt_wrap">
				<a href="./list.do">목록</a>
				<%
				if(memId.equals(av.getMemId())|| memP.equals("1")){
            %>
				<a href="./update.do?askNo=<%=av.getAskNo() %>">수정</a> <a
					href="./delete.do?askNo=<%=av.getAskNo() %>"
					onclick="return confirm('삭제하시겠습니까?')">삭제</a>
				<%   
               }else{
                  
               }
            %>

			</div>
		</div>
	<form action="./insertcom.do" method="post" id="insertArm"
		name="insertArm">
		<%	
            int askcomSize = askcomList.size();
            if(askcomSize > 0){
               for(int i=0; i<askcomSize; i++){
            %>
		<div class="replylist">
			<div class="replyCount">번호 : <%=i+1%></div>
			<div class="replyNick">작성자 : <%=askcomList.get(i).getaComNick()%></div>
			<button style="float:right; margin-top:-3%;" >삭제</button>
			<div>내용 : <%=askcomList.get(i).getaComCon()%></div>
		</div>
		<%
            }
            }else{
           %>
		<tr>
			<td colspan="5">글이 존재하지 않습니다.</td>
		</tr>
		<%
            }
         %>
		<div class="info">
			<dl>
				<dt></dt>
				<dd>
					<input type="hidden" name="aComNo" />
				</dd>
			</dl>
			<dl>
				<dt></dt>
				<dd>
					<input type="hidden" name="aComNick" value="<%=av.getAskNick()%>"
						readonly />
				</dd>
			</dl>
			<dl>
				<dt></dt>
				<dd>
					<input type="hidden" name="askNo" value="<%=av.getAskNo()%>"
						readonly />
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
			<textarea name="aComCon" placeholder="내용 입력"></textarea>
		</div>
		<div>
			<button type="button" id="insertBtn">댓글 작성 완료</button>
		</div>
	</form>
</body>
</html>