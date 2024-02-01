package com.xxxx.service;

import com.xxxx.entity.Movie;
import com.xxxx.entity.User;
import com.xxxx.entity.movieExample;
import com.xxxx.mapper.UserMapper;
import com.xxxx.mapper.movieMapper;
import com.xxxx.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class MovieService {
    SqlSession session = GetSqlSession.createSqlSession();
    movieMapper movieMapper = session.getMapper(movieMapper.class);
    public int addMovie(Movie movie){
        Date now = new Date();
        Date showtimeDate = movie.getShowtime();
        if((showtimeDate.getTime()+(24*60*60*1000))<now.getTime()&&showtimeDate.getDate()<now.getDate()||
                (showtimeDate.getTime()+(24*60*60*1000))<now.getTime()) //过时
        {
            return 0;
        }
        else {
            movieMapper.insert(movie);
            return 1;
        }
    }

    public void outdateMovie(Integer id){movieMapper.outdateByPrimaryKeySelective(id);}

    public void deleteMovie(Integer id){
        movieMapper.deleteByPrimaryKey(id);
    }
    //上映电影
    public void updateMovie(Integer id){
        movieMapper.updateByPrimaryKeySelective(id);
    }
    //查询所有电影
    public List<Movie> seleteMovies(){
        List<Movie> list = movieMapper.selectAll(null);
        return list;
    }

    //根据电影的id查找电影
    public Movie seleteMovieById(Integer id){
        if(id!=null){
            Movie movie = movieMapper.selectByPrimaryKey(id);
            return movie;
        }
        else {
            return null;
        }
    }

    //根据演员查找电影
    public List<Movie> seleteMovieByActor(String actor){
        if(actor!=null){
            return movieMapper.selectByactor(actor);
        }
        else {
            return null;
        }
    }

    //根据导演查找电影
    public List<Movie> seleteMovieByDirector(String director){
        if(director!=null){
            return movieMapper.selectBydirector(director);
        }
        else {
            return null;
        }
    }

    //根据电影的状态查找电影
    public List<Movie> seleteMovieByStatus(Integer status){
        if(status!=null){
            return movieMapper.selectBystatus(status);
        }
        else {
            return null;
        }
    }

    //根据电影的类型查找电影
    public List<Movie> seleteMovieBytype(String type){
        if(type!=null){
            return movieMapper.selectBytype(type);
        }
        else {
            return null;
        }
    }

    //根据电影的名字查找电影，模糊查询，返回一个列表
    public List<Movie> seleteMovieByName(String movName){
        if(movName!=null){
            return movieMapper.selectByLikemovName(movName);
        }
        else {
            return null;
        }
    }


    //根据电影的上映名字查找电影，返回一个列表
    public List<Movie> seleteMovieBetweenDate(String showtime){
        Date date1 = new Date(); // 现在的时间
        Date date2 = null;
        Calendar rightNow = Calendar.getInstance();
        rightNow.setTime(date1);
        if(showtime.equals("half")){
            rightNow.add(Calendar.DAY_OF_YEAR, -15);
            date2 = rightNow.getTime();
            return movieMapper.selectBytime(date1, date2);
        }
        if(showtime.equals("1")){
            rightNow.add(Calendar.MONTH, -1);
            date2 = rightNow.getTime();
            return movieMapper.selectBytime(date1, date2);
        }
        if(showtime.equals("3")){
            rightNow.add(Calendar.MONTH, -3);
            date2 = rightNow.getTime();
            return movieMapper.selectBytime(date1, date2);
        }
        if(showtime.equals("all")){
            return seleteMovies();
        }
        return null;
    }
}
