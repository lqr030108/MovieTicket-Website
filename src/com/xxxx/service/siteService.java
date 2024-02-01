package com.xxxx.service;
import com.xxxx.entity.site;
import com.xxxx.entity.siteKey;
import com.xxxx.mapper.movieMapper;
import com.xxxx.mapper.siteMapper;
import com.xxxx.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
public class siteService {
    SqlSession session = GetSqlSession.createSqlSession();
    siteMapper sitemapper = session.getMapper(siteMapper.class);
    public int addSite(site si){
        return sitemapper.insert(si);
    }//添加座位，返回0失败，1成功
    public int updateSite(site site){

        return sitemapper.updateByPrimaryKeySelective(site);
    }//修改座位状态，返回0失败，1成功
    public site selectById(site si){
        siteKey key = new siteKey();
        key.setSesId(si.getSesId());
        key.setColumnId(si.getColumnId());
        key.setRowId(si.getRowId());
        return sitemapper.selectByPrimaryKey(key);
    }//根据座位(其实是根据row_id和clo_idh和ses_id)查找座位
    public List<site> selectBySesID(int SesID){
        return sitemapper.selectBySesID(SesID);
    }
//    public List<site> selectByScrID_SesID(int ScrId,int SesID){
//        siteExample siEx = new siteExample();
//        siteExample.Criteria siExC = siEx.createCriteria();
//        siExC.andScrIdEqualTo(ScrId);
//        siExC.andSesIdEqualTo(SesID);
//        return sitemapper.selectByExample(siEx);
//    }//根据影厅id和场次id查找座位列表
}
