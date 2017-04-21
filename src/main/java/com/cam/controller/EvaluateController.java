package com.cam.controller;

import com.cam.contant.Contant;
import com.cam.model.*;
import com.cam.service.*;
import com.cam.utils.ExportExcelUtils;
import com.cam.utils.ImportEvaluateUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by rain on 2017/4/4.
 */
@Controller
@RequestMapping("/evaluate")
public class EvaluateController {

    @Resource
    private EvaluateService evaluateService;

    @Resource
    private ScoreService scoreService;

    @Resource
    private ChooseService chooseService;

    @Resource
    private VacantService vacantService;

    @Resource
    private JudgeService judgeService;

    @Resource
    private ShortAnswerService shortAnswerService;

    @RequestMapping("/correct")
    public String correctEvaluate(HttpServletRequest request,Model model,@RequestParam String evaluatename,EvaluateAnswerList answerList){
        try {
            List<String> chooseList=answerList.getChooseList();
            List<String> chooseAns=answerList.getChooseAns();
            List<String> judgeList=answerList.getJudgeList();
            List<String> judgeAns=answerList.getJudgeAns();
            List<String> vacantList=answerList.getVacantList();
            List<String> vacantAns=answerList.getVacantAns();
            List<String> shortAnswerList=answerList.getShortAnswerList();
            List<String> shortAnswerAns=answerList.getShortAnswerAns();
            if(chooseList.size()!=chooseAns.size()
                    ||judgeList.size()!=judgeAns.size()
                    ||vacantList.size()!=vacantAns.size()
                    ||shortAnswerList.size()!=shortAnswerAns.size()){
                return "/error";
            }
            int score=matchAnswer(chooseList,chooseAns)+matchAnswer(judgeList,judgeAns)+matchAnswer(vacantList,vacantAns)*2;
            Score scorem=new Score();
            scorem.setEvaluatename(evaluatename);
            String username= (String) request.getSession().getAttribute("username");
            scorem.setUsername(username);
            scorem.setScore(score);

            List<Score> list=scoreService.getScoreByUserAndEvaluateName(username,evaluatename);
            if (list.size()>0){
                scoreService.updateScoreByUserAndEvaluateName(username,evaluatename,score);
            }else {
                scoreService.addScore(scorem);
            }
            String path = request.getSession().getServletContext().getRealPath("file")+File.separator+"evaluate"
                    + File.separator+evaluatename+"-"+username+".xls";
            File file=new File(path);
            if (file.exists()){
                file.delete();
            }
            String keys[]={"选择题所选答案","选择题正确答案","判断题所选答案","判断题正确答案","填空题所选答案","填空题正确答案","简答题所选答案","简答题正确答案"};
            Map<String,Object> params=new HashMap<String, Object>();
            params.put(keys[0],chooseList);
            params.put(keys[1],chooseAns);
            params.put(keys[2],judgeList);
            params.put(keys[3],judgeAns);
            params.put(keys[4],vacantList);
            params.put(keys[5],vacantAns);
            params.put(keys[6],shortAnswerList);
            params.put(keys[7],shortAnswerAns);
            ExportExcelUtils.exportExcel(keys,params,path);

            return showEvaluate(request,model,1,"");
        }catch (Exception e){
            return "/error";
        }
    }

    private int matchAnswer(List<String> list,List<String> ans){
        Iterator listit=list.iterator();
        Iterator ansit=ans.iterator();
        int score=0;
        while (listit.hasNext()){
            String correctans= (String) listit.next();
            String rightans= (String) ansit.next();
            if(null!=correctans && null!=rightans){
                if (correctans.equals(rightans)){
                    score++;
                }
            }
        }
        return score;
    }

    @RequestMapping("/evaluate")
    public String rootEvaluate(HttpServletRequest request){
        return "/root/evaluatemanage/createEvaluate";
    }

    @RequestMapping("/import")
    public String importEvaluate(HttpServletRequest request){
        return "/root/evaluatemanage/importEvaluate";
    }

