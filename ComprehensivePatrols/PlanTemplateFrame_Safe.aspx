<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanTemplateFrame_Safe.aspx.cs" Inherits="M_Main.ComprehensivePatrols.PlanTemplateFrame_Safe" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>计划模板tab页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="../jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <script src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            background-color: #f5f5f5;
            overflow: hidden;
        }
    </style>
</head>
<body style="">
    <form id="frmForm">
        <div class="tabs-container">
            <ul class="nav nav-tabs">
                <li class="active" refpage="PlanTemplateEdit_Safe" refsel="1"><a data-toggle="tab" href="#tab-1" aria-expanded="true">基本信息</a></li>
                <li class="" refpage="PlanTemplatePoint_Safe" refsel="0"><a data-toggle="tab" href="#tab-2" aria-expanded="false">点位信息</a></li>
                <li class="" refpage="PlanTemplateRoute_Safe" refsel="0"><a data-toggle="tab" href="#tab-3" aria-expanded="false">计划路线</a></li>
            </ul>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="PlanTemplateEdit_Safe" src="PlanTemplateEdit_Safe.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-2" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="PlanTemplatePoint_Safe" src="PlanTemplatePoint_Safe.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-3" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="PlanTemplateRoute_Safe" src="PlanTemplateRoute_Safe.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" id="RoomIDs" name="RoomIDs" runat="server" />
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height() - 40;
                $(".Frm").css({ "height": h + "px" });
            }

            InitTableHeight();

            function Close() {
                HDialog.Close("true");
            }

            $(".tabs-container li").click(function () {
                var refpage = $(this).attr("refpage");
                var refsel = $(this).attr("refsel");
                if (refsel == 0) {
                    $("#" + refpage).attr("src", refpage + ".aspx?PlanId=" + localStorage.getItem('CpPlanId'));
                    $(this).attr("refsel", "1");
                }
            });

            $(function () {
                $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                    // 获取已激活的标签页的名称
                    var refpage = $(e.target).offsetParent().attr('refpage');
                    $(window.document).contents().find("#" + refpage)[0].contentWindow.Load();
                });
            });
        </script>
    </form>
</body>
</html>
