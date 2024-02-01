package com.xxxx.controller;

import com.xxxx.entity.Movie;
import com.xxxx.entity.User;
import com.xxxx.entity.comments;
import com.xxxx.entity.sessions;
import com.xxxx.entity.vo.MessageModel;
import com.xxxx.service.MovieService;
import com.xxxx.service.SessionsService;
import com.xxxx.service.UserService;
import com.xxxx.service.commentsService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/movieDetail")
public class movieDetail extends HttpServlet {
    // 实例化 UserService对象
    MovieService movieService = new MovieService();
    SessionsService sessionsService = new SessionsService();
    commentsService commentsService = new commentsService();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 接受客户端请求、用户参数
        Integer id = Integer.valueOf(request.getParameter("id"));
        // 调用service层方法，返回消息模型对象
        Movie movie = movieService.seleteMovieById(id);
        List<sessions> sessionsList = sessionsService.loadSessionsListByMov_id(id);
        List<comments> commentsList = new ArrayList<comments>();
        List<User>  comCliList = new ArrayList<User>();
        for(int i =0;i<sessionsList.size();i++){
            List<comments> cList = commentsService.selectBySesId(sessionsList.get(i).getId());
            commentsList.addAll(cList);

            for(int j=0;j<cList.size();j++){
                User cli = UserService.loadUserByID(cList.get(j).getCliId());
                comCliList.add(cli);
            }
        }
        request.getSession().setAttribute("comCliList", comCliList);
        request.getSession().setAttribute("comList",commentsList );
        request.getSession().setAttribute("mov_detail", movie);
        response.sendRedirect("detail.jsp");
    }
}
