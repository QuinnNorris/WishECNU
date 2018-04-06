<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

</head>

<body style="overflow: visible;background: url(${pageContext.request.contextPath}/assets/img/bg8.jpg) center center fixed;">

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
                        <a class="tooltip-tip ajax-load" href="${pageContext.request.contextPath}/wishlist"
                           title="wishlist">
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
                        <i class="icon-view-list"></i>
                        <span>心愿列表
                            </span>
                    </h2>
                </div>
            </div>
        </div>

        <div class="row" style="height:13px;">
            <hr style="    position: relative;
    top: 44px;"/>
        </div>

        <div class="content-wrap">
            <div class="row">
                <div class="btn-group btn-group-justified" role="group" aria-label="">
                    <div class="btn-group" role="group" style="    border-right: 1px solid #dddddd;">
                        <a href="#" class="btn dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-haspopup="true" aria-expanded="false"
                           style="color: #848484;    border-color: #ffffff!important;" id="last_show">
                            一周内 &nbsp;<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#" style="color: #848484!important" onclick="chlast(0)" id="last0">三天内</a></li>
                            <li><a href="#" style="color: #848484!important" onclick="chlast(1)" id="last1">一周内</a></li>
                            <li><a href="#" style="color: #848484!important" onclick="chlast(2)" id="last2">所有</a></li>
                        </ul>
                    </div>
                    <div class="btn-group" role="group" style="    border-right: 1px solid #dddddd;">
                        <a href="#" class="btn dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-haspopup="true" aria-expanded="false"
                           style="color: #848484;    border-color: #ffffff!important;" id="status_show">
                            未实现 &nbsp;<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#" style="color: #848484!important" onclick="chstatus(0)" id="status0">未实现</a>
                            </li>
                            <li><a href="#" style="color: #848484!important" onclick="chstatus(1)" id="status1">已实现</a>
                            </li>
                            <li><a href="#" style="color: #848484!important" onclick="chstatus(2)" id="status2">全部</a>
                            </li>
                        </ul>
                    </div>
                    <div class="btn-group" role="group">
                        <a href="#" class="btn dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-haspopup="true" aria-expanded="false"
                           style="color: #848484;    border-color: #ffffff!important;" id="sort_show">
                            时间 &nbsp;<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#" style="color: #848484!important" onclick="chsort(0)" id="sort0">时间</a></li>
                            <li><a href="#" style="color: #848484!important" onclick="chsort(1)" id="sort1">关注度</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="content-wrap">
            <hr/>
            <div class="row" style="height: 450px;overflow: scroll;">

                <c:if test="${wishs_size != 0}">

                    <c:forEach items="${wishs}" var="item">

                        <div class="col-xs-12 col-md-6 col-lg-4" style="margin: 0">
                            <div class="nest" style="cursor: pointer" onclick="to_one_wish(${item.wish_id})">
                                <div class="title-alt"
                                     style="background: url(${pageContext.request.contextPath}/assets/img/${item.sexs}.jpg) center center no-repeat;background-size: cover; color:white; height: 40px;">
                                    <h6 style="left: 10px;padding: 0;top: 0;">
                                        <img class="media-object img-circle blog-profile" data-src="holder.js/64x64"
                                             alt="64x64"
                                             src="${pageContext.request.contextPath}/assets/img/${item.headp}.jpg"
                                             height="48px">
                                        <div style="float:  left;"><span
                                                style="color: ${item.wish_color};position:relative;top: 13px;left: 4px;font-family: monospace;">${item.wish_status_cn}</span>
                                        </div>
                                    </h6>
                                    <h4 style="position: relative;top: 12px;left: 17px;">${item.nickname}&nbsp;</h4>
                                </div>
                                <div class="body-nest sexs${item.sexs}colors"
                                     style="border-bottom: 1px solid ${item.sexs_color};border-left: 1px solid ${item.sexs_color};border-right: 1px solid ${item.sexs_color};">
                                    <div style="margin-top: 13px;margin-left: 60px;"><span
                                            style="font-size: 17px;color: #8c8c8c;">${item.titles}</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </c:forEach>

                </c:if>

            </div>
            <hr/>
            <input type="hidden" value="${last_search}" id="last_search"/>
            <input type="hidden" value="${come_true}" id="come_true"/>
            <input type="hidden" value="${sort_as}" id="sort_as"/>
            <input type="hidden" value="${page_now}" id="page_now"/>
            <div class="row">
                <div class="col-xs-6">
                    <a style="color: #8c8c8c;cursor: pointer" onclick="get_a_pages(0)">上一页</a>
                </div>
                <div class="col-xs-6" style="text-align: right">
                    <a style="    color: #8c8c8c;cursor: pointer" onclick="get_a_pages(1)">下一页</a>
                </div>
            </div>
        </div>

        <div class="footer-space"></div>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/md5.js"></script>

</body>
<script>
    var urldomain = "${pageContext.request.contextPath}";

    $(function () {
        $("#last_show").html($("#last" + $("#last_search").val()).html() + '&nbsp;&nbsp;<span class="caret"></span>');
        $("#status_show").html($("#status" + $("#come_true").val()).html() + '&nbsp;&nbsp;<span class="caret"></span>');
        $("#sort_show").html($("#sort" + $("#sort_as").val()).html() + '&nbsp;&nbsp;<span class="caret"></span>');

    });

    function chlast(chnm) {
        $("#last_show").html($("#last" + chnm).html() + '&nbsp;&nbsp;<span class="caret"></span>');
        $("#last_search").val(chnm);
        gotopage();
    }

    function chstatus(chnum) {
        $("#status_show").html($("#status" + chnum).html() + '&nbsp;&nbsp;<span class="caret"></span>');
        $("#come_true").val(chnum);
        gotopage();
    }

    function chsort(chnum) {
        $("#sort_show").html($("#sort" + chnum).html() + '&nbsp;&nbsp;<span class="caret"></span>');
        $("#sort_as").val(chnum);
        gotopage();
    }

    function get_a_pages(toPage) {
        var to_page = $("#page_now").val();
        if (Number(toPage) == 0) to_page--;
        if (Number(toPage) == 1) to_page++;
        if (to_page < 0) return;
        $("#page_now").val(to_page);
        gotopage();
    }

    function gotopage() {
        var last_search = $("#last_search").val();
        var come_true = $("#come_true").val();
        var sort_as = $("#sort_as").val();
        var to_page = $("#page_now").val();
        window.location.href = urldomain + '/wishlistlist?last_search=' + last_search +
            '&come_true=' + come_true + '&sort_as=' + sort_as + '&to_page=' + to_page;
    }

    function to_one_wish(wishid) {
        window.location.href = urldomain + '/seewish?wishid=' + wishid;
    }

</script>
</html>
