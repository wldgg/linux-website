package com.cam.controller;

import com.cam.contant.Contant;
import com.cam.model.User;
import com.cam.model.UserRegister;
import com.cam.service.UserService;
import com.cam.utils.ImportEvaluateUtils;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Cam on 2017/2/10.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    private Logger log = Logger.getLogger(UserController.class);
    @Resource
    private UserService userService;

    @RequestMapping("/import")
    public String userImport(HttpServletRequest request,@RequestParam MultipartFile file) throws Exception{
        try {
            if(file.isEmpty()){
                System.out.println("文件未上传!");
            }
            else{
                List<User> erruser=new ArrayList<User>();
                Workbook workbook=null;
                String filename=file.getOriginalFilename();
                String fileType = filename.substring(filename.lastIndexOf(".")+1);
                DecimalFormat decimalFormat=new DecimalFormat("0");
                if (fileType.equalsIgnoreCase("xlsx")) {
                    workbook=new XSSFWorkbook(file.getInputStream());
                }else if(fileType.equalsIgnoreCase("xls")){
                    workbook = new HSSFWorkbook(file.getInputStream());
                }
                for (int sheetindex=0;sheetindex<workbook.getNumberOfSheets();sheetindex++){
                    Sheet sheet=workbook.getSheetAt(sheetindex);
                    if(sheet==null){
                        continue;
                    }
                    for (int rowindex=0;rowindex<=sheet.getLastRowNum();rowindex++){
                        Row row=sheet.getRow(rowindex);
                        String username= decimalFormat.format(ImportEvaluateUtils.getCellValue(row.getCell(0)));
                        String userPwd= decimalFormat.format(ImportEvaluateUtils.getCellValue(row.getCell(1)));
                        String userEmail= (String) ImportEvaluateUtils.getCellValue(row.getCell(2));
                        User user=new User();
                        user.setUsername(username);
                        user.setUserPwd(userPwd);
                        user.setUserEmail(userEmail);
                        try {
                            userService.addUser(user);
                        }catch (Exception e){
//                            erruser.add(user);
                        }
                    }
//                    Iterator it=erruser.iterator();
//                    while (it.hasNext()){
//                        log.info(it.next().toString());
//                        System.out.println(it.next().toString());
//                    }
                }
            }
            return "/root/usermanage/importUser";
        }catch (Exception e){
            return "/error";
        }
    }

    @RequestMapping("/user")
    public String rootuser(HttpServletRequest request){
        return "/root/usermanage/importUser";
    }

    @RequestMapping("/login")
    public String userLogin(HttpServletRequest request,String username,String password,
                            Model model){
        try {
            User user=userService.checkUserAndPwd(username, password);
            if(user!=null){
                request.getSession().setAttribute("username",username);
                request.getSession().setAttribute("roleid",""+user.getUserRole());
                if(user.getUserRole()!=2){
                    return showUser(request,model,1,null);
                }
                return "/toindex";
            }else {
                return "/loginfalse";
            }
        }catch (Exception e){
            return "/error";
        }
    }

    @RequestMapping("/update")
    public String updateUser(HttpServletRequest request,Model model,@RequestParam(required = false) String username,
                             @RequestParam(required = false) Integer role){
        try {
            if(role!=null){
                if (role==1){
                    role=2;
                } else if (role==2){
                    role=1;
                }
            }
            userService.updateUserRole(username,role);
            return showUser(request,model,1,null);
        }catch (Exception e){
            return "/error";
        }
    }

    @RequestMapping("/quit")
    public String userQuit(HttpServletRequest request){
        try {
            request.getSession().removeAttribute("username");
            return "/toindex";
        }catch (Exception e){
            return "/error";
        }
    }

    @RequestMapping("register")
    public String userRegister(HttpServletRequest request, UserRegister userRegister){
        try {
            User user=new User();
            user.setUsername(userRegister.getUsername());
            user.setUserPwd(userRegister.getUserPwd());
            user.setUserEmail(userRegister.getUserEmail());
            user.setUserRole(2);
            if(userService.addUser(user)){
                request.getSession().setAttribute("username",userRegister.getUsername());
                request.getSession().setAttribute("roleid","2");
                return "/toindex";
            }else {
                return "/registerfalse";
            }
        }catch (Exception e){
            return "/error";
        }
    }

    @RequestMapping("getregister")
    public String usergetRegister(HttpServletRequest request){
        return "/register";
    }

    @RequestMapping("/showuser")
    public String showUser(HttpServletRequest request, Model model,
                           @RequestParam(required = false,defaultValue = "1") Integer curpage,@RequestParam(required = false) String username){
        try {
            List<User> userList=new ArrayList<User>();
            String roleid= (String) request.getSession().getAttribute("roleid");
            int counts=0;
            if(username!=null){
                if(roleid.equals("0")){
                    userList=userService.getUsersByName(username);
                }else {
                    userList=userService.getUsersNotAdminByName(username);
                }
                counts=userList.size();
            }else {
                if(roleid.equals("0")){
                    userList=userService.getUsersByPage(curpage);
                    counts=userService.getCounts();
                }else {
                    userList=userService.getUsersNotAdminByPage(curpage);
                    counts=userService.getNotAdminCounts();
                }
            }
            model.addAttribute("users",userList);
            int pagenum=counts% Contant.pagesize==0?counts/ Contant.pagesize:counts/ Contant.pagesize+1;
            model.addAttribute("pagenum",pagenum);
            model.addAttribute("counts",counts);
            model.addAttribute("curpage",curpage);
            model.addAttribute("pagesize", Contant.pagesize);
            if(roleid.equals("1")||roleid.equals("0"))return "/root/usermanage/userList";
            return "/toindex";
        }catch (Exception e){
            return "/error";
        }
    }

    @RequestMapping("/index")
    public String index(HttpServletRequest request){
        return "/toindex";
    }
}
