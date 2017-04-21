package com.cam.controller;

import com.cam.contant.Contant;
import com.cam.model.ExperReport;
import com.cam.model.Experiment;
import com.cam.model.Score;
import com.cam.service.ExperReportService;
import com.cam.service.ExperimentService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * Created by rain on 2017/4/4.
 */
@Controller
@RequestMapping("/experiment")
public class ExperimentController {

    @Resource
    private ExperimentService experimentService;

    @Resource
    private ExperReportService experReportService;

    @RequestMapping("/experiment")
    public String rootExperiment(HttpServletRequest request){
        return "/root/experimentmanage/createExperiment";
    }

    @RequestMapping("/upload")
    public String uploadReport(HttpServletRequest request, Model model,@RequestParam String experimentname,
                               @RequestParam MultipartFile experimentfile) throws IOException, ParseException {
        try {
            if(experimentfile.isEmpty()){
                System.out.println("文件未上传!");
            }
            else{
                String username= (String) request.getSession().getAttribute("username");
                //得到上传的文件名
                String fileName = experimentname+"-"+username+"-"+experimentfile.getOriginalFilename();
//                String fileName = experimentfile.getOriginalFilename();
                //得到服务器项目发布运行所在地址
                String path1 = request.getSession().getServletContext().getRealPath("file")+ File.separator+"experiment"+ File.separator;
                //  此处未使用UUID来生成唯一标识,用日期做为标识
                String path = path1+ fileName;
                if(experReportService.getReportByUserAndExperimentName(username,experimentname).size()>0){
                    experReportService.updateReportByUserAndExperimentName(username,experimentname,fileName);
                }else {
                    ExperReport experReport=new ExperReport();
                    experReport.setUsername(username);
                    experReport.setExperimentname(experimentname);
                    experReport.setFilename(fileName);
                    experReportService.addExperReport(experReport);
                }
                //把文件上传至path的路径
                File localFile = new File(path);
                if(localFile.exists()){
                    localFile.delete();
                }
                experimentfile.transferTo(localFile);
            }
            Experiment experiment=experimentService.getOneExperimentByName(experimentname);
            DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
            model.addAttribute("experiment",experiment);
            model.addAttribute("experimentstarttime",dateFormat.format(experiment.getStarttime()));
            model.addAttribute("experimentfinishtime",dateFormat.format(experiment.getFinishtime()));
            return "/user/experiment/realExper";        }catch (Exception e){
            return "/error";
        }
    }

