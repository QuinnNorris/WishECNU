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
                    <li class="" style="margin-left: 7px;float:left;">
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
                <h2 style="padding-top: 5px;">心愿</h2>
            </div>
            <div class="col-lg-2">

            </div>
        </div>


        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                    <div class="widget-head-color-box ${seesexscolor} p-lg text-center">
                        <div class="m-b-md">
                            <h2 class="font-bold no-margins">
                                ${seetitle}
                            </h2>
                            <small style="position: relative;top: 8px;">${seenickname}</small>
                        </div>
                        <img src="${pageContext.request.contextPath}/img/${seeheadp}.jpg"
                             style="height: 100%;width: 100%;"
                             class="img-circle circle-border m-b-md" alt="profile">
                        <div>
                            <span><i class="fa fa-clock-o"></i> ${seetime}</span> |
                            <span><i class="fa fa-mouse-pointer"></i> ${seecares}次</span> |
                            <span><i class="fa fa-star"></i> 待接受</span>
                        </div>
                    </div>
                    <div class="widget-text-box">
                        <p>${seeinners}</p>
                        <div class="text-right">
                            <a class="btn btn-xs ${seesexsbutton}" onclick="comethiswish()"><i class="fa fa-heart"></i>
                                领取这个心愿</a>
                        </div>
                    </div>
                </div>
            </div>

            <hr/>
            <input type="hidden" value="${wishid}" id="wishids">
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

    function comethiswish() {
        if (window.confirm("确认领取这个心愿？")) {
            $.ajax({
                url: urldomain + '/comethiswish',
                type: 'post',
                contentType: 'application/x-www-form-urlencoded',
                data: {
                    wishid: $("#wishids").val()
                },
                dataType: "json",
                success: function (data) {
                    if (data.errorCode == "00") {
                        alert('心愿被其他人抢先领走啦，去看看别的吧');
                    } else if (data.errorCode == "login") {
                        window.location.href = urldomain + "/login";
                    } else if (data.errorCode == "01") {
                        alert('您可领取的心愿已达上限啦');
                    } else if (data.errorCode == "02") {
                        alert('自己不能领取自己发布的心愿哦');
                    } else
                        window.location.href = urldomain + '/getwish?wishid=' + $("#wishids").val();

                }
            });
        } else {
            return;
        }

    }
</script>
</html>
