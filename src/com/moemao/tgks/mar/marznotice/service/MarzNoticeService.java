package com.moemao.tgks.mar.marznotice.service;

import java.util.List;

import com.moemao.tgks.mar.marznotice.entity.MarzNoticeEvt;
import com.moemao.tgks.mar.marznotice.entity.MarzNoticeReq;

public interface MarzNoticeService
{
public List<MarzNoticeEvt> queryMarzNotice(MarzNoticeReq marzNoticeReq);

public MarzNoticeEvt queryMarzNoticeById(String id);

public int addMarzNotice(MarzNoticeEvt marzNoticeEvt);

public int updateMarzNotice(MarzNoticeEvt marzNoticeEvt);

public int deleteMarzNotice(List<String> ids);

}