    @RequestMapping("/create")
    public String createExperiment(HttpServletRequest request, Model model,@RequestParam String experimentname,@RequestParam String experimentbody,
                                   @RequestParam String starttime,@RequestParam String finishtime,@RequestParam MultipartFile experimentfile) throws IOException, ParseException {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Experiment experiment=new Experiment();
            experiment.setExperimentname(experimentname);
            experiment.setExperimentbody(experimentbody);
            Date date=sdf.parse(starttime);
            experiment.setStarttime(sdf.parse(starttime));
            experiment.setFinishtime(sdf.parse(finishtime));
            experiment.setExperimentfile(experimentfile.getOriginalFilename());
            if(experimentfile.isEmpty()){
                System.out.println("文件未上传!");
            }
            else{
                //得到上传的文件名
                String fileName = experimentfile.getOriginalFilename();
                //得到服务器项目发布运行所在地址
                String path1 = request.getSession().getServletContext().getRealPath("file")+ File.separator+"experiment"+ File.separator;
                String path = path1+ fileName;
                //查看文件上传路径,方便查找
                System.out.println(path);
                //把文件上传至path的路径
                File localFile = new File(path);
                experimentfile.transferTo(localFile);
            }
            experimentService.addExperiment(experiment);
            return showExperiment(request,model,1,"");
        }catch (Exception e){
            return "/error";
        }
    }

    @RequestMapping("/update")
    public String updateExperiment(HttpServletRequest request, @RequestParam String experimentid,@RequestParam String experimentfilename,@RequestParam String experimentname,
                                   @RequestParam String experimentbody,@RequestParam String starttime,@RequestParam String finishtime,
                                   @RequestParam MultipartFile experimentfile,Model model) throws IOException, ParseException {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Experiment experiment=new Experiment();
            experiment.setExperimentid(Integer.parseInt(experimentid));
            experiment.setExperimentname(experimentname);
            experiment.setExperimentbody(experimentbody);
            Date date=sdf.parse(starttime);
            experiment.setStarttime(sdf.parse(starttime));
            experiment.setFinishtime(sdf.parse(finishtime));
            if(experimentfile.isEmpty()){
                System.out.println("文件未上传!");
                experiment.setExperimentfile(experimentfilename);
            }
            else{
                experiment.setExperimentfile(experimentfile.getOriginalFilename());
                //得到上传的文件名
                String fileName = experimentfile.getOriginalFilename();
                //得到服务器项目发布运行所在地址
                String path1 = request.getSession().getServletContext().getRealPath("file")+ File.separator+"experiment"+ File.separator ;
//            //  此处未使用UUID来生成唯一标识,用日期做为标识
//            String realfilename=new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+ fileName;
                String path = path1+ fileName;
                //查看文件上传路径,方便查找
                System.out.println(path);
                //把文件上传至path的路径
                File localFile = new File(path);
                experimentfile.transferTo(localFile);
            }
            experimentService.updateExperiment(experiment);
            return showExperiment(request,model,1,"");
        }catch (Exception e){
            return "/error";
        }
    }

    @RequestMapping("/delete")
    public String deleteExperiment(HttpServletRequest request,Model model,@RequestParam String experimentname){
        try {
            experimentService.removeExperiment(experimentname);
            List<ExperReport> list=experReportService.getReportByExperimentName(experimentname);
            Iterator it=list.iterator();
            while (it.hasNext()){
                ExperReport experReport= (ExperReport) it.next();
                String path = request.getSession().getServletContext().getRealPath("file")+File.separator+"experiment"
                        + File.separator+experReport.getFilename();
                File file=new File(path);
                if (file.exists()){
                    file.delete();
                }
            }
            experReportService.deleteByExperimentName(experimentname);
            return showExperiment(request,model,1,"");
        }catch (Exception e){
            return "/error";
        }
    }

    @RequestMapping("/edit")
    public String editExperiment(HttpServletRequest request,Model model,@RequestParam String experimentname){
        try {
            Experiment experiment=experimentService.getOneExperimentByName(experimentname);
            DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
            String experimentstarttime=dateFormat.format(experiment.getStarttime());
            String experimentfinishtime=dateFormat.format(experiment.getFinishtime());
            model.addAttribute("experiment",experiment);
            model.addAttribute("experimentstarttime",experimentstarttime);
            model.addAttribute("experimentfinishtime",experimentfinishtime);
            return "/root/experimentmanage/editExperiment";
        }catch (Exception e){
            return "/error";
        }
    }

    @RequestMapping("/gotoexper")
    public String gotoExperiment(HttpServletRequest request,Model model,@RequestParam String experimentname){
        try {
            Experiment experiment=experimentService.getOneExperimentByName(experimentname);
            DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
            model.addAttribute("experiment",experiment);
            model.addAttribute("experimentstarttime",dateFormat.format(experiment.getStarttime()));
            model.addAttribute("experimentfinishtime",dateFormat.format(experiment.getFinishtime()));
            return "/user/experiment/realExper";
        }catch (Exception e){
            return "/error";
        }
    }


    @RequestMapping("/showexperiment")
    public String showExperiment(HttpServletRequest request, Model model, @RequestParam(required = false,defaultValue = "1") Integer curpage, @RequestParam(required = false) String experimentname){
        try {
            List<Experiment> experimentList=new ArrayList<Experiment>();
            int counts=0;
            if(experimentname!=null){
                experimentList=experimentService.getExperimentByName(experimentname);
                counts=experimentList.size();
            }else {
                experimentList=experimentService.getExperimentByPage(curpage);
                counts=experimentService.getCounts();
            }
            model.addAttribute("experiment",experimentList);
            int pagenum=counts% Contant.pagesize==0?counts/ Contant.pagesize:counts/ Contant.pagesize+1;
            model.addAttribute("pagenum",pagenum);
            model.addAttribute("counts",counts);
            model.addAttribute("curpage",curpage);
            model.addAttribute("pagesize", Contant.pagesize);
            if(request.getSession().getAttribute("roleid").equals("2"))return "/user/experiment/experiment";
            return "/root/experimentmanage/experimentsList";
        }catch (Exception e){
            return "/error";
        }
    }

    @RequestMapping("/showreport")
    public String showReport(HttpServletRequest request, Model model, @RequestParam(required = false) String username,
                             @RequestParam(required = false) String experimentname){
        try {
            List<ExperReport> reportList=new ArrayList<ExperReport>();
            if(username!=null&&experimentname!=null){
                reportList=experReportService.getReportByUserAndExperimentName(username,experimentname);
            }else if (experimentname!=null){
                reportList=experReportService.getReportByExperimentName(experimentname);
            }else if (username!=null){
                reportList=experReportService.getReportByUserName(username);
            }
            model.addAttribute("report",reportList);
            return "/root/experimentmanage/reportList";
        }catch (Exception e){
            return "/error";
        }
    }

    @RequestMapping("/download")
    public String download(@RequestParam String experimentfile, HttpServletRequest request, HttpServletResponse response) throws IOException{
        try {
            response.setCharacterEncoding("utf-8");
            response.setContentType("multipart/form-data");
            response.setHeader("Content-Disposition", "attachment;fileName=" + new String(experimentfile.getBytes("gbk"), "iso-8859-1"));
            InputStream inputStream = null;
            OutputStream os = null;
            try {
                String path = request.getSession().getServletContext().getRealPath("file") + File.separator+"experiment"+ File.separator;
                File file = new File(path + experimentfile);
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
            return "";
        }catch (Exception e){
            return "/error";
        }
    }

    @RequestMapping("/downloadreport")
    public String downloadReport(@RequestParam String experimentname,@RequestParam Integer cnt,@RequestParam String experimentfile,
                                 @RequestParam String username,HttpServletRequest request, HttpServletResponse response,Model model) throws IOException{
        try {
            response.setCharacterEncoding("utf-8");
            response.setContentType("multipart/form-data");
            response.setHeader("Content-Disposition", "attachment;fileName=" + new String(experimentfile.getBytes("gbk"), "iso-8859-1"));
            InputStream inputStream = null;
            OutputStream os = null;
            try {
                String path = request.getSession().getServletContext().getRealPath("file") + File.separator+"experiment"+ File.separator;
                File file = new File(path + experimentfile);
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
                experReportService.updateDownloadCntByUserAndExperimentName(username,experimentname,cnt+1);
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
