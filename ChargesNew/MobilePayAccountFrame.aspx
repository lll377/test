<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MobilePayAccountFrame.aspx.cs" Inherits="M_Main.ChargesNew.MobilePayAccountFrame" %>

<!DOCTYPE html>
<html>
<head>
    <title>移动支付对账</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 600px;
            height: 120px;
        }

        .SearchTable {
            width: 600px;
            height: auto;
        }

            .SearchTable .TdTitle {
                width: 15%;
            }

            .SearchTable .TdContent {
                width: 35%;
            }

        .ContainerLeft {
            float: left;
            overflow-y: auto;
            width: 49.9%;
            border-right: 1px solid #cccccc;
        }

        .ContainerRight {
            float: left;
            width: 50%;
            overflow: auto;
        }

        .toolbarLeft {
            float: left;
            overflow-y: auto;
            width: 49.7%;
        }

        .toolbarRight {
            float: left;
            width: 49.7%;
            overflow: auto;
        }

        .subtotal {
            font-weight: bold;
        }
        /*合计单元格样式*/
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div class="datagrid-toolbar toolbarLeft" id="divttFine">
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td>订单生成时间
                        <input class="Control_IteminputNoStyle" id="PaySuccessDateBg" name="PaySuccessDateBg" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default', onpicked: PaySuccessDateBgChange })" format="date" readonly="readonly" style="border: 1px #cccccc solid; width: 14%" runat="server" />
                        &nbsp;-&nbsp;
                        <input class="Control_IteminputNoStyle" id="PaySuccessDateEnd" name="PaySuccessDateEnd" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default', onpicked: PaySuccessDateEndChange, maxDate: '%y-%M-{%d-1}' })" format="date" readonly="readonly" style="border: 1px #cccccc solid; width: 14%" runat="server" />
                        &nbsp;客户名称&nbsp;
                        <input id="CustName" name="CustName" type="text" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 14%" />
                        &nbsp;房屋编号&nbsp;
                        <input id="RoomSign" name="RoomSign" type="text" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 14%" />
                    </td>
                </tr>
                <tr>
                    <td>支付完成时间
                        <input class="Control_IteminputNoStyle" id="PayTimeBg" name="PayTimeBg" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" readonly="readonly" style="border: 1px #cccccc solid; width: 14%" runat="server" />
                        &nbsp;-&nbsp;
                        <input class="Control_IteminputNoStyle" id="PayTimeEnd" name="PayTimeEnd" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" readonly="readonly" style="border: 1px #cccccc solid; width: 14%" runat="server" />
                        &nbsp;业务订单号&nbsp;
                        <input id="BusinessTradeNo" name="BusinessTradeNo" type="text" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 14%" onchange="BusinessTradeNoChange()" />
                        <input id="hiBusinessTradeNo" name="hiBusinessTradeNo" type="hidden" />
                        <a href="javascript:void(0)" onclick="LoadList(); " class="l-btn l-btn-small l-btn-plain">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">查询</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a>
                        <a href="javascript:void(0)" onclick="FinanceClear(); " class="l-btn l-btn-small l-btn-plain">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">清空</span><span class="l-btn-icon icon-filter">&nbsp;</span></span></a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="javascript:void(0)" onclick="PayAccountFinAndBank(); " class="l-btn l-btn-small l-btn-plain" id="Account1">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">对账复核</span><span class="l-btn-icon icon-add">&nbsp;</span></span></a>
                        <a href="javascript:void(0)" onclick="PayAccountFinAndBank(); " class="l-btn l-btn-small l-btn-plain" id="Account2">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">确认复核</span><span class="l-btn-icon icon-add">&nbsp;</span></span></a>
                        <a href="javascript:void(0)" onclick="ExcelPrint(); " class="l-btn l-btn-small l-btn-plain">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">导出</span><span class="l-btn-icon icon-page_white_excel">&nbsp;</span></span></a>
                        <a href="javascript:void(0)" onclick="UnderAccount(); " class="l-btn l-btn-small l-btn-plain" id="Account3">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">正式下账</span><span class="l-btn-icon icon-undo">&nbsp;</span></span></a>
                    </td>
                </tr>
            </table>
        </div>
        <div class="datagrid-toolbar toolbarRight" id="divttBank">
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td style="height: 26px">业务订单号
                        <input class="Control_IteminputNoStyle" id="BankBusinessTradeNo" name="BankBusinessTradeNo" style="border: 1px #cccccc solid; width: 14%" onchange="BankBusinessTradeNoChange()" />
                        <%--&nbsp;支付类型&nbsp;--%>
                        <select id="payType" name="payType" class="easyui-validatebox" style="border: 1px solid #cccccc; width: 14%; display: none">
                            <option value="" selected></option>
                            <option value="1">扫码支付</option>
                            <option value="2">移动支付</option>
                        </select>
                        <%--&nbsp;订单生成时间&nbsp;--%>
                        <input class="Control_IteminputNoStyle" id="timeStartBg" name="timeStartBg" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" readonly="readonly" style="border: 1px #cccccc solid; width: 14%; display: none" />
                        <%--&nbsp;-&nbsp;--%>
                        <input class="Control_IteminputNoStyle" id="timeStartEnd" name="timeStartEnd" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" readonly="readonly" style="border: 1px #cccccc solid; width: 14%; display: none" />
                    </td>
                </tr>
                <tr>
                    <td>支付完成时间
                        <input class="Control_IteminputNoStyle" id="timeEndBg" name="timeEndBg" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default', onpicked: timeEndBgChange })" format="date" readonly="readonly" style="border: 1px #cccccc solid; width: 14%" runat="server" />
                        &nbsp;-&nbsp;
                        <input class="Control_IteminputNoStyle" id="timeEndEnd" name="timeEndEnd" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default', onpicked: timeEndEndChange, maxDate: '%y-%M-{%d-1}' })" format="date" readonly="readonly" style="border: 1px #cccccc solid; width: 14%" runat="server" />
                        &nbsp;&nbsp;
                        <%--<a href="javascript:void(0)" runat="server" onclick="PayAccount()" class="l-btn l-btn-small l-btn-plain">
                            &nbsp;&nbsp;取数时间:<input class="Control_IteminputNoStyle" id="AccountDate" name="AccountDate" runat="server" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" readonly="readonly" style="border: 1px #cccccc solid; width: 40%" />
                            <asp:Button Style="display: none;" Width="0" Height="0" OnClick="Unnamed_Click" ID="Account" runat="server" />
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">手动取数</span><span class="l-btn-icon icon-add">&nbsp;</span></span></a>--%>
                        <a href="javascript:void(0)" onclick="LoadList(); " class="l-btn l-btn-small l-btn-plain">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">查询</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a>
                        <a href="javascript:void(0)" onclick="BankClear(); " class="l-btn l-btn-small l-btn-plain">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">清空</span><span class="l-btn-icon icon-filter">&nbsp;</span></span></a>
                    </td>
                </tr>
            </table>
        </div>
        <div id="ContainerLeft" class="ContainerLeft">
            <div id="TableContainerFinance" style="background-color: #cccccc;">
            </div>
        </div>
        <div id="ContainerRight" class="ContainerRight">
            <div id="TableContainerBank" style="background-color: #cccccc;">
            </div>
        </div>

        <div id="SearchDlg2" class="easyui-dialog" title="收款方式" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 300px; height: 100px;">
            <table class="DialogTable">

                <tr>
                    <td class="TdTitle">收款方式</td>

                    <td class="TdContentSearch" colspan="3">
                        <select id="ChargeMode" name="ChargeMode" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" id="search2" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="AuditBankZGYHReconBrowseNew();">确定</a>
                </tr>
            </table>
        </div>

        <script type="text/javascript">
            //手动读取账单信息
            function PayAccount() {
                if ($("#AccountDate").val() != '' && $("#AccountDate").val() != null && $("#AccountDate").val() != undefined) {
                    document.getElementById("Account").click();
                } else {
                    HDialog.Info("请选择取数时间");
                }
            }

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainerFinance").css("height", h + "px");
                $("#TableContainerBank").css("height", h + "px");
                var w = $(window).width();
                $("#TableContainerFinance").css("width", w / 2 - 1 + "px");
                $("#TableContainerBank").css("width", w / 2 + "px");
                $("#divttFine").css("width", w / 2 - 1 + "px");
                $("#divttBank").css("width", w / 2 + "px");
            }
            InitFunction();

            function FinanceClear() {
                $('#PaySuccessDateBg').val('');
                $('#PaySuccessDateEnd').val('');
                $('#timeEndBg').val('');
                $('#timeEndEnd').val('');
                $('#PayTimeBg').val('');
                $('#PayTimeEnd').val('');
                $('#CustName').val('');
                $('#RoomSign').val('');
                $('#BusinessTradeNo').val('');
            }

            function BankClear() {
                $('#BankBusinessTradeNo').val('');
                $('#payType').val('');
                $('#timeStartBg').val('');
                $('#timeStartEnd').val('');
                $('#PaySuccessDateBg').val('');
                $('#PaySuccessDateEnd').val('');
                $('#timeEndBg').val('');
                $('#timeEndEnd').val('');
            }

            //导出
            function ExcelPrint() {
                var url = '../ChargesNew/MobilePayAccountExcel.aspx?ExcelName=对账页面导出' + '&random=' + Math.random() + GetParamet();
                window.open(url);
            }

            function GetParamet() {
                var str = "&PaySuccessDateBg=" + $("#PaySuccessDateBg").val();
                str += "&PaySuccessDateEnd=" + $("#PaySuccessDateEnd").val();
                str += "&PayTimeBg=" + $("#PayTimeBg").val();
                str += "&PayTimeEnd=" + $("#PayTimeEnd").val();
                str += "&timeEndBg=" + $("#timeEndBg").val();
                str += "&timeEndEnd=" + $("#timeEndEnd").val();
                str += "&CustName=" + $("#CustName").val();
                str += "&RoomSign=" + $("#RoomSign").val();
                str += "&BusinessTradeNo=" + $("#BusinessTradeNo").val();
                str += "&BankBusinessTradeNo=" + $("#BankBusinessTradeNo").val();
                str += "&payType=" + $("#payType").val();
                str += "&timeStartBg=" + $("#timeStartBg").val();
                str += "&timeStartEnd=" + $("#timeStartEnd").val();
                return encodeURI(str);
            }

            function PaySuccessDateBgChange() {
                $('#timeEndBg').val($('#PaySuccessDateBg').val());
            }

            function PaySuccessDateEndChange() {
                $('#timeEndEnd').val($('#PaySuccessDateEnd').val());
            }

            function timeEndBgChange() {
                $('#PaySuccessDateBg').val($('#timeEndBg').val());
            }

            function timeEndEndChange() {
                $('#PaySuccessDateEnd').val($('#timeEndEnd').val());
            }

            function BusinessTradeNoChange() {
                $('#BankBusinessTradeNo').val($('#BusinessTradeNo').val());
            }

            function BankBusinessTradeNoChange() {
                $('#BusinessTradeNo').val($('#BankBusinessTradeNo').val());
            }

            //对账
            function PayAccountFinAndBank() {
                $.tool.DataGet('PayAccount', 'PayAccountFinAndBank', 'random=' + Math.random() + GetParamet(),
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Info("对账成功" + _Data + "条数据");
                        LoadList();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //对账
            function AccountMsg(Type) {
                if (Type == '1') {
                    HDialog.Info("请先对已复核数据进行确认");
                } else {
                    HDialog.Info("请先对数据进行复核");
                }
            }

            var frozenColumns;
            frozenColumns = [[
                { field: 'ck', checkbox: true },
                { field: 'CommName', title: '项目', width: 120, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 70, align: 'left', sortable: true },
            ]];
            var columnFinance;
            columnFinance = [[
                { field: 'RoomSign', title: '房屋编号', width: 250, align: 'left', sortable: true },
                {
                    field: 'BusinessTradeNo', title: '业务订单号', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var FeesID = '';
                        var Type = '2';
                        if (row.PayData != undefined) {
                            var data = JSON.parse(row.PayData);
                            if (data.Type == "1") {
                                for (var i = 0; i < data.Data.length; i++) {
                                    FeesID = FeesID + ',' + data.Data[i].FeesId;
                                }
                                Type = "1";
                            }
                        }
                        if (FeesID.length > 0) {
                            FeesID = FeesID.substr(1, FeesID.length);
                        }
                        var str = "<a class=\"HrefStyle\" onclick=\"OrderInfo('" + FeesID + "','" + Type + "');\">" + row.BusinessTradeNo + "</a>";
                        return str;
                    }
                },
                { field: 'BillsAmount', title: '缴费金额', width: 70, align: 'left', sortable: true },
                { field: 'AccountStatusName', title: '对账结果', width: 50, align: 'left', sortable: true },
                { field: 'PaySuccessDate', title: '订单生成时间', width: 170, align: 'left', sortable: true },
                { field: 'PayTime', title: '支付完成时间', width: 170, align: 'left', sortable: true },
                //{ field: 'BillsSign', title: '票据号码', width: 120, align: 'left', sortable: true },
                { field: 'SuccessName', title: '下账状态', width: 120, align: 'left', sortable: true },
                { field: 'PayMode', title: '支付渠道', width: 150, align: 'left', sortable: true }//,
                //{ field: 'ChargeMode', title: '收款方式', width: 150, align: 'left', sortable: true }
            ]];
            var toolbarFinance = [
                {
                    text: '对账',
                    iconCls: 'icon-add',
                    handler: function () {
                        PayAccountFinAndBank();
                    }
                }, '-',
                //{
                //    text: '筛选',
                //    iconCls: 'icon-filter',
                //    handler: function () {
                //        $('#SearchDlgFinance').parent().appendTo($("form:first"));
                //        $('#SearchDlgFinance').dialog('open');
                //    }
                //}, "-",
                {
                    text: 'EXCEL导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        ExcelPrint();
                    }
                }
            ];

            var columnBank;
            columnBank = [[
                //{ field: 'ck', checkbox: true },
                //{ field: 'outTradeNo', title: '商户订单号', width: 150, align: 'left', sortable: true },
                { field: 'businessTradeNo', title: '业务订单号', width: 150, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 250, align: 'left', sortable: true },
                { field: 'totalFee', title: '金额', width: 150, align: 'left', sortable: true },
                //{ field: 'timeStart', title: '订单生成时间', width: 200, align: 'left', sortable: true },
                { field: 'timeEnd', title: '支付完成时间', width: 200, align: 'left', sortable: true },
                { field: 'payTypeName', title: '交易类型', width: 200, align: 'left', sortable: true }//,
                //{ field: 'orderStatusName', title: '支付订单状态', width: 200, align: 'left', sortable: true }//,
                //{ field: 'errorMsg', title: '错误信息', width: 200, align: 'left', sortable: true }
            ]];
            var toolbarBank = [
                //{
                //    text: '筛选',
                //    iconCls: 'icon-filter',
                //    handler: function () {
                //        $('#SearchDlgBank').parent().appendTo($("form:first"));
                //        $('#SearchDlgBank').dialog('open');
                //    }
                //}, '-',
            ];

            function LoadList() {
                $.tool.DataGet('PayAccount', 'GetSum', 'random=' + Math.random() + GetParamet(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var rows = JSON.parse(_Data).rows;
                        for (var i = 0; i < rows.length; i++) {
                            if (rows[i].name == 'fin') {
                                //添加“合计”列
                                $('#TableContainerFinance').datagrid('reloadFooter', [{
                                    CustName: '合计',
                                    BusinessTradeNo: '',
                                    BillsAmount: "<span style='color:red'>" + rows[i].sumAmount + "</span>"
                                }]);
                            }
                            if (rows[i].name == 'bank') {
                                //添加“合计”列
                                $('#TableContainerBank').datagrid('reloadFooter', [{
                                    businessTradeNo: '合计',
                                    totalFee: "<span style='color:red'>" + rows[i].sumAmount + "</span>"
                                }]);
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
                $("#TableContainerFinance").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    nowrap: false,
                    columns: columnFinance,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    singleSelect: true,
                    rownumbers: true,
                    border: false,
                    pagination: true,
                    width: "100%",
                    checkOnSelect: true,
                    selectOnCheck: true,
                    singleSelect: true,
                    //toolbar: toolbarFinance,
                    toolbar: '#divttFine',
                    showFooter: true,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("PayAccount", "GetTwApiPay", "TableContainerFinance", param);
                    },
                    onLoadSuccess: function (data) {
                        var rows = $('#TableContainerFinance').datagrid("getRows");
                        if (rows[0].AccountStatusName > '') {
                            $('#Account1').attr('onclick', "AccountMsg('1')");
                            $('#Account2').attr('onclick', "PayAccountFinAndBank()");
                        } else {
                            $('#Account1').attr('onclick', "PayAccountFinAndBank()");
                            $('#Account2').attr('onclick', "AccountMsg('2')");
                        }
                    },
                    rowStyler: function (index, row) {
                        if (row.AccountStatus == '0') {
                            return 'background-color:pink;color:blue;font-weight:bold;';
                        }
                    }
                });
                $("#TableContainerBank").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    nowrap: false,
                    columns: columnBank,
                    fitcolumns: false,
                    singleSelect: true,
                    rownumbers: true,
                    border: false,
                    pagination: true,
                    width: "100%",
                    checkOnSelect: true,
                    selectOnCheck: true,
                    singleSelect: true,
                    //toolbar: toolbarBank,
                    toolbar: '#divttBank',
                    showFooter: true,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("PayAccount", "GetBankApiPay", "TableContainerBank", param);
                    },
                    onLoadSuccess: function (data) {
                    },
                    rowStyler: function (index, row) {
                        if (row.AccountStatus == '0') {
                            return 'background-color:pink;color:blue;font-weight:bold;';
                        }
                    }
                });
            }
            LoadList();

            function OrderInfo(FeesID, Type) {
                if (Type == "2") {
                    HDialog.Info("移动支付预存暂无订单明细");
                    return;
                }
                HDialog.Open('950', '540', '../ChargesNew/BusinessTradeInfo.aspx?ReceID=' + FeesID, '订单详情', true, function callback(_Data) {
                });
            }

            //下帐
            function UnderAccount() {


                var row = $("#TableContainerFinance").datagrid("getChecked");
                if (row == null || row.length == 0) {
                    HDialog.Info('请选择要下账的费用！');
                    return;
                }

                ////支付金额
                //var PaymentAmount = row.PaymentAmount;
                ////Amount
                //var Amount = row.Amount;
                ////支付类型
                //var Source = row.Source;
                ////是否预存
                //var IsPrec = row.IsPrec;
                //订单号

                //if (IsPrec<=0) {
                //    HDialog.Info("错误的业务类型");
                //    return;
                //}

                $.messager.confirm('确定', '是否执行下帐操作', function (r) {
                    if (r) {

                        $('#SearchDlg2').parent().appendTo($("form:first"))
                        $('#SearchDlg2').dialog('open');


                    }
                });
            }
            function AuditBankZGYHReconBrowseNew() {
                var row = $("#TableContainerFinance").datagrid("getChecked");
                $.tool.DataPost('BankAgentSet', 'BankZGYHReconBrowseNew', 'BusinessTradeNo=' + row[0].BusinessTradeNo + '&ChargeMode=' + $("#ChargeMode").find("option:selected").text(),
                    function Init() {
                    },
                    function callback(_Data) {
                        //LoadList();   
                        HDialog.Info(_Data + ",请重新刷新订单列表");
                        $('#SearchDlg2').dialog('close');
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>
