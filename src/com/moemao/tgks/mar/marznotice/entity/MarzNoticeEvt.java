package com.moemao.tgks.mar.marznotice.entity;

import java.util.Date;

public class MarzNoticeEvt
{
/**
 * 表唯一主键
 */
private String id;

/**
 * 标题
 */
private String title;

/**
 * 链接
 */
private String url;

/**
 * 级别（0 普通；1 重要）
 */
private String level;

/**
 * 创建时间
 */
private Date createTime;

@Override
public String toString()
{
return String.format("id:%S\ntitle:%S\nurl:%S\nlevel:%S\ncreateTime:%S\n", id, title, url, level, createTime);
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
 * @return 返回 title
 */
public String getTitle()
{
    return title;
}

/**
 * @param 对title进行赋值
 */
public void setTitle(String title)
{
    this.title = title;
}

/**
 * @return 返回 url
 */
public String getUrl()
{
    return url;
}

/**
 * @param 对url进行赋值
 */
public void setUrl(String url)
{
    this.url = url;
}

/**
 * @return 返回 level
 */
public String getLevel()
{
    return level;
}

/**
 * @param 对level进行赋值
 */
public void setLevel(String level)
{
    this.level = level;
}

/**
 * @return 返回 createTime
 */
public Date getCreateTime()
{
    return createTime;
}

/**
 * @param 对createTime进行赋值
 */
public void setCreateTime(Date createTime)
{
    this.createTime = createTime;
}

}