<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>实验</title>
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
                    <li><a href="<%=basesite%>experiment/showexperiment?curpage=1">实验</a></li>
                    <li><a href="#">hello <%=request.getSession().getAttribute("username")%></a></li>
                    <li><a href="<%=basesite%>user/quit">退出</a></li>
                </ul>
            </div>
            <!--script-->
        </div>
    </div>
</div>
<!--header end here-->
<!--gallery-starts-->
<div class="gallery">
    <div class="container">
        <div class="gallery-top heading">
            <h2>实验</h2>
            <p>在这里将会看到现有的实验信息</p>
        </div>
        <section>
            <ul id="da-thumbs" class="da-thumbs">

                <c:forEach items="${experiment}" var="experiment">
                    <li>
                        <center>${experiment.experimentname}</center>
                        <a href="<%=basesite%>experiment/gotoexper?experimentname=${experiment.experimentname}" rel="title" class="b-link-stripe b-animate-go  thickbox">
                            <img src="<%=basepath%>/ui/images/g${experiment.experimentid%9+1}.jpg" alt="" class="img-responsive">
                            <div>
                                <h5>Education</h5>
                                <span>non suscipit leo fringilla non suscipit leo fringilla molestie</span>
                            </div>
                        </a>
                    </li>
                </c:forEach>

                <%--<li>--%>
                    <%--<center>实验一</center>--%>
                    <%--<a href="<%=basepath%>/ui/images/g1.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">--%>
                        <%--<img src="<%=basepath%>/ui/images/g1.jpg" alt="" class="img-responsive">--%>
                        <%--<div>--%>
                            <%--<h5>Education</h5>--%>
                            <%--<span>non suscipit leo fringilla non suscipit leo fringilla molestie</span>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                <%--</li>--%>
                <%--<li>--%>
                    <%--<center>实验2</center>--%>
                    <%--<a href="<%=basepath%>/ui/images/g2.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">--%>
                        <%--<img src="<%=basepath%>/ui/images/g2.jpg" alt="">--%>
                        <%--<div>--%>
                            <%--<h5>Education</h5>--%>
                            <%--<span>non suscipit leo fringilla non suscipit leo fringilla molestie</span>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                <%--</li>--%>
                <%--<li>--%>
                    <%--<center>实验3</center>--%>
                    <%--<a href="<%=basepath%>/ui/images/g3.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">--%>
                        <%--<img src="<%=basepath%>/ui/images/g3.jpg" alt="">--%>
                        <%--<div>--%>
                            <%--<h5>Education</h5>--%>
                            <%--<span>non suscipit leo fringilla non suscipit leo fringilla molestie</span>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                <%--</li>--%>
                <%--<li>--%>
                    <%--<center>实验4</center>--%>

                    <%--<a href="<%=basepath%>/ui/images/g4.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">--%>
                        <%--<img src="<%=basepath%>/ui/images/g4.jpg" alt="">--%>
                        <%--<div>--%>
                            <%--<h5>Education</h5>--%>
                            <%--<span>non suscipit leo fringilla non suscipit leo fringilla molestie</span>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                <%--</li>--%>
                <%--<li>--%>
                    <%--<center>实验5</center>--%>

                    <%--<a href="<%=basepath%>/ui/images/g5.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">--%>
                        <%--<img src="<%=basepath%>/ui/images/g5.jpg" alt="">--%>
                        <%--<div>--%>
                            <%--<h5>Education</h5>--%>
                            <%--<span>non suscipit leo fringilla non suscipit leo fringilla molestie</span>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                <%--</li>--%>
                <%--<li>--%>
                    <%--<center>实验5</center>--%>

                    <%--<a href="<%=basepath%>/ui/images/g6.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">--%>
                        <%--<img src="<%=basepath%>/ui/images/g6.jpg" alt="">--%>
                        <%--<div>--%>
                            <%--<h5>Education</h5>--%>
                            <%--<span>non suscipit leo fringilla non suscipit leo fringilla molestie</span>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                <%--</li>--%>
                <%--<li>--%>
                    <%--<center>实验5</center>--%>

                    <%--<a href="<%=basepath%>/ui/images/g7.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">--%>
                        <%--<img src="<%=basepath%>/ui/images/g7.jpg" alt="">--%>
                        <%--<div>--%>
                            <%--<h5>Education</h5>--%>
                            <%--<span>non suscipit leo fringilla non suscipit leo fringilla molestie</span>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                <%--</li>--%>
                <%--<li>--%>
                    <%--<center>实验5</center>--%>

                    <%--<a href="<%=basepath%>/ui/images/g8.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">--%>
                        <%--<img src="<%=basepath%>/ui/images/g8.jpg" alt="">--%>
                        <%--<div>--%>
                            <%--<h5>Education</h5>--%>
                            <%--<span>non suscipit leo fringilla non suscipit leo fringilla molestie</span>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                <%--</li>--%>
                <%--<li>--%>
                    <%--<center>实验5</center>--%>

                    <%--<a href="<%=basepath%>/ui/images/g9.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">--%>
                        <%--<img src="<%=basepath%>/ui/images/g9.jpg" alt="">--%>
                        <%--<div>--%>
                            <%--<h5>Educatione</h5>--%>
                            <%--<span>non suscipit leo fringilla non suscipit leo fringilla molestie</span>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                <%--</li>--%>
                <div class="clearfix"> </div>
            </ul>
        </section>

        <script type="text/javascript">
            $(function() {

                $(' #da-thumbs > li ').each( function() { $(this).hoverdir(); } );

            });
        </script>
    </div>
</div>
<!--gallery-end-->
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