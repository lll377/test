<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnlineInvoice_UnbilledFeesDlg.aspx.cs" Inherits="M_Main.OnlineInvoice_SL.OnlineInvoice_UnbilledFeesDlg" %>


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
        <input id="CommId" type="hidden" name="CommId" runat="server" />
        <input id="CustId" type="hidden" name="CustId" runat="server" />
        <input id="ApiBaseUrl" type="hidden" name="ApiBaseUrl" runat="server" />
        <div id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden; width: 640px; height: 230px;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable" style="margin-top: 5px; width: 100%">
                <tr style="white-space: nowrap;">
                    <td class="TdTitle">业务类型</td>
                    <td class="TdContent">
                        <select id="FeeType" name="FeeType" runat="server">
                            <option value="-1" selected>全部</option>
                            <option value="1">实收</option>
                            <option value="2">预交</option>
                            <option value="3">预存</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否允许开票</td>
                    <td class="TdContent">
                        <select id="IsAllowInvoicing" name="IsAllowInvoicing" runat="server">
                            <option value="-1">全部</option>
                            <option value="0">否</option>
                            <option value="1" selected>是</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContent">
                        <input type="text" id="RoomSign" name="RoomSign" runat="server" />
                    </td>
                    <td class="TdTitle">票据号</td>
                    <td class="TdContent">
                        <input type="text" id="BillSign" name="BillSign" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">商品编码</td>
                    <td class="TdContent">
                        <input type="text" id="ProductCode" name="ProductCode" runat="server" />
                    </td>
                    <td class="TdTitle">商品名称</td>
                    <td class="TdContent">
                        <input type="text" id="ProductName" name="ProductName" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">应收时间</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="FeesDueStartDate" name="FeesDueStartDate" runat="server"
                            onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd', alwaysUseStartDate: true })" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="FeesDueEndDate" name="FeesDueEndDate" runat="server"
                            onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd', alwaysUseStartDate: true })" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">收款时间</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="ChargeStartDate" name="ChargeStartDate" runat="server"
                            onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd', alwaysUseStartDate: true })" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="ChargeEndDate" name="ChargeEndDate" runat="server"
                            onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd', alwaysUseStartDate: true })" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList(1,50);">确定筛选</a>
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
                { field: 'feeId', title: 'FeeId', hidden: true },
                { field: 'feeType', title: 'FeeType', hidden: true },
                { field: 'ck', checkbox: true },
                { field: 'feeTypeName', title: '业务类型', width: 60, align: 'left', sortable: true },
                { field: 'roomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                { field: 'parkName', title: '车位编号', width: 100, align: 'left', sortable: true },
                { field: 'billsSign', title: '票据号', width: 100, align: 'left', sortable: true },
                { field: 'corpCostName', title: '费项名称', width: 120, align: 'left', sortable: true },
                { field: 'productCode', title: '商品编码', width: 120, align: 'left', sortable: true },
                { field: 'productName', title: '商品名称', width: 120, align: 'left', sortable: true },
                { field: 'productTaxItem', title: '商品税目', width: 120, align: 'left', sortable: true },
                { field: 'productSpec', title: '规格型号', width: 100, align: 'left', sortable: true },
                { field: 'chargeDate', title: '收款时间', width: 150, align: 'left', sortable: true },
                { field: 'feesDueDate', title: '费用应收时间', width: 100, align: 'left', sortable: true },
                { field: 'feesStartDate', title: '费用开始时间', width: 100, align: 'left', sortable: true },
                { field: 'feesEndDate', title: '费用结束时间', width: 100, align: 'left', sortable: true },
                { field: 'amount', title: '金额', width: 100, align: 'left', sortable: true },
                { field: 'lateAmount', title: '违约金', width: 100, align: 'left', sortable: true },
                { field: 'taxRate', title: '税率', width: 100, align: 'left', sortable: true },
                { field: 'taxAmount', title: '税额', width: 100, align: 'left', sortable: true },
                { field: 'withTaxAmount', title: '价税合计', width: 100, align: 'left', sortable: true },
                { field: 'isAllowInvoicingName', title: '是否允许开票', width: 150, align: 'center', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: '确认选择',
                    iconCls: 'icon-ok',
                    handler: function () {
                        var rows = $("#TableContainer").datagrid('getSelections');
                        if (rows == null || rows == "" || rows == undefined) {
                            HDialog.Info("请选择费用！");
                            return;
                        }
                        var obj = { "total": rows.length, "rows": rows };
                        HDialog.Close(JSON.stringify(obj));
                    }
                }
            ];

            $("#TableContainer").datagrid({
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: columns,
                fitColumns: false,
                singleSelect: false,
                remoteSort: false,
                pagination: true,
                rownumbers: true,
                width: "100%",
                toolbar: toolbar,
                border: false,
                sortOrder: "asc",
                selectOnCheck: true,
                checkOnSelect: true,
                onLoadSuccess: function (data) {//加载完毕后获取所有的checkbox遍历
                    if (data.rows.length > 0) {
                        for (var i = 0; i < data.rows.length; i++) {
                            if (data.rows[i].isAllowInvoicing == 0 || data.rows[i].isInvoiced == 1) {
                                $("input[type='checkbox']")[i + 1].disabled = true;
                            }
                        }
                    }
                    $(".datagrid-header-check").html('<input type="checkbox" id="selectAll"/>');
                    $("#selectAll").change(function () {
                        var status = $(this).is(":checked");
                        for (var i = 0; i < data.rows.length; i++) {
                            if (!$("input[type='checkbox']")[i + 1].disabled) {
                                if (status) {
                                    $('#TableContainer').datagrid('selectRow', i);
                                } else {
                                    $('#TableContainer').datagrid('unselectRow', i);
                                }
                            }
                        }
                    });
                },
                onClickRow: function (rowIndex, rowData) {
                    //加载完毕后获取所有的checkbox遍历
                    $("input[type='checkbox']").each(function (index, el) {
                        //如果当前的复选框不可选，则不让其选中
                        if (el.disabled == true) {
                            $("#TableContainer").datagrid('unselectRow', index - 1);
                        }
                    });
                },
                onSelectAll: function (rows) {
                    //加载完毕后获取所有的checkbox遍历
                    $("input[type='checkbox']").each(function (index, el) {
                        //如果当前的复选框不可选，则不让其选中
                        if (el.disabled == true) {
                            $("#TableContainer").datagrid('unselectRow', index - 1);
                            $(el).prop("checked", false);
                        } else {
                        }
                    });
                }
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

            function LoadList(pageNum, pageSize) {
                $.tool.pageLoading();
                var params = {
                    "pageNum": pageNum,
                    "pageSize": pageSize,
                    "commId": $("#CommId").val(),
                    "custId": $("#CustId").val(),
                    "feeType": $("#FeeType option:selected").val(),
                    "isAllowInvoicing": $("#IsAllowInvoicing").val(),
                    "productCode": $("#ProductCode").val(),
                    "productName": $("#ProductName").val(),
                    "feesDueStartDate": $("#FeesDueStartDate").val(),
                    "feesDueEndDate": $("#FeesDueEndDate").val(),
                    "chargeStartDate": $("#ChargeStartDate").val(),
                    "chargeEndDate": $("#ChargeEndDate").val(),
                    "roomSign": $("#RoomSign").val(),
                    "billSign": $("#BillSign").val(),
                    "isErp": 1
                };

                $.ajax({
                    url: $("#ApiBaseUrl").val().replace("###", "GetUnbilledFeeList"),
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

