package com.cam.controller;

import com.cam.contant.Contant;
import com.cam.model.Materials;
import com.cam.service.MaterialsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by rain on 2017/3/28.
 */
@Controller
@RequestMapping("/file")
public class MaterialsController {

    @Resource
    private MaterialsService materialsService;

    @RequestMapping("/download")
    public String download(@RequestParam String fileName, HttpServletRequest request,HttpServletResponse response) throws IOException{
        try {
            response.setCharacterEncoding("utf-8");
            response.setContentType("multipart/form-data");
            response.setHeader("Content-Disposition", "attachment;fileName=" + new String(fileName.getBytes("gbk"), "iso-8859-1"));
            InputStream inputStream = null;
            OutputStream os = null;
            try {
                String path = request.getSession().getServletContext().getRealPath("file") + File.separator;
                File file = new File(path + fileName);
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
            //  返回值要注意，要不然就出现下面这句错误！
            //java+getOutputStream() has already been called for this response
            return "";
        }catch (Exception e){
            return "/error";
        }
    }

    @RequestMapping("/upload")
    public String upload(@RequestParam MultipartFile[] myfiles, HttpServletRequest request) throws IOException {
        try {
            for(MultipartFile file : myfiles){
                //此处MultipartFile[]表明是多文件,如果是单文件MultipartFile就行了
                if(file.isEmpty()){
                    System.out.println("文件未上传!");
                }
                else{
                    //得到上传的文件名
                    String fileName = file.getOriginalFilename();
                    //得到服务器项目发布运行所在地址
                    String path1 = request.getSession().getServletContext().getRealPath("file")+ File.separator;
                    //  此处未使用UUID来生成唯一标识,用日期做为标识
                    String realfilename=new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+ fileName;
                    String path = path1+ realfilename;
                    //查看文件上传路径,方便查找
                    System.out.println(path);
                    //把文件上传至path的路径
                    File localFile = new File(path);
                    file.transferTo(localFile);
                    materialsService.addMaterials(new Materials(realfilename));
                }
            }
            return "/root/materialsmanage/materialUpload";
        }catch (Exception e){
            return "/error";
        }
    }

    @RequestMapping("/materials")
    public String rootmaterials(HttpServletRequest request){
        return "/root/materialsmanage/materialUpload";
    }

    @RequestMapping("/delete")
    public String deletematerials(HttpServletRequest request,Model model,@RequestParam String materialsname){
        try {
            materialsService.removeMaterials(materialsname);
            return showMaterials(request,model,1,"");
        }catch (Exception e){
            return "/error";
        }
    }

    @RequestMapping("/showmaterials")
    public String showMaterials(HttpServletRequest request, Model model,@RequestParam(required = false,defaultValue = "1") Integer curpage,@RequestParam(required = false) String materialsname){
        try {
            List<Materials> materialsList=new ArrayList<Materials>();
            int counts=0;
            if(materialsname!=null){
                materialsList=materialsService.getMaterialsByName(materialsname);
                counts=materialsList.size();
            }else {
                materialsList=materialsService.getMaterialsByPage(curpage);
                counts=materialsService.getCounts();
            }
            model.addAttribute("materials",materialsList);
            int pagenum=counts% Contant.pagesize==0?counts/ Contant.pagesize:counts/ Contant.pagesize+1;
            model.addAttribute("pagenum",pagenum);
            model.addAttribute("counts",counts);
            model.addAttribute("curpage",curpage);
            model.addAttribute("pagesize", Contant.pagesize);
            if(request.getSession().getAttribute("roleid").equals("2"))return "/user/materials/materials";
            return "/root/materialsmanage/materialsList";
        }catch (Exception e){
            return "/error";
        }
    }

}
