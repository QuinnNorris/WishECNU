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
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">选择头像</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-xs-4"><img class="media-object blog-profile" data-src="holder.js/64x64" alt="64x64"
                                               src="${pageContext.request.contextPath}/img/0.jpg"
                                               style="width: 100%;height: 100%" onclick="get3sel(0)" id="p0">
                        <div style="height: 10px;"></div>
                    </div>
                    <div class="col-xs-4"><img class="media-object blog-profile" data-src="holder.js/64x64" alt="64x64"
                                               src="${pageContext.request.contextPath}/img/1.jpg"
                                               style="width: 100%;height: 100%" onclick="get3sel(1)" id="p1">
                        <div style="height: 10px;"></div>
                    </div>
                    <div class="col-xs-4"><img class="media-object blog-profile" data-src="holder.js/64x64" alt="64x64"
                                               src="${pageContext.request.contextPath}/img/2.jpg"
                                               style="width: 100%;height: 100%" onclick="get3sel(2)" id="p2">
                        <div style="height: 10px;"></div>
                    </div>
                    <div class="col-xs-4"><img class="media-object blog-profile" data-src="holder.js/64x64" alt="64x64"
                                               src="${pageContext.request.contextPath}/img/3.jpg"
                                               style="width: 100%;height: 100%" onclick="get3sel(3)" id="p3">
                        <div style="height: 10px;"></div>
                    </div>
                    <div class="col-xs-4"><img class="media-object blog-profile" data-src="holder.js/64x64" alt="64x64"
                                               src="${pageContext.request.contextPath}/img/4.jpg"
                                               style="width: 100%;height: 100%" onclick="get3sel(4)" id="p4">
                        <div style="height: 10px;"></div>
                    </div>
                    <div class="col-xs-4"><img class="media-object blog-profile" data-src="holder.js/64x64" alt="64x64"
                                               src="${pageContext.request.contextPath}/img/5.jpg"
                                               style="width: 100%;height: 100%" onclick="get3sel(5)" id="p5">
                        <div style="height: 10px;"></div>
                    </div>
                    <div class="col-xs-4"><img class="media-object blog-profile" data-src="holder.js/64x64" alt="64x64"
                                               src="${pageContext.request.contextPath}/img/6.jpg"
                                               style="width: 100%;height: 100%" onclick="get3sel(6)" id="p6">
                        <div style="height: 10px;"></div>
                    </div>
                    <div class="col-xs-4"><img class="media-object blog-profile" data-src="holder.js/64x64" alt="64x64"
                                               src="${pageContext.request.contextPath}/img/7.jpg"
                                               style="width: 100%;height: 100%" onclick="get3sel(7)" id="p7">
                        <div style="height: 10px;"></div>
                    </div>
                    <div class="col-xs-4"><img class="media-object blog-profile" data-src="holder.js/64x64" alt="64x64"
                                               src="${pageContext.request.contextPath}/img/8.jpg"
                                               style="width: 100%;height: 100%" onclick="get3sel(8)" id="p8">
                        <div style="height: 10px;"></div>
                    </div>
                    <div class="col-xs-4"><img class="media-object blog-profile" data-src="holder.js/64x64" alt="64x64"
                                               src="${pageContext.request.contextPath}/img/9.jpg"
                                               style="width: 100%;height: 100%" onclick="get3sel(9)" id="p9">
                        <div style="height: 10px;"></div>
                    </div>
                    <div class="col-xs-4"><img class="media-object blog-profile" data-src="holder.js/64x64" alt="64x64"
                                               src="${pageContext.request.contextPath}/img/10.jpg"
                                               style="width: 100%;height: 100%" onclick="get3sel(10)" id="p10">
                        <div style="height: 10px;"></div>
                    </div>
                    <div class="col-xs-4"><img class="media-object blog-profile" data-src="holder.js/64x64" alt="64x64"
                                               src="${pageContext.request.contextPath}/img/11.jpg"
                                               style="width: 100%;height: 100%" onclick="get3sel(11)" id="p11">
                        <div style="height: 10px;"></div>
                    </div>
                </div>
            </div>
            <button type="button" style="display: none" id="target" class="btn btn-primary " data-dismiss="modal">确认选择
            </button>
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
                <h2 style="padding-top: 5px;">许下心愿</h2>
            </div>
            <div class="col-lg-2">

            </div>
        </div>


        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="ibox-content">
                    <div method="get" class="form-horizontal">
                        <div class="form-group"><label class="col-sm-2 control-label">我的昵称</label>
                            <div class="col-sm-10"><input type="text" maxlength="8" id="nickname" class="form-control">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group"><label class="col-sm-2 control-label">我的性别</label>
                            <div class="col-sm-10">
                                <div class="input-group m-b" style="margin-bottom: 0px;">
                                    <div class="input-group-btn">
                                        <button class="btn btn-white dropdown-toggle"
                                                type="button" onclick="changesex()">点击更换
                                        </button>
                                    </div>
                                    <input type="text" class="form-control" id="sex" value="男"
                                           style="text-align: center"></div>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group"><label class="col-sm-2 control-label">心愿标题</label>
                            <div class="col-sm-10"><input type="text" id="title" maxlength="20" class="form-control">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group"><label class="col-sm-2 control-label">心愿内容</label>
                            <div class="col-sm-10"><textarea rows="6" id="inner" maxlength="300" class="form-control"
                                                             style="width: 100%;border: 1px solid #e5e6e7;resize: none;"></textarea>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group"><label class="col-sm-2 control-label">联系方式</label>
                            <div class="col-sm-10">
                                <div class="input-group m-b" style="margin-bottom: 0px;">
                                    <div class="input-group-btn">
                                        <button data-toggle="dropdown" class="btn btn-white dropdown-toggle"
                                                id="megp" type="button">QQ <span class="caret"></span></button>
                                        <input type="hidden" id="hidm" value="0">
                                        <ul class="dropdown-menu">
                                            <li><a href="javascript:void(0);" id="me0" onclick="change4sel(0)">QQ</a>
                                            </li>
                                            <li><a href="javascript:void(0);" id="me1" onclick="change4sel(1)">微信</a>
                                            </li>
                                            <li><a href="javascript:void(0);" id="me2" onclick="change4sel(2)">手机号</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <input type="text" class="form-control" maxlength="30" id="conn"></div>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group"><label class="col-sm-2 control-label">选择头像</label>
                            <div class="col-sm-10">
                                <div class="col-xs-offset-3 col-xs-6">
                                    <img class="media-object blog-profile" data-src="holder.js/64x64" alt="64x64"
                                         id="showimg"
                                         src="${pageContext.request.contextPath}/img/7.jpg" data-toggle="modal"
                                         data-target="#myModal"
                                         style="width: 100%;height: 100%">
                                </div>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group"><label hidden class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <button class="btn btn-outline btn-danger dim btn-block" type="button" id="thiscreatebut"
                                        onclick="post_new_wish()">许下这个心愿
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <div>
                <input id="headp" type="hidden" value="7"/>
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

    function post_new_wish() {
        $('#thiscreatebut').attr('disabled','disabled');
        var sexs = "";
        var getss = $("#sex").val();
        if (getss == "男") sexs = "1";
        else if (getss == "女") sexs = "0";
        else {
            alert('请输入正确的性别哦');
            return;
        }
        if ($("#nickname").val() == null || $("#title").val() == null || $("#inner").val() == null || $("#conn").val() == null
            || $("#nickname").val().trim() == "" || $("#title").val().trim() == "" || $("#inner").val().trim() == "" || $("#conn").val().trim() == "") {
            alert('请填写表格的每一项哦');
            return;
        }
        $.ajax({
            url: urldomain + '/newwish',
            type: 'post',
            async: false,
            contentType: 'application/x-www-form-urlencoded',
            data: {
                nickname: $("#nickname").val(),
                titles: $("#title").val(),
                inners: $("#inner").val(),
                conn_type: $("#hidm").val(),
                conn: $("#conn").val(),
                sexs: sexs,
                headp: $("#headp").val()
            },
            dataType: "json",
            success: function (data) {
                if (data.errorCode == 'login')
                    window.location.href = urldomain + "/login";
                else if (data.errorCode == '01')
                    alert('一次最多只能许下5个心愿哦');
                else
                    window.location.href = urldomain + "/post";
                $('#thiscreatebut').removeAttrs('disabled');
            }
        });
    }

    function changesex() {
        var getsex = $("#sex").val();
        if (getsex == '男') $("#sex").val("女");
        if (getsex == "女") $("#sex").val("男");
    }

    function change4sel(getnum) {
        $("#megp").html($("#me" + getnum).text() + "&nbsp;<span class=\"caret\"></span>");
        $("#hidm").val(getnum);
    }

    function get3sel(headp) {
        $("#headp").val(headp);
        $("#showimg").attr("src", urldomain + "/img/" + headp + ".jpg");
        document.getElementById("target").click();
    }

</script>
</html>
