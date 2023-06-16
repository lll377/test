<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchasePlanSelBottom.aspx.cs" Inherits="M_Main.Mt.StorageDialog.PurchasePlanSelBottom" %>

<!DOCTYPE html>
<html>
<head>
    <title>采购计划单选择列表</title>
    <script type="text/javascript" src="../../jscript/jquery-1.11.3.min.js"></script>
    <script  src="../../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../../css/button.css" type="text/css" rel="stylesheet" />
    <script src="../../jscript/format.js" type="text/javascript"></script>
    <style type="text/css">
        body { 
            margin:0px;
            padding:0px;
            font-size:12px;
            overflow-y:auto;
        }
        .panel-header {
            background: #f5f5f5 none repeat scroll 0 0;
        }
        .panel-header, .panel-body {
            border-color: #cccccc;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
    <input type="hidden" id="SearchResult" name="SearchResult" value="{total:0,rows:[]}" runat="server" />
    <div id="TableContainer"></div>
    <div style="text-align:center;bottom:0;position:fixed;width:100%;height:50px;line-height:50px;background-color:#f5f5f5;margin-right:45px;"><input type="button" id="BtnSave" value="确定选择" class="button"></div>

    <script  src="../../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script type="text/javascript">
        //计算小数位数
        var decimalPos = 4;

        function InitFunction() {
            var h = $(window).height()-4-50;
            $("#TableContainer").css("height", h + "px");
        } 
        InitFunction();
        var column;
        column = [[
                        { field: 'BuyMethod', title: '采购方式', width: 100, align: 'center', sortable: true },
                        { field: 'MaterialTypeName', title: '物资类别', width: 100, align: 'center', sortable: true },
                        { field: 'MaterialName', title: '物资名称', width: 160, align: 'center', sortable: true },
                        { field: 'UnitName', title: '单位名称', width: 100, align: 'center', sortable: true },
                        { field: 'Brand', title: '品牌', align: 'center', width: 100, sortable: true },
                        { field: 'Specification', title: '规格', align: 'center', width: 210, sortable: true },
                        { field: 'ColorName', title: '颜色', align: 'center', width: 100, sortable: true },
                        { field: 'SafeCount', title: '安全库存', align: 'center', width: 100, sortable: true },
                        { field: 'StoreCount', title: '当前库存', align: 'center', width: 100, sortable: true },
                        { field: 'SupplierName', title: '分供方名称', align: 'center', width: 100, sortable: true },
                        { field: 'BasePrice', title: '含税参考价', align: 'center', width: 100, sortable: true },
                        { field: 'Price', title: '含税单价', align: 'center', width: 100, sortable: true },
                        { field: 'Taxes', title: '税率', align: 'center', width: 100, sortable: true },
                        { field: 'NoTaxPrice', title: '不含税单价', align: 'center', width: 100, sortable: true },
                        { field: 'Quantity', title: '数量', align: 'center', width: 100, sortable: true },
                        { field: 'Amount', title: '含税金额', align: 'center', width: 100, sortable: true },
                        { field: 'TaxMoney', title: '税款', align: 'center', width: 100, sortable: true },
                        { field: 'NoTaxAmount', title: '不含税金额', align: 'center', width: 100, sortable: true },
        ]];

        function LoadList() {

            $("#TableContainer").datagrid({
                idField: "Id",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: false,
                singleSelect: true,
                pagination: false,
                remoteSort: false,
                rownumbers: true,
                width: "100%",
                border: true,
                sortOrder: "asc",
                onLoadSuccess: function (data) {
                    $("#SearchDlg").dialog("close");
                },
                onDblClickRow: function (rowIndex, rowData) {
                    $('#TableContainer').datagrid('deleteRow', rowIndex);
                }
            });
        }
        LoadList();

        //初始化加载数据

        //选择物资后增加行
        function AddRow(row) {
            var _Data = $('#TableContainer').datagrid('getData');

            var selIndex = $("#TableContainer").datagrid("getRowIndex", row.Id);
            //如果有相同的采购明细ID
            if (selIndex >= 0) return;

            var row_index = _Data.rows.length;
            $('#TableContainer').datagrid('insertRow', {
                index: row_index,
                row: {
                    BuyMethodFrom: row.BuyMethodFrom,
                    BasePriceFrom: row.BasePriceFrom,
                    Id: row.Id,
                    PurchaseDetailId: "",
                    PurchasePlanDetailid: row.PlanPurchaseDetailId,
                    MaterialId: row.MaterialId,
                    BuyMethod: row.BuyMethod,
                    MaterialTypeName: row.MaterialTypeName,
                    MaterialName: row.MaterialName,
                    UnitName: row.UnitName,
                    Brand: row.Brand,
                    Specification: row.Specification,
                    ColorName: row.ColorName,
                    StoreCount: ToDecimal(row.StoreCount, decimalPos),
                    SafeCount: ToDecimal(row.SafeCount, decimalPos),
                    SupplierName: row.SupplierName,
                    BasePrice: ToDecimal(row.Price, decimalPos),
                    Price: ToDecimal(row.PlanPrice, decimalPos),
                    SupplierId: row.SupplierId,
                    Quantity: row.Quantity,
                    Amount: ToDecimal(row.Amount, decimalPos),
                    NoTaxPrice: ToDecimal(row.PlanNoTaxPrice, decimalPos),
                    NoTaxAmount: ToDecimal(row.PlanNoTaxAmount, decimalPos),
                    Taxes: row.PlanTaxes,
                    TaxMoney: row.PlanTaxMoney
                }
            });
        }

        $("#BtnSave").click(function () {
            var rows = $("#TableContainer").datagrid("getRows");
            HDialog.ReturnIsJson = true;
            HDialog.CloseWindow(rows, parent.window.name);
        });

    </script>
    </form>
</body>
</html>
