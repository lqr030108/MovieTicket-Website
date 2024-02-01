package com.xxxx.mapper;
import com.xxxx.entity.site;
import com.xxxx.entity.siteKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;
public interface siteMapper {
//    int countByExample(siteExample example);
//
//    int deleteByExample(siteExample example);

    int deleteByPrimaryKey(siteKey key);

    int insert(site record);

    int insertSelective(site record);

//    List<site> selectByExample(siteExample example);

    List<site> selectBySesID(@Param("SesID")Integer SesID);

    site selectByPrimaryKey(siteKey key);

//    int updateByExampleSelective(@Param("record") site record, @Param("example") siteExample example);
//
//    int updateByExample(@Param("record") site record, @Param("example") siteExample example);

    int updateByPrimaryKeySelective(site site);

    int updateByPrimaryKey(site record);
}
