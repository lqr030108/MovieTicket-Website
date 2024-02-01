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

@WebServlet("/addmovie")
public class addmovieServlet extends HttpServlet {
    // 实例化 UserService对象
    MovieService movieService = new MovieService();
    CustomDateConverter convert = new CustomDateConverter();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 接受客户端请求、用户参数
        request.setCharacterEncoding("UTF-8");
        String movName = request.getParameter("movName");
        String type = request.getParameter("select_country");
        Integer status = Integer.valueOf(request.getParameter("select_language"));
        Integer runningtime = Integer.valueOf(request.getParameter("runningtime"));
        String director = request.getParameter("director");
        String actor = request.getParameter("actor");
//        String date = request.getParameter("showtime");
//        Date showtime = convert.convert(date);
        Date now = new Date();
        String image = request.getParameter("image");
        String introduction = request.getParameter("introduction");

        Movie movie = new Movie();
        movie.setMovName(movName);
        movie.setType(type);
        movie.setStatus(status);
        movie.setRunningtime(runningtime);
        movie.setDirector(director);
        movie.setActor(actor);
        movie.setShowtime(now);
        movie.setImage(image);
        movie.setIntroduction(introduction);

        // 调用service层方法，返回消息模型对象
        movieService.addMovie(movie);
        // 判断消息模型的状态码

        response.sendRedirect("add_movie.jsp");
    }
}
