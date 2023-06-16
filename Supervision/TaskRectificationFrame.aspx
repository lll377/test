<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskRectificationFrame.aspx.cs" Inherits="M_Main.Supervision.TaskRectificationFrame" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>计划模板tab</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.extend.js"></script>
    <link href="../css/basebootstrap.css" rel="stylesheet" />
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            overflow: hidden;
        }
    </style>
</head>
<body>
    <div id="tab" class="easyui-tabs">
        <div id="tab0" issel="true" title="基本信息" style="overflow: hidden">
        </div>
        <div id="tab1" issel="false" title="加扣分项" style="overflow: hidden">
        </div>
        <div id="tab2" issel="false" title="分项检查及问题描述" style="overflow: hidden">
        </div>
        <div id="tab3" issel="false" title="服务亮点及优秀做法" style="overflow: hidden">
        </div>
        <div id="tab4" issel="false" title="改进建议及提升方向" style="overflow: hidden">
        </div>
    </div>
    <script language="javascript" type="text/javascript">
        $(function () {
            InitControl();
        });

        var OldIndex = 0;

        function InitControl() {
            var h = $(window).height();
            $("#tab0").css("height", h - 35 + "px");

            var pageName = "TaskRectificationInfo";

            var html = "<iframe scrolling=\"yes\" frameborder=\"0\" src=\"../Supervision/" + pageName + ".aspx\" style=\"width: 100%; height: 100%;\"></iframe>";
            $("#tab0").html(html);

            $('#tab').tabs({
                height: h,
                justified: true,
                fit: true,
                border: false,
                onSelect: function (title, index) {
                    var issel = $("#tab" + index).attr("issel");
                    if (issel == "false") {
                        if (index == 0) { pageName = "TaskRectificationInfo"; }
                        else if (index == 1) { pageName = "TaskRectificationDeductionItem"; }
                        else if (index == 2) { pageName = "TaskRectificationItemProblem"; }
                        else if (index == 3) { pageName = "TaskRectificationServiceHighlights"; }
                        else if (index == 4) { pageName = "TaskRectificationSuggestions"; }
                        var html = "<iframe scrolling=\"yes\" frameborder=\"0\" src=\"../Supervision/" + pageName + ".aspx\" style=\"width: 100%; height: 100%;\"></iframe>";
                        $("#tab" + index).html(html);
                        $("#tab" + index).attr("issel", "true");
                    }
                    $("#tab" + OldIndex).attr("issel", "false");
                    OldIndex = index;
                }
            });
        };

        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }
    </script>
</body>
</html>
