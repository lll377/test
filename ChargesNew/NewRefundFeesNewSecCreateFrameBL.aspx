<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewRefundFeesNewSecCreateFrameBL.aspx.cs" Inherits="M_Main.ChargesNew.NewRefundFeesNewSecCreateFrameBL" %>
 

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
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
<body>
    <form id="frmForm">

        <div class="tabs-container">
            <ul class="nav nav-tabs">
                <li class="active" name="NewRefundFeesNewSecCreate1" refpage="NewRefundFeesNewSecCreate1" refsel="1"><a data-toggle="tab" href="#tab-1" aria-expanded="true">
                    <div id="title" name="title">退款申请</div>
                </a>
                </li>
                <%-- <li class="active" name="NewRefundFeesNewSecCreate" refpage="NewRefundFeesNewSecCreate" refsel="1"><a data-toggle="tab" href="#tab-1" aria-expanded="true">
                    <div id="title" name="title">第一步：退款申请</div>
                </a>
                </li>--%>
                <%-- <li class="" name="RefundFeesNewBrowse" refpage="RefundFeesNewBrowse" refsel="0"><a data-toggle="tab" href="#tab-2" aria-expanded="false">第二步：退款办理</a>
                </li>--%>
                <li class="" name="NewBatchRefundFeesBrowse" refpage="NewBatchRefundFeesBrowse" refsel="0"><a data-toggle="tab" href="#tab-2" aria-expanded="false">
                    <div id="title" name="title">批量退款申请</div>
                </a>
                </li>
               <%-- <li class="" name="NewRefundFeesBrowse" refpage="NewRefundFeesBrowse" refsel="0"><a data-toggle="tab" href="#tab-3" aria-expanded="false">查询审核状态</a>
                </li>--%>
                <li style="display: none;" class="" id="tishi" name="" refpage="tishi" refsel="0"><a data-toggle="tab" href="#" style="font-weight: normal; cursor: default;" aria-expanded="false"><font color="red">*预收费用退款后，系统将自动撤销该笔应收。</font></a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="NewRefundFeesNewSecCreate1" src="NewRefundFeesNewSecCreate1.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <%--  <div id="tab-1" class="tab-pane active">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="NewRefundFeesNewSecCreate" src="NewRefundFeesNewSecCreate.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>--%>
                <%-- <div id="tab-2" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="RefundFeesNewBrowse" src="RefundFeesNewBrowse.aspx?ModifyType=2" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>--%>
                <div id="tab-2" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="NewBatchRefundFeesBrowse" src="NewBatchRefundFeesBrowse.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-3" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="NewRefundFeesBrowse" src="NewRefundFeesBrowse.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">



            function InitTableHeight() {
                var h = $(window).height() - 38;

                $(".Frm").css({ "height": h + "px" });

            }

            InitTableHeight();

            $(".tabs-container li").click(function () {
                var refpage = $(this).attr("refpage");
                var refsel = $(this).attr("refsel");
                if (refpage == "tishi") {
                    return false;
                }
                if (refpage == "RefundFeesNewBrowse") {
                    $("#tishi").show();
                } else {
                    $("#tishi").hide();
                }
                if (refsel == 0) {
                    $("#" + refpage).attr("src", refpage + ".aspx");
                    $(this).attr("refsel", "1");
                }
            });
        </script>
    </form>
</body>
</html>
