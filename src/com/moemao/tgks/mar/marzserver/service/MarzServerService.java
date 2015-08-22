package com.moemao.tgks.mar.marzserver.service;

import java.util.List;

import com.moemao.tgks.mar.marzserver.entity.MarzServerEvt;
import com.moemao.tgks.mar.marzserver.entity.MarzServerReq;

public interface MarzServerService
{
public List<MarzServerEvt> queryMarzServer(MarzServerReq marzServerReq);

public MarzServerEvt queryMarzServerById(String id);

public MarzServerEvt queryMarzServerByLoaclIp(String ip);

public List<MarzServerEvt> queryMarzServerByIds(List<String> ids);

public int addMarzServer(MarzServerEvt marzServerEvt);

public int updateMarzServer(MarzServerEvt marzServerEvt);

public int deleteMarzServer(List<String> ids);

public int changeMarzServerStatus(String ip, String status);

public int updateMarzServerUserNum(String ip, int num);

public MarzServerEvt queryMarzServerForMin();

}