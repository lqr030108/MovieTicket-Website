package com.xxxx.mapper;

import com.xxxx.entity.Movie;
import com.xxxx.entity.orders;
import com.xxxx.entity.sessions;
import com.xxxx.entity.sessionsExample;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
public interface sessionsMapper {
    int countByExample(sessionsExample example);

    int deleteByExample(sessionsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(sessions record);

    int insertSelective(sessions record);

    List<sessions> selectBymovId(Integer movId);

    List<sessions> selectAll(String movId);

    List<sessions> selectBytime(Date begin, Date end);

    List<sessions> selectBydate(Date dt);

    List<sessions> selectBydatemovId(Date date, Integer movId);

    List<sessions> selectBymovIdtime(@Param("movId")Integer movId, @Param("date")Date date, @Param("endDate")Date endDate);

    sessions selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") sessions record, @Param("example") sessionsExample example);

    int updateByExample(@Param("record") sessions record, @Param("example") sessionsExample example);

    int updateByPrimaryKeySelective(sessions record);

    int updateByPrimaryKey(sessions record);

    List<Movie> findsessionsBymovId();

    List<sessions> findmoviesBySessions();

}
