<%--
  Created by IntelliJ IDEA.
  User: rain
  Date: 2017/4/4
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>实验列表</title>
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
            <h3 class="typo1">实验管理</h3>
            <!--button-->
            <div class="grid_3 grid_4">
                <div class="page-header">
                    <form id = "queryForm" action="<%=basesite%>experiment/showexperiment" method="post">
                        <input type="hidden" name="curpage" value="1">
                        实验名：<input type="text" name = "experimentname" value="">
                        <input style="background-color: darkgray" class="hvr-bounce-to-right" type="submit" value="查询">
                        <input onclick="gotoAddPage()" style="background-color: darkgray" class="hvr-bounce-to-right" type="button" value="创建新实验">
                    </form>
                </div>
                <div class="bs-example">
                    <table class="table">

                        <thead>
                        <th>实验名</th>
                        <th>实验创建时间</th>
                        <th>操作</th>
                        <th></th>
                        </thead>
                        <tbody>
                        <c:forEach items="${experiment}" var="experiment">
                            <tr>
                                <td><h3 id="h3-bootstrap-heading">${experiment.experimentname}<a class="anchorjs-link" href="#h3.-bootstrap-heading"><span class="anchorjs-icon"></span></a></h3></td>
                                <td class="type-info">${experiment.addtime}</td>
                                    <%--<td>--%>
                                    <%--<c:if test="${user.nIsAdmin == 0}">否</c:if>--%>
                                    <%--<c:if test="${user.nIsAdmin == 1}">是</c:if>--%>
                                    <%--</td>--%>
                                    <%--<td><a href="update.action?id=${material.materialsname}">修改</a>|<a href="delete.action?id=${material.materialsname}">删除</a></td>--%>
                                <td><a class="hvr-bounce-to-right" href="<%=basesite%>experiment/edit?experimentname=${experiment.experimentname}">修改</a></td>
                                <td><a class="hvr-bounce-to-right" href="<%=basesite%>experiment/delete?experimentname=${experiment.experimentname}">删除</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div style="text-align: center">
                        <p>
                            <a class="type-info" href="<%=basesite%>experiment/showexperiment?curpage=1">首页</a>
                            <a class="type-info" href="<%=basesite%>experiment/showexperiment?curpage=${curpage-1 eq 0?1:curpage-1}">上一页</a>
                            <a class="type-info" href="<%=basesite%>experiment/showexperiment?curpage=${curpage eq pagenum?pagenum:curpage+1}">下一页</a>
                            <a class="type-info" href="<%=basesite%>experiment/showexperiment?curpage=${pagenum}">末页</a>
                        </p>
                        <p>当前第${curpage}页/共${pagenum}页,一共有${counts}条记录, 每页 ${pagesize} 条</p>
                        跳转到第<input type="number" id = "page" size="2">页
                        <a class="hvr-bounce-to-right" onclick="gotoPage()" >跳转</a>
                        <%--<input type="button" class="hvr-bounce-to-right" onclick="gotoPage()" value="跳转">--%>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function gotoPage() {
            var str=$("input#page").val();
            if(str=='')return false;
            if(str>${pagenum}||str<1){
                alert("超出页数范围");
                return false;
            }
            window.location.href="<%=basesite%>experiment/showexperiment?curpage="+str;
        }

        function gotoAddPage() {
            window.location.href="<%=basesite%>experiment/experiment";
        }
    </script>

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
