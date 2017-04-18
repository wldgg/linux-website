package com.cam.utils;

import org.apache.poi.hssf.usermodel.*;

import java.io.FileOutputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Created by wangl on 2017/4/16.
 */
public class ExportExcelUtils {

    public static void exportExcel(String[] keys, Map<String,Object> params,String filepath){
        try{
            // 第一步，创建一个webbook，对应一个Excel文件
            HSSFWorkbook wb = new HSSFWorkbook();
            // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
            HSSFSheet sheet = wb.createSheet("答卷信息");
            // 第三步，在sheet中添加表行,注意老版本poi对Excel的行数列数有限制short
            HSSFRow row=null;
            // 第四步，创建单元格，并设置值表头 设置表头居中
            HSSFCellStyle style = wb.createCellStyle();
            style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式
            HSSFCell cell =null;
            int maxrow=0;
            // 第五步，写入实体数据 实际应用中这些数据从数据库得到，
            for (int i=0;i<keys.length;i++){
                List<String> list= (List<String>) params.get(keys[i]);
                Iterator it=list.iterator();
                int j=0;
                while (it.hasNext()){
                    if(j==maxrow){
                        row = sheet.createRow(j);
                        maxrow=j+1;
                    }else {
                        row=sheet.getRow(j);
                    }
                    cell=row.createCell(i);
                    if(j==0){
                        cell.setCellValue(keys[i]);
                    }else {
                        String s= (String) it.next();
                        cell.setCellValue(s);
                    }
                    cell.setCellStyle(style);
                    j++;
                }
            }
            // 第六步，将文件存到指定位置
            FileOutputStream fout = new FileOutputStream(filepath);
            wb.write(fout);
            fout.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
