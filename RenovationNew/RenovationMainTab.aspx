<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RenovationMainTab.aspx.cs" Inherits="M_Main.RenovationNew.RenovationMainTab" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>装修Tab页</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>

    <link href="../css/basebootstrap.css" rel="stylesheet" />
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <script src="../jscript/help.js" type="text/javascript"></script>
    <style type="text/css">
       
    </style>
</head>
<body>
    <div id="tab" class="easyui-tabs">
        <div id="tab0" issel="true" title="装修登记" style="overflow: hidden">
        </div>
        <div id="tab1" issel="false" title="装修附件" style="overflow: hidden">
        </div>
        <div id="tab2" issel="false" title="装修收费" style="overflow: hidden">
        </div>
        <div id="tab3" issel="false" title="装修办证" style="overflow: hidden">
        </div>
        <div id="tab4" issel="false" title="装修变更" style="overflow: hidden">
        </div>
        <div id="tab5" issel="false" title="装修停工" style="overflow: hidden">
        </div>
        <div id="tab6" issel="false" title="装修延期" style="overflow: hidden">
        </div>
        <div id="tab7" issel="false" title="人员放行" style="overflow: hidden">
        </div>
        <div id="tab8" issel="false" title="材料放行" style="overflow: hidden">
        </div>
        <div id="tab9" issel="false" title="装修巡查" style="overflow: hidden">
        </div>
        <div id="tab10" issel="false" title="装修验收" style="overflow: hidden">
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

            var OpType = $.getUrlParam("OpType");
            $("#OpType").val(OpType);
            var AuditState = $.getUrlParam("AuditState");
            if (AuditState != "已审核") {
                for (var i = 1; i < 9; i++) {
                    $('#tab').tabs('disableTab', 2 + i);
                }
            }

            var pageName = "RenovationEdit";
            if (OpType == "Detailed") {
                pageName = "RenovationDetailed";
            }
            var ID = $.getUrlParam("ID");
            var LicenceNum = $.getUrlParam("LicenceNum");

            var urlParam = $.param({ "OpType": OpType, "ID": ID, "RID": ID, "AuditState": AuditState, "LicenceNum": LicenceNum });
            var html = "<iframe scrolling=\"yes\" frameborder=\"0\" src=\"../RenovationNew/" + pageName + ".aspx?" + urlParam + "\" style=\"width: 100%; height: 100%;\"></iframe>";
            $("#tab0").html(html);

            $('#tab').tabs({
                height: h,
                justified: true,
                fit: true,
                border: false,
                onLoad: function () {

                },
                onSelect: function (title, index) {
                    var issel = $("#tab" + index).attr("issel");
                    if (issel == "false") {
                        if (index == 0) {
                            pageName = "RenovationEdit";
                            if (OpType == "Detailed") {
                                pageName = "RenovationDetailed";
                            }
                        }
                        else if (index == 1) { pageName = "AttachedFile"; }
                        else if (index == 2) { pageName = "Fees"; }
                        else if (index == 3) { pageName = "HandleCertificate"; }
                        else if (index == 4) { pageName = "RenoChange"; }
                        else if (index == 5) { pageName = "RenoStoppage"; }
                        else if (index == 6) { pageName = "RenoDelay"; }
                        else if (index == 7) { pageName = "ReleasePeople"; }
                        else if (index == 8) { pageName = "ReleaseMaterial"; }
                        else if (index == 9) { pageName = "Patrol"; }
                        else if (index == 10) { pageName = "CompletionAcceptance"; }
                        var html = "<iframe scrolling=\"yes\" frameborder=\"0\" src=\"../RenovationNew/" + pageName + ".aspx?" + urlParam + "\" style=\"width: 100%; height: 100%;\"></iframe>";
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
