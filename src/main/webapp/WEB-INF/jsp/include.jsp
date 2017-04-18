<%--
  Created by IntelliJ IDEA.
  User: wangl
  Date: 2017/2/28
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
    String basepath=request.getContextPath();
    String basesite=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+basepath+'/';
%>

<link href="<%=basepath%>/ui/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<link href="<%=basepath%>/ui/css/chocolat.css" rel="stylesheet" type="text/css" media="all">
<link href="<%=basepath%>/ui/css/style.css" rel="stylesheet" type="text/css" media="all">

<script src="<%=basepath%>/ui/js/easing.js"></script>
<script src="<%=basepath%>/ui/js/jquery.chocolat.js"></script>
<script src="<%=basepath%>/ui/js/jquery.hoverdir.js"></script>
<script src="<%=basepath%>/ui/js/jquery-1.11.0.min.js"></script>
<script src="<%=basepath%>/ui/js/menu_jquery.js"></script>
<script src="<%=basepath%>/ui/js/modernizr.custom.97074.js"></script>
<script src="<%=basepath%>/ui/js/move-top.js"></script>
