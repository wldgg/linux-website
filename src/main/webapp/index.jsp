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
            <!---->
            <%--<div class="header-logo">--%>
            <%--<div class="logo">--%>
            <%--<a href="index.html"><img src="<%=basepath%>/ui/images/lo1.png" alt="" ></a>--%>
            <%--</div>--%>
            <%--<div class="top-nav">--%>
            <%--<span class="icon"><img src="<%=basepath%>/ui/images/menu.png" alt=""> </span>--%>
            <%--<ul>--%>
            <%--<li ><a href="index.html">1111111</a> </li>--%>
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
                <h1>欢迎来到Linux教学网站</h1>
                <p>全军出击</p>
                <div class="bann-main">
                    <div class="col-md-4 bann-grid">
                        <img src="<%=basepath%>/ui/images/i1.png" alt="">
                        <h4>Porro Neque</h4>
                    </div>
                    <div class="col-md-4 bann-grid">
                        <img src="<%=basepath%>/ui/images/i2.png" alt="">
                        <h4>Porro Neque</h4>
                    </div>
                    <div class="col-md-4 bann-grid">
                        <img src="<%=basepath%>/ui/images/i3.png" alt="">
                        <h4>Porro Neque</h4>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--header end here-->
<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >企业网站模板</a></div>
<!--baner-info start here-->
<div class="banner-info">
    <div class="container">
        <div class="banner-info-main">
            <div class="col-md-6 bann-info-left">
                <img src="<%=basepath%>/ui/images/2.jpg" alt="" class="img-responsive">
                <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur</p>
            </div>
            <div class="col-md-6 bann-info-left">
                <img src="<%=basepath%>/ui/images/balance.jpg" alt="" class="img-responsive">
                <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur</p>
            </div>
            <div class="clearfix"> </div>
        </div>
        <div class="bann-info-btn"><a href="single.html" class="hvr-bounce-to-right">Read More</a></div>
    </div>
</div>
<!--banner-info end here-->
<!--testimonal start here-->
<div class="testimonal">
    <div class="container">
        <div class="testimonal-main">
            <h2>Nor again anyone who loves  pursues desires</h2>
            <p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids</p>
            <a href="single.html" class="hvr-bounce-to-right  testimo-btn">Read More</a>
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
                <h3>How We Work</h3>
                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
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
                    <p> Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.omnis iste natus error sit voluptatem accusantium doloremque laudantium</p>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
</div>
<!--we work end here-->
<!--feature start here-->
<div class="features">
    <div class="container">
        <div class="features-main">
            <div class="features-top">
                <h3>Features</h3>
                <p> </p>
            </div>
            <div class="features-bottom">
                <div class="col-md-3 feature-grid">
                    <img src="<%=basepath%>/ui/images/f1.jpg" alt="" class="img-responsive">
                    <h4>voluptatem accusantium</h4>
                    <p>quae ab illo inventore veritatis et quasi architecto beatae vitae</p>
                </div>
                <div class="col-md-3 feature-grid">
                    <img src="<%=basepath%>/ui/images/f2.jpg" alt="" class="img-responsive">
                    <h4>voluptatem accusantium</h4>
                    <p>quae ab illo inventore veritatis et quasi architecto beatae vitae</p>
                </div>
                <div class="col-md-3 feature-grid">
                    <img src="<%=basepath%>/ui/images/f3.jpg" alt="" class="img-responsive">
                    <h4>voluptatem accusantium</h4>
                    <p>quae ab illo inventore veritatis et quasi architecto beatae vitae</p>
                </div>
                <div class="col-md-3 feature-grid">
                    <img src="<%=basepath%>/ui/images/f4.jpg" alt="" class="img-responsive">
                    <h4>voluptatem accusantium</h4>
                    <p>quae ab illo inventore veritatis et quasi architecto beatae vitae</p>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
</div>
<!--services end here-->
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