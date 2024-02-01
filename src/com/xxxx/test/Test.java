package com.xxxx.test;

import com.xxxx.entity.Movie;
import com.xxxx.entity.User;
import com.xxxx.mapper.UserMapper;
import com.xxxx.mapper.movieMapper;
import com.xxxx.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class Test {
    public static void main(String[] args) {
        // 获取sqlSession对象
        SqlSession session = GetSqlSession.createSqlSession();
        // 得到对应的Mapper
        movieMapper movieMapper = session.getMapper(movieMapper.class);
        // 调用方法返回用户对象
        List<Movie> movie = movieMapper.selectByLikemovName("速");

        System.out.println(movie);
    }
}
