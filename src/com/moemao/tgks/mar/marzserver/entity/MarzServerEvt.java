package com.moemao.tgks.mar.marzserver.entity;

import java.util.Date;

public class MarzServerEvt
{
/**
 * 表唯一主键
 */
private String id;

/**
 * 服务器名称
 */
private String serverName;

/**
 * 用户数量
 */
private int userNum;

/**
 * 状态（0 已停止；1 运行中）
 */
private String status;

/**
 * 是否分流
 */
private String accept;

/**
 * 本地IP
 */
private String loaclIp;

/**
 * 外网IP
 */
private String netIp;

private Date updateTime;

@Override
public String toString()
{
return String.format("id:%S\nserverName:%S\nuserNum:%S\nstatus:%S\naccept:%S\nloaclIp:%S\nnetIp:%S\n", id, serverName, userNum, status, accept, loaclIp, netIp);
}

/**
 * @return 返回 id
 */
public String getId()
{
    return id;
}

/**
 * @param 对id进行赋值
 */
public void setId(String id)
{
    this.id = id;
}

/**
 * @return 返回 serverName
 */
public String getServerName()
{
    return serverName;
}

/**
 * @param 对serverName进行赋值
 */
public void setServerName(String serverName)
{
    this.serverName = serverName;
}

/**
 * @return 返回 userNum
 */
public int getUserNum()
{
    return userNum;
}

/**
 * @param 对userNum进行赋值
 */
public void setUserNum(int userNum)
{
    this.userNum = userNum;
}

/**
 * @return 返回 status
 */
public String getStatus()
{
    return status;
}

/**
 * @param 对status进行赋值
 */
public void setStatus(String status)
{
    this.status = status;
}

/**
 * @return 返回 accept
 */
public String getAccept()
{
    return accept;
}

/**
 * @param 对accept进行赋值
 */
public void setAccept(String accept)
{
    this.accept = accept;
}

/**
 * @return 返回 loaclIp
 */
public String getLoaclIp()
{
    return loaclIp;
}

/**
 * @param 对loaclIp进行赋值
 */
public void setLoaclIp(String loaclIp)
{
    this.loaclIp = loaclIp;
}

/**
 * @return 返回 netIp
 */
public String getNetIp()
{
    return netIp;
}

/**
 * @param 对netIp进行赋值
 */
public void setNetIp(String netIp)
{
    this.netIp = netIp;
}

public Date getUpdateTime()
{
    return updateTime;
}

public void setUpdateTime(Date updateTime)
{
    this.updateTime = updateTime;
}

}