<%@page import="java.util.Arrays"%>
<%@page import="com.xxxx.entity.screens"%>
<%@page import="com.xxxx.entity.User"%>
<%@page import="com.xxxx.service.SessionsService"%>
<%@page import="com.xxxx.entity.sessions"%>
<%@page import="com.xxxx.entity.site"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.xxxx.entity.Movie"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<base href="<%=basePath %>" />
 <head>
  <meta charset="UTF-8">
  <title>选座购票</title>
  <link rel="stylesheet" href="css/public.css ">
  <link rel="stylesheet" href="css/index.css">
  <link rel="stylesheet" href="css/select_seat.css">
 </head>
 <body>
<%
	Movie mov_detail = (Movie)session.getAttribute("mov_detail");
	sessions ses = (sessions) session.getAttribute("ses");
	int[] arrayToString = (int[])session.getAttribute("seatArray");
%>
	<div id="head" style="background: #161C29">
		<div class="rt">
			<span class="">欢迎你，</span>
			<a href="" style="color: white">${user.userName}</a>
		</div>
		<img src="images/logo.png" alt="logo" style="width:100px">
	</div>
	<div id="body" class="">
		<div id="seat" class="lf">
			<div class="first">
				<b></b><span>可选座位</span>
				<b></b><span>已售座位</span>
				<b></b><span>已选座位</span>
			</div>
			<div class="second">
			</div>
			<div id="seat_content" class="">
				<p>1<span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></p>
				<p>2<span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></p>
				<p>3<span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></p>
				<p>4<span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></p>
				<p>5<span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></p>
				<p>6<span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></p>
				<p>7<span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></p>
				<p>8<span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></p>
				<p>9<span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></p>
			</div>
			<div id="instruction" class="">
				<p><b>说明：</b></p>
				<p>1.点击上面座位直接选择</p>
				<p>2.已售座位不能再次被选中</p>
				<p>3.每个用户每次不能购买超过4张票</p>
			</div>
		</div>
		
		<input type="hidden" value="<%=ses.getPrice()%>" >
		<div id="seat_info" class="lf">
			<div id="movie_info" class="">
				<p>电影：<span id="movieName"><%=mov_detail.getMovName()%></span></p>
				<p>类型：<span id="movieType"><%=mov_detail.getType()%></span></p>
				<p>片长：<span id="movieTime"><%=mov_detail.getRunningtime() %></span>分钟</p>
			</div>
			<div class="">
				<p>影院：FilmFlex</p>
				<p>影厅：<span id="movie_room"><%=ses.getScreensId() %></span>号厅</p>
				<p>播放时间：<span id="showTime">2017-07-02:19:30</span></p>
				<p>票价：￥<span id="price"><%=ses.getPrice()%></span></p>
			</div>
			<div id="sel_seat" class="clear">
				<p>座位</p>
				<ul>
					<li>1</li>
					<li>2</li>
					<li>3</li>
					<li>4</li>
				</ul>
				<h3 id="totalPrice" class="">
					总价&nbsp;&nbsp;&nbsp;￥&nbsp;<b>0</b>
				</h3>
			</div>
			<div id="form" class="">
<%--				<a href="submitorder?rowId_1=${rows[0]}&columnId_1=${cols[0]}&rowId_2=${rows[1]}&columnId_2=${cols[1]}&rowId_3=${rows[2]}&columnId_3=${cols[2]}&rowId_4=${rows[3]}&columnId_4=${cols[3]}">提交</a>--%>
				<input id="orderbtn" type="button" value="提交订单">
<%--				<button type="button" id="orderbtn">提交订单</button>--%>
			</div>
		</div>
	</div>
	<input type="hidden" id="array" value="<%=Arrays.toString(arrayToString)%>" >
	<!-- 尾部 -->
<br><br>
	<footer style="background: #161C29">
		<div>友情链接：<a href="http://www.dytt8.net/" style="color: white">电影天堂</a></div>
		<br><br>
	</footer>
<%--	<script src="js/jquery.js"></script>--%>
<%--	<script src="js/select_seat.js"></script>--%>
 </body>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	var seats = document.querySelectorAll("#seat_content>p span");
	var count = 0;
	var seat_lis = document.querySelectorAll("#sel_seat li");
	var totalPrice = document.querySelector("#totalPrice b");
	var price = $("#price").val();

	var value=document.getElementById("array").value;
	var jsArr=value.split(',');

	for(var i = 0; i < seats.length;i++){
		if(jsArr[i] == " 1" || jsArr[i] == "[1" || jsArr[i] == "1]")
			seats[i].className = "red";
	}

	var rows = [];
	var cols = [];
	var index = 0;

	//用了二位数组存储座位号
	var array = [];
	for(var i = 0; i < 4; i++){
		rows[i] = 0;
		cols[i] = 0
	}
	for(var i = 0; i < 9;i++){
		array[i] = new Array(11);
	}
	for(var i = 0;i < 9;i++){
		for(var j = 0;j < 11; j++){
			array[i][j] = 0;
		}
	}
	for(var i = 0; i < seats.length; i++){
		seats[i].onclick = function(){
			if(this.className == "" && count < 4){
				this.className = "green";
				++count;
			}else if(this.className == "green"){
				this.className = "";
				--count;
			}else if(this.className == "red"){

			}
			loop();
		}
	}

	$("#orderbtn").click(function (){
		location.href = "submitorder?rowId_1="+rows[0]+"&columnId_1="+cols[0]+"&rowId_2="+rows[1]+"&columnId_2="+cols[1]+"&rowId_3="+rows[2]+"&columnId_3="+cols[2]+"&rowId_4="+rows[3]+"&columnId_4="+cols[3]+"&userName=${user.userName}";

	});

	function loop(){
		for(var i = 0; i < seats.length; i++){
			var r = parseInt(i / 11);
			var c = parseInt(i % 11);
			if(seats[i].className == "green"){
				array[r][c] = 1;
			}else{
				array[r][c] = 0;
			}
		}
		loop2();
	}

	function loop2(){
		var temp = 0;
		for(var i = 0;i < 4;i++){
			seat_lis[i].innerHTML = i+1;
			seat_lis[i].className = "";
		}
		for(var r = 0; r < 9; r++){
			for(var c = 0; c < 11; c++){
				if(array[r][c] == 1){
					seat_lis[temp].innerHTML = (r+1) + "排" + (c+1) + "座";
					seat_lis[temp].className = "sel";
					rows[temp] = (r+1);
					cols[temp] = (c+1);
					temp++;
				}
			}
		}
		totalPrice.innerHTML = price * temp;
	}

</script>
</html>
