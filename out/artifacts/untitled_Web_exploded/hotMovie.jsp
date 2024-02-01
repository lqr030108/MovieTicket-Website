<%@page import="com.xxxx.entity.Movie"%>
<%@page import="java.util.List"%>
<%@page import="com.xxxx.entity.User"%>
<%@ page import="com.xxxx.controller.movieDoingServlet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
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
                    <input type="text" class="form-control" name ="movName"  placeholder="找电影">
                </div>
                <button type="button" class="btn btn-default" id="searchbtn"><span class="glyphicon glyphicon-search"></span></button>
            </form>
            <ul class="nav navbar-nav">\
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


<nav class="subnav navbar-default" >
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
<%--                        <li>--%>
<%--                            <form action="movieDoing" method="post" id="allform">--%>
<%--                            <button type="button" id="allbtn" style="border: none;background-color:white;"--%>
<%--                            >全部</button></form>--%>
                        <li class="active" data-state-val="{catTagName:'全部'}" style="background: #161C29">
                            <a data-act="tag-click" data-val="{TagName:'全部'}"
                               href="movieDoing" style="cursor: default"
                            >全部</a>
                        </li>
                        <li>
                            <a data-act="tag-click" data-val="{TagName:'爱情'}"
                               href="movieType?type=爱情"
                            >爱情</a>
    <li>
        <a data-act="tag-click" data-val="{TagName:'喜剧'}"
           href="movieType?type=喜剧"
        >喜剧</a>
    <li>
        <a data-act="tag-click" data-val="{TagName:'动漫'}"
           href="movieType?type=动漫"
        >动漫</a>
    <li>
        <a data-act="tag-click" data-val="{TagName:'剧情'}"
           href="movieType?type=剧情"
        >剧情</a>
    <li>
        <a data-act="tag-click" data-val="{TagName:'恐怖'}"
           href="movieType?type=恐怖"
        >恐怖</a>
    <li>
        <a data-act="tag-click" data-val="{TagName:'惊悚'}"
           href="movieType?type=惊悚"
        >惊悚</a>
    <li>
        <a data-act="tag-click" data-val="{TagName:'科幻'}"
           href="movieType?type=科幻"
        >科幻</a>
    <li>
        <a data-act="tag-click" data-val="{TagName:'动作'}"
           href="movieType?type=动作"
        >动作</a>
    <li>
        <a data-act="tag-click" data-val="{TagName:'悬疑'}"
           href="movieType?type=悬疑"
        >悬疑</a>
    <li>
        <a data-act="tag-click" data-val="{TagName:'犯罪'}"
           href="movieType?type=犯罪"
        >犯罪</a>
    <li>
        <a data-act="tag-click" data-val="{TagName:'冒险'}"
           href="movieType?type=冒险"
        >冒险</a>
    <li>
        <a data-act="tag-click" data-val="{TagName:'战争'}"
           href="movieType?type=战争"
        >战争</a>
    <li>
        <a data-act="tag-click" data-val="{TagName:'奇幻'}"
           href="movieType?type=奇幻"
        >奇幻</a>
    <li>
        <a data-act="tag-click" data-val="{TagName:'运动'}"
           href="movieType?type=运动"
        >运动</a>
    <li>
        <a data-act="tag-click" data-val="{TagName:'家庭'}"
           href="movie/seleteMovieBytype1.action?type=14"
        >家庭</a>
    <li>
        <a data-act="tag-click" data-val="{TagName:'古装'}"
           href="movieType?type=古装"
        >古装</a>
    <li>
        <a data-act="tag-click" data-val="{TagName:'武侠'}"
           href="movieType?type=武侠"
        >武侠</a>
    <li>
        <a data-act="tag-click" data-val="{TagName:'西部'}"
           href="movieType?type=西部"
        >西部</a>
    <li>
        <a data-act="tag-click" data-val="{TagName:'历史'}"
           href="movieType?type=历史"
        >历史</a>
    <li>
        <a data-act="tag-click" data-val="{TagName:'传记'}"
           href="movieType?type=传记"
        >传记</a>
    <li>
        <a data-act="tag-click" data-val="{TagName:'情色'}"
           href="movieType?type=情色"
        >情色</a>
    <li>
        <a data-act="tag-click" data-val="{TagName:'歌舞'}"
           href="movieType?type=歌舞"
        >歌舞</a>
    <li>
        <a data-act="tag-click" data-val="{TagName:'黑色电影'}"
           href="movieType?type=黑色电影"
        >黑色电影</a>
    <li>
        <a data-act="tag-click" data-val="{TagName:'短片'}"
           href="movieType?type=短片"
        >短片</a>
    <li>
        <a data-act="tag-click" data-val="{TagName:'纪录片'}"
           href="movieType?type=纪录片"
        >纪录片</a>
    <li>
        <a data-act="tag-click" data-val="{TagName:'其他'}"
           href="movieType?type=其他"
        >其他</a>
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
<%--                                <form action="movieDetail?id=${item.id}"  method="post" id="detailform">--%>
<%--                                    <button type="button" id="detailbtn" style="border: none;background-color:white;"--%>
<%--                                    >${item.movName}</button></form>--%>
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

</html>