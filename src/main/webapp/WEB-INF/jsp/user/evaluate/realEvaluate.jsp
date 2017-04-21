<%@ page import="com.cam.model.Choose" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: rain
  Date: 2017/4/8
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>在线评测</title>
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
                    <li><a href="<%=basesite%>">留言</a></li>
                    <%
                        if(request.getSession().getAttribute("username")!=null){
                    %>
                    <li><a href="<%=basesite%>">hello <%=request.getSession().getAttribute("username")%></a></li>
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
                                        <span><a href="<%=basesite%>register">没有账户？点击注册</a></span>
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

<div class="contact">
    <div class="container">
        <div class="contact-top">
            <h2>${evaluate.evaluatename}</h2>
        </div>
        <form method="post" action="<%=basesite%>evaluate/correct?evaluatename=${evaluate.evaluatename}">
        <c:if test="${fn:length(choose)>0}">
            <div class="contact-infom">
                <h4>选择题:共${fn:length(choose)}道.</h4>
                <c:forEach items="${choose}" var="choose" varStatus="status">
                    <h3 id="h3-bootstrap-heading">${status.count}. ${choose.choosebody}</h3>
                    <input type="radio" name="chooseList[${status.count-1}]" value="A">${choose.choosea}<br>
                    <input type="radio" name="chooseList[${status.count-1}]" value="B">${choose.chooseb}<br>
                    <input type="radio" name="chooseList[${status.count-1}]" value="C">${choose.choosec}<br>
                    <input type="radio" name="chooseList[${status.count-1}]" value="D">${choose.choosed}<br>
                    <input type="radio" style="display: none" name="chooseList[${status.count-1}]" value="E" checked="checked"><br>
                    <input type="hidden" name="chooseAns[${status.count-1}]" value="${choose.chooseanswer}">
                </c:forEach>
            </div>
        </c:if>
        <c:if test="${fn:length(judge)>0}">
            <div class="contact-infom">
                <h4>判断题:共${fn:length(judge)}道.</h4>
                <c:forEach items="${judge}" var="judge" varStatus="status">
                    <h3 id="h3-bootstrap-heading">${status.count}. ${judge.judgebody}</h3>
                    <input type="radio" name="judgeList[${status.count-1}]" value="T">T<br>
                    <input type="radio" name="judgeList[${status.count-1}]" value="F">F<br>
                    <input type="radio" style="display: none" name="judgeList[${status.count-1}]" value="E" checked="checked"><br>
                    <input type="hidden" name="judgeAns[${status.count-1}]" value="${judge.judgeanswer}">
                </c:forEach>
            </div>
        </c:if>
        <c:if test="${fn:length(vacant)>0}">
            <div class="contact-infom">
                <h4>填空题:共${fn:length(vacant)}道.</h4>
                <c:forEach items="${vacant}" var="vacant" varStatus="status">
                    <h3 id="h3-bootstrap-heading">${status.count}. ${vacant.vacantbody}</h3>
                    <%--<input type="text" name="vacantList[${status.count-1}]"><br>--%>
                    <textarea id="vacantList[${status.count-1}]" name="vacantList[${status.count-1}]" placeholder="" style="width: 60%;height: 50px"></textarea>
                    <input type="hidden" name="vacantAns[${status.count-1}]" value="${vacant.vacantanswer}">
                </c:forEach>
            </div>
        </c:if>
        <c:if test="${fn:length(shortAnswer)>0}">
            <div class="contact-infom">
                <h4>简答题:共${fn:length(shortAnswer)}道.</h4>
                <c:forEach items="${shortAnswer}" var="shortAnswer" varStatus="status">
                    <h3 id="h3-bootstrap-heading">${status.count}. ${shortAnswer.shortanswerbody}</h3>
                    <%--<input type="text" name="shortAnswerList[${status.count-1}]"><br>--%>
                    <textarea id="shortAnswerList[${status.count-1}]" name="shortAnswerList[${status.count-1}]" placeholder="" style="width: 80%;height: 200px"></textarea>
                    <input type="hidden" name="shortAnswerAns[${status.count-1}]" value="${shortAnswer.shortansweranswer}">
                </c:forEach>
            </div>
        </c:if>
            <input type="submit" class="btn btn-lg btn-primary" value="提交">
            <%--<p class="grid1">--%>
                <%--<button type="button" class="btn btn-lg btn-primary">提交</button>--%>
            <%--</p>--%>
        </form>
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
