package com.xxxx.controller;
import com.xxxx.entity.*;
import com.xxxx.entity.vo.MessageModel;
import com.xxxx.service.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet("/submitorder")
public class submitorderServlet extends HttpServlet {
    private SessionsService sessionsService = new SessionsService();
    private siteService siteService = new siteService();
    private orderService ordersService = new orderService();
    private UserService userService = new UserService();
    private MovieService movieService = new MovieService();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        User user = userService.loadUserByName(userName);
        List<site> ses_SeatList = (List<site>) request.getSession().getAttribute("ses_SeatList");
        sessions ses = (sessions) request.getSession().getAttribute("ses");
        Integer rowId_1 = Integer.valueOf(request.getParameter("rowId_1"));
        Integer columnId_1 = Integer.valueOf(request.getParameter("columnId_1"));
        Integer rowId_2 = Integer.valueOf(request.getParameter("rowId_2"));
        Integer columnId_2 = Integer.valueOf(request.getParameter("columnId_2"));
        Integer rowId_3 = Integer.valueOf(request.getParameter("rowId_3"));
        Integer columnId_3 = Integer.valueOf(request.getParameter("columnId_3"));
        Integer rowId_4 = Integer.valueOf(request.getParameter("rowId_4"));
        Integer columnId_4 = Integer.valueOf(request.getParameter("columnId_4"));

        if(user != null){
            orders order = new orders();
            order.setCliId(user.getUserId());
            order.setSesId(ses_SeatList.get(0).getSesId());
            java.sql.Date sqlNowDate=new java.sql.Date(new java.util.Date().getTime());
            order.setOrderTime(sqlNowDate);

            site site = new site();
            site.setSesId(ses_SeatList.get(0).getSesId());

            Integer siteid = ses_SeatList.get(0).getScrId();
            site.setScrId(siteid);
            if(rowId_1 != 0 && columnId_1 != 0){
                order.setRowId(rowId_1);
                order.setColumnId(columnId_1);
                ordersService.addOrders(order);
                ses.setTotalSold(ses.getTotalSold()+1);
                sessionsService.modifySessions(ses);

                site.setEmpty(1);
                site.setRowId(rowId_1);
                site.setColumnId(columnId_1);
//                siteService.updateSite(site);

                request.getSession().setAttribute("order_1", order);
            }

            if(rowId_2 != 0 && columnId_2 != 0){
                order.setRowId(rowId_2);
                order.setColumnId(columnId_2);
                ordersService.addOrders(order);
                ses.setTotalSold(ses.getTotalSold()+1);
                sessionsService.modifySessions(ses);

//                site.setEmpty(1);
//                site.setRowId(rowId_2);
//                site.setColumnId(columnId_2);
                siteService.updateSite(site);

                request.getSession().setAttribute("order_2", order);
            }

            if(rowId_3 != 0 && columnId_3 != 0){
                order.setRowId(rowId_3);
                order.setColumnId(columnId_3);
                ordersService.addOrders(order);
                ses.setTotalSold(ses.getTotalSold()+1);
                sessionsService.modifySessions(ses);

//                site.setEmpty(1);
//                site.setRowId(rowId_3);
//                site.setColumnId(columnId_3);
                siteService.updateSite(site);

                request.getSession().setAttribute("order_3", order);
            }

            if(rowId_4 != 0 && columnId_4 != 0){
                order.setRowId(rowId_4);
                order.setColumnId(columnId_4);
                ordersService.addOrders(order);
                ses.setTotalSold(ses.getTotalSold()+1);
                sessionsService.modifySessions(ses);

//                site.setEmpty(1);
//                site.setRowId(rowId_4);
//                site.setColumnId(columnId_4);
                siteService.updateSite(site);

                request.getSession().setAttribute("order_4", order);
            }
            List<orders> orders = ordersService.findBycliId(user.getUserId());
            for(int i=0;i<orders.size();i++){
                sessions se = sessionsService.selectById(orders.get(i).getSesId());
                Movie mo = movieService.seleteMovieById(se.getMovId());
                se.setMovie(mo);
                orders.get(i).setSessions(se);
            }
            request.getSession().setAttribute("orders", orders);
            response.sendRedirect("checkOrders.jsp");
//            response.sendRedirect("hotMovie.jsp");
        }
        else response.sendRedirect("index.jsp");
    }
}
