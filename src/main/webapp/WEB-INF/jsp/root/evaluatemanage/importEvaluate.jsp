<%--
  Created by IntelliJ IDEA.
  User: rain
  Date: 2017/4/7
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>试题批量导入</title>
    <%@include file="../../include.jsp"%>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!-- Custom Theme files -->
    <!-- Custom Theme files -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Study Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--Google Fonts-->
    <!-- start-smoth-scrolling -->
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
            });
        });
    </script>
    <!-- //end-smoth-scrolling -->
</head>
<body>
<%
    if(request.getSession().getAttribute("username")==null){
        response.sendRedirect(request.getContextPath()+"/index.jsp");
    }
%>
<!--header start here-->
<div class="header1">
    <div class="container">
        <div class="header-main">
            <div class="top-menu">
                <ul>
                    <li ><a href="<%=basesite%>user/showuser?curpage=1">用户管理</a> </li>
                    <li ><a href="<%=basesite%>evaluate/showevaluate?curpage=1">在线测评管理</a> </li>
                    <li><a href="<%=basesite%>file/showmaterials?curpage=1">教学资源管理</a></li>
                    <li><img src="<%=basepath%>/ui/images/lo1.png" alt=""></li>
                    <li><a href="<%=basesite%>experiment/showexperiment?curpage=1">实验管理</a></li>
                    <li><a href="#">hello <%=request.getSession().getAttribute("username")%></a></li>
                    <li><a href="<%=basesite%>user/quit">退出</a></li>
                </ul>
            </div>
            <!--script-->
        </div>
    </div>
</div>
<!--header end here-->
<!--typo start here-->
<div class="typrography">
    <div class="container">
        <div class="page">
            <h3 class="typo1">批量导入试题</h3>
            <!--button-->
            <div class="grid_3 grid_4">
                <div class="page-header">
                    <h4>上传excel文件导入选择题，填空题，判断题，简答题
                        <a class="btn btn-sm btn-info" href="<%=basesite%>file/download?materialsname=questions.xlsx">下载模板</a>
                    </h4>
                </div>
                <div class="bs-example">
                    <form action="<%=basesite%>evaluate/importexcel" method="post" enctype="multipart/form-data">
                        试题信息Excel文件: <input type="file" name="file"/><br/>
                        <input type="submit" class="btn btn-sm btn-info" value="上传">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!--typo end here-->
<%@include file="../../footer.jsp"%>
</body>
</html>