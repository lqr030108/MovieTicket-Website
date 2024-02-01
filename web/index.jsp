<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: l--%>
<%--  Date: 2023/5/13--%>
<%--  Time: 23:03--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>hello</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--    <h1>欢迎${user.userName}登录成功！</h1>--%>
<%--    <button type="button" id="loginbtn_index">登录</button>--%>
<%--    <button type="button" id="registerbtn_index">注册</button>--%>
<%--</body>--%>
<%--<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>--%>

<%--<script type="text/javascript">--%>
<%--    $("#loginbtn_index").click(function (){--%>
<%--        location.href="${pageContext.request.contextPath}/login.jsp";--%>
<%--    })--%>
<%--    $("#registerbtn_index").click(function (){--%>
<%--        location.href="${pageContext.request.contextPath}/register.jsp";--%>
<%--    })--%>
<%--</script>--%>
<%--</html>--%>
<%--<%@page import="com.mysql.jdbc.Connection"%>--%>
<%@page import="java.util.Collections"%>
<%@page import="com.xxxx.entity.Movie"%>
<%@page import="java.util.List"%>
<%@page import="com.xxxx.entity.User"%>

<%@page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.css">
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
            border-top: 5px dashed ;
            border-top: 5px solid ;
            border-right: 5px solid transparent;
            border-left: 5px solid transparent;
            -webkit-transition: all .2s ease;
            transition: all .2s ease
        }

        .divcss5-right {
            float: right;
            width: 260px;
            padding-top: 12px;
        }
    </style>
</head>
<body>

<!--导航栏-->
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
                <li class="active"><a href="index.jsp">首页 <span class="sr-only">(current)</span></a></li>
                <li><a href="hotMovie.jsp">电影</a></li>
            </ul>
            <form class="navbar-form navbar-left" method="post" action="selectByName" id="searchform">
                <div class="form-group">
                    <input type="text" class="form-control" name ="movName"  placeholder="找电影">
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
                            <li><a href="login.jsp">登录</a></li>
                            <li><a href="register.jsp">注册</a></li>
                            <li><a href="login_admin.jsp">管理员登录</a></li>
                            <li><a href="User/logout.action">退出登录</a></li>
                        </c:if>

                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<!--轮播图-->
<div id="myCarousel" class="carousel slide">
    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
        <li data-target="#myCarousel" data-slide-to="4"></li>
    </ol>
    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner">
        <div class="item active">
            <img src="images/1.jpg" style="width:100%" alt="First slide">
        </div>
        <div class="item">
            <img src="images/2.jpg" style="width:100%" alt="Second slide">
        </div>
        <div class="item">
            <img src="images/3.jpg" style="width:100%" alt="Third slide">
        </div>
        <div class="item">
            <img src="images/4.jpg" style="width:100%" alt="Forth slide">
        </div>
        <div class="item">
            <img src="images/5.jpg" style="width:100%" alt="Five slide">
        </div>

    </div>
    <!-- 轮播（Carousel）导航 -->
    <a class="carousel-control left" href="#myCarousel"
       data-slide="prev">&lsaquo;</a>
    <a class="carousel-control right" href="#myCarousel"
       data-slide="next">&rsaquo;</a>
</div>

<!--正在热映-->
<p></p>
<div class="container">
    <div class="row-fluid">
        <span style="color: #c12e2a"><font size="5"><strong>正在热映</strong></font></span>
        <a href="hotMovie.jsp" class="divcss5-right" style="color: #c12e2a"><font size="2">全部</font><span
                class="glyphicon glyphicon-chevron-right"></span></a>

    </div>
<%--    <div class="panel-body">--%>
<%--        <div class="bs-example" data-example-id="thumbnails-with-custom-content">--%>
<%--            <div class="row-fluid">--%>
<%--                <c:forEach items="${movieDoing}" var="item" begin="0" end="4">--%>
<%--                    <div class="col-sm-6 col-md-2">--%>

<%--                        <div class="thumbnail">--%>

<%--                            <img src="${item.image }"--%>
<%--                                 style="height: 200px; width: 100%; display: block;">--%>
<%--                            <p class="text-center" style="padding-top: 5px"><a href="movie/goMovDetail.action?id=${item.id}" >${item.movName}</a>--%>

<%--                        </div>--%>

<%--                    </div>--%>
<%--                </c:forEach>--%>
<%--            </div>--%>

<%--        </div>--%>

