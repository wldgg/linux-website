package com.cam.controller;

import com.cam.model.User;
import com.cam.model.UserRegister;
import com.cam.service.UserService;
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
        if(file.isEmpty()){
            System.out.println("文件未上传!");
        }
        else{
//                //得到上传的文件名
//                String fileName = file.getOriginalFilename();
//                //得到服务器项目发布运行所在地址
//                String path1 = request.getSession().getServletContext().getRealPath("file")+ File.separator;
//                //  此处未使用UUID来生成唯一标识,用日期做为标识
//                String realfilename=new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+ fileName;
//                String path = path1+ realfilename;
//                //查看文件上传路径,方便查找
//                System.out.println(path);
//                //把文件上传至path的路径
//                File localFile = new File(path);
//                file.transferTo(localFile);

            List<User> erruser=new ArrayList<User>();
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
                if(sheet==null){
                    continue;
                }
                for (int rowindex=0;rowindex<=sheet.getLastRowNum();rowindex++){
                    Row row=sheet.getRow(rowindex);
//                        for (int colindex=0;colindex<row.getPhysicalNumberOfCells();colindex++){
//                            System.out.println(row.getCell(colindex));
//                        }
                    String username=row.getCell(0).toString().trim();
//                        if(rowindex==1)username="xiaoming";
                    String userPwd=row.getCell(1).toString().trim();
                    String userEmail=row.getCell(2).toString().trim();
                    User user=new User();
                    user.setUsername(username);
                    user.setUserPwd(userPwd);
                    user.setUserEmail(userEmail);
                    try {
                        userService.addUser(user);
                    }catch (Exception e){
                        erruser.add(user);
                    }

                }
                Iterator it=erruser.iterator();
                while (it.hasNext()){
                    log.info(it.next().toString());
                    System.out.println(it.next().toString());
                }
            }

        }
        return "/root/usermanage/importUser";
    }

    @RequestMapping("/user")
    public String rootuser(HttpServletRequest request){
        return "/root/usermanage/importUser";
    }

    @RequestMapping("/login")
    public String userLogin(HttpServletRequest request,String username,String password){
        boolean isRight=userService.checkUserAndPwd(username, password);
        if(isRight){
            request.getSession().setAttribute("username",username);
            if(username.equals("root")){
                return "/root/rootindex";
            }
            return "/toindex";
        }else {
            return "/loginfalse";
        }
    }

    @RequestMapping("/quit")
    public String userQuit(HttpServletRequest request){
        request.getSession().removeAttribute("username");
        return "/toindex";
    }

    @RequestMapping("register")
    public String userRegister(HttpServletRequest request, UserRegister userRegister){
        User user=new User();
        user.setUsername(userRegister.getUsername());
        user.setUserPwd(userRegister.getUserPwd());
        user.setUserEmail(userRegister.getUserEmail());
        if(userService.addUser(user)){
            request.getSession().setAttribute("username",userRegister.getUsername());
            return "/toindex";
        }else {
            return "/registerfalse";
        }
    }

    @RequestMapping("getregister")
    public String usergetRegister(HttpServletRequest request){
        return "/register";
    }

    @RequestMapping("/showUser")
    public String showUser(HttpServletRequest request, Model model){
        log.info("查询所有用户信息");
        List<User> userList = userService.getAllUser();
        model.addAttribute("userList",userList);
        return "/showUser";
    }

    @RequestMapping("/index")
    public String index(HttpServletRequest request){
        return "/toindex";
    }
}
