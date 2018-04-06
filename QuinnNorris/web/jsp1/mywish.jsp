<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>ECNU心愿墙</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/loader-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css">
</head>

<body style="overflow: visible;background: url(${pageContext.request.contextPath}/assets/img/bg8.jpg) center center no-repeat fixed;">

<!-- TOP NAVBAR -->
<nav role="navigation" class="navbar navbar-static-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <div id="logo-mobile" class="visible-xs">
                <h1>心愿墙 <span style="top: 0px;">ECNU</span></h1>
            </div>
        </div>
        <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
            <ul style="margin-right:0;" class="nav navbar-nav navbar-right">
                <li>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <img alt="" class="admin-pic img-circle"
                             src="${pageContext.request.contextPath}/assets/img/10.jpg">Hi, Dave Mattew
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div id="skin-select">
    <div id="logo">
        <h1>心愿墙 <span>ECNU</span></h1>
    </div>

    <a id="toggle"><span class="entypo-menu"></span></a>

    <div class="skin-part">
        <div id="tree-wrap">
            <div class="side-bar">
                <ul class="topnav menu-left-nest">
                    <li>
                        <a class="tooltip-tip ajax-load" href="${pageContext.request.contextPath}/wishlist" title="wishlist">
                            <i class="icon icon-view-list"></i>
                            <span style="top: 1px;">心愿列表</span>

                        </a>
                    </li>
                    <li>
                        <a class="tooltip-tip ajax-load" href="${pageContext.request.contextPath}/create" title="Mail">
                            <i class="icon icon-direction"></i>
                            <span style="top: 1px;">发布心愿</span>
                        </a>
                    </li>
                    <li>
                        <a class="tooltip-tip ajax-load" href="${pageContext.request.contextPath}/mywish" title="Icons">
                            <i class="icon-heart"></i>
                            <span style="top: 1px;">接受心愿</span>
                        </a>
                    </li>
                    <li>
                        <a class="tooltip-tip " href="${pageContext.request.contextPath}/signout" title="login">
                            <i class="icon entypo-login"></i>
                            <span style="top: 3px;">更换账户</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="wrap-fluid">
    <div class="container-fluid paper-wrap bevel tlbr">
        <div class="row">
            <div id="paper-top">
                <div class="col-sm-6">
                    <h2 class="tittle-content-header">
                        <i class="icon-heart"></i>
                        <span>我接受的心愿
                            </span>
                    </h2>
                </div>
            </div>
        </div>

        <div class="content-wrap">
            <div style="height:20px;"></div>
            <div class="row">
                <div class="col-xs-4">
                    <img src="${pageContext.request.contextPath}/assets/img/${myheadp}.jpg" class="avatar img-circle" style="width: 100%;height: 100%;"
                         alt="avatar">
                </div>
                <div class="col-xs-8" style="margin-bottom: 0;">
                    <div class="row" style="text-align: left">
                        <p style="color:#0d1832;font-size: 16px;">${mytitles}</p>
                        <hr style="margin-bottom: 5px;margin-top: 0"/>
                    </div>
                    <div class="row">
                        <div class="">
                            <p style="color: ${mysexscolor};text-align: left;/*#6e89e2*/">${mynickname}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-offset-1 col-xs-11"
                     style="margin-bottom: 20px;">
                    <div style="margin: 20px 0px 20px 0px">
                        <p style="color: #65676b; font-size: 16px;">
                            ${myinners}</p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-offset-1 col-xs-11" style="    margin-bottom: 0;padding: 0;">
                    <hr style="margin: 0 0 10px 0;"/>
                    <div class="col-xs-12">
                        <p style="margin: 7px 0 0 -10px;"><i style="position: relative;top: 1px;" class="icon-heart"></i> ${myconn_type}:&nbsp;${myconn}</p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-offset-1 col-xs-10" style="    margin-bottom: 0;">
                    <p style="margin: 7px 0 0 -10px; text-align: center">等待Ta确认"心愿已实现"后<br/>您才可以接受下一个新的心愿</p>
                    <hr/></div>
            </div>

        </div>

        <div class="footer-space" style=""><small style="    position: relative;top: 12px;">&nbsp;联系方式有问题？请发邮件至：aaa_aaaaa_aaa@bbb.com</small></div>
        <div id="footer">
            <div class="devider-footer-left"></div>
            <div class="time">
                <p id="spanDate">
                <p id="clock">
            </div>
            <div class="copyright">Copyright(C) ECNU SCSSE 公共关系中心
            </div>
            <div class="devider-footer"></div>
        </div>


    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/preloader.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/app.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/load.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/main.js"></script>


<script src="${pageContext.request.contextPath}/assets/js/button/ladda/spin.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/button/ladda/ladda.min.js"></script>
<script src='${pageContext.request.contextPath}/assets/js/button/progressbutton.jquery.js'></script>

</body>

</html>