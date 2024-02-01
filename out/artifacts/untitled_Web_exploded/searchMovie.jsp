<%@page import="java.util.Collections"%>
<%@page import="com.xxxx.entity.Movie"%>
<%@page import="java.util.List"%>
<%@page import="com.xxxx.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <title>正在热映</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet"  type="text/css"  href="css/movie.css"/>

    <style>

        .nav li:hover .dropdown-menu {
            display: block;
        }

        .navbar-collapse a:hover .caret {
            -webkit-transform: rotate(180deg);
            -ms-transform: rotate(180deg);
            transform: rotate(180deg)
        }

        .caret {
            display: inline-block;
            width: 0;
            height: 0;
            margin-left: 2px;
            vertical-align: middle;
            border-top: 5px dashed #666;
            border-top: 5px solid #666 \9;
            border-right: 5px solid transparent;
            border-left: 5px solid transparent;
            -webkit-transition: all .2s ease;
            transition: all .2s ease
        }

        a:hover {
            text-decoration: none
        }

    </style>

</head>
<body>


<!--导航栏-->
<!--<div>-->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid" style="background: #161C29">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <img src="images/logo.png" alt="logo" style="width:100px">
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="index.jsp">首页 <span class="sr-only">(current)</span></a></li>
                <li class="active"><a href="hotMovie.jsp">电影</a></li>
            </ul>
            <form class="navbar-form navbar-left" method="post" action="selectByName" id="searchform">
                <div class="form-group">
                    <input type="text" name ="movName" id ="movName" placeholder="找电影" value="${searchName}">
                </div>
                <button type="button" class="btn btn-default" id="searchbtn"><span class="glyphicon glyphicon-search"></span></button>
            </form>
            <ul class="nav navbar-nav">
                <br>
                <li class="active" style="font-size: medium;color: white">欢迎${user.userName}</li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false"> <span class="glyphicon glyphicon-user"></span><span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                   <c:if test="${user==null}">
                        <li><a href="login.jsp">登录</a></li>
                        <li><a href="register.jsp">注册</a></li>
                       <li><a href="login_admin.jsp">管理员登录</a></li>
                        </c:if>
					<c:if test="${user!=null}">
                        <li><a href="User/logout.action">退出登录</a></li>
                     </c:if>

                      </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<nav class="subnav navbar-default">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
            <ul class="navbar">
                <li>
                    <a href="hotMovie.jsp" class="active"  data-act="subnav-click" data-val="{subnavClick:1}">正在热映</a>
                </li>
                <li>
                    <a href="comingMovie.jsp" data-act="subnav-click" data-val="{subnavClick:2}">即将上映</a>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>


