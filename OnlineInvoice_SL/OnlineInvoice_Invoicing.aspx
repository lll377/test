<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnlineInvoice_Invoicing.aspx.cs" Inherits="M_Main.OnlineInvoice_SL.OnlineInvoice_Invoicing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>开具发票</title>
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
</head>
<body style="overflow-y: auto;">
    <form id="frmForm" runat="server">
        <input id="ApiBaseUrl" type="hidden" name="ApiBaseUrl" runat="server" />
        <input id="CommId" type="hidden" name="CommId" runat="server" />
        <input id="CustId" type="hidden" name="CustId" runat="server" />
        <input id="InvoicingType" type="hidden" name="InvoicingType" runat="server" />
        <input id="RecdIds" type="hidden" name="RecdIds" runat="server" />
        <input id="OrderNos" type="hidden" name="OrderNos" runat="server" />
        <input id="InvoicingStatus" type="hidden" name="InvoicingStatus" runat="server" />
        <input id="Invoicer" type="hidden" name="Invoicer" runat="server" />

        <table class="DialogTable" id="DialogTable">
            <tr class="seller-info">
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">销货单位信息</span> </td>
            </tr>
            <tr class="seller-info">
                <td class="TdTitle">税控类别</td>
                <td class="TdContent">
                    <input id="TaxControlTypeName" type="text" class="easyui-validatebox" disabled name="TaxControlTypeName" runat="server" />
                </td>
                <td class="TdTitle">税控盘编号</td>
                <td class="TdContent">
                    <input id="TaxControlCode" type="text" class="easyui-validatebox" disabled name="TaxControlCode" runat="server" />
                </td>
            </tr>
            <tr class="seller-info">
                <td class="TdTitle">销货单位识别号</td>
                <td class="TdContent">
                    <input id="SellIdentifier" type="text" class="easyui-validatebox" disabled name="SellIdentifier" runat="server" /></td>
                <td class="TdTitle">销货单位名称</td>
                <td class="TdContent">
                    <input id="SellName" type="text" class="easyui-validatebox" disabled name="SellName" runat="server" />
                </td>
            </tr>
            <tr class="seller-info">
                <td class="TdTitle">销货单位地址电话</td>
                <td class="TdContent">
                    <input id="SellAddrAndPhone" type="text" class="easyui-validatebox" disabled name="SellAddrAndPhone" runat="server" /></td>
                <td class="TdTitle">销货单位银行名称账号</td>
                <td class="TdContent">
                    <input id="SellBankAndAccount" type="text" class="easyui-validatebox" disabled name="SellBankAndAccount" runat="server" />
                </td>
            </tr>

            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">购货单位信息</span> </td>
            </tr>
            <tr>
                <td class="TdTitle">客户名称</td>
                <td class="TdContentSearch">
                    <input id="CustName" searcher="SelCust" style="width: 76%;" data-options="" name="CustName" class="easyui-searchbox" runat="server" />
                </td>
                <td class="TdTitle">购货单位识别号</td>
                <td class="TdContent">
                    <input id="VATNumber" type="text" class="easyui-validatebox" disabled name="VATNumber" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">购货单位名称</td>
                <td class="TdContent">
                    <input id="VATName" type="text" class="easyui-validatebox" disabled name="VATName" runat="server" />
                </td>
                <td class="TdTitle">购货单位地址电话</td>
                <td class="TdContent">
                    <input id="VATAddLinkTel" type="text" class="easyui-validatebox" disabled name="VATAddLinkTel" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">购货单位银行名称账号</td>
                <td class="TdContent">
                    <input id="VATBankAccoutNumber" type="text" class="easyui-validatebox" disabled name="VATBankAccoutNumber" runat="server" />
                </td>
                <td class="TdTitle">购货单位邮箱</td>
                <td class="TdContent">
                    <input id="VATEmail" type="text" class="easyui-validatebox" name="VATEmail" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <div id="TableContainer" style="width: 100%; height: 220px;"></div>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                    <span style="font-size: 16px">票据信息</span> </td>
            </tr>
            <tr>
                <td class="TdTitle">发票类型</td>
                <td class="TdContentSearch">
                    <select id="InvoiceType" name="InvoiceType" runat="server" disabled>
                        <option value="1" selected>增值税电子发票</option>
                        <option value="2">增值税专用发票</option>
                        <option value="3">增值税普通发票</option>
                    </select>
                </td>
                <td class="TdTitle">
                    <asp:Label ID="lbPaidAmount" runat="server">票据金额</asp:Label>
                </td>
                <td class="TdContentSearch">
                    <input id="PaidAmount" readonly name="PaidAmount" runat="server">
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <div id="TableContainer2" style="width: 100%; height: 100px;"></div>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="4" style="padding-top: 10px">
                    <input class="button" id="btnSave" type="button" value="开票" name="btnSave" onclick="Invoicing()" runat="server">&nbsp;&nbsp;
                </td>
            </tr>
        </table>
    </form>
    <script type="text/javascript">
        var Columns = [[
            { field: 'feeId', title: 'FeeId', hidden: true },
            { field: 'feeType', title: 'FeeType', hidden: true },
            { field: 'ck', checkbox: true },
            { field: 'feeTypeName', title: '业务类型', width: 100, align: 'left', sortable: true },
            { field: 'productCode', title: '商品编码', width: 180, align: 'left', sortable: true },
            { field: 'productName', title: '商品名称', width: 180, align: 'left', sortable: true },
            { field: 'productTaxItem', title: '商品税目', width: 180, align: 'left', sortable: true },
            { field: 'productSpec', title: '规格型号', width: 180, align: 'left', sortable: true },
            { field: 'feesDueDate', title: '费用应收时间', width: 180, align: 'left', sortable: true },
            { field: 'feesStartDate', title: '费用开始时间', width: 180, align: 'left', sortable: true },
            { field: 'feesEndDate', title: '费用结束时间', width: 100, align: 'left', sortable: true },
            { field: 'amount', title: '金额', width: 100, align: 'left', sortable: true },
            { field: 'lateAmount', title: '违约金', width: 100, align: 'left', sortable: true },
            { field: 'taxRate', title: '税率', width: 100, align: 'left', sortable: true },
            { field: 'taxAmount', title: '税额', width: 100, align: 'left', sortable: true },
            { field: 'withTaxAmount', title: '价税合计', width: 100, align: 'left', sortable: true }
        ]];
        var toolbar = [];
        if ($("#InvoicingType").val() == "History") {
            toolbar = [
                {
                    text: '选择开票记录',
                    iconCls: 'icon-add',
                    handler: function () {
                        if ($('#CustId').val() == '') {
                            HDialog.Info('请选择要开票的客户');
                        }
                        else {
                            var custId = $('#CustId').val();
                            var w = $(window).width();
                            var h = $(window).height();
                            var conent = "../OnlineInvoice_SL/OnlineInvoice_UnbilledFeesDlg.aspx?CustId=" + custId;
                            HDialog.Open(w, h, conent, '收费信息', false, function callback(_Data) {
                                if (_Data != "" && _Data != undefined) {
                                    var obj = JSON.parse(_Data);
                                    var rows = $('#TableContainer').datagrid('getRows');
                                    for (var i = 0; i < rows.length; i++) {
                                        var flag = true;
                                        for (var j = 0; j < obj.rows.length; j++) {
                                            if (rows[i].recdId == obj.rows[j].recdId) {
                                                flag = false;
                                            }
                                        }
                                        if (flag == true) {
                                            obj.rows.push(rows[i]);
                                        }
                                    }
                                    var totalAmount = 0;
                                    $.each(obj.rows, function (key, item) {
                                        totalAmount += parseFloat(item.withTaxAmount);
                                    })
                                    $('#PaidAmount').val(ToDecimal(totalAmount, 2));
                                    InitRemark(obj.rows);
                                    $('#TableContainer').datagrid('loadData', obj);
                                }
                            });
                        }
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var isView = $("#IsView").val();
                        if (isView != "1") {
                            var rows = $("#TableContainer").datagrid('getSelections');
                            if (rows == "" || rows == undefined) {
                                HDialog.Info('请选择删除项!');
                                return;
                            }
                            for (var i = 0; i < rows.length; i++) {
                                var index = $('#TableContainer').datagrid('getRowIndex', rows[i]);
                                $('#TableContainer').datagrid('deleteRow', index);
                            }

                            rows = $('#TableContainer').datagrid('getRows');

                            var totalAmount = 0;
                            $.each(rows, function (key, item) {
                                totalAmount += parseFloat(item.withTaxAmount);
                            })

                            $('#PaidAmount').val(ToDecimal(totalAmount, 2));
                            InitRemark(rows);

                            var obj = {
                                "total": rows.length,
                                "rows": rows
                            }

                            //重新刷新datagrid
                            $('#TableContainer').datagrid('loadData', obj);
                        }
                    }
                }
            ]
        }

        //重写DataGrid,支持更改页脚样式
        var myview = $.extend({}, $.fn.datagrid.defaults.view, {
            renderFooter: function (target, container, frozen) {
                var opts = $.data(target, 'datagrid').options;
                var rows = $.data(target, 'datagrid').footer || [];
                var fields = $(target).datagrid('getColumnFields', frozen);
                var table = ['<table class="datagrid-ftable" cellspacing="0" cellpadding="0" border="0"><tbody>'];

                for (var i = 0; i < rows.length; i++) {
                    var styleValue = opts.rowStyler ? opts.rowStyler.call(target, i, rows[i]) : '';
                    var style = styleValue ? 'style="' + styleValue + '"' : '';
                    table.push('<tr class="datagrid-row" datagrid-row-index="' + i + '"' + style + '>');
                    table.push(this.renderRow.call(this, target, fields, frozen, i, rows[i]));
                    table.push('</tr>');
                }
                table.push('</tbody></table>');
                $(container).html(table.join(''));
            }
        });

        //初始化表格信息
        $("#TableContainer").datagrid({
            nowrap: false,
            title: '开票信息',
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: Columns,
            fitColumns: true,
            remoteSort: false,
            singleSelect: false,
            pagination: false,
            width: "100%",
            toolbar: toolbar,
            sortOrder: "asc",
            rownumbers: true,
            border: false,
            showFooter: true,
            view: myview,
            rowStyler: function (index, row) {
                //如果是页脚
                if (row.Fids == 'footer') {
                    return 'background-color:#F4F4F4;border:none;'; // return inline style
                }
            },
            onLoadSuccess: function (data) {
                //加载页脚
                $('#TableContainer').datagrid('reloadFooter', [
                    {
                        Fids: 'footer',
                        feeTypeName: "<span style='color:red'>合计</span>",
                        amount: "<span style='color:red'>" + Compute("amount") + "</span>",
                        lateAmount: "<span style='color:red'>" + Compute("lateAmount") + "</span>",
                        withTaxAmount: "<span style='color:red'>" + Compute("withTaxAmount") + "</span>"
                    }
                ]);
            }
        });

        //初始化表格信息
        $("#TableContainer2").datagrid({
            nowrap: false,
            title: '发票备注(<span style="color:red;">*如果需要备注换行显示，请在换行的地方添加符号“&”</span>)',
            columns: [
                [
                    { field: 'recdIds', title: 'recdIds', hidden: true },
                    { field: 'orderNo', title: '订单号', width: 100, align: 'left', sortable: true, rowspan: 1 },
                    { field: 'productName', title: '商品名称', width: 100, align: 'left', sortable: true, rowspan: 1 },
                    { field: 'remark', title: '备注', width: 900, align: 'left', sortable: true, rowspan: 1, editor: 'textbox' }
                ]
            ],
            fitColumns: true,
            remoteSort: false,
            singleSelect: true,
            pagination: false,
            width: "100%",
            sortOrder: "asc",
            rownumbers: true,
            border: false,
            nowrap: true,
            onClickCell: onClickCell
        });

        var editIndex = undefined;
        function endEditing() {//该方法用于关闭上一个焦点的editing状态
            if (editIndex == undefined) {
                return true
            }
            if ($('#TableContainer2').datagrid('validateRow', editIndex)) {
                $('#TableContainer2').datagrid('endEdit', editIndex);
                editIndex = undefined;
                return true;
            } else {
                return false;
            }
        }

        //点击单元格事件：
        function onClickCell(index, field, value) {
            var invoicingType = $("#InvoicingType").val();
            if (invoicingType == "invoicingType" || invoicingType == "History" || (invoicingType == "View" && $("#InvoicingStatus").val() == 0)) {
                if (endEditing()) {
                    if (field == "remark") {
                        $(this).datagrid('beginEdit', index);
                        var ed = $(this).datagrid('getEditor', { index: index, field: field });
                        $(ed.target).focus();
                    }
                    editIndex = index;
                }
                $('#TableContainer2').datagrid('onClickRow');
            }
        }

        $(function () {
            InitInvoiceInfo();
            var invoicingType = $("#InvoicingType").val();
            switch (invoicingType) {
                case "Immediate":
                case "History":
                    $("#btnSave").val('开具发票');
                    $("#InvoiceType").removeAttr("disabled");
                    break;
                case "RedInvoice":
                    $("#btnSave").val('发票红冲');
                    break;
                case "Invalid":
                    $("#btnSave").val('发票作废');
                    break;
                case "View":
                    if ($("#InvoicingStatus").val() == 0) {
                        $("#InvoiceType").removeAttr("disabled");
                        $("#btnSave").val('重新开票');
                    } else {
                        $("#btnSave").hide();
                    }
                    break;
            }

        });

        //指定列求和
        function Compute(colName) {
            var rows = $('#TableContainer').datagrid('getRows');
            var total = 0;
            for (var i = 0; i < rows.length; i++) {
                total += parseFloat(rows[i][colName]);
            }
            return ToDecimal(total, 2);
        }

        //加载销方信息
        function InitSellInfo() {
            $.tool.pageLoading();
            $.ajax({
                url: $("#ApiBaseUrl").val().replace("###", "GetSellInfoByCommId"),
                type: 'POST',
                data: JSON.stringify({ "commId": $("#CommId").val() }),
                dataType: 'json',
                cache: false,
                async: true,
                success: function (_data) {
                    if (_data.code == 200) {
                        var sellInfo = _data.data;
                        $("#TaxControlTypeName").val(sellInfo.taxControlTypeName);
                        $("#TaxControlCode").val(sellInfo.taxControlCode);
                        $("#SellIdentifier").val(sellInfo.sellIdentifier);
                        $("#SellName").val(sellInfo.sellName);
                        $("#SellAddrAndPhone").val(sellInfo.sellAddrAndPhone);
                        $("#SellBankAndAccount").val(sellInfo.sellBankAndAccount);
                    } else {
                        HDialog.Info("销方信息加载失败：" + _data.message);
                    }
                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {
                    $.tool.pageUnLoading();
                }
            });
        }

        //加载购方信息
        function InitPurchInfo() {
            $.tool.pageLoading();
            $.ajax({
                url: $("#ApiBaseUrl").val().replace("###", "GetPurchInfo"),
                type: 'POST',
                data: JSON.stringify({ "custId": $("#CustId").val() }),
                dataType: 'json',
                cache: false,
                async: true,
                success: function (_data) {
                    if (_data.code == 200) {
                        var purchInfo = _data.data;
                        $("#VATNumber").val(purchInfo.vatNumber);
                        $("#VATName").val(purchInfo.vatName);
                        $("#VATAddLinkTel").val(purchInfo.vatAddLinkTel);
                        $("#VATBankAccoutNumber").val(purchInfo.vatBankAccoutNumber);
                        $("#VATEmail").val(purchInfo.vatEmail);
                    } else {
                        HDialog.Info("购方信息加载失败：" + _data.message);
                    }
                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {
                    $.tool.pageUnLoading();
                }
            });
        }

        //加载发票信息
        function InitInvoiceInfo() {
            $.tool.pageLoading();
            var invoicingType = $("#InvoicingType").val()
            var apiUrl = $("#ApiBaseUrl").val().replace("###", "GetInvoiceInfo");
            var isHistory = 0;
            switch (invoicingType) {
                case "Immediate":
                case "History":
                    isHistory = 0;
                    break;
                default:
                    isHistory = 1;
                    break;
            }

            var param = {
                "commId": $("#CommId").val(),
                "custId": $("#CustId").val(),
                "recdIds": $("#RecdIds").val(),
                "orderNos": $("#OrderNos").val()
            }
            $.ajax({
                url: apiUrl,
                type: 'POST',
                data: JSON.stringify(param),
                dataType: 'json',
                cache: false,
                async: true,
                success: function (_data) {
                    if (_data.code == 200) {
                        var sellInfo = _data.data.sellInfo;
                        var purchInfo = _data.data.purchInfo;
                        var feeDetails = _data.data.invoiceFeesDetail;
                        //加载销方信息
                        $("#TaxControlTypeName").val(sellInfo.taxControlTypeName);
                        $("#TaxControlCode").val(sellInfo.taxControlCode);
                        $("#SellIdentifier").val(sellInfo.sellIdentifier);
                        $("#SellName").val(sellInfo.sellName);
                        $("#SellAddrAndPhone").val(sellInfo.sellAddrAndPhone);
                        $("#SellBankAndAccount").val(sellInfo.sellBankAndAccount);

                        //加载购方信息
                        $('#CustName').searchbox("setValue", purchInfo.custName);
                        $("#VATNumber").val(purchInfo.vatNumber);
                        $("#VATName").val(purchInfo.vatName);
                        $("#VATAddLinkTel").val(purchInfo.vatAddLinkTel);
                        $("#VATBankAccoutNumber").val(purchInfo.vatBankAccoutNumber);
                        $("#VATEmail").val(purchInfo.vatEmail);

                        if (feeDetails.length > 0) {
                            var totalAmount = 0;
                            $.each(feeDetails, function (key, item) {
                                totalAmount += parseFloat(item.withTaxAmount);
                            })
                            $('#PaidAmount').val(ToDecimal(totalAmount, 2));

                            var obj = {
                                "rows": feeDetails,
                                "total": feeDetails.length
                            };
                            InitRemark(feeDetails);
                            $('#TableContainer').datagrid('loadData', obj);
                        }
                    } else {
                        HDialog.Info("发票信息加载失败：" + _data.message);
                    }
                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {
                    $.tool.pageUnLoading();
                }
            });
        }

        //加载备注信息
        function InitRemark(rows) {
            var recdIds = '';
            for (var i = 0; i < rows.length; i++) {
                if (rows[i].feeType != 4) {
                    recdIds += rows[i].recdId + ',';
                }
            }
            if (recdIds.length > 0) {
                recdIds = recdIds.substr(0, recdIds.length - 1);
            }

            var param = {
                "commId": $("#CommId").val(),
                "custId": $("#CustId").val(),
                "recdIds": recdIds,
                "invoiceType": $("#InvoiceType option:selected").val()
            }
            $.ajax({
                url: $("#ApiBaseUrl").val().replace("###", "GetRemark"),
                type: 'POST',
                data: JSON.stringify(param),
                dataType: 'json',
                cache: false,
                async: false,
                success: function (_data) {
                    if (_data.code == 200) {
                        var obj = {
                            "rows": _data.data,
                            "total": _data.data.length
                        };
                        $('#TableContainer2').datagrid('loadData', obj);
                    } else {
                        HDialog.Info("备注信息加载失败：" + _data.message);
                    }
                }
            });
        }

        //选择客户信息
        function SelCust() {
            if ($("#InvoicingType").val() == "History") {
                $('#CustName').searchbox("setValue", '');
                $('#CustId').val('');

                HDialog.Open(800, 400, "../DialogNew/CustDlg.aspx?CommID=" + $('#CommId').val(), '客户选择', false, function callback(_Data) {
                    if (_Data != '') {
                        var data = JSON.parse(_Data);
                        $('#CustName').searchbox("setValue", data.CustName);
                        $('#CustId').val(data.CustID);
                        InitPurchInfo();
                    }
                });
            }
        }

        //开具发票
        function Invoicing() {
            endEditing();
            var remarks = $('#TableContainer2').datagrid('getRows');
            var custId = $('#CustId').val();
            var invoicingType = $("#InvoicingType").val()
            var rows = $('#TableContainer').datagrid('getRows');
            
            if ((custId == "0") || (custId == "")) {
                HDialog.Info("请选择客户!");
                return false;
            }
            if (rows == null || rows == '') {
                HDialog.Info("请选择票据明细!");
                return false;
            }
            if ($("#VATEmail").val() == '') {
                HDialog.Info("请输入邮箱!");
                return false;
            }
            var recdIds = '';
            for (var i = 0; i < rows.length; i++) {
                if (rows[i].feeType != 4) {
                    recdIds += rows[i].recdId + ',';
                }
            }

            if (recdIds.length > 0) recdIds = recdIds.substr(0, recdIds.length - 1);
            if (recdIds.length == 0) {
                HDialog.Info("没有可开票费用！");
                return false;
            }

            var invoicingMode = 0;
            switch (invoicingType) {
                case "Immediate":
                case "History":
                case "View":
                    invoicingMode = 0; //蓝票
                    break;
                case "RedInvoice":
                    invoicingMode = 1; //红票
                    break;
                case "Invalid":
                    invoicingMode = 2; //作废
                    break;
            }

            var param = {
                "commId": $("#CommId").val(),
                "custId": custId,
                "emailAddress": $("#VATEmail").val(),
                "invoicingMode": invoicingMode,
                "invoiceType": $("#InvoiceType option:selected").val(),
                "recdIds": recdIds,
                "orderNos": $("#OrderNos").val(),
                "invoicer": $("#Invoicer").val(),
                "remarks": JSON.stringify(remarks)
            };

            $.tool.pageLoading();
            $.ajax({
                url: $("#ApiBaseUrl").val().replace("###", "Invoicing"),
                type: 'POST',
                data: JSON.stringify(param),
                dataType: 'json',
                cache: false,
                async: true,
                success: function (data) {
                    HDialog.Info(data.message);
                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {
                    $.tool.pageUnLoading();
                }
            });
        }
    </script>
</body>
</html>
