package com.moemao.tgks.mar.marz.entity;

import net.sf.json.JSONObject;

public class ChiariEvt
{
    private String cardid;
    private int num;
    
    public ChiariEvt()
    {
        
    }
    
    public ChiariEvt(JSONObject cardJSON)
    {
        this.setCardid(cardJSON.getString("0"));
        this.setNum(cardJSON.getInt("1"));
    }
    
    public String getCardid()
    {
        return cardid;
    }
    public void setCardid(String cardid)
    {
        this.cardid = cardid;
    }
    public int getNum()
    {
        return num;
    }
    public void setNum(int num)
    {
        this.num = num;
    }
}
