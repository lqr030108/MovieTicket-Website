package com.xxxx.mapper;
import com.xxxx.entity.Movie;
import com.xxxx.entity.movieExample;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface movieMapper {
    int countByExample(movieExample example);

    int deleteByExample(movieExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Movie movie);

    int insertSelective(Movie record);

    List<Movie> selectByactor(String actor);

    List<Movie> selectBydirector(String director);

    List<Movie> selectBystatus(Integer status);

    List<Movie> selectBytype(String type);

    List<Movie> selectByLikemovName(String movName);

    Movie selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Movie record, @Param("example") movieExample example);

    int updateByExample(@Param("record") Movie record, @Param("example") movieExample example);

    int updateByPrimaryKeySelective(Integer id);

    int outdateByPrimaryKeySelective(Integer id);

    int updateByPrimaryKey(Movie record);

    List<Movie> selectAll(String movie);

    List<Movie> selectBytime(Date date1, Date date2);
}
