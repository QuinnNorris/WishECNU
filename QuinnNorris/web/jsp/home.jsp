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

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">规则说明</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <br/>
                    注册后每人获得五颗爱心，每发一个心愿少一个爱心，即每人每次最多许<span style="color: hotpink">5个</span>心愿。愿望被完成或愿望过期（<span
                        style="color: hotpink">24小时</span>无人接或接下心愿后24小时内未完成算过期）可<span style="color: hotpink">重新</span>获得一个心愿。
                    <br/><br/>
                    <span style="color: hotpink">一旦心愿被领取，可获得该许愿者的联系方式。</span>一次最多可以接5个愿望，愿望完成后才可接下其他心愿，一旦接下心愿后不可中途放弃，该愿望超过24小时或被确认后算完成。
                    <br/>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModal0" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <img class="media-object blog-profile" data-src="holder.js/64x64" alt="64x64"
                                               src="${pageContext.request.contextPath}/img/2wei.jpg"
                                               style="width: 100%;height: 100%" >
                </div>
            </div>
        </div>
    </div>
</div>

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
                <h2 style="padding-top: 5px;">我的心愿</h2>
            </div>
            <div class="col-lg-2">

            </div>
        </div>


        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-6">
                    <div class="widget style1 navy-bg" onclick="window.location.href='${pageContext.request.contextPath}/post'">
                        <div class="row">
                            <div class="col-xs-4">
                                <i class="fa fa-magic fa-5x"></i>
                            </div>
                            <div class="col-xs-8 text-right">
                                <span> 剩余可许下心愿数 </span>
                                <h2 class="font-bold">${have_post}</h2>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="widget style1 red-bg" onclick="window.location.href='${pageContext.request.contextPath}/get'">
                        <div class="row">
                            <div class="col-xs-4">
                                <i class="fa fa-heart fa-5x"></i>
                            </div>
                            <div class="col-xs-8 text-right">
                                <span> 剩余可领取心愿数 </span>
                                <h2 class="font-bold">${have_get}</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <a style="float: left;color: #b9b9b9;" data-toggle="modal" data-target="#myModal0">心愿墙二维码</a>
            <a style="float: right;color: #b9b9b9;" data-toggle="modal" data-target="#myModal">规则说明</a>
            <hr/>
            <div style="height: 10px;"></div>
            <div class="row">
                <div class="col-xs-12">
                    <c:if test="${have_post > 0}">
                        <button class="btn btn-outline btn-danger dim btn-block" type="button"
                                onclick="window.location.href = '${pageContext.request.contextPath}/create'">许下一个心愿
                        </button>
                    </c:if>
                </div>
            </div>
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

</html>
