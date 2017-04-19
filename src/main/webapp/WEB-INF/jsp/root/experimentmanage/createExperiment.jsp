<%--
  Created by IntelliJ IDEA.
  User: rain
  Date: 2017/4/4
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>创建新实验</title>
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
            var experimentname=$("input#experimentname").val();
            var experimentbody=$("input#experimentbody").val();
            var starttime=$("input#starttime").val();
            var finishtime=$("input#finishtime").val();
            var flag=true;
            if(experimentname==""){
                $("input#experimentname").attr('placeholder','experimentname不可为空');
                flag=false;
            }
            if(experimentbody==""){
                $("input#experimentbody").attr('placeholder','experimentbody不可为空');
                flag=false;
            }
            if(starttime>finishtime){
                alert("开始时间不能晚于结束时间");
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
            <h2>新实验</h2>
            <p>请仔细填写实验的名称,内容,附件,起止时间</p>
        </div>
        <%--<div class="contact-infom">--%>
        <%--<h4>CONTACT INFO</h4>--%>
        <%--<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,sheets containing Lorem Ipsum passages,--%>
        <%--sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.It was popularised in the 1960s with the release of Letraset--%>
        <%--and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>--%>
        <%--</div>--%>
        <div class="contact-form">
            <%--<form>--%>
                <%--<input type="text" placeholder="Name">--%>
                <%--<input type="text"  class="email" placeholder="email">--%>
                <%--<input type="text" placeholder="Telephone">--%>
                <%--<textarea placeholder="Message" required=""></textarea>--%>
                <%--<input type="submit" value="Submit" >--%>
            <%--</form>--%>


            <form action="<%=basesite%>experiment/create" method="post" enctype="multipart/form-data">
                <span style="color: red">*</span>实验名称：
                <br>
                <input type="text" id="experimentname" name="experimentname" placeholder="experimentname">
                <br>
                <span style="color: red">*</span>实验描述：
                <br>
                <textarea id="experimentbody" name="experimentbody" placeholder="Message" required=""></textarea>
                <br>
                开始时间：
                <br>
                <input type="date" id="starttime" name="starttime" placeholder="请输入starttime">
                <br>
                结束时间：
                <br>
                <input type="date" id="finishtime" name="finishtime" placeholder="请输入finishtime">
                <br>
                附件：
                <br>
                <input type="file" id="experimentfile" name="experimentfile" placeholder="请输入experimentfile">
                <br>
                <input type="submit" id="submitInfo" value="提交" >
            </form>
        </div>

    </div>
</div>
<!--contact end here-->
<!--footer start here-->
<div class="footer">
    <div class="container">
        <div class="footer-main">
            <div class="col-md-4 ftr-grid">
                <div class="ftr-grid-left">
                    <img src="<%=basepath%>/ui/images/location.png" alt="">
                </div>
                <div class="ftr-grid-right">
                    <p>7556 gt globel Place <span class="local">CD-road,M 07 435.</span></p>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="col-md-4 ftr-grid">
                <div class="ftr-grid-left">
                    <img src="<%=basepath%>/ui/images/email.png" alt="">
                </div>
                <div class="ftr-grid-right">
                    <p><a href="#">mail@user.com</a><span class="local">saepe eveniet</span></p>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="col-md-4 ftr-grid">
                <div class="ftr-grid-left">
                    <img src="<%=basepath%>/ui/images/phone.png" alt="">
                </div>
                <div class="ftr-grid-right">
                    <p>+1234 567 9871 <span class="local">+1204 859 6598</span></p>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!--footer end here-->
<!--copyright start here-->
<div class="copyright">
    <div class="container">
        <div class="copyright-main">
            <p>Copyright &copy; 2015.Company name All rights reserved.<a target="_blank" href="http://www.cssmoban.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!--copyright end here-->
</body>
</html>
