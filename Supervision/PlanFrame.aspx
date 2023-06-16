<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanFrame.aspx.cs" Inherits="M_Main.Supervision.PlanFrame" %>

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
        <div id="tab0" issel="true" title="检查计划设置" style="overflow: hidden">
        </div>
        <div id="tab1" issel="false" title="检查标准设置" style="overflow: hidden">
        </div>
        <div id="tab2" issel="false" title="检查标准查看" style="overflow: hidden">
        </div>
        <div id="tab3" issel="false" title="计划预警设置" style="overflow: hidden">
        </div>
    </div>
    <script language="javascript" type="text/javascript">
        $(function () {
            InitControl();
        });

        function InitControl() {
            var h = $(window).height();
            $("#tab0").css("height", h - 35 + "px");

            var OpType = GetQueryString('OpType');
            var Id = GetQueryString('Id');
            var CommId = GetQueryString('CommId');
            var CommName = GetQueryString('CommName');
            var Frequency = GetQueryString('Frequency');
            var pageName = "PlanEdit";

            var urlParam = $.param({ "OpType": OpType, "Id": Id, "CommId": CommId, "CommName": CommName, "Frequency": Frequency });
            var html = "<iframe scrolling=\"yes\" frameborder=\"0\" src=\"../Supervision/" + pageName + ".aspx?" + urlParam + "\" style=\"width: 100%; height: 100%;\"></iframe>";
            $("#tab0").html(html);

            $('#tab').tabs({
                height: h,
                justified: true,
                fit: true,
                border: false,
                onSelect: function (title, index) {
                    var issel = $("#tab" + index).attr("issel");
                    if (issel == "false") {
                        if (index == 0) { pageName = "PlanEdit"; }
                        else if (index == 1) { pageName = "PlanStandardSet"; }
                        else if (index == 2) { pageName = "PlanStandardSel"; }
                        else if (index == 3) { pageName = "PlanEarlyWarningList"; }
                        var html = "<iframe scrolling=\"yes\" frameborder=\"0\" src=\"../Supervision/" + pageName + ".aspx?" + urlParam + "\" style=\"width: 100%; height: 100%;\"></iframe>";
                        $("#tab" + index).html(html);
                        $("#tab" + index).attr("issel", "true");
                    }
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
