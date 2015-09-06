package com.moemao.tgks.mar.marz.entity;

import net.sf.json.JSONObject;

public class PresentEvt
{
    private String presentid;
    
    private String add_elapsed_sec;
    
    private int limit_tm;
    
    private int type;
    
    private int num;
    
    private String reward_typeid;
    
    private String comment;
    
    public PresentEvt()
    {
        
    }
    
    public PresentEvt(JSONObject presentJSON)
    {
        this.setPresentid(presentJSON.getString("presentid"));
        this.setAdd_elapsed_sec(presentJSON.getString("add_elapsed_sec"));
        this.setLimit_tm(presentJSON.getInt("limit_tm"));
        this.setType(JSONObject.fromObject(presentJSON.getString("reward")).getInt("type"));
        this.setNum(JSONObject.fromObject(presentJSON.getString("reward")).getInt("num"));
        this.setReward_typeid(JSONObject.fromObject(presentJSON.getString("reward")).getString("reward_typeid"));
        this.setComment(presentJSON.getString("comment"));
    }

    public String getPresentid()
    {
        return presentid;
    }

    public void setPresentid(String presentid)
    {
        this.presentid = presentid;
    }

    public String getAdd_elapsed_sec()
    {
        return add_elapsed_sec;
    }

    public void setAdd_elapsed_sec(String add_elapsed_sec)
    {
        this.add_elapsed_sec = add_elapsed_sec;
    }
    
    public int getLimit_tm()
    {
        return limit_tm;
    }

    public void setLimit_tm(int limit_tm)
    {
        this.limit_tm = limit_tm;
    }

    public int getType()
    {
        return type;
    }

    public void setType(int type)
    {
        this.type = type;
    }

    public int getNum()
    {
        return num;
    }

    public void setNum(int num)
    {
        this.num = num;
    }

    public String getReward_typeid()
    {
        return reward_typeid;
    }

    public void setReward_typeid(String reward_typeid)
    {
        this.reward_typeid = reward_typeid;
    }

    public String getComment()
    {
        return comment;
    }

    public void setComment(String comment)
    {
        this.comment = comment;
    }
}
