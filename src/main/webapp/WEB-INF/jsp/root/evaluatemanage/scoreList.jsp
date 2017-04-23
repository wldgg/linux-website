<%--
  Created by IntelliJ IDEA.
  User: wangl
  Date: 2017/4/19
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>查看成绩</title>
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
            <h3 class="typo1">成绩查看</h3>
            <!--button-->
            <div class="grid_3 grid_4">
                <div class="bs-example">
                    <table class="table">
                        <thead>
                        <th>试卷名</th>
                        <th>用户名</th>
                        <th>试题完成时间</th>
                        <th>分数</th>
                        </thead>
                        <tbody>
                        <c:forEach items="${score}" var="score">
                            <tr>
                                <td><h3 class="h3-bootstrap-heading">${score.evaluatename}<a class="anchorjs-link" href="#h3.-bootstrap-heading"><span class="anchorjs-icon"></span></a></h3></td>
                                <td><h3 class="h3-bootstrap-heading">${score.username}<a class="anchorjs-link" href="#h3.-bootstrap-heading"><span class="anchorjs-icon"></span></a></h3></td>
                                <td class="type-info">${score.addtime}</td>
                                <td><a class="hvr-bounce-to-right">${score.score}</a></td>
                                <td><a class="hvr-bounce-to-right" href="<%=basesite%>evaluate/downloadanswer?evaluatename=${score.evaluatename}&username=${score.username}">下载该用户答案</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!--typo end here-->
    <%@include file="../../footer.jsp"%>
</body>
</html>
