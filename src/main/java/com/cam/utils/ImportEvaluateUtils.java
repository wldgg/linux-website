package com.cam.utils;

import com.cam.model.Choose;
import com.cam.model.Judge;
import com.cam.model.ShortAnswer;
import com.cam.model.Vacant;
import com.cam.service.ChooseService;
import com.cam.service.JudgeService;
import com.cam.service.ShortAnswerService;
import com.cam.service.VacantService;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;

import java.util.Random;

/**
 * Created by rain on 2017/4/7.
 */
public class ImportEvaluateUtils {

    public static void importChoose(Sheet sheet,ChooseService chooseService){
        int length=chooseService.getCounts();
        for (int rowindex=0;rowindex<=sheet.getLastRowNum();rowindex++){
            length++;
            Row row=sheet.getRow(rowindex);
            String choosebody=row.getCell(1).toString().trim();
            String choosea=row.getCell(2).toString().trim();
            String chooseb=row.getCell(3).toString().trim();
            String choosec=row.getCell(4).toString().trim();
            String choosed=row.getCell(5).toString().trim();
            String chooseanswer=row.getCell(6).toString().trim();
            Choose choose=new Choose();
            choose.setChoosebody(choosebody);
            choose.setChooseanswer(chooseanswer);
            choose.setChoosea(choosea);
            choose.setChooseb(chooseb);
            choose.setChoosec(choosec);
            choose.setChoosed(choosed);
            choose.setChooseid(length);
            try {
                chooseService.addChoose(choose);
            }catch (Exception e){
                length--;
                System.out.println("重复了啦");
            }
        }
    }

    public static void importVacant(Sheet sheet,VacantService vacantService){
        int length=vacantService.getCounts();
        for (int rowindex=0;rowindex<=sheet.getLastRowNum();rowindex++){
            length++;
            Row row=sheet.getRow(rowindex);
            String vacantbody=row.getCell(1).toString().trim();
            String vacantanswer=row.getCell(2).toString().trim();
            Vacant vacant=new Vacant();
            vacant.setVacantbody(vacantbody);
            vacant.setVacantanswer(vacantanswer);
            vacant.setVacantid(length);
            try {
                vacantService.addVacant(vacant);
            }catch (Exception e){
                length--;
            }
        }
    }

    public static void importJudge(Sheet sheet,JudgeService judgeService){
        int length=judgeService.getCounts();
        for (int rowindex=0;rowindex<=sheet.getLastRowNum();rowindex++){
            length++;
            Row row=sheet.getRow(rowindex);
            String judgebody=row.getCell(1).toString().trim();
            String judgeanswer=row.getCell(2).toString().trim();
            Judge judge=new Judge();
            judge.setJudgebody(judgebody);
            judge.setJudgeanswer(judgeanswer);
            judge.setJudgeid(length);
            try {
                judgeService.addJudge(judge);
            }catch (Exception e){
                length--;
            }
        }
    }

    public static void importShortanswer(Sheet sheet,ShortAnswerService shortAnswerService){
        int length=shortAnswerService.getCounts();
        for (int rowindex=0;rowindex<=sheet.getLastRowNum();rowindex++){
            length++;
            Row row=sheet.getRow(rowindex);
            String shortAnswerbody=row.getCell(1).toString().trim();
            String shortAnsweranswer=row.getCell(2).toString().trim();
            ShortAnswer shortAnswer=new ShortAnswer();
            shortAnswer.setShortanswerbody(shortAnswerbody);
            shortAnswer.setShortansweranswer(shortAnsweranswer);
            shortAnswer.setShortanswerid(length);
            try {
                shortAnswerService.addShortAnswer(shortAnswer);
            }catch (Exception e){
                length--;
            }
        }
    }

    public static String getRandomList(int num,int size){
        if(num==0)return "";
        Random random=new Random();
        int temp1,temp2,temp;
        int[] values=new int[size];
        for (int i=0;i<size;i++){
            values[i]=i+1;
        }
        for (int i=0;i<size;i++){
            temp1=Math.abs(random.nextInt())%size;
            temp2=Math.abs(random.nextInt())%size;
            if(temp1!=temp2){
                temp=values[temp1];
                values[temp1]=values[temp2];
                values[temp2]=temp;
            }
        }
        StringBuilder sb=new StringBuilder();
        for (int i=0;i<num;i++){
            if(i!=0){
                sb.append(";"+String.valueOf(values[i]));
            }else {
                sb.append(String.valueOf(values[i]));
            }
        }
        return sb.toString();
    }

    public static String[] getInString(String s){
        return s.split(";");
    }

    public static Object getCellValue(Cell cell){
        if(cell == null){
            return null;
        }else if(cell.getCellType() == Cell.CELL_TYPE_BLANK){
            return "";
        }else if(cell.getCellType() == Cell.CELL_TYPE_STRING){
            return cell.getStringCellValue().trim();
        }else if(cell.getCellType() == Cell.CELL_TYPE_NUMERIC){
            return cell.getNumericCellValue();
        }else if(cell.getCellType() == Cell.CELL_TYPE_BOOLEAN){
            return cell.getBooleanCellValue();
        }else if(cell.getCellType() == Cell.CELL_TYPE_FORMULA){
            return cell.getNumericCellValue()+" 公式为："+cell.getCellFormula();
        }else {
            return cell.toString();
        }
    }

}
