<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportMatterAuditSetFrom.aspx.cs" Inherits="M_Main.IncidentNew.ReportMatterAuditSetFrom" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="../jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet">

    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet">

    <script src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>
    <style type="text/css">
        body {
            background-color: #f5f5f5;
            overflow: hidden;
        }
        .active {
            background-color: #cccccc;
        }
    </style>
</head>
<body>
    <form id="frmForm">
        <input type="hidden" id="refsel" />
        <div class="tabs-container">
            <div class="tabs-left" style="margin: 0px;">
                <ul class="nav nav-tabs">
                    <li class="active" refsel="0" refid="Tab0" refpage="ReportMatterAuditSetBrowse" reftype="报事延期审核流程_0">
                        <a data-toggle="tab" href="#tab-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i></i>报事延期审核流程</a>
                    </li>
                    <li class="" refsel="0" refid="Tab1" refpage="ReportMatterAuditSetBrowse" reftype="报事协助审核流程_1">
                        <a data-toggle="tab" href="#tab-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i></i>报事协助审核流程</a>
                    </li>
                    <li class="" refsel="0" refid="Tab2" refpage="ReportMatterAuditSetBrowse" reftype="报事关闭审核流程_2">
                        <a data-toggle="tab" href="#tab-2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i></i>报事关闭审核流程</a>
                    </li>

                    <li class="" refsel="0" refid="Tab3" refpage="ReportMatterAuditSetBrowse" reftype="工单免费审核流程_3">
                        <a data-toggle="tab" href="#tab-3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i></i>工单免费审核流程</a>
                    </li>
                </ul>
                <div class="tab-content ">
                    <div id="tab-0" class="tab-pane active">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab0"  style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>
                    <div id="tab-1" class="tab-pane">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab1"  style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>
                    <div id="tab-2" class="tab-pane">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab2"  style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>

                    <div id="tab-3" class="tab-pane">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab3"  style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $(".Frm").css({ "height": h + "px" });
            }
            InitTableHeight();

            $(".tabs-container li").click(function () {
                
                var refpage = $(this).attr("refpage");
                if (refpage == 'shlcsz') {
                    return false;
                }
                var refsel = $(this).attr("refsel");
                var reftype = $(this).attr("reftype");
                var refid = $(this).attr("refid");
                if (refsel == 0) {
                    $("#" + refid).attr("src", refpage + ".aspx?AuditType=" + reftype);
                    $(this).attr("refsel", "1");
                }
            });

            $(document).ready(function () {
                // 任何需要执行的js特效 
                $("#Tab0").attr("src", "ReportMatterAuditSetBrowse.aspx?AuditType=报事延期审核流程_0" );
                $("#Tab0").attr("refsel", "1");
            });

          
        </script>
    </form>
</body>
</html>
