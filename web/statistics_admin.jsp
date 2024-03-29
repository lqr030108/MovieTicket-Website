<%@page import="com.xxxx.entity.Movie"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <meta charset="UTF-8">
  <title>喵眼电影管理平台</title>
  <link rel="stylesheet" href="css/admin/admin_public.css ">
  <link rel="stylesheet" href="css/admin/movie_statistics.css ">
 </head>
 <body>
	<!-- 导入头部 -->
	<jsp:include page="admin_public/admin_header.html"></jsp:include>
	<!-- 导入左侧导航栏 -->
	<jsp:include page="admin_public/sta_admin_left_nav.html"></jsp:include>
	<form action="movie/paixu.action">
	<div id="statistics_search" class="">
		<span class="">统计方式</span>
		<select name="paixu">
			<option value="0" selected>正常排序</option>
			<option value="1" >票房最多</option>
			<option value="2" >评分最高</option>
		</select>
		<input type="submit" value="查看">
	</div></form>
	<div id="thead" class="">
		<table class="public">
			<tr>
				<td>id</td>
				<td>电影名称</td>
				<td>上映时间</td>
				<td>评分</td>
				<td>本院票房</td>	
			</tr>
		</table>
	</div>
	<div id="movie_statistics" class="">
		<table class="public">
		<%List<Movie> movieStati = (List<Movie>)session.getAttribute("movieStati"); %>
			<%for(int i = 0;i<movieStati.size();i++){ %>
			<tr>
				<td><%=movieStati.get(i).getId() %></td>
				<td><%=movieStati.get(i).getMovName()%></td>
				<td><fmt:formatDate value="<%=movieStati.get(i).getShowtime()%>" pattern="yyyy-MM-dd"/></td>
				<td><%=movieStati.get(i).getTotalScore()%></td>
				<td><%=movieStati.get(i).getSumMoney()%></td>
			</tr>
			<%} %>
		</table>
	</div>
	<div id="" class="cover">	
	</div>
 </body>
</html>