<%--    </div>--%>
    <div class="panel-body">
        <div class="bs-example" data-example-id="thumbnails-with-custom-content">
            <div class="row-fluid">
                <div class="col-sm-6 col-md-2">
                    <div class="thumbnail">
                        <img src="images/titanic.jpg"
                             style="height: 200px; width: 100%; display: block;">
                        <p class="text-center" style="padding-top: 5px"><a href="#">购票</a></div>
                </div>
            </div>
            <div class="row-fluid">
                <div class="col-sm-6 col-md-2">
                    <div class="thumbnail">
                        <img src="images/piano.jpg"
                             style="height: 200px; width: 100%; display: block;">
                        <p class="text-center" style="padding-top: 5px"><a href="#">购票</a></div>
                </div>
                <div class="col-sm-6 col-md-2">
                    <div class="thumbnail">
                        <img src="images/lingya.jpg"
                             style="height: 200px; width: 100%; display: block;">
                        <p class="text-center" style="padding-top: 5px"><a href="#">购票</a></div>
                </div>
            </div>
            <div class="col-sm-6 col-md-2">
                <div class="thumbnail">
                    <img src="images/77.png"
                         style="height: 200px; width: 100%; display: block;">
                    <p class="text-center" style="padding-top: 5px"><a href="#">购票</a></div>
            </div>
        </div>
        <div class="col-sm-6 col-md-2">
            <div class="thumbnail">
                <img src="images/mov4.jpg"
                     style="height: 200px; width: 100%; display: block;">
                <p class="text-center" style="padding-top: 5px"><a href="#">购票</a></div>
        </div>
        <div class="col-sm-6 col-md-2">
            <div class="thumbnail">
                <img src="images/mov5.jpg"
                     style="height: 200px; width: 100%; display: block;">
                <p class="text-center" style="padding-top: 5px"><a href="#">购票</a></div>
        </div>
    </div>
    <p></p>
    <!--即将上映-->
<%--    <div class="row-fluid">--%>
<%--        <span style="color: #5cb3fd"><font size="5"><strong>即将上映</strong></font></span>--%>
<%--        <a href="comingMovie.jsp" class="divcss5-right" style="color: #5cb3fd"><font size="2">全部</font><span--%>
<%--                class="glyphicon glyphicon-chevron-right"></span></a>--%>
<%--    </div>--%>
<%--    <div class="panel-body">--%>
<%--        <div class="bs-example" data-example-id="thumbnails-with-custom-content">--%>
<%--            <div class="row-fluid">--%>
<%--                <c:forEach items="${moviesComing}" var="item" begin="0" end="4">--%>
<%--                    <div class="col-sm-6 col-md-2">--%>

<%--                        <div class="thumbnail">--%>

<%--                            <img src="${item.image }"--%>
<%--                                 style="height: 200px; width: 100%; display: block;">--%>
<%--                            <p class="text-center" style="padding-top: 5px"><a href="movie/goMovDetail.action?id=${item.id }" >${item.movName}</a>--%>

<%--                        </div>--%>

<%--                    </div>--%>
<%--                </c:forEach>--%>
<%--            </div>--%>

<%--        </div>--%>

<%--    </div>--%>
    <div class="row-fluid">
        <span style="color: #5cb3fd"><font size="5"><strong>即将上映</strong></font></span>
        <a href="#" class="divcss5-right" style="color: #5cb3fd"><font size="2">全部</font><span
                class="glyphicon glyphicon-chevron-right"></span></a>
    </div>
    <div class="panel-body">
        <div class="bs-example" data-example-id="thumbnails-with-custom-content">
            <div class="row-fluid">
                <div class="col-sm-6 col-md-2">
                    <div class="thumbnail">
                        <img src="images/mov1.jpg"
                             style="height: 200px; width: 100%; display: block;">
                        <p class="text-center" style="padding-top: 5px"><a href="#">购票</a></div>
                </div>
            </div>
            <div class="row-fluid">
                <div class="col-sm-6 col-md-2">
                    <div class="thumbnail">
                        <img src="images/mov13.jpg"
                             style="height: 200px; width: 100%; display: block;">
                        <p class="text-center" style="padding-top: 5px"><a href="#">购票</a></div>
                </div>
                <div class="col-sm-6 col-md-2">
                    <div class="thumbnail">
                        <img src="images/mov12.jpg"
                             style="height: 200px; width: 100%; display: block;">
                        <p class="text-center" style="padding-top: 5px"><a href="#">购票</a></div>
                </div>
            </div>
            <div class="col-sm-6 col-md-2">
                <div class="thumbnail">
                    <img src="images/mov8.jpg"
                         style="height: 200px; width: 100%; display: block;">
                    <p class="text-center" style="padding-top: 5px"><a href="#">购票</a></div>
            </div>
        </div>
        <div class="col-sm-6 col-md-2">
            <div class="thumbnail">
                <img src="images/mov9.jpg"
                     style="height: 200px; width: 100%; display: block;">
                <p class="text-center" style="padding-top: 5px"><a href="#">购票</a></div>
        </div>
        <div class="col-sm-6 col-md-2">
            <div class="thumbnail">
                <img src="images/mov17.jpg"
                     style="height: 200px; width: 100%; display: block;">
                <p class="text-center" style="padding-top: 5px"><a href="#">购票</a></div>
        </div>

    </div>

</div>
</body>

<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
<script type="text/javascript">
    $("#searchbtn").click(function (){
        // 提交表单
        $("#searchform").submit();
    });
</script>
</html>
