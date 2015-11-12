package com.moemao.tgks.mar.marznotice.service.impl;

import java.util.List;

import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.mar.marznotice.dao.MarzNoticeDao;
import com.moemao.tgks.mar.marznotice.entity.MarzNoticeEvt;
import com.moemao.tgks.mar.marznotice.entity.MarzNoticeReq;
import com.moemao.tgks.mar.marznotice.service.MarzNoticeService;
import com.moemao.tgks.mar.tool.MarUtil;

public class MarzNoticeServiceImpl implements MarzNoticeService
{
/**
 * ﻿MarzNoticeDao
 */
private MarzNoticeDao mar_marzNoticeDao;

public List<MarzNoticeEvt> queryMarzNotice(MarzNoticeReq marzNoticeReq)
{
if (CommonUtil.isEmpty(marzNoticeReq.getSortSql()))
{
marzNoticeReq.setSortSql(" t.ID DESC");
}
return mar_marzNoticeDao.mar_queryMarzNotice(marzNoticeReq);
}

public MarzNoticeEvt queryMarzNoticeById(String id)
{
MarzNoticeReq marzNoticeReq = new MarzNoticeReq();
marzNoticeReq.setId(id);
MarzNoticeEvt marzNoticeEvt = null;
List<MarzNoticeEvt> marzNoticeList = mar_marzNoticeDao.mar_queryMarzNotice(marzNoticeReq);
if (!CommonUtil.isEmpty(marzNoticeList))
{
marzNoticeEvt = marzNoticeList.get(0);
}
return marzNoticeEvt;
}

public int addMarzNotice(MarzNoticeEvt marzNoticeEvt)
{
marzNoticeEvt.setId(MarUtil.createUniqueID());
return mar_marzNoticeDao.mar_addMarzNotice(marzNoticeEvt);
}

public int updateMarzNotice(MarzNoticeEvt marzNoticeEvt)
{
return mar_marzNoticeDao.mar_updateMarzNotice(marzNoticeEvt);
}

public int deleteMarzNotice(List<String> ids)
{
return mar_marzNoticeDao.mar_deleteMarzNotice(ids);
}

/**
 * @return 返回 mar_marzNoticeDao
 */
public MarzNoticeDao getMar_marzNoticeDao()
{
    return mar_marzNoticeDao;
}

/**
 * @param 对mar_marzNoticeDao进行赋值
 */
public void setMar_marzNoticeDao(MarzNoticeDao mar_marzNoticeDao)
{
    this.mar_marzNoticeDao = mar_marzNoticeDao;
}

}