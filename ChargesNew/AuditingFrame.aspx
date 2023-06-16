<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditingFrame.aspx.cs" Inherits="M_Main.ChargesNew.AuditingFrame" %>

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
                    <li class="active" refsel="1" refid="Tab1" refpage="AuditingSetBrowse" reftype="" style="height: 33px">
                        <a data-toggle="tab" href="#tab-1"><i class="fa fa-cogs "></i>管控模型设置</a>
                    </li>
                    <li class="" refsel="0" refid="" refpage="shlcsz" style="height: 33px" reftype="">
                        <a data-toggle="tab" href="#"><i class="fa fa-cogs "></i>审核流程设置</a>
                    </li>
                    <li class="" refsel="0" refid="Tab9" refpage="AuditCorpCostItemFeesBrowse" reftype="交房状态审核流程_7" style="height: 33px">
                        <a data-toggle="tab" href="#tab-9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i></i>交房状态审核流程</a>
                    </li>

                    <li class="" refsel="0" refid="Tab8" refpage="AuditCorpCostItemContractBrowse" style="height: 33px" reftype="租赁合同审核流程_4,经营合同签订流程_5,经营合同变更流程_10,经营合同执行流程_11 ">
                        <a data-toggle="tab" href="#tab-8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i></i>合同费用审核流程(4)</a>
                    </li>

                    <li class="" refsel="0" refid="Tab2" refpage="AuditCorpCostItemFeesBrowse" style="height: 33px" reftype="批量入账审核流程_1,单户入账审核流程_2">
                        <a data-toggle="tab" href="#tab-2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i></i>应收入账审核流程(2)</a>
                    </li>


                    <li class="" refsel="0" refid="Tab11" refpage="AuditCorpCostItemFeesBrowse" style="height: 33px" reftype="应收导入审核流程_12">
                        <a data-toggle="tab" href="#tab-11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i></i>应收导入审核流程</a>
                    </li>

                    <li class="" refsel="0" refid="Tab12" refpage="AuditCorpCostItemFeesBrowse" style="height: 33px" reftype="预交导入审核流程_13">
                        <a data-toggle="tab" href="#tab-12">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i></i>预交导入审核流程</a>
                    </li>
                    <li class="" refsel="0" refid="Tab3" refpage="AuditCorpCostItemFeesBrowse" style="height: 33px" reftype="预交冲抵审核流程_3">
                        <a data-toggle="tab" href="#tab-3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i></i>预交冲抵审核流程</a>
                    </li>
                    <li class="" refsel="0" refid="Tab4" refpage="AuditCorpCostItemWaivBrowse" style="height: 33px" reftype="费用减免审核流程_1,取消减免审核流程_15">
                        <a data-toggle="tab" href="#tab-4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i></i>费用减免审核流程(2)</a>
                    </li>
                    <li class="" refsel="0" refid="Tab5" refpage="AuditCorpCostItemFeesBrowse" style="height: 33px" reftype="票据撤销审核流程_6">
                        <a data-toggle="tab" href="#tab-5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i></i>票据撤销审核流程</a>
                    </li>
                    <li class="" refsel="0" refid="Tab6" refpage="AuditCorpCostItemBrowse" style="height: 33px" reftype="实收退款审核流程_1,预存退款审核流程_8">
                        <a data-toggle="tab" href="#tab-6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i></i>费用退款审核流程(2)</a>
                    </li>


                    <li class="" refsel="0" refid="Tab13" refpage="AuditCorpCostItemFeesBrowse" style="height: 33px" reftype="实收票据冲销审核_16,预交冲抵冲销审核_17,减免冲抵冲销审核_18">
                        <a data-toggle="tab" href="#tab-13">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i></i>费用冲销审核流程(3)</a>
                    </li>

                    <li class="" refsel="0" refid="Tab14" refpage="AuditCorpCostItemFeesBrowse" style="height: 33px" reftype="银行托收审核流程_19">
                        <a data-toggle="tab" href="#tab-14">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i></i>银行托收审核流程</a>
                    </li>

                    <li class="" refsel="0" refid="Tab10" refpage="AuditCorpCostItemFeesBrowse" style="height: 33px" reftype="发函审核流程_9">
                        <a data-toggle="tab" href="#tab-10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i></i>客户发函审核流程</a>
                    </li>
                </ul>
                <div class="tab-content ">
                    <div id="tab-1" class="tab-pane active">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab1" src="AuditingSetBrowse.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>
                    <div id="tab-2" class="tab-pane">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab2" style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>
                    <div id="tab-3" class="tab-pane">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab3" style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>
                    <div id="tab-4" class="tab-pane">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab4" style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>
                    <div id="tab-5" class="tab-pane">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab5" style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>
                    <div id="tab-6" class="tab-pane">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab6" style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>
                    <div id="tab-7" class="tab-pane">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab7" style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>
                    <div id="tab-8" class="tab-pane">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab8" style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>
                    <div id="tab-9" class="tab-pane">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab9" style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>
                    <div id="tab-10" class="tab-pane">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab10" style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>

                    <div id="tab-11" class="tab-pane">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab11" style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>

                    <div id="tab-12" class="tab-pane">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab12" style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>

                    <div id="tab-13" class="tab-pane">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab13" style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>

                    <div id="tab-14" class="tab-pane">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab14" style="width: 100%; border: none;" class="Frm"></iframe>
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


        </script>
    </form>
</body>
</html>
