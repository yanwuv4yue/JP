package com.moemao.tgks.mar.marznotice.action;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.moemao.tgks.common.core.action.TGKSAction;
import com.moemao.tgks.common.tool.CommonConstant;
import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.common.tool.StringUtil;
import com.moemao.tgks.mar.marznotice.entity.MarzNoticeEvt;
import com.moemao.tgks.mar.marznotice.entity.MarzNoticeReq;
import com.moemao.tgks.mar.marznotice.service.MarzNoticeService;

public class MarzNoticeAction extends TGKSAction
{
    private static final long serialVersionUID = -8527809674768130066L;

    private static Log logger = LogFactory.getLog(MarzNoticeAction.class);
    
    /**
     * ﻿MarzNotice业务接口
     */
    private MarzNoticeService mar_marzNoticeService;
    
    /**
     * 查询结果集
     */
    private List<MarzNoticeEvt> list;
    
    /**
     * ﻿MarzNoticeEvt对象
     */
    private MarzNoticeEvt marzNoticeEvt;
    
    /**
     * ﻿MarzNotice查询条件封装对象（自动生成代码后需要new对象）
     */
    private MarzNoticeReq marzNoticeReq = new MarzNoticeReq();
    
    public String marzNoticeManager()
    {
    return SUCCESS;
    }
    
    public String queryMarzNotice()
    {
    list = mar_marzNoticeService.queryMarzNotice(marzNoticeReq);
    return SUCCESS;
    }
    
    public String editMarzNoticePage()
    {
    String id = this.getRequest().getParameter("id");
    if (!CommonUtil.isEmpty(id))
    {
    marzNoticeEvt = mar_marzNoticeService.queryMarzNoticeById(id);
    }
    return SUCCESS;
    }
    
    public String editMarzNotice()
    {
    CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN, "MarzNoticeAction.updateMarzNotice");
    int result = 0;
    if (CommonUtil.isEmpty(marzNoticeEvt.getId()))
    {
    result = mar_marzNoticeService.addMarzNotice(marzNoticeEvt);
    CommonUtil.systemLog("mar/editMarzNotice.action", CommonConstant.SYSTEMLOG_TYPE_1, result == 0 ? CommonConstant.FAILD : CommonConstant.SUCCESS, String.format("新增marzNoticeEvt\n%S", marzNoticeEvt.toString()));
    }
    else
    {
    result = mar_marzNoticeService.updateMarzNotice(marzNoticeEvt);
    CommonUtil.systemLog("mar/editMarzNotice.action", CommonConstant.SYSTEMLOG_TYPE_2, result == 0 ? CommonConstant.FAILD : CommonConstant.SUCCESS, String.format("修改marzNoticeEvt\n%S", marzNoticeEvt.toString()));
    }
    CommonUtil.infoLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS, StringUtil.toBeString(result));
    CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT, "MarzNoticeAction.updateMarzNotice");
    return SUCCESS;
    }
    
    public String deleteMarzNotice()
    {
    CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN, "MarzNoticeAction.deleteMarzNotice");
    String ids = this.getRequest().getParameter("ids");
    int result = mar_marzNoticeService.deleteMarzNotice(CommonUtil.stringToList(ids));
    CommonUtil.systemLog("mar/deleteMarzNotice.action", CommonConstant.SYSTEMLOG_TYPE_3, result == 0 ? CommonConstant.FAILD : CommonConstant.SUCCESS, String.format("删除marzNoticeEvt\nID:%S", ids));
    CommonUtil.infoLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS, StringUtil.toBeString(result));
    CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT, "MarzNoticeAction.deleteMarzNotice");
    return SUCCESS;
    }
    
    /**
     * @return 返回 mar_marzNoticeService
     */
    public MarzNoticeService getMar_marzNoticeService()
    {
        return mar_marzNoticeService;
    }
    
    /**
     * @param 对mar_marzNoticeService进行赋值
     */
    public void setMar_marzNoticeService(MarzNoticeService mar_marzNoticeService)
    {
        this.mar_marzNoticeService = mar_marzNoticeService;
    }
    
    /**
     * @return 返回 list
     */
    public List<MarzNoticeEvt> getList()
    {
        return list;
    }
    
    /**
     * @param 对list进行赋值
     */
    public void setList(List<MarzNoticeEvt> list)
    {
        this.list = list;
    }
    
    /**
     * @return 返回 marzNoticeEvt
     */
    public MarzNoticeEvt getMarzNoticeEvt()
    {
        return marzNoticeEvt;
    }
    
    /**
     * @param 对marzNoticeEvt进行赋值
     */
    public void setMarzNoticeEvt(MarzNoticeEvt marzNoticeEvt)
    {
        this.marzNoticeEvt = marzNoticeEvt;
    }
    
    /**
     * @return 返回 marzNoticeReq
     */
    public MarzNoticeReq getMarzNoticeReq()
    {
        return marzNoticeReq;
    }
    
    /**
     * @param 对marzNoticeReq进行赋值
     */
    public void setMarzNoticeReq(MarzNoticeReq marzNoticeReq)
    {
        this.marzNoticeReq = marzNoticeReq;
    }

}