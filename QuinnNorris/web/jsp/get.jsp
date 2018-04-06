<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>女生节-心愿墙</title>

    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

</head>

<body>

<div id="wrapper">

    <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top " role="navigation"
                 style="margin-bottom: 0;background-color: #273a4a;">
                <ul class="nav navbar-top-links " style="">
                    <li class="active" style="margin-left: 7px;float:left;">
                        <a class="" href="${pageContext.request.contextPath}/home">
                            <i class="fa fa-child" style="font-size: 20px;float:left;margin-left: 5px;"></i>
                        </a>
                    </li>
                    <li class="" style="float:right;">
                        <a class="" href="#" style="padding-bottom: 10px;">
                            <i class="fa fa-list" style="font-size: 20px;float:left;margin-left: 5px;"
                               onclick="if($('#disul').attr('style') == 'position:absolute;display:none;') $('#disul').attr('style','position:absolute;');
else $('#disul').attr('style','position:absolute;display:none;')"></i>
                        </a>
                        <ul class="nav navbar-top-links " id="disul" style="position:absolute;display:none;">
                            <li class="" style="    width: 300px;
    position: relative;
    right: 90px;background: #293846;    padding: 0 5px 2px 2px;">
                                <a class="" href="${pageContext.request.contextPath}/wishlist" style="padding-left: 25px;">
                                    <i class="fa fa-list" style="font-size: 17px;position: relative;
    top: 1px;"></i>&nbsp;&nbsp;
                                    <span style="font-weight: 200;">心愿列表</span>
                                </a>
                            </li>
                            <li class="" style="    width: 300px;
    position: relative;
    right: 90px;background: #293846;    padding: 0 5px 2px 2px;">
                                <a class="" href="${pageContext.request.contextPath}/wishlistfin" style="padding-left: 25px;">
                                    <i class="fa fa-heart" style="font-size: 17px;position: relative;
    top: 1px;"></i>&nbsp;&nbsp;
                                    <span style="font-weight: 200;">实现心愿</span>
                                </a>
                            </li>
                            <li class="" style="    width: 300px;
    position: relative;
    right: 90px;background: #293846;    padding: 0 5px 2px 2px;">
                                <a class="" href="${pageContext.request.contextPath}/wishlistall" style="padding-left: 25px;">
                                    <i class="fa fa-magic" style="font-size: 17px;position: relative;
    top: 1px;"></i>&nbsp;&nbsp;
                                    <span style="font-weight: 200;">所有心愿</span>
                                </a>
                            </li>

                        </ul>
                    </li>


                </ul>
            </nav>
        </div>
        <div style="height: 20px;"></div>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2 style="padding-top: 5px;">领取心愿列表</h2>
            </div>
            <div class="col-lg-2">

            </div>
        </div>


        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">

                <c:if test="${wishs_size != 0}">
                    <c:forEach items="${wishs}" var="item">
                        <div class="col-lg-3">
                            <div class="ibox float-e-margins" onclick="to_one_wish_get(${item.wish_id})">
                                <div class="ibox-title">
                                    <span class="label <%--label-info--%>${item.statusclass}  pull-right"><i
                                            class="fa fa-clock-o"></i> ${item.status}</span>
                                    <h5 style="font-weight: 400;">${item.nickname}</h5>
                                </div>
                                <div class="ibox-content" style="height: 83px;">
                                    <img class="media-object blog-profile" data-src="holder.js/64x64" alt="64x64"
                                         src="${pageContext.request.contextPath}/img/${item.headp}.jpg" height="57px"
                                         style="float: left;position:  relative;right:  4px;bottom: 3px;">
                                    <h2 class="no-margins"
                                        style="margin-left: 70px !important;font-size: 18px;font-weight: 300;">${item.titles}</h2>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>

            </div>
            <input type="hidden" value="${page_now}" id="page_now"/>
            <div class="row">
                <div class="col-xs-6">
                    <a style="color: #676b6c;" onclick="get_a_pages(0)">&nbsp;&nbsp;&nbsp;上一页</a>
                </div>
                <div class="col-xs-6" style="text-align: right">
                    <a style="    color: #676b6c;"onclick="get_a_pages(1)">下一页&nbsp;&nbsp;&nbsp;</a>
                </div>
            </div>
            <hr/>
            <div style="height: 10px;"></div>
        </div>
        <div class="footer">
            <div>
                <strong>Copyright &copy; </strong>2018 ECNU SCSSE 公共关系中心
            </div>
        </div>

    </div>
</div>


<!-- Mainly scripts -->
<script src="${pageContext.request.contextPath}/js/jquery-2.1.1.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="${pageContext.request.contextPath}/js/inspinia.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/pace/pace.min.js"></script>

<script src="${pageContext.request.contextPath}/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>


</body>
<script>

    var urldomain = "${pageContext.request.contextPath}";

    function get_a_pages(toPage) {
        var to_page = $("#page_now").val();
        if (Number(toPage) == 0) to_page--;
        if (Number(toPage) == 1) to_page++;
        if (to_page < 0) return;
        $("#page_now").val(to_page);
        window.location.href = urldomain + '/getlist?to_page=' + to_page;
    }

    function to_one_wish_get(wishid) {
        window.location.href = urldomain + '/getwish?wishid=' + wishid;
    }
</script>
</html>
