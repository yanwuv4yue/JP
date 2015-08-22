package com.moemao.tgks.mar.marz.action;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;

import com.moemao.tgks.common.core.action.TGKSAction;
import com.moemao.tgks.mar.marz.thread.MarzThreadPoolDiffusion;

public class MarzAction extends TGKSAction
{
    /** 
     * @Fields serialVersionUID
     */ 
    private static final long serialVersionUID = 4468522957708102512L;
    
    private List<String> marzThreadList;
    
    private String ipAddress;
    
    public String marzThreadPoolManager()
    {
        // 查询当前线程池状态
        marzThreadList = MarzThreadPoolDiffusion.getInstance().showAllThread();
        
        // 本机IP
        try
        {
            ipAddress = InetAddress.getLocalHost().getHostAddress().toString();
            System.out.println("服务器本地IP：" + ipAddress);
        }
        catch (UnknownHostException e)
        {
            e.printStackTrace();
            return SUCCESS;
        }
        
        // TODO 查询前100条marzLog记录
        
        // TODO 图标等等
        
        return SUCCESS;
    }
    
    /**
     * 
     * @Title: marzThreadPoolStart
     * @Description: 创建MARZ工作线程池并启用
     * @return
     * @return String 返回类型
     * @throws
     */
    public String marzThreadPoolStart()
    {
        //Thread thread = new Thread(MarzThreadPool.getInstance());
        Thread thread = new Thread(MarzThreadPoolDiffusion.getInstance());
        thread.start();
        return SUCCESS;
    }
    
    /**
     * 
     * @Title: marzThreadPoolShutdown
     * @Description: 关闭MARZ工作线程池
     * @return
     * @return String 返回类型
     * @throws
     */
    public String marzThreadPoolShutdown()
    {
        //MarzThreadPool.getInstance().setbRunning(false);
        MarzThreadPoolDiffusion.getInstance().shutdown();
        return SUCCESS;
    }

    public List<String> getMarzThreadList()
    {
        return marzThreadList;
    }

    public void setMarzThreadList(List<String> marzThreadList)
    {
        this.marzThreadList = marzThreadList;
    }

    public String getIpAddress()
    {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress)
    {
        this.ipAddress = ipAddress;
    }
}
