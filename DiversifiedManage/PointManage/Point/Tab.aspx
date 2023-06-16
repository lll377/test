<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tab.aspx.cs" Inherits="M_Main.DiversifiedManage.PointManage.Point.Tab" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tab页</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/compatible.css" rel="stylesheet" />
    <%--<script src="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>
    <script src="/HM/M_Main/jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/help.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
</head>
<body>
    <div id="tab" class="easyui-tabs">
        <div id="tab0" issel="true" title="点位登记详情" style="overflow: hidden">
        </div>
        <div id="tab1" issel="false" title="点位使用信息" style="overflow: hidden">
        </div>
    </div>
    <script language="javascript" type="text/javascript">

        $(function () {
            InitPage();
            InitControl();

        });
        function InitPage() {

        }
        function InitControl() {
            var h = $(window).height();
            $("#tab0").css("height", h - 35 + "px");
            var ID = $.getUrlParam("ID");

            var param = $.getUrlParam();
            param.search = "search";
            param.beacon = "Point";
            var urlParam = $.param(param);
            var html = "<iframe scrolling=\"yes\" frameborder=\"0\" src=\"/HM/M_Main/DiversifiedManage/PointManage/Point/Detailed.aspx?" + urlParam + "\" style=\"width: 100%; height: 100%;\"></iframe>";
            $("#tab0").html(html);

            $('#tab').tabs({
                height: h,
                justified: false,
                fit: true,
                border: false,
                onLoad: function () {

                },
                onSelect: function (title, index) {
                    var issel = $("#tab" + index).attr("issel");
                    var pageName = "Detailed";
                    if (issel == "false") {
                        if (index == 0) { pageName = "Detailed"; }
                        else if (index == 1) { pageName = "UseSearch"; }
                        var html = "<iframe scrolling=\"yes\" frameborder=\"0\" src=\"/HM/M_Main/DiversifiedManage/PointManage/Point/" + pageName + ".aspx?" + urlParam + "\" style=\"width: 100%; height: 100%;\"></iframe>";
                        $("#tab" + index).html(html);
                        $("#tab" + index).attr("issel", "true");
                    }
                }
            });
        };
        function InitTableHeight() {
            //var h = $('#layout_center').height();
            //$("#tgPoint").css("height", h * 5 / 9 + "px");
            //$("#tgObject").css("height", h * 4 / 9 + "px");
        }
    </script>
</body>
</html>
