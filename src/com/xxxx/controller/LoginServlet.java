package com.xxxx.controller;

import com.xxxx.entity.Movie;
import com.xxxx.entity.User;
import com.xxxx.entity.vo.MessageModel;
import com.xxxx.service.MovieService;
import com.xxxx.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    // 实例化 UserService对象
    private UserService userService = new UserService();
    private MovieService movieService = new MovieService();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 接受客户端请求、用户参数
        String uname = request.getParameter("uname");
        String upwd = request.getParameter("upwd");
        // 调用service层方法，返回消息模型对象
        MessageModel messageModel = userService.userLogin(uname, upwd);
        // 判断消息模型的状态码
        Integer type = Integer.valueOf(request.getParameter("type"));
        if (type == 0){
        if (messageModel.getCode() == 1) { // 成功
            // 将消息模型中的用户信息设置到session作用域中，重定向跳转到index.jsp
            request.getSession().setAttribute("user", messageModel.getObject());
            List<Movie> movieDoing = movieService.seleteMovieByStatus(1);
            request.getSession().setAttribute("movieList", movieDoing);
            response.sendRedirect("hotMovie.jsp");
        } else{ // 失败
            // 将消息模型对象设置到request作用域中，请求转发跳转到login.jsp
            request.setAttribute("messageModel", messageModel);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }}
        else if (type == 1){
            if (messageModel.getCode() == 1) { // 成功
                // 将消息模型中的用户信息设置到session作用域中，重定向跳转到index.jsp
                request.getSession().setAttribute("user", messageModel.getObject());
                List<Movie> movieDoing = movieService.seleteMovieByStatus(1);
                request.getSession().setAttribute("movieList", movieDoing);
                response.sendRedirect("admin_index.jsp");
            } else{ // 失败
                // 将消息模型对象设置到request作用域中，请求转发跳转到login.jsp
                request.setAttribute("messageModel", messageModel);
                request.getRequestDispatcher("login_admin.jsp").forward(request, response);
            }
        }
    }
}

