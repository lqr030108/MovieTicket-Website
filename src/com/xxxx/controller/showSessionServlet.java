package com.xxxx.controller;

import com.xxxx.entity.User;
import com.xxxx.entity.sessions;
import com.xxxx.entity.vo.MessageModel;
import com.xxxx.service.SessionsService;
import com.xxxx.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet("/showSession")
public class showSessionServlet extends HttpServlet {
    private SessionsService sessionsService = new SessionsService();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Date nowDate = new Date();
        Integer mov_id = Integer.valueOf(request.getParameter("mov_id"));
        List<sessions> mov_SessionList = sessionsService.loadSessionsListByMov_id(mov_id);
//        List<sessions> mov = sessionsService.loadSessionsListByMov_id(mov_id);
        request.getSession().setAttribute("movSessionList", mov_SessionList);
        response.sendRedirect("select_session.jsp");
    }
}
