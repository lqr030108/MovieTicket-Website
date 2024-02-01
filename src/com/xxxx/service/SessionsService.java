package com.xxxx.service;

import java.util.Date;
import java.util.List;

import com.xxxx.entity.sessions;
import com.xxxx.mapper.movieMapper;
import com.xxxx.mapper.sessionsMapper;
import com.xxxx.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

public class SessionsService {
    SqlSession session = GetSqlSession.createSqlSession();
    com.xxxx.mapper.sessionsMapper sessionsMapper = session.getMapper(com.xxxx.mapper.sessionsMapper.class);
    //根据id查询
    public sessions selectById(Integer id){
        return sessionsMapper.selectByPrimaryKey(id);
    }

    //新增新的session
    public int addScreens(sessions sessions){
        return sessionsMapper.insertSelective(sessions);
    }

    //根据id删除
    public int removeSessionsById(Integer id){
        return sessionsMapper.deleteByPrimaryKey(id);
    }

    //修改session，session。id与要修改的相同
    public int modifySessions(sessions sessions){
        return sessionsMapper.updateByPrimaryKey(sessions);
    }

    //查询sessions表
    public List<sessions> loadSessionsList(){
        return sessionsMapper.selectAll(null);
    }

    //根据电影id查场次
    public List<sessions> loadSessionsListByMov_id(Integer movId){
        return sessionsMapper.selectBymovId(movId);
    }

    //查询在某段时间内的场次表
    public List<sessions> loadSessionsListBetweenDateTime(Date begin, Date end){
        return sessionsMapper.selectBytime(begin, end);
    }

    //查询某天的所有场次
    public List<sessions> loadSessionsListByDateTime(Date dt){
        return sessionsMapper.selectBydate(dt);
    }

    //查询某天某电影的所有场次
    public List<sessions> loadSessionsListByDateTimeAndMov_id(Date date, Integer movId){
        return sessionsMapper.selectBydatemovId(date, movId);
    }

    //查询某电影未来一周内所有场次
    public List<sessions> loadSesisonsListByMov_idBetweenDateTime(Integer movId, Date date){
        long time = date.getTime();
        long day = 7;
        day = day*24*60*60*1000;
        time += day;
        Date endDate = new Date(time);
        return sessionsMapper.selectBymovIdtime(movId, date, endDate);
    }
//
//    public List<sessions> findmoviesBySessions(){
//        return sessionsMapper.findmoviesBySessions();
//    }
}
