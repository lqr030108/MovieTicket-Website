package com.xxxx.service;

import com.xxxx.entity.comments;
import com.xxxx.mapper.commentsMapper;
import com.xxxx.mapper.movieMapper;
import com.xxxx.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class commentsService {
    SqlSession session = GetSqlSession.createSqlSession();
    com.xxxx.mapper.commentsMapper comMapper = session.getMapper(commentsMapper.class);
    int addComments(comments com){
        return comMapper.insert(com);
    }//添加评论
    int countByCliId(int cliId){
        return comMapper.countBycliId(cliId);
    }//根据用户id计算评论数
    int countBySesId(int sesId){
        return comMapper.countBysesId(sesId);
    }//根据场次id计算评论数
    List<comments> selectByCliId(int cliId){
        return comMapper.selectBycliId(cliId);
    }//根据用户id返回评论列表
    public List<comments> selectBySesId(int sesId){
        return comMapper.selectBysesId(sesId);
    }//根据场次id返回评论列表
    List<comments> selectByCliId_SesId(int cliId,int sesId){
        return comMapper.selectBycliIdsesId(cliId, sesId);
    }//根据用户id,场次id返回评论列表
}
