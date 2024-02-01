<%--
  Created by IntelliJ IDEA.
  User: l
  Date: 2023/5/16
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/login.css ">
    <title>注册账号</title>
</head>
<style> body { font-family: Arial, sans-serif; background-color: #f7f7f7; } form { width: 400px; margin: 100px auto; padding: 30px; background-color: #fff; box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.2); border-radius: 8px; } input[type="text"], input[type="password"] { width: 100%; padding: 10px; margin-bottom: 20px; border: 1px solid #ccc; border-radius: 5px; box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1); font-size: 16px; } input[type="text"]:focus, input[type="password"]:focus { border-color: #0d6efd; outline: none; box-shadow: 0px 0px 5px rgba(13, 110, 253, 0.3); } button { display: block; width: 100%; padding: 10px; background-color: #0d6efd; color: #fff; border: none; border-radius: 5px; cursor: pointer; transition: all 0.3s ease; font-size: 18px; font-weight: 600; } button:hover { background-color: #0c63e4; } span#error-message { display: block; font-size: 14px; color: #f44336; margin-bottom: 10px; } label { display: block; font-size: 16px; font-weight: 600; margin-bottom: 5px; } </style>
<body>
<div style="text-align: center">
    <form action="register" method="post" id="registerform">
        姓名（必填）<input type="text" name="uname" id="uname" value="${messageModel.object.userName}">  <br>
        密码（必填）<input type="password" name="upwd" id="upwd" value="${messageModel.object.userPwd}"> <br>
        身份证号（必填）<input type="text" name="uid" id="uid" value="${messageModel.object.userId}"> <br>
        年龄<input type="text" name="uage" id="uage" value="${messageModel.object.userAge}"> <br>
        <span id="msg" style="font-size: 12px;color: red">${messageModel.msg}</span> <br>
        <button type="button" id="registerbtn">注册</button>
    </form>
</div>
</body>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
    $("#registerbtn").click(function (){
        var uname = $("#uname").val();
        var upwd = $("#upwd").val();
        var uid = $("#uid").val();
        //  判断姓名是否为空
        if (isEmpty(uname)){
            $("#msg").html("用户姓名不可为空！");
            return;
        }
        //  判断密码是否为空
        if (isEmpty(upwd)){
            $("#msg").html("用户密码不可为空！");
            return;
        }
        //  判断身份证号是否为空
        if (isEmpty(uid)){
            $("#msg").html("身份证号不可为空！");
            return;
        }
        // 提交表单
        $("#registerform").submit();
    });
    // 判断字符串是否为空
    function isEmpty(str){
        if (str == null || str.trim() == "") return true;
        return false;
    }
</script>
</html>