    @RequestMapping("/importexcel")
    public String importExcelEvaluate(HttpServletRequest request,@RequestParam MultipartFile file,Model model) throws Exception{
        try {
            if(file.isEmpty()){
                System.out.println("文件未上传!");
            }
            else{
                Workbook workbook=null;
                String filename=file.getOriginalFilename();
                String fileType = filename.substring(filename.lastIndexOf(".")+1);
                if (fileType.equalsIgnoreCase("xlsx")) {
                    workbook=new XSSFWorkbook(file.getInputStream());
                }else if(fileType.equalsIgnoreCase("xls")){
                    workbook = new HSSFWorkbook(file.getInputStream());
                }
                for (int sheetindex=0;sheetindex<workbook.getNumberOfSheets();sheetindex++){
                    Sheet sheet=workbook.getSheetAt(sheetindex);
                    String sheetname=sheet.getSheetName();
                    if(sheet==null){
                        continue;
                    }
                    if (sheetname.equals("选择题")){
                        ImportEvaluateUtils.importChoose(sheet,chooseService);
                    }else if (sheetname.equals("填空题")){
                        ImportEvaluateUtils.importVacant(sheet,vacantService);
                    }else if (sheetname.equals("判断题")){
                        ImportEvaluateUtils.importJudge(sheet,judgeService);
                    }else if (sheetname.equals("简答题")){
                        ImportEvaluateUtils.importShortanswer(sheet,shortAnswerService);
                    }
                }
            }
            return showEvaluate(request,model,1,"");
        }catch (Exception e){
            return "/error";
        }

    }

    @RequestMapping("/create")
    public String createEvaluate(HttpServletRequest request,Model model, @RequestParam String evaluatename,@RequestParam Integer choosenum,
                                 @RequestParam Integer vacantnum,@RequestParam Integer judgenum,@RequestParam Integer shortanswernum) throws IOException, ParseException {
        try {
            int choosesize=chooseService.getCounts();
            if(choosesize<choosenum)choosenum=choosesize;
            int vacantsize=vacantService.getCounts();
            if(vacantsize<vacantnum)vacantnum=vacantsize;
            int judgesize=judgeService.getCounts();
            if(judgesize<judgenum)judgenum=judgesize;
            int shortanswersize=shortAnswerService.getCounts();
            if(shortanswersize<shortanswernum)shortanswernum=shortanswersize;

            String chooselist=ImportEvaluateUtils.getRandomList(choosenum,choosesize);
            String vacantlist=ImportEvaluateUtils.getRandomList(vacantnum,vacantsize);
            String judgelist=ImportEvaluateUtils.getRandomList(judgenum,judgesize);
            String shortanswerlist=ImportEvaluateUtils.getRandomList(shortanswernum,shortanswersize);

            Evaluate evaluate=new Evaluate();
            evaluate.setEvaluatename(evaluatename);
            evaluate.setChoosenum(choosenum);
            evaluate.setChooselist(chooselist);
            evaluate.setVacantnum(vacantnum);
            evaluate.setVacantlist(vacantlist);
            evaluate.setJudgenum(judgenum);
            evaluate.setJudgelist(judgelist);
            evaluate.setShortanswernum(shortanswernum);
            evaluate.setShortanswerlist(shortanswerlist);
            evaluateService.addEvaluate(evaluate);
            return showEvaluate(request,model,1,"");
        }catch (Exception e){
            return "/error";
        }
    }

    @RequestMapping("/delete")
    public String deleteEvaluate(HttpServletRequest request,Model model,@RequestParam String evaluatename){
        try {
            evaluateService.removeEvaluate(evaluatename);
            List<Score> list=scoreService.getScoreByEvaluateName(evaluatename);
            Iterator it=list.iterator();
            while (it.hasNext()){
                Score score= (Score) it.next();
                String path = request.getSession().getServletContext().getRealPath("file")+File.separator+"evaluate"
                        + File.separator+evaluatename+"-"+score.getUsername()+".xls";
                File file=new File(path);
                if (file.exists()){
                    file.delete();
                }
            }
            scoreService.deleteByEvaluatename(evaluatename);
            return showEvaluate(request,model,1,"");
        }catch (Exception e){
            return "/error";
        }
    }

