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
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.List;

@WebServlet("/updatemovie")
public class updatemovieServlet extends HttpServlet {
    MovieService movieService = new MovieService();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 接受客户端请求、用户参数
        request.setCharacterEncoding("UTF-8");
        Integer id = Integer.valueOf(request.getParameter("id"));
        Integer status = Integer.valueOf(request.getParameter("status"));
        if (status == 1){
            movieService.updateMovie(id);
            response.sendRedirect("movie_admin.jsp");
        }
        else if (status == -1){
            movieService.outdateMovie(id);
            response.sendRedirect("movie_admin.jsp");
        }
        else if (status == 0){
            movieService.deleteMovie(id);
            response.sendRedirect("movie_admin.jsp");
        }
    }
}
