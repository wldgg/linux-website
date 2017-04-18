<%--
  Created by IntelliJ IDEA.
  User: rain
  Date: 2017/4/5
  Time: 00:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>实验信息</title>
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
    <!--script-->
    <!--light-box-files -->
    <script type="text/javascript" charset="utf-8">
        $(function() {
            $('.gallery a').Chocolat();
        });
    </script>
</head>
<body>
<!--header start here-->
<div class="header1">
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
                    <li><a href="<%=basepath%>/jsp/user/message/message.jsp">留言</a></li>
                    <li><a href="#">hello <%=request.getSession().getAttribute("username")%></a></li>
                    <li><a href="<%=basesite%>user/quit">退出</a></li>
                </ul>
            </div>
            <!--script-->
        </div>
    </div>
</div>

<script>
    function judgeDownload() {
        var str="${experiment.experimentfile}";
        if(str==''){
            alert("没有附件");
            return false;
        }else {
            window.location.href="<%=basesite%>file/download?fileName=${experiment.experimentfile}&experimentname=${experiment.experimentname}";
            return true;
        }
    }
</script>

<!--header end here-->
<!--about start here-->
<div class="about">
    <div class="container">
        <div class="about-main">
            <div class="about-top">
                <h2>${experiment.experimentname}</h2>
                <%--<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas tristique orci ac sem. Duis ultricies pharetra</p>--%>
            </div>
            <div class="about-bottom">
                <div class="col-md-7 about-left">
                    <h6><a id="downloadHref" onclick="judgeDownload()">下载本实验附件</a></h6>
                    <p>实验开始时间:${experimentstarttime}/${experimentfinishtime}</p>
                    <p>${experiment.experimentbody}</p>
                </div>
                <div class="col-md-5 about-right">
                    <a href="single.html" >
                        <img src="<%=basepath%>/ui/images/g${experiment.experimentid%9+1}.jpg" alt="" class="img-responsive ">
                    </a>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <div class="team-mem">
            <h1>Our Team</h1>
            <div class="col-md-3 team-grid">
                <img src="<%=basepath%>/ui/images/t1.jpg"  alt="" class="img-responsive">
                <ul class="img-social-stags">
                    <li><a class="twitter" href="#"><span> </span></a><li>
                    <li><a class="facebook" href="#"><span> </span></a><li>
                    <div class="clearfix"> </div>
                </ul>
            </div>
            <div class="col-md-3 team-grid">
                <img src="<%=basepath%>/ui/images/t2.jpg"  alt="" class="img-responsive">
                <ul class="img-social-stags">
                    <li><a class="twitter" href="#"><span> </span></a><li>
                    <li><a class="facebook" href="#"><span> </span></a><li>
                    <div class="clearfix"> </div>
                </ul>
            </div>
            <div class="col-md-3 team-grid">
                <img src="<%=basepath%>/ui/images/t3.jpg"  alt="" class="img-responsive">
                <ul class="img-social-stags">
                    <li><a class="twitter" href="#"><span> </span></a><li>
                    <li><a class="facebook" href="#"><span> </span></a><li>
                    <div class="clearfix"> </div>
                </ul>
            </div>
            <div class="col-md-3 team-grid">
                <img src="<%=basepath%>/ui/images/t4.jpg"  alt="" class="img-responsive">
                <ul class="img-social-stags">
                    <li><a class="twitter" href="#"><span> </span></a><li>
                    <li><a class="facebook" href="#"><span> </span></a><li>
                    <div class="clearfix"> </div>
                </ul>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
    <div class="advantages">
        <div class="container">
            <div class="advantage-main">
                <div class="advance-top">
                    <h3>Advantages</h3>
                </div>
                <div class="advance-bottom">
                    <div class="col-md-6 advantage-left">
                        <div class="advanc-grid">
                            <div class="col-md-3 advanc-icons">
                                <img src="<%=basepath%>/ui/images/a1.png" alt="">
                            </div>
                            <div class="col-md-9 advanc-text">
                                <h4>Open Access</h4>
                                <p>Praesent nunc nunc, egestas eget elementum sed; rutrum eget metus! Vestibulum congue congue dui</p>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="advanc-grid">
                            <div class="col-md-3 advanc-icons">
                                <img src="<%=basepath%>/ui/images/a2.png" alt="">
                            </div>
                            <div class="col-md-9 advanc-text">
                                <h4>Open Access</h4>
                                <p>Praesent nunc nunc, egestas eget elementum sed; rutrum eget metus! Vestibulum congue congue dui</p>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                    <div class="col-md-6 advantage-right">
                        <div class="advanc-grid">
                            <div class="col-md-3 advanc-icons">
                                <img src="<%=basepath%>/ui/images/a3.png" alt="">
                            </div>
                            <div class="col-md-9 advanc-text">
                                <h4>Open Access</h4>
                                <p>Praesent nunc nunc, egestas eget elementum sed; rutrum eget metus! Vestibulum congue congue dui</p>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="advanc-grid">
                            <div class="col-md-3 advanc-icons">
                                <img src="<%=basepath%>/ui/images/a4.png" alt="">
                            </div>
                            <div class="col-md-9 advanc-text">
                                <h4>Open Access</h4>
                                <p>Praesent nunc nunc, egestas eget elementum sed; rutrum eget metus! Vestibulum congue congue dui</p>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--about end here-->
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