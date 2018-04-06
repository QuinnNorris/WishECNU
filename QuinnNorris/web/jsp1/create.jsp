<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html style="width: 100%;height: 100%">

<head>
    <meta charset="utf-8">
    <title>ECNU心愿墙</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/loader-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/button/ladda/ladda.min.css">

</head>

<body style="overflow: scroll;background: url(${pageContext.request.contextPath}/assets/img/bg8.jpg) center center no-repeat fixed;width: 100%;height: 100%;">

<!-- TOP NAVBAR -->
<nav role="navigation" class="navbar navbar-static-top" style="height: 5%">
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

<div class="wrap-fluid" style="height: 90%">
    <div class="container-fluid paper-wrap bevel tlbr" style="height: 100%">
        <div class="row">
            <div id="paper-top">
                <div class="col-sm-6">
                    <h2 class="tittle-content-header">
                        <i class="icon-direction"></i>
                        <span>发布心愿
                            </span>
                    </h2>
                </div>
            </div>
        </div>

        <div class="content-wrap">

            <div class="nest" id="b1">
                <div class="title-alt">
                    <h6 style="font-family: inherit;">选择<b>自己</b>的性别</h6>
                </div>
                <div class="body-nest">
                    <div style="height: 30px"></div>
                    <button type="button" class="btn btn-default btn-lg btn-block"
                            style="background: url(${pageContext.request.contextPath}/assets/img/bg13.jpg) center center no-repeat; background-size: cover;  border-radius: 0px ;height: 40px;"
                            onclick="get2sel(0)"><i
                            class="fa fa-mars" style="font-size: 18px;"></i></button>
                    <div style="height: 40px"></div>
                    <button type="button" class="btn btn-default btn-lg btn-block"
                            style="background: url(${pageContext.request.contextPath}/assets/img/sf1.jpg) center center ; background-size: cover; border-radius: 0px;height: 40px;"
                            onclick="get2sel(1)"><i
                            class="fa fa-venus" style="font-size: 18px;"></i></button>

                </div>
            </div>

            <div class="nest" id="b2" hidden="hidden">
                <div class="title-alt">
                    <h6 style="font-family: inherit;">选一个喜欢的头像</h6>
                </div>
                <div class="body-nest" style="padding: 0">
                    <div style="height: 20px"></div>
                    <div class="col-xs-4" style="padding: 0 4px 0 16px;">
                        <div><img src="assets/img/01.jpg" style="width: 100%;height: 100%;cursor: pointer;"
                                  onclick="get3sel(0)" id="p0">
                            <p style="height:5px;">
                            <hr/>
                            </p><img src="assets/img/01.jpg"
                                     style="width: 100%;height: 100%;cursor: pointer;"
                                     onclick="get3sel(1)" id="p1">
                            <p style="height:5px;">
                            <hr/>
                            </p><img src="assets/img/01.jpg"
                                     style="width: 100%;height: 100%;cursor: pointer;"
                                     onclick="get3sel(2)" id="p2">
                            <p style="height:5px;">
                            <hr/>
                            </p><img src="assets/img/01.jpg"
                                     style="width: 100%;height: 100%;cursor: pointer;"
                                     onclick="get3sel(3)" id="p3">
                        </div>
                    </div>
                    <div class="col-xs-4" style="padding: 0 10px 0 10px;">
                        <div><img src="assets/img/01.jpg" style="width: 100%;height: 100%;cursor: pointer;"
                                  onclick="get3sel(4)" id="p4">
                            <p style="height:5px;">
                            <hr/>
                            </p><img src="assets/img/01.jpg"
                                     style="width: 100%;height: 100%;cursor: pointer;"
                                     onclick="get3sel(5)" id="p5">
                            <p style="height:5px;">
                            <hr/>
                            </p><img src="assets/img/01.jpg"
                                     style="width: 100%;height: 100%;cursor: pointer;"
                                     onclick="get3sel(6)" id="p6">
                            <p style="height:5px;">
                            <hr/>
                            </p><img src="assets/img/01.jpg"
                                     style="width: 100%;height: 100%;cursor: pointer;"
                                     onclick="get3sel(7)" id="p7">
                            <div style="height: 20px"></div>
                        </div>
                    </div>
                    <div class="col-xs-4" style="padding: 0 16px 0 4px;">
                        <div><img src="assets/img/01.jpg" style="width: 100%;height: 100%;cursor: pointer;"
                                  onclick="get3sel(8)" id="p8">
                            <p style="height:5px;">
                            <hr/>
                            </p><img src="assets/img/01.jpg"
                                     style="width: 100%;height: 100%;cursor: pointer;"
                                     onclick="get3sel(9)" id="p9">
                            <p style="height:5px;">
                            <hr/>
                            </p><img src="assets/img/01.jpg"
                                     style="width: 100%;height: 100%;cursor: pointer;"
                                     onclick="get3sel(10)" id="p10">
                            <p style="height:5px;">
                            <hr/>
                            </p><img src="assets/img/01.jpg"
                                     style="width: 100%;height: 100%;cursor: pointer;"
                                     onclick="get3sel(11)" id="p11">
                        </div>
                    </div>
                </div>
            </div>

            <div class="nest" id="b3" hidden="hidden">
                <div class="title-alt">
                    <h6 style="font-family: inherit;">分别写下心愿的标题和内容</h6>
                </div>
                <div class="body-nest">
                    <div style="height: 10px"></div>
                    <input type="text" placeholder="" maxlength="20" id="titles"
                           style="border: 1px solid #dddddd;width: 100%;height: 40px;    font-size: 15px;color: #0d1832"/>
                    <div style="height: 10px;">
                        <hr/>
                    </div>
                    <div style="height: 10px;"></div>
                    <div>
                            <textarea name="message" id="message" placeholder="" rows="8" maxlength="500"
                                      style="line-height: 22px;border: 1px solid #dddddd;width: 100%;resize: none;color: #0d1832;font-size: 13px;"></textarea>
                        <div style="height: 30px;">
                            <hr/>
                        </div>
                        <button type="button" class="btn btn-default btn-lg btn-block" id="bub3"
                                style="border-radius: 0px;height: 40px;" onclick="get4sel()"><i id="b3button"
                                                                                                class="fa fa-venus"
                                                                                                style="font-size: 18px;"></i>
                        </button>
                    </div>
                </div>
            </div>


            <div class="nest" id="b4" hidden="hidden">
                <div class="title-alt">
                    <h6 style="font-family: inherit;">为Ta，留下一种联系方式</h6>
                </div>
                <div class="body-nest">
                    <div style="height: 10px"></div>
                    <div class="input-group">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"
                                    id="megp"
                                    aria-haspopup="true" aria-expanded="false" style="    height: 40px!important;">
                                QQ
                                <span class="caret"></span>
                            </button>
                            <input type="hidden" id="hidm" value="0">
                            <ul class="dropdown-menu">
                                <li><a href="javascript:void(0);" id="me0" onclick="change4sel(0)"
                                       style="color: #848484!important">QQ</a></li>
                                <li><a href="javascript:void(0);" id="me1" onclick="change4sel(1)"
                                       style="color: #848484!important">微信</a></li>
                                <li><a href="javascript:void(0);" id="me2" onclick="change4sel(2)"
                                       style="color: #848484!important">手机号</a></li>
                                <li><a href="javascript:void(0);" id="me3" onclick="change4sel(3)"
                                       style="color: #848484!important">邮箱</a></li>
                            </ul>
                        </div><!-- /btn-group -->
                        <input type="text" class="form-control" style="height: 40px!important;"
                               aria-label="..." id="postconn">
                    </div>
                    <div style="height: 30px">
                        <hr/>
                    </div>
                    <button type="button" class="btn btn-default btn-lg btn-block" id="bub4"
                            style="border-radius: 0px;height: 40px;" onclick="get5sel()"><i id="b4button"
                                                                                            class="fa fa-venus"
                                                                                            style="font-size: 18px;"></i>
                    </button>
                </div>
            </div>

            <div class="nest" id="b5" hidden="hidden">
                <div class="title-alt">
                    <h6 style="font-family: inherit;">最后，为自己起一个昵称</h6>
                </div>
                <div class="body-nest">
                    <div style="height: 10px"></div>
                    <input type="text" placeholder="" maxlength="7" id="usernames"
                           style="border: 1px solid #dddddd;width: 100%;height: 40px;    font-size: 15px;color: #0d1832"/>
                    <div style="height: 10px;">
                        <hr/>
                    </div>
                    <div style="height: 30px"></div>
                    <button type="button" class="btn btn-default btn-lg btn-block" id="bub5"
                            style="border-radius: 0px;height: 40px;" onclick="post_new_wish()">发布我的心愿
                    </button>
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


