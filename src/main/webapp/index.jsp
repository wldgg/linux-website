<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Home</title>
    <%@include file="WEB-INF/jsp/include.jsp"%>
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
<div class="header">
    <div class="container">
        <div class="header-main">
            <script>
                $(document).ready(function () {
                    $("input#login").click(function () {
                        var usernameval=$("input#username").val();
                        var userpwdval=$("input#password").val();
                        var flag=true;
                        if(usernameval==''){
                            flag=false;
                            $("#loginalertinfo").html('用户名不可为空');
                        }else if(userpwdval==''){
                            flag=false;
                            $("#loginalertinfo").html('密码不可为空');
                        }
                        if(flag){
                            $('#loginform').submit();
                        }else {
                            $("#loginalertinfo").show();
                            return false;
                        }
                    });
                })
            </script>

            <div class="top-menu">
                <ul>
                    <li ><a href="<%=basepath%>/index.jsp" >首页</a> </li>
                    <li ><a href="<%=basesite%>evaluate/showevaluate?curpage=1">在线测评</a> </li>
                    <li><a href="<%=basesite%>file/showmaterials?curpage=1">教学资源</a></li>
                    <li><img src="<%=basepath%>/ui/images/lo1.png" alt=""></li>
                    <li><a href="<%=basesite%>experiment/showexperiment?curpage=1">实验 </a></li>
                    <%
                        if(request.getSession().getAttribute("username")!=null){
                    %>
                    <li><a href="#">hello <%=request.getSession().getAttribute("username")%></a></li>
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
                                            <%--<label for="checkbox"><input type="checkbox" id="checkbox"> <i>记住密码</i></label>--%>
                                        </fieldset>
                                        <%--<span><a href="#">忘记密码？</a></span> --%>
                                        <span><a href="<%=basesite%>user/getregister">没有账户？点击注册</a></span>
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

            <div class="bann-bottom">
                <h1>欢迎来到《Linux操作系统》教学网站</h1>
                <%--<p>全军出击</p>--%>
                <div class="bann-main">
                    <div class="col-md-4 bann-grid" onclick="SetHome(this,location.href);">
                        <img src="<%=basepath%>/ui/images/i1.png" alt="">
                        <h4><a >设为首页</a></h4>
                    </div>
                    <div class="col-md-4 bann-grid"onclick="AddFavorite('我的网站',location.href)">
                        <img src="<%=basepath%>/ui/images/i2.png" alt="">
                        <h4><a >收藏本站</a></h4>
                    </div>
                    <div class="col-md-4 bann-grid">
                        <img src="<%=basepath%>/ui/images/i3.png" alt="">
                        <h4>点赞</h4>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--header end here-->
<%--<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >企业网站模板</a></div>--%>
<!--baner-info start here-->
<div class="banner-info">
    <div class="container">
        <div class="banner-info-main">
            <div class="col-md-6 bann-info-left">
                <img src="<%=basepath%>/ui/images/2.jpg" alt="" class="img-responsive">
                <p>Linux是一套免费使用和自由传播的类Unix操作系统，是一个基于POSIX和UNIX的多用户、多任务、支持多线程和多CPU的操作系统。它能运行主要的UNIX工具软件、应用程序和网络协议。它支持32位和64位硬件。Linux继承了Unix以网络为核心的设计思想，是一个性能稳定的多用户网络操作系统。</p>
            </div>
            <div class="col-md-6 bann-info-left">
                <img src="<%=basepath%>/ui/images/balance.jpg" alt="" class="img-responsive">
                <p>Linux操作系统诞生于1991 年10 月5 日（这是第一次正式向外公布时间）。Linux存在着许多不同的Linux版本，但它们都使用了Linux内核。Linux可安装在各种计算机硬件设备中，比如手机、平板电脑、路由器、视频游戏控制台、台式计算机、大型机和超级计算机。</p>
            </div>
            <div class="clearfix"> </div>
        </div>
        <div class="bann-info-btn"><a href="<%=basesite%>file/showmaterials?curpage=1" class="hvr-bounce-to-right">更多知识请点击</a></div>
    </div>
</div>
<!--banner-info end here-->
<!--testimonal start here-->
<div class="testimonal">
    <div class="container">
        <div class="testimonal-main">
            <h2>Linux的组成</h2>
            <p>内核：是系统的心脏，是运行程序和管理像磁盘和打印机等硬件设备的核心程序。
                Shell：是系统的用户界面，提供了用户和内核进行交互操作的一种接口。它接收用户输入的命令并把它送入内核去执行，是一个命令解释器。但它不仅使命令解释器，而且还是高级编程语言，shell编程。
                文件系统：文件系统是文件存放在磁盘等存储设备上的组织方法，Linux支持多种文件系统，如ext3,ext2,NFS,SMB,iso9660等
                应用程序：标准的Linux操作系统都会有一套应用程序例如X-Window,Open Office等</p>
            <a href="<%=basesite%>experiment/showexperiment?curpage=1" class="hvr-bounce-to-right  testimo-btn">通过实验了解更多</a>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!--testimonal end here-->
<!--we work strat her-->

<div class="we-work">
    <div class="container">
        <div class="we-work-main">
            <div class="we-work-top">
                <h3>在线练习</h3>
                <p>简述Linux系统有什么显著特点或特性。</p>
            </div>
            <div class="we-work-bottom">
                <div class="col-md-6 we-work-left">
                    <div class="col-md-6 we-left-img1">
                        <img src="<%=basepath%>/ui/images/w1.jpg" alt="" class="img-responsive">
                    </div>
                    <div class="col-md-6 we-left-img2">
                        <img src="<%=basepath%>/ui/images/w2.jpg" alt="" class="img-responsive">
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="col-md-6 we-work-right">
                    <p> （1）与UNIX兼容（2）自由软件，源码公开（3）性能高，安全性强（4）便于定制和再开发（5）互操作性高。或（1）开放性（2）多用户（3）多任务（4）良好的用户界面（5）设备独立性（6）提供了丰富的网络功能（7）可靠的系统安全（8）良好的可移植性 </p>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <div class="bann-info-btn">
            <a href="<%=basesite%>evaluate/showevaluate?curpage=1" class="hvr-bounce-to-right">看看练习题</a>
        </div>
    </div>
</div>
<!--we work end here-->
<!--feature start here-->
<%--<div class="features">--%>
    <%--<div class="container">--%>
        <%--<div class="features-main">--%>
            <%--<div class="features-top">--%>
                <%--<h3>Features</h3>--%>
                <%--<p> </p>--%>
            <%--</div>--%>
            <%--<div class="features-bottom">--%>
                <%--<div class="col-md-3 feature-grid">--%>
                    <%--<img src="<%=basepath%>/ui/images/f1.jpg" alt="" class="img-responsive">--%>
                    <%--<h4>voluptatem accusantium</h4>--%>
                    <%--<p>quae ab illo inventore veritatis et quasi architecto beatae vitae</p>--%>
                <%--</div>--%>
                <%--<div class="col-md-3 feature-grid">--%>
                    <%--<img src="<%=basepath%>/ui/images/f2.jpg" alt="" class="img-responsive">--%>
                    <%--<h4>voluptatem accusantium</h4>--%>
                    <%--<p>quae ab illo inventore veritatis et quasi architecto beatae vitae</p>--%>
                <%--</div>--%>
                <%--<div class="col-md-3 feature-grid">--%>
                    <%--<img src="<%=basepath%>/ui/images/f3.jpg" alt="" class="img-responsive">--%>
                    <%--<h4>voluptatem accusantium</h4>--%>
                    <%--<p>quae ab illo inventore veritatis et quasi architecto beatae vitae</p>--%>
                <%--</div>--%>
                <%--<div class="col-md-3 feature-grid">--%>
                    <%--<img src="<%=basepath%>/ui/images/f4.jpg" alt="" class="img-responsive">--%>
                    <%--<h4>voluptatem accusantium</h4>--%>
                    <%--<p>quae ab illo inventore veritatis et quasi architecto beatae vitae</p>--%>
                <%--</div>--%>
                <%--<div class="clearfix"> </div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>

<script type="text/JavaScript">
    function SetHome(obj,url){
        try{
            obj.style.behavior='url(#default#homepage)';
            obj.setHomePage(url);
        }catch(e){
            if(window.netscape){
                try{
                    netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                }catch(e){
                    alert("抱歉，此操作被浏览器拒绝！\n\n请在浏览器地址栏输入“about:config”并回车然后将[signed.applets.codebase_principal_support]设置为'true'");
                }
            }else{
                alert("抱歉，您所使用的浏览器无法完成此操作。\n\n您需要手动将【"+url+"】设置为首页。");
            }
        }
    }

    //收藏本站
    function AddFavorite(title, url) {
        try {
            window.external.addFavorite(url, title);
        }
        catch (e) {
            try {
                window.sidebar.addPanel(title, url, "");
            }
            catch (e) {
                alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加");
            }
        }
    }
</script>

<!--services end here-->
<%@include file="WEB-INF/jsp/footer.jsp"%>
</body>
</html>