<div class="container-fluid" class="page-movie/list">
    <div class="movies-channel">
        <div class="tags-panel">
            <ul class="tags-lines">
                <li class="tags-line" data-val="{tagTypeName:'cat'}">
                    <div class="tags-title">类型 :</div>
                    <ul class="tags">
                        <li>
                            <form action="movieDoing" method="post" id="allform">
                                <button type="button" id="allbtn" style="border: none;background-color:white;"
                                >全部</button></form>

                        <li>
                            <form action="movieType?type=爱情"  method="post" id="aiqingform">
                                <button type="button" id="aiqingbtn" style="border: none;background-color:white;"
                                >爱情</button></form>
                        <li>
                            <form action="movieType?type=喜剧"  method="post" id="xijuform">
                                <button type="button" id="xijubtn" style="border: none;background-color:white;"
                                >喜剧</button></form>
                        <li>
                            <form action="movieType?type=动漫"  method="post" id="dongmanform">
                                <button type="button" id="dongmanbtn" style="border: none;background-color:white;"
                                >动漫</button></form>
                        <li>
                            <form action="movieType?type=剧情"  method="post" id="juqingform">
                                <button type="button" id="juqingbtn" style="border: none;background-color:white;"
                                >剧情</button></form>
                        <li>
                            <form action="movieType?type=恐怖"  method="post" id="kongbuform">
                                <button type="button" id="kongbubtn" style="border: none;background-color:white;"
                                >恐怖</button></form>
                        <li>
                            <form action="movieType?type=惊悚"  method="post" id="jingsongform">
                                <button type="button" id="jingsongbtn" style="border: none;background-color:white;"
                                >惊悚</button></form>
                        <li>
                            <form action="movieType?type=科幻"  method="post" id="kehuanform">
                                <button type="button" id="kehuanbtn" style="border: none;background-color:white;"
                                >科幻</button></form>
                        <li>
                            <form action="movieType?type=动作"  method="post" id="dongzuoform">
                                <button type="button" id="dongzuobtn" style="border: none;background-color:white;"
                                >动作</button></form>
                        <li>
                            <form action="movieType?type=悬疑"  method="post" id="xuanyiform">
                                <button type="button" id="xuanyibtn" style="border: none;background-color:white;"
                                >悬疑</button></form>
                        <li>
                            <form action="movieType?type=犯罪"  method="post" id="fanzuiform">
                                <button type="button" id="fanzuibtn" style="border: none;background-color:white;"
                                >犯罪</button></form>
                        <li>
                            <form action="movieType?type=冒险"  method="post" id="maoxianform">
                                <button type="button" id="maoxianbtn" style="border: none;background-color:white;"
                                >冒险</button></form>
                        <li>
                            <form action="movieType?type=战争"  method="post" id="zhanzhengform">
                                <button type="button" id="zhanzhengbtn" style="border: none;background-color:white;"
                                >战争</button></form>
                        <li>
                            <form action="movieType?type=奇幻"  method="post" id="qihuanform">
                                <button type="button" id="qihuanbtn" style="border: none;background-color:white;"
                                >奇幻</button></form>
                        <li>
                            <form action="movieType?type=运动"  method="post" id="yundongform">
                                <button type="button" id="yundongbtn" style="border: none;background-color:white;"
                                >运动</button></form>
                        <li>
                            <form action="movieType?type=家庭"  method="post" id="jiatingform">
                                <button type="button" id="jiatingbtn" style="border: none;background-color:white;"
                                >家庭</button></form>
                        <li>
                            <form action="movieType?type=古装"  method="post" id="guzhuangform">
                                <button type="button" id="guzhuangbtn" style="border: none;background-color:white;"
                                >古装</button></form>
                        <li>
                            <form action="movieType?type=武侠"  method="post" id="wuxiaform">
                                <button type="button" id="wuxiabtn" style="border: none;background-color:white;"
                                >武侠</button></form>
                        <li>
                            <form action="movieType?type=西部"  method="post" id="xibuform">
                                <button type="button" id="xibubtn" style="border: none;background-color:white;"
                                >西部</button></form>
                        <li>
                            <form action="movieType?type=历史"  method="post" id="lishiform">
                                <button type="button" id="lishibtn" style="border: none;background-color:white;"
                                >历史</button></form>
                        <li>
                            <form action="movieType?type=传记"  method="post" id="zhuanjiform">
                                <button type="button" id="zhuanjibtn" style="border: none;background-color:white;"
                                >传记</button></form>
                        <li>
                            <form action="movieType?type=情色"  method="post" id="qingseform">
                                <button type="button" id="qingsebtn" style="border: none;background-color:white;"
                                >情色</button></form>
                        <li>
                            <form action="movieType?type=歌舞"  method="post" id="gewuform">
                                <button type="button" id="gewubtn" style="border: none;background-color:white;"
                                >歌舞</button></form>
                        <li>
                            <form action="movieType?type=黑色电影"  method="post" id="heiseform">
                                <button type="button" id="heisebtn" style="border: none;background-color:white;"
                                >黑色电影</button></form>
                        <li>
                            <form action="movieType?type=短片"  method="post" id="duanpianform">
                                <button type="button" id="duanpianbtn" style="border: none;background-color:white;"
                                >短片</button></form>
                        <li>
                            <form action="movieType?type=纪录片"  method="post" id="jilupianform">
                                <button type="button" id="jilupianbtn" style="border: none;background-color:white;"
                                >纪录片</button></form>
                        <li>
                            <form action="movieType?type=其他"  method="post" id="qitaform">
                                <button type="button" id="qitabtn" style="border: none;background-color:white;"
                                >其他</button></form>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>

