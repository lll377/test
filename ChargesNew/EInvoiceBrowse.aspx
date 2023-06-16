<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EInvoiceBrowse.aspx.cs" Inherits="M_Main.ChargesNew.EInvoiceBrowse" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/ajax.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <style type="text/css">
        /*#SearchDlg {
            padding: 10px;
            width: 700px;
            height: 250px;
        }

        .SearchTable {
            width: 700px;
            height: auto;
        }*/

        /*.SearchTable .TdTitle {
                width: 15%;
            }

            .SearchTable .TdContent {
                width: 35%;
            }*/


        .button {
            line-height: 28px;
            height: 28px;
            width: 60px;
            color: #ffffff;
            background-color: #3e73ca;
            font-size: 12px;
            font-weight: normal;
            font-family: 微软雅黑;
            border: 0px solid #dcdcdc;
            -webkit-border-top-left-radius: 3px;
            -moz-border-radius-topleft: 3px;
            border-top-left-radius: 3px;
            -webkit-border-top-right-radius: 3px;
            -moz-border-radius-topright: 3px;
            border-top-right-radius: 3px;
            -webkit-border-bottom-left-radius: 3px;
            -moz-border-radius-bottomleft: 3px;
            border-bottom-left-radius: 3px;
            -webkit-border-bottom-right-radius: 3px;
            -moz-border-radius-bottomright: 3px;
            border-bottom-right-radius: 3px;
            -moz-box-shadow: inset 0px 0px 0px 0px #ffffff;
            -webkit-box-shadow: inset 0px 0px 0px 0px #ffffff;
            box-shadow: inset 0px 0px 0px 0px #ffffff;
            text-align: center;
            display: inline-block;
            text-decoration: none;
        }

            .button:hover {
                background-color: #2b58a0;
            }
    </style>
