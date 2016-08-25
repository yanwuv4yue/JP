package com.moemao.tgks.mar.krsmacard.tool;

import java.io.File;

public class CardPicId
{
public static final String pre = "\\chr20_";
    
    public static void main(String[] args)
    {
        File file = new File("D:\\10147");
        new CardPicId().ChangeFileName(file);
        System.out.println("all complete");
    }
    
    public void ChangeFileName(File file)
    {
        String dirPath = file.getAbsolutePath();// 目录路径
        if (file.isDirectory())
        {
            File[] files = file.listFiles();
            for (File f : files)
            {
                String originalName = f.getName();
                String toFileName = dirPath + pre + originalName;
                System.out.println(toFileName);
                if (toFileName.indexOf("jpg") != -1)
                {
                    toFileName = toFileName.substring(0, toFileName.length() - 3) + "png";
                }
                System.out.println(toFileName);
                File finalName = new File(toFileName);
                f.renameTo(finalName);
            }
        }
    }
}
