<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		var message = "${msg}";
		var url = "${url}";
		alert('쪽지 보내기 성공!!');
		document.location.href = 'http://localhost/demo2/message/write.do';
	</script>
</body>
</html>