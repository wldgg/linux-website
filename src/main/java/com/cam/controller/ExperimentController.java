package com.cam.controller;

import com.cam.contant.Contant;
import com.cam.model.Experiment;
import com.cam.service.ExperimentService;
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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by rain on 2017/4/4.
 */
@Controller
@RequestMapping("/experiment")
public class ExperimentController {

    @Resource
    private ExperimentService experimentService;

    @RequestMapping("/experiment")
    public String rootExperiment(HttpServletRequest request){
        return "/root/experimentmanage/createExperiment";
    }

    @RequestMapping("/create")
    public String createExperiment(HttpServletRequest request, Model model,@RequestParam String experimentname,@RequestParam String experimentbody,
                                   @RequestParam String starttime,@RequestParam String finishtime,@RequestParam MultipartFile experimentfile) throws IOException, ParseException {
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
            String path1 = request.getSession().getServletContext().getRealPath("file")+ File.separator;
//            //  此处未使用UUID来生成唯一标识,用日期做为标识
//            String realfilename=new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+ fileName;
            String path = path1+ fileName;
            //查看文件上传路径,方便查找
            System.out.println(path);
            //把文件上传至path的路径
            File localFile = new File(path);
            experimentfile.transferTo(localFile);
        }
        experimentService.addExperiment(experiment);

        return showExperiment(request,model,1,"");
    }

    @RequestMapping("/update")
    public String updateExperiment(HttpServletRequest request, @RequestParam String experimentid,@RequestParam String experimentfilename,@RequestParam String experimentname,
                                   @RequestParam String experimentbody,@RequestParam String starttime,@RequestParam String finishtime,
                                   @RequestParam MultipartFile experimentfile,Model model) throws IOException, ParseException {
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
            String path1 = request.getSession().getServletContext().getRealPath("file")+ File.separator;
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
    }

    @RequestMapping("/delete")
    public String deleteExperiment(HttpServletRequest request,Model model,@RequestParam String experimentname){
        experimentService.removeExperiment(experimentname);
        return showExperiment(request,model,1,"");
    }

    @RequestMapping("/edit")
    public String editExperiment(HttpServletRequest request,Model model,@RequestParam String experimentname){
        Experiment experiment=experimentService.getOneExperimentByName(experimentname);
        DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        String experimentstarttime=dateFormat.format(experiment.getStarttime());
        String experimentfinishtime=dateFormat.format(experiment.getFinishtime());
        model.addAttribute("experiment",experiment);
        model.addAttribute("experimentstarttime",experimentstarttime);
        model.addAttribute("experimentfinishtime",experimentfinishtime);
        return "/root/experimentmanage/editExperiment";
    }

    @RequestMapping("/gotoexper")
    public String gotoExperiment(HttpServletRequest request,Model model,@RequestParam String experimentname){
        Experiment experiment=experimentService.getOneExperimentByName(experimentname);
        DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        model.addAttribute("experiment",experiment);
        model.addAttribute("experimentstarttime",dateFormat.format(experiment.getStarttime()));
        model.addAttribute("experimentfinishtime",dateFormat.format(experiment.getFinishtime()));
        return "/user/experiment/realExper";
    }


    @RequestMapping("/showexperiment")
    public String showExperiment(HttpServletRequest request, Model model, @RequestParam(required = false,defaultValue = "1") Integer curpage, @RequestParam(required = false) String experimentname){
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
        if(request.getSession().getAttribute("username").equals("root"))return "/root/experimentmanage/experimentsList";
        return "/user/experiment/experiment";
    }

}