</head>
<body>
    <form id="frmForm">
        <input id="Attribute" name="Attribute" value="" type="hidden" />

        <input id="LCompanyName" value="名称" type="hidden" />
        <input id="LTaxNO" value="0" type="hidden" />
        <input id="LClientNum" value="0" type="hidden" />
        <input id="LResidue" value="0" type="hidden" />

        <input id="RoomID" type="hidden" size="1" name="RoomID" runat="server" />
        <input id="CostIDs" type="hidden" name="CostIDs" runat="server" />
        <input id="CustID" type="hidden" name="CustID" runat="server" />

        <input name="hiIsSQLData" type="hidden" id="hiIsSQLData" style="width: 8px" size="1" />

        <input name="IsCreate" type="hidden" id="IsCreate" />

        <div id="TableContainer" style="width: 100%;"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="width: 700px; height: 230px;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable" style="margin: 10px auto">
                <tr>
                    <td class="DialogTdTitle">是否预交</td>
                    <td class="DialogTdContent">
                        <select id="IsPrec" name="IsPrec">
                            <option value="" selected="selected">全部</option>
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select></td>
                    <td class="DialogTdTitle">费用时间从</td>
                    <td class="DialogTdContent">
                        <input id="FeesStartDate" class="Wdate" onclick="WdatePicker()" name="FeesStartDate" runat="server" /></td>
                    <td class="DialogTdTitle">到</td>
                    <td class="DialogTdContent">
                        <input id="FeesEndDate" class="Wdate" onclick="WdatePicker()" name="FeesEndDate" runat="server" /></td>


                </tr>
                <tr>
                    <td class="DialogTdTitle">客户名称</td>
                    <td class="DialogTdContent">
                        <input id="CustName" searcher="SelCust"
                            name="CustName" class="easyui-searchbox" data-options="editable:false" runat="server" />
                    </td>
                    <td class="DialogTdTitle">收款时间从</td>
                    <td class="DialogTdContent">
                        <input id="ChargeStartDate" class="Wdate" onclick="WdatePicker()" name="ChargeStartDate" runat="server" /></td>
                    <td class="DialogTdTitle">到</td>
                    <td class="DialogTdContent">
                        <input id="ChargeEndDate" class="Wdate" onclick="WdatePicker()" name="ChargeEndDate" runat="server" /></td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">房屋编号</td>
                    <td class="DialogTdContent">
                        <input id="RoomSign" searcher="SelRoom" name="RoomSign" class="easyui-searchbox" data-options="editable:false" runat="server" /></td>
                    <td class="DialogTdTitle">费用名称</td>
                    <td class="DialogTdContent">
                        <input id="CostNames" class="easyui-searchbox" data-options="editable:false" searcher="SelCost"
                            name="CostNames" runat="server" /></td>
                    <td class="DialogTdTitle">开票状态</td>
                    <td class="DialogTdContent">
                        <select id="BillingState" name="BillingState">
                            <option value="" selected="selected">全部</option>
                            <option value="0">待发送</option>
                            <option value="1">已发送</option>
                            <option value="2">开票成功</option>
                            <option value="3">开票失败</option>
                            <option value="4">未开票</option>
                        </select></td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">发票号码</td>
                    <td class="DialogTdContent">
                        <input id="InvoiceNo" name="InvoiceNo" /></td>
                    <td class="DialogTdTitle">发票代码</td>
                    <td class="DialogTdContent">
                        <input id="InvoiceCode" name="InvoiceCode" /></td>
                    <td class="DialogTdTitle">收据号码</td>
                    <td class="DialogTdContent">
                        <input id="BillsSign" name="BillsSign" /></td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">批量开票</td>
                    <td class="DialogTdContent">
                        <select id="IsBatch" name="IsBatch">
                            <option value="" selected="selected">全部</option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select></td>
                    <td class="DialogTdTitle">收款方式</td>
                    <td class="DialogTdContent">
                        <select id="ChargeMode" name="ChargeMode" runat="server">
                            <option selected="selected"></option>
                        </select></td>
                </tr>
                <tr>
                    <td colspan="6" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadData(1);">生成并查询</a>
                        &nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadData(0);">查询</a>

                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function SelCost() {

                var w = 700;
                var h = 400;

                HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {

                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");

                        $('#CostIDs').val(varObjects[0]);
                        $('#CostNames').searchbox('setValue', varObjects[1]);
                    }
                });
            }
            function SelCust() {

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');

                var w = $(window).width();
                var h = $(window).height();

                var conent = "../DialogNew/CustDlg.aspx";

                HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                });
            }

            function SelRoom() {

                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');


                var conent = "../DialogNew/RoomDlg.aspx";

                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#RoomID').val(data.RoomID);

                });

            }



            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $('#hiIsSQLData').val('-1');
            }
            InitFunction();


            var Headcolumn = [
                [
                    { field: '', checkbox: true },
                    { field: 'CustName', title: '客户名称', align: 'center', sortable: true, width: 100 },
                    {
                        field: 'FType', title: '是否预交', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            if (row.FType == "3") {
                                return "是";
                            }
                            else {
                                return "否";
                            }
                        }
                    },
                    { field: 'BillsSign', title: '收据号码', align: 'center', sortable: true, width: 100 },
                    { field: 'RoomSign', title: '房屋编号', align: 'center', sortable: true, width: 100 },
                    { field: 'RoomName', title: '房屋名称', align: 'center', sortable: true, width: 100 },
                    { field: 'CostName', title: '费用名称', align: 'center', sortable: true, width: 100 },
                    {
                        field: 'FeesDueDate', title: '费用日期', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            var str = formatDate(value, "yyyy-MM-dd");
                            return str;
                        }
                    }, {
                        field: 'State', title: '开票状态', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            var str = "";
                            switch (row.State) {
                                case "0":
                                    str = "待发送";
                                    break;
                                case "1":
                                    str = "已发送";
                                    break;
                                case "2":
                                    str = "开票成功";
                                    break;
                                case "3":
                                    str = "开票失败";
                                    break;
                                default:
                            }
                            return str;
                        }
                    },
                    {
                        field: 'BillingTime', title: '开票发起时间', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            var str = formatDate(value, "yyyy-MM-dd HH:mm:ss");
                            return str;
                        }
                    },

                    {
                        field: 'FeesEndDate', title: '应收结束日期', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {

                            var str = formatDate(value, "yyyy-MM-dd");
                            return str;
                        }
                    },
                    { field: 'DueAmount', title: '应收金额', align: 'center', sortable: true, width: 100 },
                    { field: 'OffsetAmount', title: '冲抵金额', align: 'center', sortable: true, width: 100 },
                    { field: 'WaivAmount', title: '减免金额', align: 'center', sortable: true, width: 100 },
                    { field: 'PaidAmount', title: '实收金额', align: 'center', sortable: true, width: 100 },
                    {
                        field: 'ChargeDate', title: '收款日期', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {

                            var str = formatDate(value, "yyyy-MM-dd HH:mm:ss");
                            return str;
                        }
                    },
                    { field: 'ChargeMode', title: '收款方式', align: 'center', sortable: true, width: 100 },
                    {
                        field: 'CanBillingAmount', title: '可开票含增值税金额', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            if (row.FType == "1" || row.FType == "4") {
                                if (row.State == "2") {
                                    return "0.00";
                                }
                                var taxAmount = (row.PaidAmount * row.TaxRate) / (1 + parseFloat(row.TaxRate));
                                if (row.TaxAmount == null) {
                                    $('#TableContainer').datagrid('updateRow', {
                                        index: parseInt(index),
                                        row: {
                                            TaxAmount: taxAmount.toFixed(2),
                                            AmountWithoutTax: (row.PaidAmount - taxAmount).toFixed(2)
                                        }
                                    });
                                }

                                return row.PaidAmount;
                            }
                            if (row.FType == "2") {
                                var taxAmount = (row.DueAmount * row.TaxRate) / (1 + parseFloat(row.TaxRate));
                                if (row.TaxAmount == null) {
                                    $('#TableContainer').datagrid('updateRow', {
                                        index: parseInt(index),
                                        row: {
                                            TaxAmount: taxAmount.toFixed(2),
                                            AmountWithoutTax: (row.DueAmount - taxAmount).toFixed(2)
                                        }
                                    });
                                }
                                return row.DueAmount;
                            }
                            if (value == undefined) {
                                $.post("/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=EInvoiceManage&Command=CanBillingAmount", { "RFID": row.RFID, "FType": row.FType, "Index": index }, function (data) {

                                    $('#TableContainer').datagrid('updateRow', {
                                        index: parseInt(data.index),
                                        row: {
                                            CanBillingAmount: data.amount,
                                        }
                                    });
                                }, 'json');
                                return "正在计算...";
                            }

                            else {
                                var taxAmount = (value * row.TaxRate) / (1 + parseFloat(row.TaxRate));
                                if (row.TaxAmount == null) {
                                    $('#TableContainer').datagrid('updateRow', {
                                        index: parseInt(index),
                                        row: {
                                            TaxAmount: taxAmount.toFixed(2),
                                            AmountWithoutTax: (value - taxAmount).toFixed(2)
                                        }
                                    });
                                }
                                return value;
                            }
                        }
                    },
                    { field: 'TaxAmount', title: '可开票增值税金额', align: 'center', sortable: true, width: 100 },
                    { field: 'AmountWithoutTax', title: '可开票不含增值税金额', align: 'center', sortable: true, width: 100 },
                    {
                        field: 'IsBatch', title: '批量开票', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            var str = "";
                            switch (row.IsBatch) {
                                case "0":
                                    str = "否";
                                    break;
                                case "1":
                                    str = "是";
                                    break;
                                default:
                            }
                            return str;
                        }
                    }, {
                        field: 'InvoiceNo', title: '发票号码', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            var urlarr = row.PdfUrl.split(",");
                            var noarr = value.split(",");
                            var strarr = new Array();
                            for (var i = 0; i < noarr.length; i++) {
                                var str = "<a class=\"HrefStyle\"  href='" + urlarr[i] + "'>" + noarr[i] + "</a>";
                                strarr.push(str);
                            }

                            return strarr.join(",");
                        }
                    },
                    { field: 'InvoiceCode', title: '发票代码', align: 'center', sortable: true, width: 100 },
                    {
                        field: 'FeesStateDate', title: '应收开始日期', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            var str = formatDate(value, "yyyy-MM-dd");
                            return str;
                        }
                    },
                    { field: 'UserName', title: '开票人', align: 'center', sortable: true, width: 100 },
                    {
                        field: 'CompleteTime', title: '开票完成时间', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            var str = formatDate(value, "yyyy-MM-dd HH:mm:ss");
                            return str;
                        }
                    },
                    { field: 'PosNo', title: '票易通交易号', align: 'center', sortable: true, width: 210 },
                    { field: 'ErrMsg', title: '备注', align: 'center', sortable: true, width: 100 }

                ]
            ];

            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: '开具电票',
                    iconCls: 'icon-add',
                    handler: function () {
                        var ob = $("#TableContainer").datagrid('getSelections');
                        if (ob.length > 0) {
                            //if (ob.length > 8) {
                            //    HDialog.Info("单次开票不能超过8条费用");
                            //    return;
                            //}

                            var CustID = ob[0].CustID;
                            var RoomID = ob[0].RoomID;
                            //获取各种费用的数量
                            var receiveCount = 0;//实收数量
                            var preReceiveCount = 0;//预收数量
                            var precCount = 0;//预交数量
                            var lateCount = 0;//滞纳金数量
                            var offsetCount = 0;//冲抵数量

                            for (var i = 0; i < ob.length; i++) {
                                switch (ob[i].FType) {
                                    case "1":
                                        receiveCount++;
                                        break;
                                    case "2":
                                        preReceiveCount++;
                                        break;
                                    case "3":
                                        precCount++;
                                        break;
                                    case "4":
                                        lateCount++;
                                        break;
                                    case "5":
                                        offsetCount++;
                                        break;
                                    default:
                                }
                            }

                            //var IsPrec = ob[0].IsPrec;
                            //var IsLate = ob[0].IsLate;
                            for (var i = 0; i < ob.length; i++) {
                                if (ob[i].CustID != CustID) {
                                    HDialog.Info("请选择同一客户");
                                    return;
                                }
                                if (ob[i].RoomID != RoomID) {
                                    HDialog.Info("请选择同一房屋");
                                    return;
                                }

                                if (ob[i].FType == "3" || ob[i].FType == "5") {
                                    if (ob[i].CanBillingAmount == "0.00" || ob[i].CanBillingAmount == null) {
                                        HDialog.Info("无可开票金额");
                                        return;
                                    }
                                }

                                if (ob[i].State == "1") {
                                    HDialog.Info("费用已发起开票");
                                    return;
                                }
                                if (ob[i].State == "2") {
                                    HDialog.Info("费用已完成开票");
                                    return;
                                }
                                if (ob[i].IsBatch == "1" && ob[i].State != "3") {
                                    HDialog.Info("选择费用已存在批量开票");
                                    return;
                                }

                            }

                            //判断预存和其他是否同时开票
                            if (precCount > 0 && (receiveCount + preReceiveCount + lateCount + offsetCount) > 0) {
                                HDialog.Info("预存费用只能单独开票");
                                return;
                            }
                            //判断冲抵和其他是否同时开票
                            if (offsetCount > 0 && (receiveCount + preReceiveCount + lateCount + precCount) > 0) {
                                HDialog.Info("冲抵费用只能单独开票");
                                return;
                            }
                            //判断是否有多个预存选择       
                            if (precCount > 1) {
                                HDialog.Info("预存费用不能合并开票");
                                return;
                            }

                            var FeesMsgs = new Array();
                            for (var i = 0; i < ob.length; i++) {
                                FeesMsgs.push(ob[i].RFID + "|" + ob[i].RoomID + "|" + ob[i].FType);
                            }
                            sessionStorage.setItem("BillFeesMsg", FeesMsgs.join(","));

                            var w = 900;
                            var h = $(window).height();
                            HDialog.OpenWin(w, h, "../ChargesNew/EInvoiceManage.aspx?CustName=" + ob[0].CustName + "&CustID=" + CustID + "&RoomID=" + RoomID, "开票确认", true, function callback(_Data) {
                                if (_Data != '') {
                                    LoadData();
                                }
                            });
                        }
                        else {
                            HDialog.Info("请选择费用");
                        }

                    }
                }
                , '-',
                //{
                //    text: '批量开票',
                //    iconCls: 'icon-ok',
                //    handler: function () {
                //        var ob = $("#TableContainer").datagrid('getSelections');
                //        if (ob.length > 0) {
                //            for (var i = 0; i < ob.length; i++) {
                //                if (ob[i].IsBatch == "1") {
                //                    HDialog.Info("已有费用设置批量开票");
                //                    return;
                //                }
                //                if (ob[i].State != "") {
                //                    HDialog.Info("未开票才能设置批量开票");
                //                    return;
                //                }

                //                if (ob[i].FType == "3") {
                //                    HDialog.Info("预交费用不能批量开票");
                //                    return;
                //                }
                //            }
                //            var FeesMsgs = new Array();
                //            for (var i = 0; i < ob.length; i++) {
                //                FeesMsgs.push(ob[i].RFID + "|" + ob[i].FType + "|" + ob[i].CustID + "|" + ob[i].RoomID);
                //            }
                //            $.messager.confirm('提示', '是否确认批量开票?', function (r) {
                //                if (r) {
                //                    $.tool.DataPost("EInvoiceManage", "BatchEinvoice", "FeesMsgs=" + FeesMsgs.join(","), function Init() {
                //                    },
                //                        function callback(_Data) {
                //                            var data = JSON.parse(_Data);
                //                            if (data.state == "true") {
                //                                HDialog.Info(data.msg);
                //                                LoadData();
                //                            }
                //                            else {
                //                                HDialog.Info(data.msg);
                //                            }
                //                        },
                //                        function completeCallback() {
                //                        },
                //                        function errorCallback() {
                //                        });
                //                }
                //            });
                //        }
                //        else {
                //            HDialog.Info("请选择费用");
                //        }
                //    }
                //}, '-',
                {
                    text: '撤销批量开票',
                    iconCls: 'icon-clear',
                    handler: function () {
                        var ob = $("#TableContainer").datagrid('getSelections');
                        if (ob.length > 0) {
                            for (var i = 0; i < ob.length; i++) {
                                if (ob[i].IsBatch != "1") {
                                    HDialog.Info("请勾选批量开票费用");
                                    return;
                                }
                                if (ob[i].State != "0") {
                                    HDialog.Info("只能撤销待发送状态");
                                    return;
                                }
                            }
                            var EIDs = new Array();
                            for (var i = 0; i < ob.length; i++) {
                                EIDs.push(ob[i].InvoiceID);
                            }
                            $.messager.confirm('提示', '是否撤销选中批量开票?', function (r) {
                                if (r) {
                                    $.tool.DataPost("EInvoiceManage", "RevokeBatch", "EIDs=" + EIDs.join(","), function Init() {
                                    },
                                        function callback(_Data) {
                                            var data = JSON.parse(_Data);
                                            if (data.state == "true") {
                                                HDialog.Info(data.msg);
                                                LoadData();
                                            }
                                            else {
                                                HDialog.Info(data.msg);
                                            }
                                        },
                                        function completeCallback() {
                                        },
                                        function errorCallback() {
                                        });
                                }
                            });
                        }
                        else {
                            HDialog.Info("请选择费用");
                        }
                    }
                }
                , '-',
                {
                    text: '查询发票',
                    iconCls: 'icon-print',
                    handler: function () {

                        var ob = $("#TableContainer").datagrid('getSelections');
                        if (ob.length > 0) {

                            if (ob.length > 1) {
                                HDialog.Info("请选择单笔费用");
                                return;
                            }
                            if (ob[0].InvoiceNo == "") {
                                HDialog.Info("票据开具未成功");
                                return;
                            }
                            var urlarr = ob.PdfUrl.split(",")
                            window.open(urlarr[0]);
                        }
                        else {
                            HDialog.Info("请选择费用");
                        }

                    }
                }
                , '-',
                {
                    text: 'Excel导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {

                        window.location.href = "../ChargesNew/EInvoiceBrowseCreExcel.aspx";

                    }
                }
            ];



            //加载数据
            function LoadData(Type) {
                if (Type == "1") {
                    $("#SearchDlg").dialog("close");
                }
                //加载已经统计了的数据
                $("#TableContainer").datagrid({
                    //url: null,
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: 20,
                    pageList: [20, 30, 50],
                    columns: Headcolumn,
                    fitColumns: false,
                    singleSelect: false,
                    pagination: true,
                    remoteSort: false,
                    rownumbers: true,
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {

                        $("#SearchDlg").dialog("close");
                        //AddENumberQ();
                        SetENumber();

                    },
                    onClickRow: function (rowindex, rowdata) {
                        //ViewDetail("明细", rowdata.Id);
                    },
                    onBeforeLoad: function (param) {
                        if (Type == "1") {
                            $("#IsCreate").val("1");
                        }
                        else {
                            $("#IsCreate").val("0");
                        }
                        param = $.JQForm.GetParam("EInvoiceManage", "FeesList", "TableContainer", param);
                    },
                    rowStyler: function (index, row) {
                        return 'height:20px;';
                    }
                });
            }
            //展示进度
            LoadData();

            function AddENumberQ() {
                if ($("#NumberSearch").length > 0) {
                    return;
                }
                var html = "<td style='color:blue'>&nbsp;分公司名称：</td>";
                html += "<td><lable id='CompanyName'></lable></td>";
                html += "<td style='color:blue'>&nbsp;纳税人识别号：</td>";
                html += "<td><lable id='TaxNO'></lable></td>";
                html += "<td style='color:blue'>&nbsp;申请发票量：</td>";
                html += "<td><lable id='ClientNum'></lable></td>";
                html += "<td style='color:blue'>&nbsp;发票余量：</td>";
                html += "<td><lable id='Residue'></lable></td>";
                html += '<td><a href="javascript:void(0)" id="NumberSearch" class="l-btn l-btn-small l-btn-plain" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">刷新</span><span class="l-btn-icon icon-reload">&nbsp;</span></span></a><td>';
                $(".datagrid-toolbar").find("tr").append(html);
                $("#NumberSearch").on('click', function () {
                    $.tool.DataPost("EInvoiceManage", "LeftNumQuery", "", function Init() {
                    },
                        function callback(_Data) {
                            var data = JSON.parse(_Data);
                            if (data.state == "true") {
                                var obj = JSON.parse(data.msg)[0];
                                $("#LCompanyName").val(obj.companyName);
                                $("#LTaxNO").val(obj.companyTaxNo);
                                $("#LClientNum").val(obj.applyInvoiceNum);
                                $("#LResidue").val(obj.leftInvoiceNum);
                                 SetENumber();
                            }
                            else {
                                HDialog.Info(data.msg);
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                });
                $("#NumberSearch").click();
            }
            function SetENumber() {
                $("#CompanyName").text($("#LCompanyName").val());
                $("#TaxNO").text($("#LTaxNO").val());
                $("#ClientNum").text($("#LClientNum").val());
                $("#Residue").text($("#LResidue").val());
            }

        </script>
    </form>
</body>
</html>
