<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProcessingManageFooter.aspx.cs" Inherits="M_Main.IncidentNewJH.ProcessingManageFooter" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
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
            padding-top: 4px;
            overflow: hidden;
        }
    </style>
</head>
<body>
    <div class="tabs-container">       
        <input type="hidden" id="IncidentID" name="IncidentID" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />   
        <input type="hidden" id="IsReply" name="IsReply" runat="server" />
        <ul class="nav nav-tabs">
            <li id="liIncidentReminders" class="active" refpage="IncidentRemindersFrame" data-incidentparam="IncidentID=<%=IncidentID.Value%>" refsel="1"><a data-toggle="tab" href="#tab-1" aria-expanded="false">催办信息</a>
            </li>
            <li id="liIncidentFollowUp"  class="" refpage="IncidentFollowUpFrame" data-incidentparam="IncidentID=<%=IncidentID.Value%>"  refsel="0"><a data-toggle="tab" href="#tab-3" aria-expanded="false">跟进情况</a>
            </li> 
            <li id="liIncidentTransmit"  class="" refpage="IncidentTransmitFrame" data-incidentparam="IncidentID=<%=IncidentID.Value%>"  refsel="0"><a data-toggle="tab" href="#tab-2" aria-expanded="false">转发情况</a>
            </li>
            <li id="liIncidentFees" class="" refpage="IncidentFeesFrame" data-incidentparam="IncidentID=<%=IncidentID.Value%>"  refsel="0"><a data-toggle="tab" href="#tab-4" aria-expanded="true">费用信息</a>
            </li>
              <li id="liIncidentCloseBack" class="" refpage="IncidentCloseBackFrame" data-incidentparam="type=1&amp;IncidentID=<%=IncidentID.Value%>" refsel="0"><a data-toggle="tab" href="#tab-5" aria-expanded="false">关闭退回信息</a>
            </li>
             <li id="liIncidentReply" class="" refpage="IncidentReplyFrame" data-incidentparam="IncidentID=<%=IncidentID.Value%>"  refsel="0"><a data-toggle="tab" href="#tab-6" aria-expanded="false">回访信息</a>
            </li>
            <li id="liIncidentReplyBack" class="" refpage="IncidentReplyBackFrame" data-incidentparam="IncidentID=<%=IncidentID.Value%>"  refsel="0"><a data-toggle="tab" href="#tab-7" aria-expanded="false">回访退回信息</a>
            </li>
            <li id="liMaterial"  class="" refpage="IncidentMaterialFrame" data-incidentparam="IncidentMaterialFrame.aspx?type=1&amp;IncidentID=<%=IncidentID.Value%>&amp;Reply=<%=IsReply.Value%>" refsel="0"><a data-toggle="tab" href="#tab-8" aria-expanded="false">物资情况</a>

        </ul>
        <div class="tab-content">
            <div id="tab-1" class="tab-pane active">
                <div class="panel-body" style="padding: 0px;">
                    <iframe id="IncidentRemindersFrame" src="IncidentRemindersFrame.aspx?IncidentID=<%=IncidentID.Value%>" style="width: 100%; border: none;" class="Frm"></iframe>
                </div>
            </div>
                
            <div id="tab-2" class="tab-pane">
                <div class="panel-body" style="padding: 0px;">
                    <iframe id="IncidentTransmitFrame" style="width: 100%; border: none;" class="Frm"></iframe>
                </div>
            </div>
             <div id="tab-3" class="tab-pane">
                <div class="panel-body" style="padding: 0px;">
                    <iframe id="IncidentFollowUpFrame" style="width: 100%; border: none;" class="Frm"></iframe>
                </div>
            </div>
            <div id="tab-4" class="tab-pane ">
                <div class="panel-body" style="padding: 0px;">
                    <iframe id="IncidentFeesFrame" style="width: 100%; border: none;" class="Frm"></iframe>
                </div>
            </div>
            <div id="tab-5" class="tab-pane">
                <div class="panel-body" style="padding: 0px;">
                    <iframe id="IncidentCloseBackFrame" style="width: 100%; border: none;" class="Frm"></iframe>
                </div>
            </div>
                <div id="tab-6" class="tab-pane">
                <div class="panel-body" style="padding: 0px;">
                    <iframe id="IncidentReplyFrame" style="width: 100%; border: none;" class="Frm"></iframe>
                </div>
            </div>
                <div id="tab-7" class="tab-pane">
                <div class="panel-body" style="padding: 0px;">
                    <iframe id="IncidentReplyBackFrame" style="width: 100%; border: none;" class="Frm"></iframe>
                </div>
            </div>
            <div id="tab-8" class="tab-pane">
                <div class="panel-body" style="padding: 0px;">
                    <iframe id="IncidentMaterialFrame" style="width: 100%; border: none;" class="Frm"></iframe>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            var optype = $('#OpType').val();
            //工单池只显示催办信息
            if (optype == 'GDC') {
                $('#liIncidentTransmit').hide();
                $('#liIncidentFollowUp').hide();
                $('#liIncidentFees').hide();
                $('#liIncidentCloseBack').hide();
                $('#liIncidentReply').hide();
                $('#liIncidentReplyBack').hide();
            }
            //报事处理不显示回访相关信息
            if (optype == 'BSCL') {
                $('#liIncidentReply').hide();
                $('#liIncidentReplyBack').hide();
            }
           //报事关闭
            if (optype == 'BSGB') {             
                $('#liIncidentReply').hide();
            }
        })
        function InitTableHeight() {
            var h = $(window).height() - 45;
            $(".Frm").css({ "height": h + "px" });
        }

        InitTableHeight();

        $(".tabs-container li").click(function () {
            var refpage = $(this).attr("refpage");
            var refsel = $(this).attr("refsel");
            var params = $(this).attr("data-IncidentParam");
            if (refsel == 0) {
                $("#" + refpage).attr("src", refpage + ".aspx?" + params);
                $(this).attr("refsel", "1");
            }
        });
    </script>
</body>
</html>