<div class="container">

    <div class="panel-body">
        <div class="bs-example" data-example-id="thumbnails-with-custom-content">
            <c:forEach items="${movieList}" var="item">
                <div class="row-fluid">
                    <div class="col-sm-6 col-md-2">
                        <div class="thumbnail" style="border: transparent;">
                            <img src="${item.image}"
                                 style="height: 200px; width: 100%; display: block;">
                            <div class="caption">
                                <p class="text-center"><a href="movieDetail?id=${item.id}">${item.movName}</a></p>
                                <h3 class="text-center" style="color: #eea236">${item.totalScore}</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
       	 



    </div>
</div>
</div>

</body>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
    $("#searchbtn").click(function (){
        // 提交表单
        $("#searchform").submit();
    });
</script>
<script type="text/javascript">
    $("#allbtn").click(function (){
        // 提交表单
        $("#allform").submit();
    });
</script>
<script type="text/javascript">
    $("#aiqingbtn").click(function (){
        // 提交表单
        $("#aiqingform").submit();
    });
</script>
<script type="text/javascript">
    $("#xijubtn").click(function (){
        // 提交表单
        $("#xijuform").submit();
    });
    $("#dongmanbtn").click(function (){
        // 提交表单
        $("#dongmanform").submit();
    });
    $("#juqingbtn").click(function (){
        // 提交表单
        $("#juqingform").submit();
    });
    $("#kongbubtn").click(function (){
        // 提交表单
        $("#kongbuform").submit();
    });
    $("#jingsongbtn").click(function (){
        // 提交表单
        $("#jingsongform").submit();
    });
    $("#kehuanbtn").click(function (){
        // 提交表单
        $("#kehuanform").submit();
    });
    $("#dongzuobtn").click(function (){
        // 提交表单
        $("#dongzuoform").submit();
    });
    $("#xuanyibtn").click(function (){
        // 提交表单
        $("#xuanyiform").submit();
    });
    $("#fanzuibtn").click(function (){
        // 提交表单
        $("#fanzuiform").submit();
    });
    $("#maoxianbtn").click(function (){
        // 提交表单
        $("#maoxianform").submit();
    });
    $("#zhanzhengbtn").click(function (){
        // 提交表单
        $("#zhanzhengform").submit();
    });
    $("#qihuanbtn").click(function (){
        // 提交表单
        $("#qihuanform").submit();
    });
    $("#yundongbtn").click(function (){
        // 提交表单
        $("#yundongform").submit();
    });
    $("#jiatingbtn").click(function (){
        // 提交表单
        $("#jiatingform").submit();
    });
    $("#guzhuangbtn").click(function (){
        // 提交表单
        $("#guzhuangform").submit();
    });
    $("#wuxiabtn").click(function (){
        // 提交表单
        $("#wuxiaform").submit();
    });
    $("#xibubtn").click(function (){
        // 提交表单
        $("#xibuform").submit();
    });
    $("#lishibtn").click(function (){
        // 提交表单
        $("#lishiform").submit();
    });
    $("#zhuanjibtn").click(function (){
        // 提交表单
        $("#zhuanjiform").submit();
    });
    $("#qingsebtn").click(function (){
        // 提交表单
        $("#qingseform").submit();
    });
    $("#gewubtn").click(function (){
        // 提交表单
        $("#gewuform").submit();
    });
    $("#heisebtn").click(function (){
        // 提交表单
        $("#heiseform").submit();
    });
    $("#duanpianbtn").click(function (){
        // 提交表单
        $("#duanpianform").submit();
    });
    $("#jilupianbtn").click(function (){
        // 提交表单
        $("#jilupianform").submit();
    });
    $("#qitabtn").click(function (){
        // 提交表单
        $("#qitaform").submit();
    });
</script>
</html>