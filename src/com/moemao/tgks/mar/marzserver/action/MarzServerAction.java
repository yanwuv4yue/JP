package com.moemao.tgks.mar.marzserver.action;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.moemao.tgks.common.core.action.TGKSAction;
import com.moemao.tgks.common.tool.CommonConstant;
import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.common.tool.StringUtil;
import com.moemao.tgks.mar.marzserver.entity.MarzServerEvt;
import com.moemao.tgks.mar.marzserver.entity.MarzServerReq;
import com.moemao.tgks.mar.marzserver.service.MarzServerService;

public class MarzServerAction extends TGKSAction
{

    /** 
     * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
     */ 
    private static final long serialVersionUID = -1130288588190751633L;

    private static Log logger = LogFactory.getLog(MarzServerAction.class);
    
    /**
     * ﻿MarzServer业务接口
     */
    private MarzServerService mar_marzServerService;
    
    /**
     * 查询结果集
     */
    private List<MarzServerEvt> list;
    
    /**
     * ﻿MarzServerEvt对象
     */
    private MarzServerEvt marzServerEvt;
    
    /**
     * ﻿MarzServer查询条件封装对象（自动生成代码后需要new对象）
     */
    private MarzServerReq marzServerReq = new MarzServerReq();
    
    public String marzServerManager()
    {
    return SUCCESS;
    }
    
    public String queryMarzServer()
    {
    list = mar_marzServerService.queryMarzServer(marzServerReq);
    return SUCCESS;
    }
    
    public String editMarzServerPage()
    {
    String id = this.getRequest().getParameter("id");
    if (!CommonUtil.isEmpty(id))
    {
    marzServerEvt = mar_marzServerService.queryMarzServerById(id);
    }
    return SUCCESS;
    }
    
    public String editMarzServer()
    {
    CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN, "MarzServerAction.updateMarzServer");
    int result = 0;
    if (CommonUtil.isEmpty(marzServerEvt.getId()))
    {
    result = mar_marzServerService.addMarzServer(marzServerEvt);
    CommonUtil.systemLog("mar/editMarzServer.action", CommonConstant.SYSTEMLOG_TYPE_1, result == 0 ? CommonConstant.FAILD : CommonConstant.SUCCESS, String.format("新增marzServerEvt\n%S", marzServerEvt.toString()));
    }
    else
    {
    result = mar_marzServerService.updateMarzServer(marzServerEvt);
    CommonUtil.systemLog("mar/editMarzServer.action", CommonConstant.SYSTEMLOG_TYPE_2, result == 0 ? CommonConstant.FAILD : CommonConstant.SUCCESS, String.format("修改marzServerEvt\n%S", marzServerEvt.toString()));
    }
    CommonUtil.infoLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS, StringUtil.toBeString(result));
    CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT, "MarzServerAction.updateMarzServer");
    return SUCCESS;
    }
    
    public String deleteMarzServer()
    {
    CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_IN, "MarzServerAction.deleteMarzServer");
    String ids = this.getRequest().getParameter("ids");
    int result = mar_marzServerService.deleteMarzServer(CommonUtil.stringToList(ids));
    CommonUtil.systemLog("mar/deleteMarzServer.action", CommonConstant.SYSTEMLOG_TYPE_3, result == 0 ? CommonConstant.FAILD : CommonConstant.SUCCESS, String.format("删除marzServerEvt\nID:%S", ids));
    CommonUtil.infoLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_EXECUTE_NUMS, StringUtil.toBeString(result));
    CommonUtil.debugLog(logger, CommonConstant.SYSTEM_INFO_LOG_METHOD_OUT, "MarzServerAction.deleteMarzServer");
    return SUCCESS;
    }
    
    /**
     * @return 返回 mar_marzServerService
     */
    public MarzServerService getMar_marzServerService()
    {
        return mar_marzServerService;
    }
    
    /**
     * @param 对mar_marzServerService进行赋值
     */
    public void setMar_marzServerService(MarzServerService mar_marzServerService)
    {
        this.mar_marzServerService = mar_marzServerService;
    }
    
    /**
     * @return 返回 list
     */
    public List<MarzServerEvt> getList()
    {
        return list;
    }
    
    /**
     * @param 对list进行赋值
     */
    public void setList(List<MarzServerEvt> list)
    {
        this.list = list;
    }
    
    /**
     * @return 返回 marzServerEvt
     */
    public MarzServerEvt getMarzServerEvt()
    {
        return marzServerEvt;
    }
    
    /**
     * @param 对marzServerEvt进行赋值
     */
    public void setMarzServerEvt(MarzServerEvt marzServerEvt)
    {
        this.marzServerEvt = marzServerEvt;
    }
    
    /**
     * @return 返回 marzServerReq
     */
    public MarzServerReq getMarzServerReq()
    {
        return marzServerReq;
    }
    
    /**
     * @param 对marzServerReq进行赋值
     */
    public void setMarzServerReq(MarzServerReq marzServerReq)
    {
        this.marzServerReq = marzServerReq;
    }

}