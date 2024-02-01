package com.xxxx.mapper;
import com.xxxx.entity.Movie;
import com.xxxx.entity.movieExample;
import com.xxxx.entity.orders;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
public interface orderMapper {
//    int countByExample(ordersExample example);

//    int deleteByExample(ordersExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(orders record);

    int insertSelective(orders order);

//    List<orders> selectByExample(ordersExample example);

    orders selectByPrimaryKey(Integer id);

//    int updateByExampleSelective(@Param("record") orders record, @Param("example") ordersExample example);

//    int updateByExample(@Param("record") orders record, @Param("example") ordersExample example);

    int updateByPrimaryKeySelective(orders record);

    int updateByPrimaryKey(orders record);

    List<orders> findordersByCliId(Integer cliId);

}
