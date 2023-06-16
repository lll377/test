<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentSeachContainer.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentSeachContainer" %>


<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
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
                 <li class="active" refpage="IncidentSeach" refsel="0"><a data-toggle="tab" href="#tab-1" aria-expanded="false">报事信息查询</a>
                </li>
                <li class="" refpage="IncidentFollowSeach" refsel="0"><a data-toggle="tab" href="#tab-2" aria-expanded="false">报事跟进查询</a>
                </li>
                <li class="" refpage="IncidentRemindSeach" refsel="0"><a data-toggle="tab" href="#tab-3" aria-expanded="false">报事催办查询</a>
                </li>
                <li class="" refpage="IncidentChangeSeach" refsel="0"><a data-toggle="tab" href="#tab-4" aria-expanded="false">报事转发查询</a>
                </li>
                <li class="" refpage="IncidentFeesSeach" refsel="0"><a data-toggle="tab" href="#tab-5" aria-expanded="false">报事费用查询</a>
                </li>
                <li class="" refpage="IncidentCancelFinish" refsel="0"><a data-toggle="tab" href="#tab-6" aria-expanded="false">报事取消完成查询</a>
                </li>
                <li class="" refpage="IncidentCancelColsed" refsel="0"><a data-toggle="tab" href="#tab-7" aria-expanded="false">报事取消关闭查询</a>
                </li>
                <li class="" refpage="IncidentPrintBlankSeach" refsel="0"><a data-toggle="tab" href="#tab-8" aria-expanded="false">空白派工单打印查询</a>
                </li>
               

            </ul>
            <div class="tab-content">
               <div id="tab-1" class="tab-pane active">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="IncidentSeach" src="IncidentSeach.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>

                <div id="tab-2" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="IncidentFollowSeach" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-3" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="IncidentRemindSeach" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-4" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="IncidentChangeSeach" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-5" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="IncidentFeesSeach" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-6" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="IncidentCancelFinish" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-7" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="IncidentCancelColsed" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-8" class="tab-pane">
                    <div class="panel-body" style="padding:0px;">
                        <iframe id="IncidentPrintBlankSeach" style="width:100%;border:none;" class="Frm"></iframe>
                    </div>
                </div>
                
            </div>
        </div>
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height() - 40;
                $(".Frm").css({ "height": h + "px" });
            }

            InitTableHeight();

            $(".tabs-container li").click(function () {
                var refpage = $(this).attr("refpage");
                var refsel = $(this).attr("refsel");
                if (refsel == 0) {
                    if (refpage == "IncidentControlSeach") {
                        $("#" + refpage).attr("src", refpage + ".aspx?IsReWork=1");
                    }
                    else {
                        $("#" + refpage).attr("src", refpage + ".aspx");
                    }
                    $(this).attr("refsel", "1");
                }
            });
        </script>
    </form>
</body>
</html>
