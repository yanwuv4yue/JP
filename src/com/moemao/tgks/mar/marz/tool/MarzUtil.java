package com.moemao.tgks.mar.marz.tool;

import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.codec.binary.Base64;

import com.moemao.tgks.common.core.spring.ContextUtil;
import com.moemao.tgks.common.systemconfig.entity.SystemConfigEvt;
import com.moemao.tgks.common.systemconfig.entity.SystemConfigReq;
import com.moemao.tgks.common.systemconfig.service.SystemConfigService;
import com.moemao.tgks.common.tool.CommonUtil;
import com.moemao.tgks.mar.marz.entity.CardEvt;
import com.moemao.tgks.mar.marz.entity.ItemEvt;
import com.moemao.tgks.mar.marzitem.entity.MarzItemEvt;

public class MarzUtil
{
    public static String resultCodeStr(int resultCode)
    {
        return resultCode == MarzConstant.RES_CODE_SUCCESS_0 ? "成功" : "失败";
    }
    
    public static String listToString(List<String> list)
    {
        if (CommonUtil.isEmpty(list))
        {
            return "";
        }
        
        StringBuffer str = new StringBuffer();
        
        for (String s : list)
        {
            if (!CommonUtil.isEmpty(s.trim()))
            {
                str.append(s.trim()).append(",");
            }
        }
        
        return str.substring(0, str.length() - 1).toString();
    }
    
    public static List<String> stringToList(String str)
    {
        if (CommonUtil.isEmpty(str))
        {
            return new ArrayList<String>();
        }
        
        List<String> list = new ArrayList<String>();
        for (String s : str.split(","))
        {
            if (!CommonUtil.isEmpty(s.trim()))
            {
                list.add(s.trim());
            }
        }
        
        return list;
    }
    
    public static String getFaceImageUrl(String cardId)
    {
        return "<img width=\"25px\" onerror=\"nofind();\" src=\"../resources/mar/marweb/face/chr20_" + cardId + ".png\" title=\"" + cardId + "\" />";
    }
    
    public static String getFaceImageUrlByIdList(List<String> cardIdList)
    {
        StringBuffer sb = new StringBuffer();
        for (String cardId : cardIdList)
        {
            sb.append(getFaceImageUrl(cardId));
        }
        return sb.toString();
    }
    
    public static String getFaceImageUrl(CardEvt card)
    {
    	return "<img width=\"25px\" onerror=\"nofind();\" src=\"../resources/mar/marweb/face/chr20_" + card.getCardid() + ".png\" title=\"" + card.getCardid() + "\" />";
    }
    
    public static String getFaceImageUrlByList(List<CardEvt> cardList)
    {
    	StringBuffer sb = new StringBuffer();
    	for (CardEvt card : cardList)
    	{
    		sb.append(getFaceImageUrl(card));
    	}
    	return sb.toString();
    }
    
    public static String getItemInfo(List<ItemEvt> itemList, List<MarzItemEvt> marzItemList)
    {
        StringBuffer sb = new StringBuffer();
        for (ItemEvt item : itemList)
        {
            for (MarzItemEvt marzItem : marzItemList)
            {
                if (item.getItemId().equals(marzItem.getItemId()) && MarzConstant.MARZITEM_STATUS_1.equals(marzItem.getStatus()))
                {
                    sb.append("[" + marzItem.getName() + "：" + item.getNum() + "] ");
                }
                
            }
        }
        
        return sb.toString();
    }
    
    /**
     * 
     * @Title: inPvpTime
     * @Description: 时间 ①7:00～8:00　②13:00～14:00　③18:00～19:00　④22:00～23:00
     * @return
     * @return boolean 返回类型
     * @throws
     */
    public static boolean inPvpTime()
    {
        Date now = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("HH");
        int hour = Integer.parseInt(sdf.format(now));
        return (hour == 7 || hour == 13 || hour == 18 || hour == 22);
    }
    
    public static String GenerateHashToken(String uuid) throws Exception
    {
        MessageDigest messageDigest = MessageDigest.getInstance("SHA-1");
        messageDigest.update((uuid + getMarzDBConfig(MarzConstant.DBCONFIG_HASHTOKENKEY)).getBytes("UTF-8"));
        byte[] base64HashToken = Base64.encodeBase64(messageDigest.digest());
        
        return new String(base64HashToken);
    }
    
    public static String GenerateGachaHash(String userId) throws Exception
    {
        MessageDigest messageDigest = MessageDigest.getInstance("SHA-1");
        messageDigest.update((userId + getMarzDBConfig(MarzConstant.DBCONFIG_GACHAHASHKEY)).getBytes("UTF-8"));
        byte[] base64HashToken = Base64.encodeBase64(messageDigest.digest());
        
        return new String(base64HashToken);
    }
    
    public static String getMarzDBConfig(String tag)
    {
        SystemConfigService common_systemConfigService = (SystemConfigService) ContextUtil.getBean("common_systemConfigService");
        SystemConfigReq systemConfigReq = new SystemConfigReq();
        systemConfigReq.setTag(tag);
        List<SystemConfigEvt> systemConfigList =  common_systemConfigService.querySystemConfigList(systemConfigReq);
        return systemConfigList.size() > 0 ? systemConfigList.get(0).getValue() : "";
    }
}
