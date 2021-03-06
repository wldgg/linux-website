<%--
  Created by IntelliJ IDEA.
  User: wangl
  Date: 2017/4/19
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>实验报告提交情况</title>
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
            <h3 class="typo1">实验报告提交情况</h3>
            <!--button-->
            <div class="grid_3 grid_4">
                <%--<div class="page-header">--%>
                    <%--<form id = "queryForm" action="<%=basesite%>evaluate/showevaluate" method="post">--%>
                        <%--<input type="hidden" name="curpage" value="1">--%>
                        <%--实验名：<input type="text" name = "evaluatename" value="">--%>
                        <%--<input style="background-color: darkgray" class="hvr-bounce-to-right" type="submit" value="查询">--%>
                        <%--<input onclick="gotoAddPage()" style="background-color: darkgray" class="hvr-bounce-to-right" type="button" value="创建新试卷">--%>
                        <%--<input onclick="gotoimportPage()" style="background-color: darkgray" class="hvr-bounce-to-right" type="button" value="导入试题">--%>
                    <%--</form>--%>
                <%--</div>--%>
                <div class="bs-example">
                    <table class="table">
                        <thead>
                        <th>实验名</th>
                        <th>用户名</th>
                        <th>实验报告提交时间</th>
                        <%--<th>操作</th>--%>
                        <th>下载次数</th>
                        </thead>
                        <tbody>
                        <c:forEach items="${report}" var="experreport">
                            <tr>
                                <td><h3 class="h3-bootstrap-heading">${experreport.experimentname}<a class="anchorjs-link" href="#h3.-bootstrap-heading"><span class="anchorjs-icon"></span></a></h3></td>
                                <td><h3 class="h3-bootstrap-heading">${experreport.username}<a class="anchorjs-link" href="#h3.-bootstrap-heading"><span class="anchorjs-icon"></span></a></h3></td>
                                <td class="type-info">${experreport.addtime}</td>
                                    <%--<td>--%>
                                    <%--<c:if test="${user.nIsAdmin == 0}">否</c:if>--%>
                                    <%--<c:if test="${user.nIsAdmin == 1}">是</c:if>--%>
                                    <%--</td>--%>
                                <td><a class="hvr-bounce-to-right">${experreport.downloadcnt}</a></td>
                                <%--<td><a class="hvr-bounce-to-right" onclick="downloadReport()">下载实验报告</a></td>--%>
                                <td><a class="hvr-bounce-to-right" href="<%=basesite%>experiment/downloadreport?experimentfile=${experreport.filename}&experimentname=${experreport.experimentname}&cnt=${experreport.downloadcnt}&username=${experreport.username}">下载实验报告</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <%--<div style="text-align: center">--%>
                        <%--<p>--%>
                            <%--<a class="type-info" href="<%=basesite%>evaluate/showevaluate?curpage=1">首页</a>--%>
                            <%--<a class="type-info" href="<%=basesite%>evaluate/showevaluate?curpage=${curpage-1 eq 0?1:curpage-1}">上一页</a>--%>
                            <%--<a class="type-info" href="<%=basesite%>evaluate/showevaluate?curpage=${curpage eq pagenum?pagenum:curpage+1}">下一页</a>--%>
                            <%--<a class="type-info" href="<%=basesite%>evaluate/showevaluate?curpage=${pagenum}">末页</a>--%>
                        <%--</p>--%>
                        <%--<p>当前第${curpage}页/共${pagenum}页,一共有${counts}条记录, 每页 ${pagesize} 条</p>--%>
                        <%--跳转到第<input type="number" id = "page" size="2">页--%>
                        <%--<a class="hvr-bounce-to-right" onclick="gotoPage()" >跳转</a>--%>
                        <%--&lt;%&ndash;<input type="button" class="hvr-bounce-to-right" onclick="gotoPage()" value="跳转">&ndash;%&gt;--%>
                    <%--</div>--%>
                </div>
            </div>
        </div>
    </div>

    <script>
        function downloadReport() {
            window.location.href="<%=basesite%>experiment/downloadreport?experimentfile=${experreport.filename}&experimentname=${experreport.experimentname}&cnt=${experreport.downloadcnt}&username=${experreport.username}";
            window.location.reload();
        }
    </script>

    <!--typo end here-->
    <%@include file="../../footer.jsp"%>
</body>
</html>
