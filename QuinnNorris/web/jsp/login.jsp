<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>女生节 - 心愿墙</title>

    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

</head>

<body class="gray-bg" style="background: url(${pageContext.request.contextPath}/img/bg.jpg) center center no-repeat; background-size:100% 100%">

<div class="middle-box text-center loginscreen animated fadeInDown">
    <div>
        <div>

            <h1 class="logo-name" style="font-size: 110px;font-weight: 400;position: relative;right: 6px;bottom: 10px;">&nbsp;</h1>

        </div>
        <p></p>
        <div class="m-t" role="form">
            <div class="form-group">
                <input type="text" class="form-control" id="logphone" placeholder="手机号">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="密码" id="logpw">
            </div>
            <div><span style="float: left;margin: 0px 0 15px 3px;"><small id="tipl" hidden
                                                                          style="color: #b1b1b1;"></small></span></div>
            <button type="submit" class="btn btn-primary block full-width m-b"
                    style="background-color: #ed5565;border-color: #ed5565;" onclick="sign_login()">
                登录
            </button>

            <a href="${pageContext.request.contextPath}/forget">
                <small>忘记密码?</small>
            </a>
            <div style="height: 10px;"></div>
            <a class="btn btn-sm btn-white btn-block" href="${pageContext.request.contextPath}/register">注册 - 创建账户</a>
        </div>
        <p class="m-t">
            <small><strong>Copyright &copy; </strong>2018 ECNU SCSSE 公共关系中心</small>
        </p>
    </div>
</div>

<!-- Mainly scripts -->
<script src="${pageContext.request.contextPath}/js/jquery-2.1.1.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/md5.js"></script>

</body>
<script>
    var urldomain = "${pageContext.request.contextPath}";

    function sign_login() {
        var ppw = $("#logpw").val();
        var pw = hex_md5($("#logpw").val());
        var phone = $("#logphone").val();
        if (phone == null || phone.trim() == "") {
            if (typeof($("#tipl").attr("hidden")) != "undefined") $("#tipl").removeAttr("hidden");
            $("#tipl").text("请填写手机号码");
        } else if (ppw == null || ppw.trim() == "") {
            if (typeof($("#tipl").attr("hidden")) != "undefined") $("#tipl").removeAttr("hidden");
            $("#tipl").text("请输入密码");
        } else {
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
                        $("#tipl").removeAttr("hidden");
                        $("#tipl").text("该手机号码尚未注册");
                    }
                    else if (data.errorCode == "0")
                        window.location.href = urldomain + "/home";
                    else {
                        $("#tipl").removeAttr("hidden");
                        $("#tipl").text("手机号或密码错误，请重试");
                    }
                }
            });
        }
    }
</script>
</html>
