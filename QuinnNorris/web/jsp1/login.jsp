<%--
  Created by IntelliJ IDEA.
  User: quinn_norris
  Date: 2017/10/22
  Time: 下午7:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>ECNU心愿墙</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes"/>
    <!-- Le styles -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/loader-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/signin.css">

</head>

<body style="    overflow: visible;
    background: url(assets/img/bg8.jpg) center center no-repeat fixed;">
<!-- Preloader -->
<div id="preloader">
    <div id="status">&nbsp;</div>
</div>

<div class="container">


    <div class="" id="login-wrapper">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div id="logo-login">
                    <h1>心愿墙
                        <span>ECNU</span>
                    </h1>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="account-box">
                    <div role="form">
                        <div class="form-group">
                            <!--a href="#" class="pull-right label-forgot">Forgot email?</a-->
                            <label for="logphone">手机号</label>
                            <input type="text" id="logphone" class="form-control">
                        </div>
                        <div class="form-group">
                            <a href="${pageContext.request.contextPath}/forpass" class="pull-right label-forgot">忘记密码?</a>
                            <label for="logpw">密码</label>
                            <input type="password" id="logpw" class="form-control">
                        </div>
                        <div><span><small id="tipl" hidden style="color: #b1b1b1;"></small></span>
                        </div>
                        <div class="checkbox pull-left">
                            <label>
                                <input type="checkbox">记住用户名</label>
                        </div>
                        <button class="btn btn btn-primary pull-right" type="submit"
                                onclick="sign_login()">
                            登 录
                        </button>
                    </div>
                    <div class="or-box">
                        <center><span class="text-center login-with">登录 or <b><a href="${pageContext.request.contextPath}/signup">注册</a></b></span>
                        </center>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <p>&nbsp;</p>
    <div style="text-align:center;margin:0 auto;">
        <h6 style="color:#fff;">Copyright(C)2018 wish.quinnnorris.com All Rights Reserved.<br/>
            ECNU SCSSE 公共关系中心 版权所有 </h6>
    </div>

</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/preloader.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/app.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/load.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/md5.js"></script>

</body>
<script>
    var urldomain="${pageContext.request.contextPath}";
    function sign_login() {
        var pw = hex_md5($("#logpw").val());
        var phone = $("#logphone").val();
        if (phone == null) {
            if (typeof($("#tipl").attr("hidden")) != "undefined") $("#tipl").removeAttr("hidden");
            $("#tipl").text("请填写手机号码");
        } else if (pw == null) {
            if (typeof($("#tipl").attr("hidden")) != "undefined") $("#tipl").removeAttr("hidden");
            $("#tipl").text("请输入密码");
        }
        $.ajax({
            url: urldomain + '/tologin',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {
                phone: phone,
                pw: pw
            },
            dataType: "json",
            success: function (data) {
                if (data.errorCode == "1") {
                    if (typeof($("#tipl").attr("hidden")) != "undefined") {
                        $("#tipl").removeAttr("hidden");
                        $("#tipl").text("该手机号码尚未注册");
                    }
                }
                else if (data.errorCode == "0")
                    window.location.href = urldomain + "/wishlist";
                else {
                    if (typeof($("#tipl").attr("hidden")) != "undefined") {
                        $("#tipl").removeAttr("hidden");
                        $("#tipl").text("手机号或密码错误，请重试");
                    }
                }
            }
        });
    }
</script>
</html>
