<%--
  Created by IntelliJ IDEA.
  User: rain
  Date: 2017/4/7
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>创建新试卷</title>
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
<!--contact start here-->

<script>
    $(document).ready(function () {
        $("input#submitInfo").click(function () {
            var evaluatename=$("input#evaluatename").val();
            var flag=true;
            if(evaluatename==""){
                $("input#evaluatename").attr('placeholder','evaluatename不可为空');
                flag=false;
            }
            if(!flag){
                return false;
            }
        })
    })
</script>


<div class="contact">
    <div class="container">
        <div class="contact-top">
            <h2>新试卷</h2>
            <p>请填写试卷的名称,内容(每种题型需要的题数,系统将从后台随机取题组成)</p>
        </div>
        <div class="contact-form">
            <form action="<%=basesite%>evaluate/create" method="post">
                <span style="color: red">*</span>本套试题名称：
                <br>
                <input type="text" id="evaluatename" name="evaluatename" placeholder="evaluatename">
                <br>
                选择题数目/每题分值：
                <br>
                <input type="number" id="choosenum" name="choosenum" placeholder="Message" value="0">
                <input type="number" id="choosevalue" name="choosevalue" placeholder="Message" value="0">
                <br>
                填空题数目/每题分值：
                <br>
                <input type="number" id="vacantnum" name="vacantnum" placeholder="Message" value="0">
                <input type="number" id="vacantvalue" name="vacantvalue" placeholder="Message" value="0">
                <br>
                判断题数目/每题分值：
                <br>
                <input type="number" id="judgenum" name="judgenum" placeholder="Message" value="0">
                <input type="number" id="judgevalue" name="judgevalue" placeholder="Message" value="0">
                <br>
                简答题数目/每题分值：
                <br>
                <input type="number" id="shortanswernum" name="shortanswernum" placeholder="Message" value="0">
                <input type="number" id="shortanswervalue" name="shortanswervalue" placeholder="Message" value="0">
                <br>
                <input type="submit" id="submitInfo" value="提交" >
            </form>
        </div>

    </div>
</div>
<!--contact end here-->
<%@include file="../../footer.jsp"%>
</body>
</html>

