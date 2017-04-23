<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Contact</title>
    <%@include file="include.jsp"%>
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
            <!---->
            <%--<div class="header-logo">--%>
                <%--<div class="logo">--%>
                    <%--<img src="<%=basepath%>/ui/images/lo1.png" alt="" >--%>
                <%--</div>--%>
                <%--<div class="top-nav">--%>
                    <%--<span class="icon"><img src="<%=basepath%>/ui/images/menu.png" alt=""> </span>--%>
                    <%--<ul>--%>
                        <%--<li ><a href="index.html">Home</a> </li>--%>
                        <%--<li ><a href="about.html" >About  </a> </li>--%>
                        <%--<li><a href="typo.html"  >Short Codes</a></li>--%>
                        <%--<li><a href="galley.html" >Gallery</a></li>--%>
                        <%--<li><a href="contact.html" >Contact </a></li>--%>
                    <%--</ul>--%>
                    <%--<!--script-->--%>
                    <%--<script>--%>
                        <%--$("span.icon").click(function(){--%>
                            <%--$(".top-nav ul").slideToggle(500, function(){--%>
                            <%--});--%>
                        <%--});--%>
                    <%--</script>--%>
                <%--</div>--%>
                <%--<div class="clearfix"> </div>--%>
            <%--</div>--%>

            <!---->
            <div class="top-menu">
                <ul>
                    <li ><a href="<%=basepath%>/index.jsp" >首页</a> </li>
                    <li ><a href="<%=basesite%>evaluate/showevaluate?curpage=1">在线测评</a> </li>
                    <li><a href="<%=basesite%>file/showmaterials?curpage=1">教学资源</a></li>
                    <li><img src="<%=basepath%>/ui/images/lo1.png" alt=""></li>
                    <li><a href="<%=basesite%>experiment/showexperiment?curpage=1">实验 </a></li>
                    <li><div class="header-login">
                        <div class="top-nav-right">
                            <div id="loginContainer"> <a href="<%=basepath%>/index.jsp"><span>Login</span></a>
                            </div>
                        </div>
                    </div>	</li>
                </ul>
            </div>
            <!--script-->
        </div>
    </div>
</div>
<!--header end here-->

<script>
    $(document).ready(function () {
        $("input#submitInfo").click(function () {
            var username=$("input#username").val();
            var userPwd=$("input#userPwd").val();
            var userPwdCheck=$("input#userPwdCheck").val();
            var userEmail=$("input#userEmail").val();
            var flag=true;
            if(username==""){
                $("input#username").attr('placeholder','学号不可为空');
                flag=false;
            }else {
                var reg=/^\d{10}$/;
                if (!reg.test(username)){
                    $("input#username").attr('placeholder','学号格式不匹配');
                    $("input#username").val('');
                    flag=false;
                }
            }
            if(userPwd==""){
                $("input#userPwd").attr('placeholder','密码不可为空');
                flag=false;
            }else {
                var reg=/^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)\S{6,16}$/;
                if (!reg.test(userPwd)){
                    $("input#userPwd").attr('placeholder','密码格式不匹配');
                    $("input#userPwd").val('');
                    flag=false;
                }
            }
            if(userPwdCheck==""){
                $("input#userPwdCheck").attr('placeholder','确认密码不可为空');
                flag=false;
            }else if(userPwdCheck!=userPwd){
                $("input#userPwdCheck").attr('placeholder','确认密码与密码不相同');
                $("input#userPwdCheck").val('');
                flag=false;
            }
            if(userEmail!=""){
                var re=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
                if(!re.test(userEmail)){
                    $("input#userEmail").attr('placeholder','邮箱格式不匹配');
                    $("input#userEmail").val('');
                    flag=false;
                }
            }
            if(!flag){
                return false;
            }
        })
    })
</script>

<!--contact start here-->
<div class="contact">
    <div class="container">
        <div class="contact-top">
            <h2>帐号注册</h2>
            <p>请妥善保管个人信息。</p>
        </div>
        <div class="contact-form">
                <form action="<%=basesite%>user/register" method="post">
                    <span style="color: red">*</span>学号：
                    <br>
                    <input type="text" id="username" name="username" placeholder="请输入学号">
                    <br>
                    <span style="color: red">*</span>密码：
                    <br>
                    <input type="password" id="userPwd" name="userPwd" placeholder="请输入密码" > 请至少包含大小写字母，数字，符号中的两种
                    <br>
                    <span style="color: red">*</span>密码确认：
                    <br>
                    <input type="password" id="userPwdCheck" name="userPwdCheck" placeholder="再次输入密码">
                    <%--<br>--%>
                    <%--<span style="color: red">*</span>班级：--%>
                    <%--<br>--%>
                    <%--<input type="text" name="userClass" placeholder="请输入班级"> 如：13计算机--%>
                    <br>
                    性别：
                    <br>
                    <%--<input type="text" name="userSex" placeholder="请输入性别">--%>
                    <select name="userSex">
                        <option value="2"> </option>
                        <option value="1">男</option>
                        <option value="0">女</option>
                    </select>
                    <br>
                    邮箱：
                    <br>
                    <input type="text" id="userEmail" name="userEmail" placeholder="请输入活跃邮箱，以便我们可以联系到您"> 忘记密码时，通过绑定的邮箱来找回密码
                    <br>
                    <input type="submit" id="submitInfo" value="提交" >
                </form>
        </div>

    </div>
</div>
<!--contact end here-->
<%@include file="footer.jsp"%>
</body>
</html>