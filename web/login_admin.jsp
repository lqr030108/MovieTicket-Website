<%--
  Created by IntelliJ IDEA.
  User: l
  Date: 2023/5/13
  Time: 23:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" href="css/login.css ">
  <title>管理员登录</title>
</head>
<style>
  body {
    background-color: #f2f2f2;
    font-family: Arial, sans-serif;
  }
  form {
    width: 400px;
    margin: 100px auto;
    padding: 30px;
    background-color: #fff;
    box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.2);
    border-radius: 8px;
  }
  input[type="text"], input[type="password"] {
    width: 100%;
    padding: 10px 15px;
    margin-bottom: 20px;
    border: none;
    border-radius: 5px;
    box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
    font-size: 16px;
  }
  button {
    display: block;
    width: 100%;
    padding: 10px 15px;
    background-color: #0d6efd;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s ease;
    font-size: 18px;
    font-weight: 600;
  }
  button:hover {
    background-color: #0c63e4;
  }
  a {
    color: #0d6efd;
    text-decoration: none;
    transition: all 0.3s ease;
    font-size: 16px;
  }
  a:hover {
    color: #0c63e4;
  }
  #msg {
    display: block;
    font-size: 14px;
    color: #f44336;
    margin-bottom: 10px;
  }
</style>
<body>

<div style="text-align: center">
  <form action="login?type=1" method="post" id="loginform">
    姓名<input type="text" name="uname" id="uname" value="${messageModel.object.userName}">  <br>
    密码<input type="password" name="upwd" id="upwd" value="${messageModel.object.userPwd}"> <br>
    <span id="msg" style="font-size: 12px;color: red">${messageModel.msg}</span> <br>
    <button type="button" id="loginbtn">登录</button>
  </form>
</div>


</body>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
  $("#loginbtn").click(function (){
    var uname = $("#uname").val();
    var upwd = $("#upwd").val();
    //  判断姓名是否为空
    if (isEmpty(uname)){
      $("#msg").html("管理员姓名不可为空！");
      return;
    }
    //  判断密码是否为空
    if (isEmpty(upwd)){
      $("#msg").html("管理员密码不可为空！");
      return;
    }
    // 提交表单
    $("#loginform").submit();
  });
  // 判断字符串是否为空
  function isEmpty(str){
    if (str == null || str.trim() == "") return true;
    return false;
  }
</script>
</html>
