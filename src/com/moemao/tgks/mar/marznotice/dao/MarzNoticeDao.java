package com.moemao.tgks.mar.marznotice.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.moemao.tgks.common.core.dao.TGKSDao;
import com.moemao.tgks.mar.marznotice.entity.MarzNoticeEvt;
import com.moemao.tgks.mar.marznotice.entity.MarzNoticeReq;

public interface MarzNoticeDao extends TGKSDao
{
public List<MarzNoticeEvt> mar_queryMarzNotice(MarzNoticeReq marzNoticeReq) throws DataAccessException;

public int mar_addMarzNotice(MarzNoticeEvt marzNoticeEvt) throws DataAccessException;

public int mar_updateMarzNotice(MarzNoticeEvt marzNoticeEvt) throws DataAccessException;

public int mar_deleteMarzNotice(List<String> list) throws DataAccessException;
}