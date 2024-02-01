<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 
  <base href="<%=basePath%>">
  <meta charset="UTF-8">
  <title>FilmFlex</title>
  <link rel="stylesheet" href="css/admin/admin_public.css ">
  <link rel="stylesheet" href="css/admin/add_movie.css ">
 </head>
 <style>
	 button {
		 display: block;
		 position: absolute;
		 margin-right: auto;
		 width: 30%;
		 padding: 10px 15px;
		 background-color: #32a333;
		 color: #fff;
		 border: none;
		 border-radius: 5px;
		 cursor: pointer;
		 transition: all 0.3s ease;
		 font-size: 18px;
		 font-weight: 600;
	 }
	 button:hover {
		 background-color: #32a333;
	 }
	 a {
		 color: #32a333;
		 text-decoration: none;
		 transition: all 0.3s ease;
		 font-size: 16px;
	 }
 </style>
 <body>
	<!-- 导入头部 -->
	<jsp:include page="admin_public/admin_header.html"></jsp:include>
	<!-- 导入左侧导航栏 -->
	<jsp:include page="admin_public/add_admin_left_nav.html"></jsp:include>
	<div id="movie_content">
		<c:if test="${error!=null }"> ${error } </c:if>
		<form method="post" action="addmovie" id="postform">
			电影名称：<input type="text" name="movName" id="movName"><br/>
			电影类型：
			<select type="text" name="select_country" id="select_country">
				<option value="hhh" selected>==选择==</option>
				<option value="动作" >动作</option>
				<option value="爱情">爱情</option>
				<option value="喜剧">喜剧</option>
				<option value="警匪">警匪</option>
				<option value="惊悚">惊悚</option>
				<option value="恐怖">恐怖</option>
				<option value="悬疑">悬疑</option>
				<option value="美剧">美剧</option>
				<option value="印度">印度</option>
				<option value="其他">其他</option>
			</select><br/>
			是否上映：
			<select type="text" name="select_language" id="select_language">
				<option value="-1" selected>==选择==</option>
				<option value="1">1</option>
				<option value="0">0</option>
				
			</select><br/>

			时长：<input type="text" name="runningtime" id="runningtime" class="right_shift"><span class="">&nbsp;&nbsp;分钟</span><br/>
			导演：<input type="text" name="director" id="director" class="right_shift"><br/>
			主演：<input type="text" name="actor" id="actor" class="right_shift"><br/>
			上映时间：<input type="text" name="showtime" id="showtime" size="25" width: 120px onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" /><br/>
			图片路径：<input type="text" name="image" id="image" size="25" width: 120px value="images/***.jpg" /><span class="">&nbsp;&nbsp;***填写图片名字</span><br/>
			电影简介：<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<textarea type="text" name="introduction" id="introduction" placeholder="简介....." cols="33" rows="5"></textarea>
			<input type="hidden" name="totalScore" value="0"><br>

			<button type="button" id="postbtn">提交</button>
			<!-- <input type="file" name="file"> -->
			<br><br>
			<span id="msg" style="font-size: 12px;color: red"></span> <br>
		</form>
	</div>
 </body>
 <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
 <script type="text/javascript">
	 $("#postbtn").click(function (){
		 var movName = $("#movName").val();
		 var select_country = $("#select_country").val();
		 //  判断姓名是否为空
		 if (isEmpty(movName)){
			 $("#msg").html("影片名称不可为空！");
			 return;
		 }
		 //  判断密码是否为空
		 if (isEmpty(select_country)){
			 $("#msg").html("影片类型不可为空！");
			 return;
		 }
		 // 提交表单
		 $("#postform").submit();
	 });
	 // 判断字符串是否为空
	 function isEmpty(str){
		 if (str == null || str.trim() == "") return true;
		 return false;
	 }
 </script>
</html>
