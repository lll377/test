<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnlineInvoiceBrowse.aspx.cs" Inherits="M_Main.OnlineInvoice_SL.OnlineInvoiceBrowse" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>开具发票</title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
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
<body>
    <form id="frmForm">
        <input id="CustId" type="hidden" name="CustId" runat="server" />
        <input id="CommId" type="hidden" name="CommId" runat="server" />
        <input id="ApiBaseUrl" type="hidden" name="ApiBaseUrl" runat="server" />
        <div id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden; width: 640px; height: 260px;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable" style="margin-top: 5px;">
                <tr style="white-space: nowrap;">
                    <td class="TdTitle">购货单位识别号</td>
                    <td class="TdContent">
                        <input type="text" id="VATNumber" name="VATNumber" runat="server" />
                    </td>
                    <td class="TdTitle">购货单位名称</td>
                    <td class="TdContent">
                        <input type="text" id="VATName" name="VATName" runat="server" />
                    </td>
                </tr>
                <tr style="white-space: nowrap;">
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContent">
                        <input type="text" id="CustName" name="CustName" runat="server" />
                    </td>
                    <td class="TdTitle">发票类型</td>
                    <td class="TdContent">
                        <select id="InvoiceType" name="InvoiceType" runat="server">
                            <option value="-1" selected>全部</option>
                            <option value="1">增值税电子发票</option>
                            <option value="2">增值税专用发票</option>
                            <option value="3">增值税普通发票</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">发票代码</td>
                    <td class="TdContent">
                        <input type="text" id="InvoiceCode" name="InvoiceCode" runat="server" />
                    </td>
                    <td class="TdTitle">发票号码 </td>
                    <td class="TdContent">
                        <input type="text" id="InvoiceNo" name="InvoiceNo" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">开票日期</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="InvoicingStartDate" name="InvoicingStartDate" runat="server"
                            onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd', alwaysUseStartDate: true })" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="InvoicingEndDate" name="InvoicingEndDate" runat="server"
                            onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd', alwaysUseStartDate: true })" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">开票人</td>
                    <td class="TdContent">
                        <input type="text" id="Invoicer" name="Invoicer" runat="server" />
                    </td>
                    <td class="TdTitle">开票状态 </td>
                    <td class="TdContentSearch">
                        <select id="InvoicingStatus" name="InvoicingStatus" runat="server">
                            <option value="-2" selected>全部</option>
                            <option value="1">正常</option>
                            <option value="2">红冲</option>
                            <option value="3">作废</option>
                            <option value="-1">失败</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">开票批次号</td>
                    <td class="TdContent">
                        <input type="text" id="InvoicingBatchNo" name="InvoicingBatchNo" runat="server" />
                    </td>
                    <td class="TdTitle">订单号</td>
                    <td class="TdContentSearch">
                        <input type="text" id="OrderNo" name="OrderNo" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList(1, 50)">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
        <script type="text/javascript">
            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();

            var columns = [[
                { field: 'ck', checkbox: true },
                { field: 'custName', title: '客户名称', width: 100, align: 'left', sortable: true },
                { field: 'orderNo', title: '订单号', width: 100, align: 'left', sortable: true },
                { field: 'invoicingModeName', title: '开票类型', width: 100, align: 'left', sortable: true },
                { field: 'invoiceTypeName', title: '发票类型', width: 100, align: 'left', sortable: true },
                { field: 'invoicingStatusName', title: '开票状态', width: 100, align: 'center', sortable: true },
                {
                    field: 'invoiceNo', title: '发票号码', width: 120, align: 'center', sortable: true, formatter: function (value, row, index) {

                        return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ViewDetail('View','" + row.recdIds + "','" + row.invoicingStatus + "','" + row.custId + "','" + row.orderNo + "','" + row.invoiceType + "');\">" + value + "</a>";
                    }
                },
                {
                    field: 'invoiceCode', title: '发票代码', width: 120, align: 'center', sortable: true, formatter: function (value, row, index) {
                        return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ViewDetail('View','" + row.recdIds + "','" + row.invoicingStatus + "','" + row.custId + "','" + row.orderNo + "','" + row.invoiceType + "');\">" + value + "</a>";
                    }
                },
                { field: 'withTaxAmount', title: '开票金额', width: 100, align: 'center', sortable: true },
                { field: 'taxAmount', title: '税额', width: 100, align: 'center', sortable: true },
                { field: 'invoicingDate', title: '开票时间', width: 150, align: 'center', sortable: true },
                { field: 'invoicer', title: '开票人', width: 100, align: 'center', sortable: true },
                { field: 'email', title: '电子邮箱', width: 160, align: 'left', sortable: true },
                { field: 'oldInvoiceNo', title: '原发票号码', width: 120, align: 'left', sortable: true },
                { field: 'oldInvoiceCode', title: '原发票代码', width: 120, align: 'left', sortable: true },
                { field: 'remark', title: '备注', width: 200, align: 'left', sortable: true },
                { field: 'errMsg', title: '失败原因', width: 200, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '开据发票',
                    iconCls: 'icon-add',
                    handler: function () {
                        ViewDetail('History', '', -1, $("#CustId").val(), '', 1);
                    }
                }, '-',
                {
                    text: '发票冲红',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var row = $('#TableContainer').datagrid('getSelected');
                        if (row == "" || row == undefined) {
                            HDialog.Info('请先选择发票!');
                            return;
                        }
                        ViewDetail('RedInvoice', row.recdIds, row.invoicingStatus, row.custId, row.orderNo, row.invoiceType);
                    }
                }, '-',
                {
                    text: '发票作废',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $('#TableContainer').datagrid('getSelected');
                        if (row == "" || row == undefined) {
                            HDialog.Info('请先选择发票!');
                            return;
                        }
                        if (row.invoiceTypeName == "增值税电子发票") {
                            HDialog.Info('增值税电子发票不允许作废!');
                            return;
                        }
                        ViewDetail('Invalid', row.recdIds, row.invoicingStatus, row.custId, row.orderNo, row.invoiceType);
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            $("#TableContainer").datagrid({
                nowrap: true,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: columns,
                fitColumns: false,
                singleSelect: true,
                remoteSort: false,
                pagination: true,
                rownumbers: true,
                width: "100%",
                toolbar: toolbar,
                border: false,
                sortOrder: "asc"
            });

            var opts = $("#TableContainer").datagrid('options');
            var pager = $("#TableContainer").datagrid('getPager');
            $(pager).pagination({
                onSelectPage: function (pageNum, pageSize) {
                    opts.pageNumber = pageNum;
                    opts.pageSize = pageSize;
                    pager.pagination('refresh', {
                        pageNumber: pageNum,
                        pageSize: pageSize
                    });
                    LoadList(pageNum, pageSize);
                }
            });

            //显示开票详情
            function ViewDetail(invoicingType, recdIds, invoicingStatus, custId, orderNos, invoiceType) {
                console.log(recdIds)
                if ((invoicingType == "RedInvoice" || invoicingType == "Invalid") && invoicingStatus != 1) {
                    var invoicingTypeName = "";
                    if (invoicingType == "RedInvoice") {
                        invoicingTypeName = "红冲";
                    } else {
                        invoicingTypeName = "作废";
                    }
                    HDialog.Info('仅开票状态为开票成功的发票才能' + invoicingTypeName);
                    return;
                }

                var w = $(window).width();
                var h = $(window).height();
                var conent = "../OnlineInvoice_SL/OnlineInvoice_Invoicing.aspx?InvoicingType=" + invoicingType + "&recdIds='" + recdIds + "'&InvoicingStatus=" + invoicingStatus + "&CustId=" + custId + "&OrderNos=" + orderNos + "&InvoiceType=" + invoiceType;
                HDialog.Open(w, h, conent, '网上开票', false, function callback(_Data) {
                    LoadList(1, 50);
                });
            }

            function LoadList(pageNum, pageSize) {
                $.tool.pageLoading();
                var params = {
                    "pageNum": pageNum,
                    "pageSize": pageSize,
                    "commId": $("#CommId").val(),
                    "custId": $("#CustId").val(),
                    "vatNumber": $("#VATNumber").val(),
                    "vatName": $("#VATName").val(),
                    "custName": $("#CustName").val(),
                    "invoiceCode": $("#InvoiceCode").val(),
                    "invoiceNo": $("#InvoiceNo").val(),
                    "invoicingStartDate": $("#InvoicingStartDate").val(),
                    "invoicingEndDate": $("#InvoicingEndDate").val(),
                    "invoicer": $("#Invoicer").val(),
                    "invoicingStatus": $("#InvoicingStatus option:selected").val(),
                    "invoiceType": $("#InvoiceType option:selected").val(),
                    "invoicingBatchNo": $("#InvoicingBatchNo").val(),
                    "orderNo": $("#OrderNo").val()
                };

                $.ajax({
                    url: $("#ApiBaseUrl").val().replace("###", "GetInvoicingHistory"),
                    type: 'POST',
                    data: JSON.stringify(params),
                    dataType: 'json',
                    cache: false,
                    async: false,
                    success: function (_data) {
                        var obj = { "total": 0, "rows": [] }
                        if (_data.code == 200) {
                            obj.total = _data.totalCount;
                            obj.rows = _data.data;
                        }
                        console.log(_data);
                        console.log(obj);
                        $('#TableContainer').datagrid('loadData', obj);
                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {
                        $.tool.pageUnLoading();
                    }
                });

                $("#SearchDlg").dialog("close");
            }

            LoadList(1, 50);
        </script>
    </form>
</body>
</html>

