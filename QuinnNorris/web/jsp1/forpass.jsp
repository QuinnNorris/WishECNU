<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>ECNU心愿墙</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes"/>

    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/loader-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/signin.css">

</head>

<body style="overflow: visible; background: url(assets/img/bg8.jpg) center center no-repeat fixed;">
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
                            <label for="inputUsernameEmail">手机号</label>
                            <input type="text" id="inputUsernameEmail" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="inputPassword">重设密码</label>
                            <input type="password" id="inputPassword" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="inputPasswords">确认密码</label>
                            <input type="password" id="inputPasswords" class="form-control">
                        </div>
                        <label for="inputPasswords">验证手机号</label>
                        <div class="input-group">

                            <input type="text" class="form-control" placeholder="">
                            <span class="input-group-btn">
                                <button class="btn btn-default" style="color: #848484" type="button">发送验证码</button>
                            </span>
                        </div>
                        <div style="height:17px;"></div>
                        <div class="checkbox pull-left">
                            <label>
                                <input type="checkbox">记住用户名</label>
                        </div>
                        <button class="btn btn btn-primary pull-right" type="submit">
                            找 回
                        </button>
                        <div class="or-box">
                            <center><span class="text-center login-with"><b><a href="${pageContext.request.contextPath}/login">登录</a></b> or 注册</span>
                            </center>
                        </div>
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

<!-- MAIN EFFECT -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/preloader.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/app.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/load.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/main.js"></script>

</body>
<script>
    var urldomain="${pageContext.request.contextPath}";
    function for_pw() {
        var email = $("#foremail").val();
        if (!isEmail(email)) {
            if (typeof($("#tip2").attr("hidden")) != "undefined") $("#tip2").removeAttr("hidden");
            $("#tip2").text("邮件格式有误");
        }
        else {
            $.ajax({
                url: '/forget',
                type: 'post',
                contentType: 'application/x-www-form-urlencoded',
                data: {email: email},
                dataType: "json",
                success: function (data) {
                    if (data.errorCode == "0") {
                        if (typeof($("#tip2").attr("hidden")) != "undefined") $("#tip2").removeAttr("hidden");
                        $("#tip2").text("邮件发送成功");
                    }
                    else if (data.errorCode == "1") {
                        if (typeof($("#tip2").attr("hidden")) != "undefined") $("#tip2").removeAttr("hidden");
                        $("#tip2").text("邮件发送失败");
                    }
                }
            });
        }
    }

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
