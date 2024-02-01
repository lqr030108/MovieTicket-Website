package com.xxxx.controller;

import com.xxxx.entity.User;
import com.xxxx.entity.sessions;
import com.xxxx.entity.site;
import com.xxxx.entity.vo.MessageModel;
import com.xxxx.service.SessionsService;
import com.xxxx.service.UserService;
import com.xxxx.service.siteService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet("/chooseSeat")
public class chooseSeatServlet extends HttpServlet {
    private SessionsService sessionsService = new SessionsService();
    private siteService siteService = new siteService();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Integer sesId = Integer.valueOf(request.getParameter("sesId"));
        List<site> ses_SeatList = siteService.selectBySesID(1);
        request.getSession().setAttribute("ses_SeatList", ses_SeatList);

        site site = new site();
        site.setSesId(1);
        int[] seat = new int[99];
        int t = 0;
        for(int i = 1; i<=9; i++){
            for(int j = 1; j<=11; j++){
                site.setRowId(i);
                site.setColumnId(j);
                seat[t] = (int)(siteService.selectById(site).getEmpty());
                t++;
            }
        }
        request.getSession().setAttribute("seatArray", seat);

        sessions ses = sessionsService.selectById(sesId);
        request.getSession().setAttribute("ses", ses);
        response.sendRedirect("select_seat.jsp");
    }
}