    @RequestMapping("/open")
    public String openEvaluate(HttpServletRequest request,Model model,@RequestParam String evaluatename){
        try {
            Evaluate evaluate=evaluateService.getOneEvaluateByName(evaluatename);
            String[] chooseins=ImportEvaluateUtils.getInString(evaluate.getChooselist());
            String[] vacantins=ImportEvaluateUtils.getInString(evaluate.getVacantlist());
            String[] judgeins=ImportEvaluateUtils.getInString(evaluate.getJudgelist());
            String[] shortanswerins=ImportEvaluateUtils.getInString(evaluate.getShortanswerlist());
            List<Choose> choose=chooseService.getInString(chooseins);
            List<Vacant> vacant=vacantService.getInString(vacantins);
            List<Judge> judge=judgeService.getInString(judgeins);
            List<ShortAnswer> shortAnswer=shortAnswerService.getInString(shortanswerins);
            model.addAttribute("evaluate",evaluate);
            model.addAttribute("choose",choose);
            model.addAttribute("vacant",vacant);
            model.addAttribute("judge",judge);
            model.addAttribute("shortAnswer",shortAnswer);
            return "/user/evaluate/realEvaluate";
        }catch (Exception e){
            return "/error";
        }
    }

    @RequestMapping("/showevaluate")
    public String showEvaluate(HttpServletRequest request, Model model, @RequestParam(required = false,defaultValue = "1") Integer curpage,
                               @RequestParam(required = false) String evaluatename){
        try {
            List<Evaluate> evaluateList=new ArrayList<Evaluate>();
            int counts=0;
            if(evaluatename!=null){
                evaluateList=evaluateService.getEvaluateByName(evaluatename);
                counts=evaluateList.size();
            }else {
                evaluateList=evaluateService.getEvaluateByPage(curpage);
                counts=evaluateService.getCounts();
            }
            model.addAttribute("evaluate",evaluateList);
            int pagenum=counts% Contant.pagesize==0?counts/ Contant.pagesize:counts/ Contant.pagesize+1;
            model.addAttribute("pagenum",pagenum);
            model.addAttribute("counts",counts);
            model.addAttribute("curpage",curpage);
            model.addAttribute("pagesize", Contant.pagesize);
            if(request.getSession().getAttribute("roleid").equals("2"))return "/user/evaluate/evaluate";
            return "/root/evaluatemanage/evaluatesList";
        }catch (Exception e){
            return "/error";
        }
    }

    @RequestMapping("/showscore")
    public String showScore(HttpServletRequest request, Model model, @RequestParam(required = false) String username,
                               @RequestParam(required = false) String evaluatename){
        try {
            List<Score> scoreList=new ArrayList<Score>();
            if(username!=null&&evaluatename!=null){
                scoreList=scoreService.getScoreByUserAndEvaluateName(username,evaluatename);
            }else if (evaluatename!=null){
                scoreList=scoreService.getScoreByEvaluateName(evaluatename);
            }else if (username!=null){
                scoreList=scoreService.getScoreByUserName(username);
            }
            model.addAttribute("score",scoreList);
            return "/root/evaluatemanage/scoreList";
        }catch (Exception e){
            return "/error";
        }
    }

    @RequestMapping("/downloadanswer")
    public String downloadAnswer(@RequestParam String evaluatename,@RequestParam String username,
                                 HttpServletRequest request, HttpServletResponse response, Model model) throws IOException{
        try {
            response.setCharacterEncoding("utf-8");
            response.setContentType("multipart/form-data");
            response.setHeader("Content-Disposition", "attachment;fileName=" + new String((evaluatename+"-"+username+".xls").getBytes("gbk"), "iso-8859-1"));
            InputStream inputStream = null;
            OutputStream os = null;
            try {
                String path = request.getSession().getServletContext().getRealPath("file")+File.separator+"evaluate"
                        + File.separator+evaluatename+"-"+username+".xls";
                File file = new File(path);
                if (!file.exists()) {
                    return "error";
                }
                inputStream = new FileInputStream(file);
                os = response.getOutputStream();
                byte[] b = new byte[2048];
                int length;
                while ((length = inputStream.read(b)) > 0) {
                    os.write(b, 0, length);
                }
                os.flush();
                // 这里主要关闭。
                os.close();
                inputStream.close();
            } catch (Exception e) {
                return "/error";
            } finally {
                if (os != null) {
                    os.close();
                }
                if (inputStream != null) {
                    inputStream.close();
                }
            }
            return null;
        }catch (Exception e){
            return "/error";
        }
    }

}
