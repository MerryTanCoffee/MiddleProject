<%@page import="member.vo.FileVO"%>
<%@page import="member.service.FileServiceImpl"%>
<%@page import="member.service.IFileService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.List"%>
<%@page import="member.service.MemberServiceImpl"%>
<%@page import="member.service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.vo.MemberVO"%>    
<%

   String memId = (String) session.getAttribute("loginCode");
   String memNick = (String) session.getAttribute("memNick");
   String receiverNick = (String) session.getAttribute("receiverNick");
   int memP = (int) session.getAttribute("memP");
   Random random = new Random();
   IMemberService memservice = MemberServiceImpl.getInstance();
   IFileService fileservice = FileServiceImpl.getInstance();
   List<MemberVO> memList = memservice.selectAllMember();
  
     
      List<MemberVO> ranList = new ArrayList<>();
      List<FileVO> fileList = new ArrayList<>();
      int memSize = memList.size();
      while(ranList.size() < 6){
         
         int rndNum = random.nextInt(memSize);
         
          MemberVO mv = memList.get(rndNum);
         FileVO fv = fileservice.getProfile(mv.getMemId());
          
          if(!ranList.contains(mv) && !mv.getMemId().equals(memId) && mv.getMemP() == 0){
             ranList.add(mv);
             fileList.add(fv);
          }
      }
%>   
<!DOCTYPE html>
<!-- Created By CodingLab - www.codinglabweb.com -->
<html>
  <head>
    <meta charset="UTF-8">
    <!---<title> Responsive Our Team Section | CodingLab </title> ---->
    <link rel="stylesheet" href="css/main.css">

    <jsp:include page="/sidemain.jsp"></jsp:include>
    <jsp:include page="/topbar.jsp"></jsp:include>
     

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">   
    
    
    <style>
    @font-face { /* 애플산돌고딕 폰트 적용 */
  font-family:"jua";
  src: url("css/fonts/BMJUA_ttf.ttf") format("truetype");
  font-weight: normal;
	} /* 이후 "SDGothic"으로 폰트 적용 가능 */
    
    h3, h4 {
      margin: 10px 0 30px 0;
      letter-spacing: 10px;      
      font-size: 20px;
      color: #111;
    }
    
    .person {
      border: 10px solid transparent;
      margin-bottom: 25px;
      width: 80%;
      height: 80%;
      opacity: 0.7;
    }
    .person:hover {
      border-color: #f1f1f1;
    }
    .carousel-inner img {
      -webkit-filter: grayscale(90%);
      filter: grayscale(90%); /* make all photos black and white */ 
      width: 100%; /* Set width to 100% */
      margin: auto;
    }
    .carousel-caption h3 {
      color: #fff !important;
    }
    @media (max-width: 600px) {
      .carousel-caption {
        display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
      }
    }
    .bg-1 {
      background: #2d2d30;
      color: #bdbdbd;
    }
    .bg-1 h3 {color: #fff;}
    .bg-1 p {font-style: italic;}
    .list-group-item:first-child {
      border-top-right-radius: 0;
      border-top-left-radius: 0;
    }
    .list-group-item:last-child {
      border-bottom-right-radius: 0;
      border-bottom-left-radius: 0;
    }
    .thumbnail {
      padding: 0 0 15px 0;
      border: none;
      border-radius: 0;
    }
    .thumbnail p {
      margin-top: 15px;
      color: #555;
    }
    .btn {
      padding: 10px 20px;
      background-color: #333;
      color: #f1f1f1;
      border-radius: 0;
      transition: .2s;
    }
    .btn:hover, .btn:focus {
      border: 1px solid #333;
      background-color: #fff;
      color: #000;
    }
    .modal-header, h4, .close {
      background-color: #333;
      color: #fff !important;
      text-align: center;
      font-size: 30px;
    }
    .modal-header, .modal-body {
      padding: 40px 50px;
    }
    .nav-tabs li a {
      color: #777;
    }
    #googleMap {
      width: 100%;
      height: 400px;
      -webkit-filter: grayscale(100%);
      filter: grayscale(100%);
    }  
    .navbar {
      font-family: Montserrat, sans-serif;
      margin-bottom: 0;
      background-color: #2d2d30;
      border: 0;
      font-size: 11px !important;
      letter-spacing: 4px;
      opacity: 0.9;
    }
    .navbar li a, .navbar .navbar-brand { 
      color: #d5d5d5 !important;
    }
    .navbar-nav li a:hover {
      color: #fff !important;
    }
    .navbar-nav li.active a {
      color: #fff !important;
      background-color: #29292c !important;
    }
    .navbar-default .navbar-toggle {
      border-color: transparent;
    }
    .open .dropdown-toggle {
      color: #fff;
      background-color: #555 !important;
    }
    .dropdown-menu li a {
      color: #000 !important;
    }
    .dropdown-menu li a:hover {
      background-color: red !important;
    }
    
    .logBtn{
    margin-left: 1%;
    border: solid #333;
    background: #333;
    border-radius: 50%;
    }
    
    a{}
    </style>
    
    <link rel="stylesheet" href="css/image-slide1.css">
   </head>
   <%if(memP==0) { %> 
<body style="background-image: url('img/배경.jpg'); background-size: cover; " >
	<%}else {%>
<body style="background-image: url('img/블루밍.jpg'); background-size: cover; " >	

		<%} %>
	
  
