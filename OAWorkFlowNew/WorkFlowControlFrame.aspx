<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkFlowControlFrame.aspx.cs" Inherits="M_Main.OAWorkFlowNew.WorkFlowControlFrame" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
    <style type="text/css">
        body {
            background-color: #f5f5f5;
            padding-top: 2px;
            overflow: hidden;
        }
    </style>
</head>
<body style="">
    <form id="frmForm">
        <input type="hidden" id="CorpID" name="CorpID" runat="server" />
        <div class="tabs-container">
            <ul class="nav nav-tabs">
                <li class="active" refpage="OfficialDocumentAssert" refsel="1"><a data-toggle="tab" href="#tab-1" aria-expanded="false">公文审批</a>
                </li>
                <li class="" refpage="OfficiaConferenceAssert" refsel="0"><a data-toggle="tab" href="#tab-2" aria-expanded="true">会议审批</a>
                </li>
                <li class="" refpage="SendCarAssert" refsel="0"><a data-toggle="tab" href="#tab-3" aria-expanded="true">派车审批</a>
                </li>
                <li class="" refpage="BuyPlanCheckAssert" refsel="0"><a data-toggle="tab" href="#tab-4" aria-expanded="true">采购申请</a>
                </li>
                <li class="" refpage="MaterialBuyPlanAssert" refsel="0"><a data-toggle="tab" href="#tab-5" aria-expanded="true">资产申购</a>
                </li>
                <li class="" refpage="ContractAssert" refsel="0"><a data-toggle="tab" href="#tab-6" aria-expanded="true">合同评审</a>
                </li>
                <li class="" refpage="ReimbursementAssert" refsel="0"><a data-toggle="tab" href="#tab-7" aria-expanded="true">报账审批</a>
                </li>
                <li class="" refpage="BorrowerMoneyAssert" refsel="0"><a data-toggle="tab" href="#tab-8" aria-expanded="true">借款审批</a>
                </li>
                <li class="" refpage="InsuranceCheckAssert" refsel="0"><a data-toggle="tab" href="#tab-9" aria-expanded="true">人事审批</a>
                </li>
                <li class="" refpage="AskForLeaveAssert" refsel="0"><a data-toggle="tab" href="#tab-10" aria-expanded="true">请假审批</a>
                </li>
                <li class="" refpage="WorkContactAssert" refsel="0"><a data-toggle="tab" href="#tab-11" aria-expanded="true">工作交办</a>
                </li>
                <li class="" refpage="WorkContactReportAssert" refsel="0"><a data-toggle="tab" href="#tab-12" aria-expanded="true">综合办公</a>
                </li>
                <li class="" refpage="FixedAssetsLossTableAssert" refsel="0"><a data-toggle="tab" href="#tab-13" aria-expanded="true">资产报损</a>
                </li>
                <li class="" refpage="BussAsset" refsel="0"><a data-toggle="tab" href="#tab-14" aria-expanded="true">业务审批</a>
                </li>
                <li class="DocumentApprovalBrowse" refpage="DocumentApprovalBrowse" refsel="0"><a data-toggle="tab" href="#tab-15" aria-expanded="true">发文审批</a>
                </li>
                <li class="OfficialDocumentIncoming" refpage="OfficialDocumentIncoming" refsel="0"><a data-toggle="tab" href="#tab-16" aria-expanded="true">收文审批</a>
                </li>
                <li class="MeetingReservation" style="display: none;" refpage="MeetingReservation" refsel="0"><a data-toggle="tab" href="#tab-17" aria-expanded="true">会议室预订(天投)</a>
                </li>
                <li class="WorkReport_TTBrowse" style="display: none;" refpage="WorkReport_TTBrowse" refsel="0"><a data-toggle="tab" href="#tab-18" aria-expanded="true">呈批件(天投)</a>
                </li>
                <li class="JobConnectionBrowse" style="display: none;" refpage="JobConnectionBrowse" refsel="0"><a data-toggle="tab" href="#tab-19" aria-expanded="true">工作联系单(天投)</a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="OfficialDocumentAssert" src="../OAPublicWorkNew/OfficialDocumentAssert.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-2" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="OfficiaConferenceAssert" refpage="../OAPublicWorkNew/OfficiaConferenceAssert.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-3" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="SendCarAssert" refpage="../OAPublicWorkNew/SendCarAssert.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-4" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="BuyPlanCheckAssert" refpage="../OAPublicWorkNew/BuyPlanCheckAssert.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-5" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="MaterialBuyPlanAssert" refpage="../OAPublicWorkNew/MaterialBuyPlanAssert.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-6" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="ContractAssert" refpage="../OAPublicWorkNew/ContractAssert.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-7" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="ReimbursementAssert" refpage="../OAPublicWorkNew/ReimbursementAssert.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-8" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="BorrowerMoneyAssert" refpage="../OAPublicWorkNew/BorrowerMoneyAssert.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-9" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="InsuranceCheckAssert" refpage="../OAPublicWorkNew/InsuranceCheckAssert.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-10" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="AskForLeaveAssert" refpage="../OAPublicWorkNew/AskForLeaveAssert.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-11" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="WorkContactAssert" refpage="../OAPublicWorkNew/WorkContactAssert.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-12" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="WorkContactReportAssert" refpage="../OAPublicWorkNew/WorkContactReportAssert.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-13" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="FixedAssetsLossTableAssert" refpage="../OAPublicWorkNew/FixedAssetsLossTableAssert.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-14" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="BussAsset" refpage="../OAPublicWorkNew/BussAsset.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-15" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="DocumentApprovalBrowse" refpage="../OAPublicWorkNew/DocumentApprovalBrowse.aspx?Flag=1" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-16" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="OfficialDocumentIncoming" refpage="../OAPublicWorkNew/OfficialDocumentBrowse_NewListTt.aspx?Flag=1" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-17" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="MeetingReservation" refpage="../OAPublicWorkNew/MeetingReservation.aspx?Flag=1" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-18" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="WorkReport_TTBrowse" refpage="../OAPublicWorkNew/WorkReport_TTBrowse.aspx?Flag=1" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-19" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="JobConnectionBrowse" refpage="../OAPublicWorkNew/JobConnectionBrowse.aspx?Flag=1" style="width: 100%; border: none;" class="Frm"></iframe>
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

            function Load() {
                var ID = $("#CorpID").val();
                if (ID=='1829') {
                    $('.DocumentApprovalBrowse').css("display", "block");//发文审批
                    $('.OfficialDocumentIncoming').css("display", "block");//收文审批
                    $('.MeetingReservation').css("display", "block");//会议预订
                    $('.WorkReport_TTBrowse').css("display", "block");//工作呈报
                    $('.JobConnectionBrowse').css("display", "block");//工作联系
                }
            }
            Load();
            $(".tabs-container li").click(function () {
                var refpage = $(this).attr("refpage");
                var refsel = $(this).attr("refsel");
                if (refsel == 0) {
                    var rp = $("#" + refpage).attr("refpage");
                    $("#" + refpage).attr("src", rp);
                    $(this).attr("refsel", "1");
                }
            });
        </script>
    </form>
</body>
</html>

