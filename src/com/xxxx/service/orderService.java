package com.xxxx.service;

import com.xxxx.entity.*;
import com.xxxx.mapper.UserMapper;
import com.xxxx.mapper.movieMapper;
import com.xxxx.mapper.orderMapper;
import com.xxxx.mapper.sessionsMapper;
import com.xxxx.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
public class orderService {
    SqlSession session = GetSqlSession.createSqlSession();
    movieMapper movMapper = session.getMapper(movieMapper.class);
    orderMapper ordersMapper = session.getMapper(orderMapper.class);
    sessionsMapper sessMapper = session.getMapper(sessionsMapper.class);

    public List<orders> findBycliId(Integer cliId) {
        // TODO Auto-generated method stub
        return ordersMapper.findordersByCliId(cliId);
    }
//
//
//    public List<orders> loadBysesId(Integer sesId) {
//        // TODO Auto-generated method stub
//        ordersExample or = new ordersExample();
//        ordersExample.Criteria dec = or.createCriteria();
//        dec.andSesIdEqualTo(sesId);
//        return ordersMapper.selectByExample(or);
//    }
//
//
//    public List<orders> loadByDate(Date date) {
//        // TODO Auto-generated method stub
//        ordersExample or = new ordersExample();
//        ordersExample.Criteria dec = or.createCriteria();
//        dec.andOrderTimeEqualTo(date);
//        return ordersMapper.selectByExample(or);
//    }


    public int addOrders(orders order) {
        // TODO Auto-generated method stub
		/*int re = ordersMapper.insert(order);
		return re;*/
        return ordersMapper.insertSelective(order);
    }


//    public int deleteOrdersByCliIdandSesId(Integer cliId, Integer sesId) {
//        // TODO Auto-generated method stub
//        ordersExample or = new ordersExample();
//        ordersExample.Criteria dec = or.createCriteria();
//        dec.andCliIdEqualTo(cliId);
//        dec.andSesIdEqualTo(sesId);
//        int re = ordersMapper.deleteByExample(or);
//        return re;
//    }
//
//
//    public List<orders> loadByMname(String Mname) {
//        // TODO Auto-generated method stub
//
//        List<sessions> allsess = new ArrayList<sessions>();
//        List<orders> allorders = new ArrayList<orders>();
//
//        movieExample or1 = new movieExample();
//        movieExample.Criteria dec1 = or1.createCriteria();
//        dec1.andMovNameEqualTo(Mname);
//        List<Movie> movie = movMapper.selectByExample(or1);
//
//        for(Movie mov:movie){
//            sessionsExample or2 = new sessionsExample();
//            sessionsExample.Criteria dec2 = or2.createCriteria();
//            dec2.andMovIdEqualTo(mov.getId());
//            allsess = sessMapper.selectByExample(or2);
//        }
//
//        for(sessions sess:allsess){
//            ordersExample or = new ordersExample();
//            ordersExample.Criteria dec = or.createCriteria();
//            dec.andSesIdEqualTo(sess.getId());
//            allorders.addAll(ordersMapper.selectByExample(or));
//        }
//        return allorders;
//    }

}
