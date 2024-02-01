package com.xxxx.controller;

import com.xxxx.entity.User;
import com.xxxx.entity.vo.MessageModel;
import com.xxxx.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    // 实例化 UserService对象
    private UserService userService = new UserService();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 接受客户端请求、用户参数
        String uname = request.getParameter("uname");
        String upwd = request.getParameter("upwd");
        Integer uid = Integer.valueOf(request.getParameter("uid"));
        Integer uage = request.getParameter("uage")==""?0:Integer.valueOf(request.getParameter("uage"));
        // 调用service层方法，返回消息模型对象
        MessageModel messageModel = userService.userRegister(uname, upwd, uid, uage);
        // 判断消息模型的状态码
        if (messageModel.getCode() == 1) { // 成功
            // 将消息模型中的用户信息设置到session作用域中，重定向跳转到index.jsp
            request.getSession().setAttribute("user", messageModel.getObject());
            response.sendRedirect("index.jsp");
        } else{ // 失败
            // 将消息模型对象设置到request作用域中，请求转发跳转到register.jsp
            request.setAttribute("messageModel", messageModel);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}