<% if(memP == 0) { %>
  <div class="container" style="margin-top: 230px; margimargin-right: 300px; "   >
    <input type="radio" name="dot" id="one">
    <input type="radio" name="dot" id="two">
    
    <div id="menu1"  style="text-align:center;   ">
      <h1 style="color: navy; font-family:'jua'; font-size:1.2cm; ; margin-bottom:30px; ">오늘의 추천친구</h1>
       
    </div>
    
    <!-- <div id="ad"  style="">
       <video width="300px"  src="./img/틴더광고.mp4" controls qutoplay loop style="margin-bottom: 50px"></video>
       
       <video width="300px"  src="./img/틴더광고.mp4" controls qutoplay loop></video>
       
    </div> -->
    
    
      <div class="main-card">
      <div class="cards">
    <%for(int i = 0; i < ranList.size(); i++ ) {
       if(i==3){
          %>
          </div>
          <div class="cards"> 
          <% 
       }
       %>
        <div class="card">
         <div class="content">
           <div class="img">
            <%if(fileList.get(i)==null){ %>  <img src="./img/기본프로필.png"><%} else{  %>
      <img src="<%=request.getContextPath()%>/download.do?fileSn=<%=fileList.get(i).getFileSn()%>&fileNo=<%=fileList.get(i).getFileNo()%>">
      <%} %>
           </div>
           <div class="details">
             <%-- <div class="name"><%=ranList.get(i).getMemName() %></div> --%>
             <div class="job"><%=ranList.get(i).getMemNick()%></div>
           </div>
          <button class="btn" data-toggle="modal" data-target="#myModal" onclick="modelOpen('<%=ranList.get(i).getMemId()%>','<%=ranList.get(i).getMemNick()%>')">더 알아보기</button>
         </div>
        </div>

    <%
    
    
    }%>
   
    </div>
  </div>
  <div class="button">
      <label for="one" class="active one btn-danger"></label>
      <label for="two" class="active two btn-primary"></label>
    </div>
  </div>
  
 
 <jsp:include page="/footer.jsp" ></jsp:include>
  
  
     <script>
     
     function modelOpen(memId,memNick) {
               
        $.ajax({
             url : "/demo2/membersearch",
             type : 'post',
             data : {
                "memId" : memId
             },
             success : function(data) {
                                
                $('.profile').html(data);
                $('#reportId').attr('href',"MemberReport?reportId="+memId+"&memNick="+memNick);
                $('#receiverNick').attr('href',"/demo2/message/messageWrite.jsp?receiverNick="+memNick+"&memId="+memId);
               },
             error : function() {
                alert("error");
             }
          });
     }
     
     </script>
  
     <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
      <div class="modal-dialog">
      
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <h4><span class="glyphicon glyphicon-user"></span>#about me</h4>
          </div>
          <div class="modal-body">
            <form role="form">
             <body>
          <div class="profile">
          </div>
     
        </body>
                <a id="receiverNick" href="/demo2/message/messageWrite.jsp" onClick="window.open(this.href, '', 'width=600, height=450, left=1200px, top=200px'); return false;">
                <button type="submit" class="btn btn-block" >쪽지보내기
                  <span class="glyphicon glyphicon-home"></span>
                </button></a>
                
            </form>
          </div>
          <div class="modal-footer">
            <button style="margin-right:15px" type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
              <span class="glyphicon glyphicon-remove"></span>
            </button>
                    
            <a id="reportId" href="/demo2/report/report.jsp" onClick="window.open(this.href, '', 'width=600, height=500, left=1200px, top=200px'); return false;">신고하기</a>
          </div>
        </div>
      </div>
    </div>
  <%
  } else if(memP == 1){
   %>
   <a class="logBtn" href="logout.jsp">로그아웃</a>	
   <%  
  } 
  %>
  
  
  <script>
  function sendIt(){
     
     var f = document.forms[0];
     f.submit();
  }
  </script>
</body>
</html>