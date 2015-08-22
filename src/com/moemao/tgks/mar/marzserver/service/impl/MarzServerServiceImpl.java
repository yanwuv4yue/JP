package com.moemao.tgks.mar.marzserver.service.impl;

import java.util.List;

import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.mar.marz.tool.MarzConstant;
import com.moemao.tgks.mar.marzserver.dao.MarzServerDao;
import com.moemao.tgks.mar.marzserver.entity.MarzServerEvt;
import com.moemao.tgks.mar.marzserver.entity.MarzServerReq;
import com.moemao.tgks.mar.marzserver.service.MarzServerService;
import com.moemao.tgks.mar.tool.MarUtil;

public class MarzServerServiceImpl implements MarzServerService
{
/**
 * ﻿MarzServerDao
 */
private MarzServerDao mar_marzServerDao;

public List<MarzServerEvt> queryMarzServer(MarzServerReq marzServerReq)
{
if (CommonUtil.isEmpty(marzServerReq.getSortSql()))
{
marzServerReq.setSortSql(" t.ID DESC");
}
return mar_marzServerDao.mar_queryMarzServer(marzServerReq);
}

public MarzServerEvt queryMarzServerById(String id)
{
MarzServerReq marzServerReq = new MarzServerReq();
marzServerReq.setId(id);
MarzServerEvt marzServerEvt = null;
List<MarzServerEvt> marzServerList = mar_marzServerDao.mar_queryMarzServer(marzServerReq);
if (!CommonUtil.isEmpty(marzServerList))
{
marzServerEvt = marzServerList.get(0);
}
return marzServerEvt;
}

public MarzServerEvt queryMarzServerByLoaclIp(String ip)
{
MarzServerReq marzServerReq = new MarzServerReq();
marzServerReq.setLoaclIp(ip);
marzServerReq.setSortSql(" t.usernum ASC");
MarzServerEvt marzServerEvt = null;
List<MarzServerEvt> marzServerList = mar_marzServerDao.mar_queryMarzServer(marzServerReq);
if (!CommonUtil.isEmpty(marzServerList))
{
marzServerEvt = marzServerList.get(0);
}
return marzServerEvt;
}

public int addMarzServer(MarzServerEvt marzServerEvt)
{
marzServerEvt.setId(MarUtil.createUniqueID());
return mar_marzServerDao.mar_addMarzServer(marzServerEvt);
}

public int updateMarzServer(MarzServerEvt marzServerEvt)
{
return mar_marzServerDao.mar_updateMarzServer(marzServerEvt);
}

public int deleteMarzServer(List<String> ids)
{
return mar_marzServerDao.mar_deleteMarzServer(ids);
}

/**
 * @return 返回 mar_marzServerDao
 */
public MarzServerDao getMar_marzServerDao()
{
    return mar_marzServerDao;
}

/**
 * @param 对mar_marzServerDao进行赋值
 */
public void setMar_marzServerDao(MarzServerDao mar_marzServerDao)
{
    this.mar_marzServerDao = mar_marzServerDao;
}

@Override
public List<MarzServerEvt> queryMarzServerByIds(List<String> ids)
{
    return mar_marzServerDao.mar_queryMarzServerByIds(ids);
}

@Override
public int changeMarzServerStatus(String ip, String status)
{
    MarzServerReq marzServerReq = new MarzServerReq();
    marzServerReq.setLoaclIp(ip);
    marzServerReq.setSortSql(" t.usernum ASC");
    MarzServerEvt marzServerEvt = null;
    List<MarzServerEvt> marzServerList = mar_marzServerDao.mar_queryMarzServer(marzServerReq);
    if (!CommonUtil.isEmpty(marzServerList))
    {
        marzServerEvt = marzServerList.get(0);
        marzServerEvt.setStatus(status);
        mar_marzServerDao.mar_updateMarzServer(marzServerEvt);
    }
    
    return 0;
}

@Override
public int updateMarzServerUserNum(String ip, int num)
{
    MarzServerReq marzServerReq = new MarzServerReq();
    marzServerReq.setLoaclIp(ip);
    marzServerReq.setSortSql(" t.usernum ASC");
    MarzServerEvt marzServerEvt = null;
    List<MarzServerEvt> marzServerList = mar_marzServerDao.mar_queryMarzServer(marzServerReq);
    if (!CommonUtil.isEmpty(marzServerList))
    {
        marzServerEvt = marzServerList.get(0);
        marzServerEvt.setUserNum(num);
        mar_marzServerDao.mar_updateMarzServer(marzServerEvt);
    }
    return num;
}

@Override
public MarzServerEvt queryMarzServerForMin()
{
    MarzServerReq marzServerReq = new MarzServerReq();
    marzServerReq.setStatus(MarzConstant.MARZSERVER_STATUS_1); // 启动中
    marzServerReq.setAccept(MarzConstant.MARZSERVER_ACCEPT_1); // 允许分流
    marzServerReq.setSortSql(" t.usernum ASC");
    MarzServerEvt marzServerEvt = null;
    List<MarzServerEvt> marzServerList = mar_marzServerDao.mar_queryMarzServer(marzServerReq);
    if (!CommonUtil.isEmpty(marzServerList))
    {
        marzServerEvt = marzServerList.get(0);
    }
    return marzServerEvt;
}

}