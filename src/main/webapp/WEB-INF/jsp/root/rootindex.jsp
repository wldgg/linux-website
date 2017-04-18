<%--
  Created by IntelliJ IDEA.
  User: wangl
  Date: 2017/3/21
  Time: 13:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>教学资源</title>
    <%@include file="../include.jsp"%>
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
            <!---->
            <%--<div class="header-logo">--%>
            <%--<div class="logo">--%>
            <%--<a href="index.jsp"><img src="images/lo1.png" alt="" ></a>--%>
            <%--</div>--%>
            <%--<div class="top-nav">--%>
            <%--<span class="icon"><img src="images/menu.png" alt=""> </span>--%>
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
                    <li ><a href="<%=basesite%>user/user">用户管理</a> </li>
                    <li ><a href="<%=basesite%>evaluate/showevaluate?curpage=1">在线测评管理</a> </li>
                    <li><a href="<%=basesite%>file/showmaterials?curpage=1">教学资源管理</a></li>
                    <li><img src="<%=basepath%>/ui/images/lo1.png" alt=""></li>
                    <li><a href="<%=basesite%>experiment/showexperiment?curpage=1">实验管理</a></li>
                    <%
                        if(request.getSession().getAttribute("username")!=null){
                    %>
                    <li><a href="<%=basepath%>/jsp/user/personal/personal.jsp">个人中心:<%=request.getSession().getAttribute("username")%></a></li>
                    <li><a href="<%=basesite%>user/quit">退出</a></li>
                    <%
                    }else {
                    %>
                    <li><div class="header-login">
                        <div class="top-nav-right">
                            <div id="loginContainer"> <a href="#" id="loginButton"><span>Login</span></a>
                                <div id="loginBox">

                                    <div id="loginalertinfo" class="alert alert-info" role="alert" style="display: none">
                                    </div>

                                    <form id="loginForm" action="<%=basesite%>user/login" method="post">
                                        <fieldset id="body">
                                            <fieldset>
                                                <label for="username">用户名</label>
                                                <input type="text" name="username" id="username">
                                            </fieldset>
                                            <fieldset>
                                                <label for="password">密码</label>
                                                <input type="password" name="password" id="password">
                                            </fieldset>
                                            <input type="submit" id="login" value="登陆">
                                            <label for="checkbox"><input type="checkbox" id="checkbox"> <i>记住密码</i></label>
                                        </fieldset>
                                        <span><a href="#">忘记密码？</a></span> <span><a href="<%=basepath%>/jsp/register.jsp">没有账户？点击注册</a></span>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>	</li>
                    <%
                        }
                    %>
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
            <h3 class="typo1">Typography</h3>
            <!--button-->
            <div class="grid_3 grid_4">
                <div class="page-header">
                    <h3>Headings</h3>
                </div>

                <div class="bs-example">
                    <table class="table">
                        <tbody>
                        <tr>
                            <td><h3 id="h3-bootstrap-heading">h3. Bootstrap heading<a class="anchorjs-link" href="#h3.-bootstrap-heading"><span class="anchorjs-icon"></span></a></h3></td>
                            <td class="type-info">Semibold 24px</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!--typo end here-->
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