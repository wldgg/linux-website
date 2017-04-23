<%--
  Created by IntelliJ IDEA.
  User: rain
  Date: 2017/4/4
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>教学资源</title>
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
            <h3 class="typo1">资源管理</h3>
            <!--button-->
            <div class="grid_3 grid_4">
                <div class="page-header">
                    <form id = "queryForm" action="<%=basesite%>file/showmaterials" method="post">
                        <input type="hidden" name="curpage" value="1">
                        资源名：<input type="text" name = "materialsname" value="">
                        <input class="btn btn-1 btn-primary" type="submit" value="查询">
                        <input onclick="gotoAddPage()" class="btn btn-1 btn-success" type="button" value="上传资源">
                    </form>
                </div>
                <div class="bs-example">
                    <table class="table">

                        <thead>
                        <th>资源名</th>
                        <th>资源创建时间</th>
                        <th>操作</th>
                        </thead>
                        <tbody>
                        <c:forEach items="${materials}" var="material">
                            <tr>
                                <td><h3 id="h3-bootstrap-heading">${material.materialsname}<a class="anchorjs-link" href="#h3.-bootstrap-heading"><span class="anchorjs-icon"></span></a></h3></td>
                                <td class="type-info">${material.addtime}</td>
                                    <%--<td>--%>
                                    <%--<c:if test="${user.nIsAdmin == 0}">否</c:if>--%>
                                    <%--<c:if test="${user.nIsAdmin == 1}">是</c:if>--%>
                                    <%--</td>--%>
                                    <%--<td><a href="update.action?id=${material.materialsname}">修改</a>|<a href="delete.action?id=${material.materialsname}">删除</a></td>--%>
                                <td><a class="hvr-bounce-to-right" href="<%=basesite%>file/delete?materialsname=${material.materialsname}">删除</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div style="text-align: center">
                        <p>
                            <a class="type-info" href="<%=basesite%>file/showmaterials?curpage=1">首页</a>
                            <a class="type-info" href="<%=basesite%>file/showmaterials?curpage=${curpage-1 eq 0?1:curpage-1}">上一页</a>
                            <a class="type-info" href="<%=basesite%>file/showmaterials?curpage=${curpage eq pagenum?pagenum:curpage+1}">下一页</a>
                            <a class="type-info" href="<%=basesite%>file/showmaterials?curpage=${pagenum}">末页</a>
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
            window.location.href="<%=basesite%>file/showmaterials?curpage="+str;
        }

        function gotoAddPage() {
            window.location.href="<%=basesite%>file/materials";
        }
    </script>

    <!--typo end here-->
    <%@include file="../../footer.jsp"%>
</body>
</html>
