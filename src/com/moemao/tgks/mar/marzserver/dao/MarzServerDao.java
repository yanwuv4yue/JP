package com.moemao.tgks.mar.marzserver.dao;

import java.util.List;
import org.springframework.dao.DataAccessException;
import com.moemao.tgks.common.core.dao.TGKSDao;
import com.moemao.tgks.mar.marzserver.entity.MarzServerEvt;
import com.moemao.tgks.mar.marzserver.entity.MarzServerReq;

public interface MarzServerDao extends TGKSDao
{
public List<MarzServerEvt> mar_queryMarzServer(MarzServerReq marzServerReq) throws DataAccessException;

public List<MarzServerEvt> mar_queryMarzServerByIds(List<String> ids) throws DataAccessException;

public int mar_addMarzServer(MarzServerEvt marzServerEvt) throws DataAccessException;

public int mar_updateMarzServer(MarzServerEvt marzServerEvt) throws DataAccessException;

public int mar_deleteMarzServer(List<String> list) throws DataAccessException;
}