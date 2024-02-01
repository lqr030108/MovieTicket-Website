package com.xxxx.controller;
import com.xxxx.entity.Movie;
import com.xxxx.entity.User;
import com.xxxx.entity.vo.MessageModel;
import com.xxxx.service.MovieService;
import com.xxxx.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.List;
@WebServlet("/movieType")
public class movieTypeServlet extends HttpServlet {
    MovieService movieService = new MovieService();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 接受客户端请求、用户参数
        // 调用service层方法，返回消息模型对象
        String type = request.getParameter("type");
        List<Movie> movies = movieService.seleteMovieBytype(type);
        // 判断消息模型的状态码
        request.getSession().setAttribute("movieList", movies);
        response.sendRedirect("hotMovie.jsp");
    }
}
