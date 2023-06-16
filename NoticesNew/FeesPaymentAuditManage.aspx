<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeesPaymentAuditManage.aspx.cs" Inherits="M_Main.NoticesNew.FeesPaymentAuditManage" %>



<!DOCTYPE html>
<html>
<head>
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

    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        .panel-body {
            padding: 0px;
        }

        .tabs-container .panel-body {
            padding: 0px;
        }

        .datagrid-mask-msg {
            height: 40px;
        }
    </style>
    <script language="javascript">
		<!--
    function CheckData() {

        return true;
    }
    function Win_OnLoad() {
        var strPrintParms = getObject("PrintParms").value;
        if (strPrintParms != "") {
            showOperatWin(strPrintParms);

            getObject("PrintParms").value = "";
        }
    }

		//-->
    </script>

</head>
<body onload="Win_OnLoad()">
    <form id="frmForm" runat="server">
        <input id="BeginDate" style="width: 16px; height: 22px" type="hidden" size="1" name="BeginDate"
            runat="server" /><input id="EndDate" style="width: 16px; height: 22px" type="hidden" size="1" name="EndDate"
                runat="server" /><input id="PayID" style="width: 16px; height: 22px" type="hidden" size="1" name="PayID"
                    runat="server" /><input id="TotalSumAmount" style="width: 16px; height: 22px" type="hidden" size="1" name="TotalSumAmount"
                        runat="server" />
        <input id="PrintParms" style="width: 24px; height: 21px" type="hidden" size="1" name="PrintParms"
            runat="server" />
        <input id="AuditType" name="AuditType" type="hidden" runat="server" />
        <input id="CommID" name="CommID" type="hidden" runat="server" />
        <div id="tt1">
            <table class="DialogTable" id="HeadTable" name="HeadTable" style="width: 100%;">


                <tr>
                    <td colspan="4" style="text-align: center; background: #e6e6e6"><span style="font-size: 16px">交款明细</span> </td>
                </tr>
                <tr>
                    <td class="TdTitle">开始时间</td>
                    <td class="TdContent">
                        <asp:Label ID="lbBeginDate" name="lbBeginDate" runat="server"></asp:Label>
                    </td>
                    <td class="TdTitle">结束时间</td>
                    <td class="TdContent">
                        <asp:Label ID="lbEndDate" name="lbEndDate" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td class="TdTitle">总 金 额</td>
                    <td class="TdContent">
                        <asp:Label ID="lbPayAmount" runat="server"></asp:Label>
                    </td>
                    <td class="TdTitle">申请时间</td>
                    <td class="TdContent">
                        <asp:Label ID="lbPayDate" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">交 款 人</td>
                    <td class="TdContent">
                        <asp:Label ID="lbPayUserName" runat="server"></asp:Label></td>
                    <td class="TdTitle">收款时间</td>
                    <td class="TdContent">
                        <asp:Label ID="lbGatherDate" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td class="TdTitle">记账时间</td>
                    <td class="TdContent">
                        <asp:Label ID="lbAccountDate" runat="server"></asp:Label></td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr>
                    <td class="TdTitle">交款方式</td>
                    <td class="TdContent" colspan="3">
                        <div style="overflow: auto; width: 400px; height: 120px;">
                            <asp:Label ID="lbPaymentMethods" runat="server"></asp:Label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">备注</td>
                    <td class="TdContent" colspan="3">
                        <input id="PayMemo" name="PayMemo" type="text" runat="server" />
                    </td>
                </tr>

                <tr>
                    <td colspan="4" style="height: 3px"></td>
                </tr>
                <tr>
                    <td align="center" colspan="4">

                        <input class="button" id="btnOK" type="button" value="审批确认" onclick="javascript: AuditFeesPayment(1);"
                            name="btnOK" runat="server">
                        &nbsp;&nbsp;
                      <input class="button" id="btnCancel" type="button" value="取消审批" onclick="javascript: AuditFeesPayment(0);"
                          name="btnCancel" runat="server">
                        &nbsp;&nbsp;
                   
                    <input class="button" id="btnClose" type="button" value="关闭"
                        name="btnClose" runat="server" onclick="javascript: Close();">
                    </td>

                </tr>
                <tr>
                    <td colspan="4" style="height: 6px"></td>
                </tr>

                <tr>
                    <td colspan="4" style="height: 6px"></td>
                </tr>
            </table>
        </div>
        <input id="btnHide" type="button" value="隐藏">
        <input id="btnShow" type="button" value="显示">
        <div id="Divreport" name="Divreport" class="easyui-layout" title="交款报表">
            <div data-options="region:'center',title:'交款报表'" style="background: #ffffff; border: hidden">
                <div class="tabs-container">
                    <ul class="nav nav-tabs">
                        <li class="active" id="jjbb" name="jjbb" refpage="NewPublicMeterNewResultManage" refsel="1"><a data-toggle="tab" href="#tab-1" aria-expanded="true">缴款日报表</a>
                        </li>

                        <li class="" name="pjhz" id="pjhz" refpage="NewBatchPublicResultManage" refsel="0"><a data-toggle="tab" href="#tab-2" aria-expanded="false">票据汇总表</a>
                        </li>
                        <li class="" name="pjmx" id="pjmx" refpage="NewBatchPublicResultManage" refsel="0"><a data-toggle="tab" href="#tab-3" aria-expanded="false">票据明细</a>
                        </li>
                        <li class="" name="fymx" id="fymx" refpage="NewBatchPublicResultManage" refsel="0"><a data-toggle="tab" href="#tab-4" aria-expanded="false">费用明细</a>
                        </li>
                        <li class="" name="tsmx" id="tsmx" refpage="NewBatchPublicResultManage" refsel="0"><a data-toggle="tab" href="#tab-5" aria-expanded="false">托收明细</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane active">
                            <div class="panel-body" style="padding: 0px;">
                                <div class="Frm">
                                    <div class="SearchContainer" id="TableContainer1">1</div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-2" class="tab-pane">
                            <div class="panel-body" style="padding: 0px;">
                                <div class="Frm">
                                    <div class="SearchContainer" id="TableContainer2">2</div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-3" class="tab-pane">
                            <div class="panel-body" style="padding: 0px;">
                                <div class="Frm">
                                    <div class="SearchContainer" id="TableContainer3">3</div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-4" class="tab-pane">
                            <div class="panel-body" style="padding: 0px;">
                                <div class="Frm">
                                    <div class="SearchContainer" id="TableContainer4">4</div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-5" class="tab-pane">
                            <div class="panel-body" style="padding: 0px;">
                                <div class="Frm">
                                    <div class="SearchContainer" id="TableContainer5">5</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <script type="text/javascript">
            $("#btnHide").bind("click", function (event) {
                $("#tt1").hide();
                InitTableHeight();
            }
            );
            $("#btnShow").bind("click", function (event) {
                $("#tt1").show();
                InitTableHeight();
            }
            );
            function InitTableHeight() {
                var AllHeight = $(window).height();
                var AllWidht = $(window).width();
                var TableHeight = $('#HeadTable').height();

                var DivHeight = AllHeight;// - TableHeight;
                $("#Divreport").css("width", AllWidht + "px");
                $("#Divreport").css("height", DivHeight + "px");

                var h = DivHeight - 78;

                $(".Frm").css({ "height": h + "px" });

                $("#TableContainer1").css("height", h + "px");
                $("#TableContainer2").css("height", h + "px");
                $("#TableContainer3").css("height", h + "px");
                $("#TableContainer4").css("height", h + "px");
                $("#TableContainer5").css("height", h + "px");




                $("#TableContainer1").css("width", AllWidht + "px");
                $("#TableContainer2").css("width", AllWidht + "px");
                $("#TableContainer3").css("width", AllWidht + "px");
                $("#TableContainer4").css("width", AllWidht + "px");
                $("#TableContainer5").css("width", AllWidht + "px");




            }
            InitTableHeight();

            $(".tabs-container li").click(function () {




                $('#tab-1').attr("class", "tab-pane");
                $('#tab-2').attr("class", "tab-pane");
                $('#tab-3').attr("class", "tab-pane");
                $('#tab-4').attr("class", "tab-pane");
                $('#tab-5').attr("class", "tab-pane");

                $('#jjbb').attr("refsel", "0");
                $('#pjhz').attr("refsel", "0");
                $('#pjmx').attr("refsel", "0");
                $('#fymx').attr("refsel", "0");
                $('#tsmx').attr("refsel", "0");


                $('#jjbb').attr("class", "");
                $('#pjhz').attr("class", "");
                $('#pjmx').attr("class", "");
                $('#fymx').attr("class", "");
                $('#tsmx').attr("class", "");


                switch ($(this).attr("name")) {

                    case "jjbb":

                        $('#tab-1').attr("class", "tab-pane active");
                        $('#jjbb').attr("refsel", "1");
                        $('#jjbb').attr("class", "active");
                        LoadPayment();
                        break;
                    case "pjhz":

                        $('#tab-2').attr("class", "tab-pane active");
                        $('#pjhz').attr("refsel", "1");
                        $('#pjhz').attr("class", "active");
                        LoadBill();
                        break;
                    case "pjmx":

                        $('#tab-3').attr("class", "tab-pane active");
                        $('#pjmx').attr("refsel", "1");
                        $('#pjmx').attr("class", "active");
                        LoadRece();
                        break;
                    case "fymx":

                        $('#tab-4').attr("class", "tab-pane active");
                        $('#fymx').attr("refsel", "1");
                        $('#fymx').attr("class", "active");
                        LoadDetail();
                        break;
                    case "tsmx":

                        $('#tab-5').attr("class", "tab-pane active");
                        $('#tsmx').attr("refsel", "1");
                        $('#tsmx').attr("class", "active");
                        LoadConSign();
                        break;

                }


            });



            var Paymentcolumn = [[
                { field: 'CorpCostName', title: '费用大项', width: 100, align: 'left', sortable: true },
                { field: 'CostName', title: '费用名称', width: 100, align: 'left', sortable: true },
                { field: 'TotalAmount', title: '合计', width: 100, align: 'left', sortable: true },
                { field: 'ChargeAmount', title: '实收', width: 100, align: 'left', sortable: true },
                { field: 'OffsetPrecAmount', title: '预交冲抵', width: 100, align: 'left', sortable: true },
                { field: 'RefundAmount', title: '退款', width: 100, align: 'left', sortable: true },
                { field: 'BeforePrecAmount', title: '前期预交余额', width: 100, align: 'left', sortable: true },
                { field: 'CurrPrecAmount', title: '本期预交收款', width: 100, align: 'left', sortable: true },
                { field: 'RefundPrecAmount', title: '本期预交退款', width: 100, align: 'left', sortable: true },
                { field: 'OffsetPrecTotalAmount', title: '本期预交冲抵', width: 100, align: 'left', sortable: true },
                { field: 'AfterPrecAmount', title: '期末预交余额', width: 100, align: 'left', sortable: true },
                { field: 'PerSurplusAmount', title: '本期零头结转', width: 100, align: 'left', sortable: true },
                { field: 'ExpenseAmount', title: '本期付款', width: 100, align: 'left', sortable: true }
            ]]

            var Billcolumn = [[
                { field: 'BillTypeName', title: '票据类别', width: 100, align: 'left', sortable: true },
                { field: 'UserCaseName', title: '使用方式', width: 100, align: 'left', sortable: true },
                { field: 'BillNum', title: '数量', width: 100, align: 'left', sortable: true },
                { field: 'BillsSigns', title: '摘要', width: 100, align: 'left', sortable: true },
            ]]
            var Rececolumn = [[
                { field: 'ReceTypeName', title: '票据来源', width: 100, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                { field: 'BillsSign', title: '票据号码', width: 100, align: 'left', sortable: true },
                { field: 'EInvoiceNos', title: '电子发票号', width: 100, align: 'left', sortable: true },
                {
                    field: 'BillsDate', title: '收款时间', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.BillsDate, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                { field: 'ChargeModes', title: '收款方式', width: 100, align: 'left', sortable: true },
                { field: 'BillsAmount', title: '票据金额', width: 100, align: 'left', sortable: true },
                { field: 'PerSurplus', title: '结余金额', width: 100, align: 'left', sortable: true },
                { field: 'UserName', title: '收款人', width: 100, align: 'left', sortable: true },
                { field: 'ReceMemo', title: '备注', width: 100, align: 'left', sortable: true }
            ]]
            var Detailcolumn = [[
                { field: 'ReceTypeName', title: '票据来源', width: 100, align: 'left', sortable: true },
                { field: 'BillsSign', title: '收据号码', width: 100, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                {
                    field: 'ChargeDate', title: '收款时间', width: 180, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.ChargeDate, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                { field: 'FeeDueYearMonth', title: '费用日期', width: 100, align: 'left', sortable: true },
                {
                    field: 'AccountsDueDate', title: '应收日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesStateDate', title: '开始日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesEndDate', title: '结束日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'CostName', title: '费用名称', width: 100, align: 'left', sortable: true },
                { field: 'PaidAmount', title: '收款金额', width: 100, align: 'left', sortable: true },
                { field: 'PaidLateFeeAmount', title: '合同违约金', width: 100, align: 'left', sortable: true },
                { field: 'CommisionCostName', title: '佣金费用名称', width: 100, align: 'left', sortable: true },
                { field: 'CommissPaidAmount', title: '佣金收款金额', width: 100, align: 'left', sortable: true },
                { field: 'CommissPaidLateFeeAmount', title: '佣金合同违约金', width: 100, align: 'left', sortable: true },
                { field: 'UserName', title: '收款人', width: 100, align: 'left', sortable: true },
                { field: 'ChargeMode', title: '收款方式', width: 100, align: 'left', sortable: true },
                { field: 'IsPropertyName', title: '是否垫付回收', width: 100, align: 'left', sortable: true },
                { field: 'OFeesMemo', title: '备注', width: 100, align: 'left', sortable: true }

            ]]
            var ConSigncolumn = [[
                { field: 'BillsSign', title: '收据号码', width: 100, align: 'left', sortable: true },
                //{ field: 'EInvoiceNos', title: '电子发票号', width: 100, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                { field: 'PaidAmount', title: '收款金额', width: 100, align: 'left', sortable: true },
                {
                    field: 'BillsDate', title: '托收时间', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.BillsDate, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                { field: 'UserName', title: '托收人', width: 100, align: 'left', sortable: true },
                {
                    field: 'ConfirmBillsDate', title: '收款时间', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.ConfirmBillsDate, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                { field: 'ConfirmUserName', title: '收款人', width: 100, align: 'left', sortable: true },
                {
                    field: 'DelBillsDate', title: '撤销时间', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.DelBillsDate, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                { field: 'DelUserName', title: '撤销人', width: 100, align: 'left', sortable: true },
                { field: 'IsSuccName', title: '是否已托收', width: 100, align: 'left', sortable: true }

            ]]

            var toolbar1 = [{
                text: 'Excel输出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    var data = $("#TableContainer1").datagrid('getData');
                    if (data.rows.length > 0) {
                        window.location.href = "../NoticesNew/FeesPaymentCre.aspx?CommID=" + $("#CommID").val();
                    }

                }
            }
            ];
            var toolbar2 = [{
                text: 'Excel输出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    var data = $("#TableContainer2").datagrid('getData');
                    if (data.rows.length > 0) {
                        window.location.href = "../NoticesNew/FeesPaymentBillCre.aspx?CommID=" + $("#CommID").val();
                    }
                }
            }
            ];
            var toolbar3 = [{
                text: 'Excel输出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    var data = $("#TableContainer3").datagrid('getData');
                    if (data.rows.length > 0) {
                        window.location.href = "../NoticesNew/FeesPaymentReceCre.aspx?CommID=" + $("#CommID").val();
                    }
                }
            }
            ];
            var toolbar4 = [{
                text: 'Excel输出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    var data = $("#TableContainer4").datagrid('getData');
                    if (data.rows.length > 0) {
                        window.location.href = "../NoticesNew/FeesPaymentDetailCre.aspx?CommID=" + $("#CommID").val();
                    }
                }
            }
            ];
            var toolbar5 = [{
                text: 'Excel输出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    var data = $("#TableContainer5").datagrid('getData');
                    if (data.rows.length > 0) {
                        window.location.href = "../NoticesNew/FeesPaymentConSignCre.aspx?CommID=" + $("#CommID").val();
                    }
                }
            }
            ];

            function LoadPayment() {

                $("#TableContainer1").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: Paymentcolumn,
                    toolbar: toolbar1,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: '100%',
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    onBeforeLoad: function (param) {

                        param = $.JQForm.GetParam("FeesPayment", "LoadPayment", "TableContainer1", param);
                    }
                });

                $("#TableContainer1").datagrid({ fitColumns: true });
            }
            function LoadBill() {
                $("#TableContainer2").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: Billcolumn,
                    toolbar: toolbar2,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: '100%',
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    onBeforeLoad: function (param) {

                        param = $.JQForm.GetParam("FeesPayment", "LoadBill", "TableContainer2", param);
                    }
                });
            }
            function LoadRece() {
                $("#TableContainer3").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: Rececolumn,
                    toolbar: toolbar3,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: '100%',
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    onBeforeLoad: function (param) {

                        param = $.JQForm.GetParam("FeesPayment", "LoadRece", "TableContainer3", param);
                    }
                });
            }
            function LoadDetail() {
                $("#TableContainer4").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: Detailcolumn,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    toolbar: toolbar4,
                    width: '100%',
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    onBeforeLoad: function (param) {

                        param = $.JQForm.GetParam("FeesPayment", "LoadDetail", "TableContainer4", param);
                    }
                });
            }
            function LoadConSign() {
                $("#TableContainer5").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: ConSigncolumn,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    toolbar: toolbar5,
                    width: '100%',
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    onBeforeLoad: function (param) {

                        param = $.JQForm.GetParam("FeesPayment", "LoadConSign", "TableContainer5", param);
                    }
                });
            }
            LoadPayment();


            function Close() {
                HDialog.Close();
            }

            function AuditFeesPayment(Audit) {

                HDialog.Prompt('确认审批此交款申请', function () {


                    $.tool.DataPostChk('frmForm', 'FeesPayment', 'FeesPaymentAudit', $('#frmForm').serialize() + "&Audit=" + Audit,
                        function Init() {
                        },
                        function callback(_Data) {
                            var r = _Data.split('|');
                            HDialog.Info(r[1]);
                            if (r[0] == "true") {

                                window.location.href = 'FeesPaymentAuditManage.aspx?PayID=' + $('#PayID').val() + '&AuditType=' + $('#AuditType').val() + '&CommID=' + $('#CommID').val();

                            }

                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });

                });
            }
        </script>
    </form>
</body>
</html>
