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
    <link href="${pageContext.request.contextPath}/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

</head>

<body class="gray-bg" style="background: url(${pageContext.request.contextPath}/img/bg.jpg) center center no-repeat; background-size:100% 100%">

<div class="middle-box text-center loginscreen   animated fadeInDown">
    <div>
        <div>
            <h1 class="logo-name" style="font-size: 100px;font-weight: 400;position: relative;right: 6px;bottom: 10px;">&nbsp;</h1>

        </div>
        <p></p>
        <div class="m-t" role="form">
            <div class="form-group">
                <input type="text" class="form-control" id="phone" placeholder="手机号">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" id="pw" placeholder="新密码">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" id="re_pw" placeholder="重复新密码">
            </div>
            <div class="input-group">

                <input type="text" class="form-control" id="yanzheng" placeholder="验证码">
                <span class="input-group-btn">
                                <button class="btn btn-default" style="color: #848484" onclick="yanzheng()"
                                        type="button">&nbsp;&nbsp;发送&nbsp;&nbsp;</button>
                            </span>
            </div>
            <div><span style="float: left;margin: 10px 0 15px 3px;"><small id="tip" hidden
                                                                           style="color: #b1b1b1;"></small></span></div>
            <div style="height: 15px;"></div>
            <button type="submit" class="btn btn-primary block full-width m-b"
                    style="background-color: #ed5565;border-color: #ed5565;" onclick="for_pw()">重设密码
            </button>

            <p class="text-muted text-center">
                <small>记起原有的密码?</small>
            </p>
            <a class="btn btn-sm btn-white btn-block" href="${pageContext.request.contextPath}/login">登录 - 使用账户</a>
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


    var getYZ = 'qnznp';

    function yanzheng() {
        var phone = $("#phone").val();
        if (phone.length != 11) {
            if (typeof($("#tip").attr("hidden")) != "undefined") $("#tip").removeAttr("hidden");
            $("#tip").text("手机格式错误");
        }
        $.ajax({
            url: urldomain + '/yanzheng',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {
                phone: phone
            },
            dataType: "json",
            success: function (data) {
                getYZ = data.object();
            }
        });
    }


    function for_pw() {
        var pw = hex_md5($("#pw").val());
        var re_pw = hex_md5($("#re_pw").val());
        var phone = $("#phone").val();
        var yanzheng = $("#yanzheng").val();
        if (pw != re_pw) {
            if (typeof($("#tip").attr("hidden")) != "undefined") $("#tip").removeAttr("hidden");
            $("#tip").text("两次密码不一致");
        } else if ($("#pw").val().length < 6) {
            if (typeof($("#tip").attr("hidden")) != "undefined") $("#tip").removeAttr("hidden");
            $("#tip").text("密码过短，不能少于6位");
        } else if ($("#pw").val().length > 20) {
            if (typeof($("#tip").attr("hidden")) != "undefined") $("#tip").removeAttr("hidden");
            $("#tip").text("密码过长，不能超过20位");
        } else if (phone.length != 11) {
            if (typeof($("#tip").attr("hidden")) != "undefined") $("#tip").removeAttr("hidden");
            $("#tip").text("手机格式错误");
        } else if (yanzheng != getYZ) {
            if (typeof($("#tip").attr("hidden")) != "undefined") $("#tip").removeAttr("hidden");
            $("#tip").text("验证码输入错误");
        }
        else {
            $.ajax({
                url: urldomain + '/toforget',
                type: 'post',
                contentType: 'application/x-www-form-urlencoded',
                data: {
                    phone: phone,
                    pw: pw
                },
                dataType: "json",
                success: function (data) {
                    if (data.errorCode == "1") {
                        $("#tip").removeAttr("hidden");
                        $("#tip").text("该手机号码尚未注册");
                    }
                    else
                        window.location.href = urldomain + "/wishlist";
                }
            });
        }
    }

</script>
</html>
