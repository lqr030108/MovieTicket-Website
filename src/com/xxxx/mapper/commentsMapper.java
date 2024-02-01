package com.xxxx.mapper;

import com.xxxx.entity.comments;
import com.xxxx.entity.commentsExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface commentsMapper {
    int countByExample(commentsExample example);

    int deleteByExample(commentsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(comments record);

    int insertSelective(comments record);

    int countBycliId(Integer cliId);

    int countBysesId(Integer sesId);

    List<comments> selectBycliId(Integer cliId);

    List<comments> selectBysesId(Integer sesId);

    List<comments> selectBycliIdsesId(Integer cliId, Integer sesId);

    comments selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") comments record, @Param("example") commentsExample example);

    int updateByExample(@Param("record") comments record, @Param("example") commentsExample example);

    int updateByPrimaryKeySelective(comments record);

    int updateByPrimaryKey(comments record);
}