<script src="${pageContext.request.contextPath}/assets/js/button/ladda/spin.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/button/ladda/ladda.min.js"></script>
<script src='${pageContext.request.contextPath}/assets/js/button/progressbutton.jquery.js'></script>


<script>

    var urldomain = "${pageContext.request.contextPath}";

    getsex = "";
    getheadp = "";
    gettitles = "";
    getinners = "";
    getconntype = "";
    getconn = "";
    getnickname = "";

    function post_new_wish() {
        getnickname = $("#usernames").val();
        var psexs = Number(getsex) ^ 1;
        $.ajax({
            url: urldomain + '/postnewwish',
            type: 'post',
            async: false,
            contentType: 'application/x-www-form-urlencoded',
            data: {
                nickname: getnickname,
                titles: gettitles,
                inners: getinners,
                conn_type: getconntype,
                conn: getconn,
                sexs: psexs,
                headp: psexs + '' + getheadp
            },
            dataType: "json",
            success: function (data) {
                if (data.errorCode == 'login')
                    window.location.href = urldomain + "/login";
                else
                    window.location.href = urldomain + "/create";
            }
        });
    }

    function get2sel(sex) {
        getsex = sex;
        var psex = Number(getsex) ^ 1;
        $("#sb-site").attr('style', 'height:auto;');
        $("#b1").attr("hidden", "hidden");
        for (var i = 0; i < 12; i++)
            $("#p" + i).attr("src", urldomain + "/assets/img/" + psex + i + ".jpg");
        $("#b2").show();
    }

    function get3sel(headp) {
        getheadp = headp;
        $("#b2").attr("hidden", "hidden");
        $("#b2").attr("style", "");
        if (Number(getsex) == 0) {
            $("#b3button").attr("class", "fa fa-mars");
            $("#bub3").attr("style", "border-radius: 0px;height: 40px;background: url(" + urldomain + "/assets/img/bg13.jpg) center center no-repeat; background-size: cover;");

        } else {
            $("#b3button").attr("class", "fa fa-venus");
            $("#bub3").attr("style", "border-radius: 0px;height: 40px;background: url(" + urldomain + "/assets/img/sf1.jpg) center center no-repeat; background-size: cover;");
        }
        $("#b3").show();
    }

    function get4sel() {
        gettitles = $("#titles").val();
        getinners = $("#message").val();
        $("#sb-site").attr('style', 'height:100%;');
        $("#b3").attr("hidden", "hidden");
        $("#b3").attr("style", "");
        if (Number(getsex) == 0) {
            $("#b4button").attr("class", "fa fa-mars");
            $("#bub4").attr("style", "border-radius: 0px;height: 40px;background: url(" + urldomain + "/assets/img/bg13.jpg) center center no-repeat; background-size: cover;");
        } else {
            $("#b4button").attr("class", "fa fa-venus");
            $("#bub4").attr("style", "border-radius: 0px;height: 40px;background: url(" + urldomain + "/assets/img/sf1.jpg) center center no-repeat; background-size: cover;");
        }
        $("#b4").show();//希望有小姐姐陪我去看日出
    }

    function change4sel(getnum) {
        $("#megp").html($("#me" + getnum).text() + "&nbsp;<span class=\"caret\"></span>");
        $("#hidm").val(getnum);
    }

    function get5sel() {
        getconntype = $("#hidm").val();
        getconn = $("#postconn").val();
        $("#b4").attr("hidden", "hidden");
        $("#b4").attr("style", "");
        if (Number(getsex) == 0) {
            $("#bub5").attr("style", "border-radius: 0px;height: 40px;background: url(" + urldomain + "/assets/img/bg13.jpg) center center no-repeat; background-size: cover;");
        } else {
            $("#bub5").attr("style", "border-radius: 0px;height: 40px;background: url(" + urldomain + "/assets/img/sf1.jpg) center center no-repeat; background-size: cover;");
        }
        $("#b5").show();
    }

</script>
</body>

</html>
