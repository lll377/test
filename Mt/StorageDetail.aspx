<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StorageDetail.aspx.cs" Inherits="M_Main.Mt.StorageDetail" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="../UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="~/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>入库单</title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script type="text/javascript" src="../Jscript/Guid.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript/Taxes.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link href="../css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            font-size: 12px;
            overflow-y: auto;
        }

        .panel-header {
            background: #f5f5f5 none repeat scroll 0 0;
        }

        .panel-header, .panel-body {
            border-color: #cccccc;
        }

        .TopHead {
            background-color: #f5f5f5;
            width: 100%;
            height: 40px;
            font-size: 12px;
            border-bottom: 1px solid #cccccc;
        }

            .TopHead input {
                float: left;
                border: none;
                border-right: 1px solid #cccccc;
                text-align: center;
                width: 84px;
                height: 40px;
                line-height: 40px;
                background-color: #f5f5f5;
                cursor: pointer;
            }

                .TopHead input:hover {
                    background-color: #ffffff;
                }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="StorageId" name="StorageId" runat="server" />
        <input type="hidden" id="WareHouseId" name="WareHouseId" runat="server" />
        <input type="hidden" id="SupplierId" name="SupplierId" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />

        <input type="hidden" id="SearchResult" name="SearchResult" value="" runat="server" />
        <input type="hidden" id="CalResult" name="CalResult" runat="server" />

        <input type="hidden" id="Ture_Storage_UpdatePrice" name="Ture_Storage_UpdatePrice" runat="server" />
        <input type="hidden" id="False_Storage_UpdatePrice" name="False_Storage_UpdatePrice" runat="server" />

        <input type="hidden" id="GridData" runat="server" />
        <input type="hidden" id="BussId" name="BussId" runat="server" />
        <input type="hidden" id="Originator" name="Originator" runat="server" />
        <%--小数位数--%>
        <input type="hidden" id="DecimalNum" name="DecimalNum" runat="server" value="4" />
        <input type="hidden" id="MoneyNum" name="MoneyNum" runat="server" value="2" />
        <div class="TopHead">
            <input type="button" id="BtnClose" value="关闭" />
            <input id="btnRemind" type="submit" onserverclick="btnRemind_ServerClick" value="催办" runat="server" />
            <input id="btnJump" type="submit" onserverclick="btnJump_ServerClick" value="跳过" runat="server" />
            <input id="BtnDealInfo" style="display: none;" onserverclick="BtnDealInfo_ServerClick" value="会签意见" type="submit" runat="server" />
            <input id="BtnCompleteCheckLevel" style="display: none;" onserverclick="BtnCompleteCheckLevel_ServerClick" value="批转结束" type="submit" runat="server" />
            <input id="BtnReadOver" type="submit" value="会签结束" onserverclick="BtnReadOver_ServerClick" runat="server" />
            <input id="BtnReturnPrevious" type="submit" value="驳回" onserverclick="BtnReturnPrevious_ServerClick" runat="server" />
            <input id="BtnCheckNoPass" type="submit" value="审批不通过" onserverclick="BtnCheckNoPass_ServerClick" runat="server" />
            <input id="BtnCheckPass" type="submit" value="审批通过" onserverclick="BtnCheckPass_ServerClick" runat="server" />
            <input id="BtnIsPrint" type="button" value="打印" runat="server" />
            <input id="BtnSaveStartWorkFlow" type="submit" value="送审" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
            <input id="BtnSave" type="submit" value="保存" onserverclick="BtnSave_ServerClick" runat="server" />
        </div>
        <div style="height: 4px;"></div>
        <table class="DialogTable">
            <tr>
                <td class="DialogTdTitle">入库单号：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="ReceiptSign" readonly name="ReceiptSign" runat="server" />
                </td>
                <td class="DialogTdTitle">入库类型：
                </td>
                <td class="DialogTdContent">
                    <select id="StorageType" name="StorageType" runat="server">
                        <option value="计划采购">计划采购</option>
                        <option value="非计划采购">非计划采购</option>
                        <option value="调拨入库">调拨入库</option>
                        <option value="盘盈入库">盘盈入库</option>
                        <option value="赠送入库">赠送入库</option>
                        <option value="退还入库">退还入库</option>
                    </select>
                </td>
                <td class="DialogTdTitle">入库仓库
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" readonly id="WareHouseName" name="WareHouseName" value="" runat="server" />
                </td>
                <td class="DialogTdTitle">入库单状态：
                </td>
                <td class="DialogTdContent">
                    <input type="text" readonly id="State" name="State" value="未启动" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">入库日期：
                </td>
                <td class="DialogTdContent">
                    <input id="ReceiptDate" name="ReceiptDate" class="easyui-validatebox" data-options="required:true" readonly runat="server" />
                </td>
                <td class="DialogTdTitle">分供方：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="SupplierName" name="SupplierName" runat="server" />
                </td>
                <td class="DialogTdTitle">制单人：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="OriginatorName" name="OriginatorName" runat="server" />
                </td>
                <td class="DialogTdTitle"></td>
                <td class="DialogTdContent"></td>
            </tr>
            <tr>
                <td class="DialogTdTitle">备注：
                </td>
                <td class="DialogTdMemoContent" colspan="7">
                    <input type="text" class="easyui-validatebox" id="Memo" name="Memo" runat="server" />
                </td>
            </tr>
        </table>
        <div id="Container" style="border: 1px solid #cccccc; height: auto; margin: 0px auto;">
            <div id="TableContainer" style="height: auto;"></div>
        </div>
        <div id="OAFlow" style="height: auto; margin: 0px auto;">
            <uc1:BussListWorkFlow ID="WorkFlowManage" runat="server"></uc1:BussListWorkFlow>
            <uc1:BussApproved runat="server" ID="CheckLevelInfo" />
        </div>

        <script type="text/javascript">
            //计算小数位数
            var decimalPos = Number($("#DecimalNum").val());
            var moneyPos = Number($("#MoneyNum").val());
            //编辑的行号
            var editIndex = undefined;
            if ($("#OpType").val() != "edit") {
                $("#StorageType").html('<option value="计划采购">计划采购</option><option value="非计划采购">非计划采购</option><option value="赠送入库">赠送入库</option><option value="退还入库">退还入库</option>');
            }
            function InitPurchaseTableHeight() {
                var w = $(window).width();
                $("#Container").css("width", (w - 8) + "px");
                $("#OAFlow").css("width", (w - 8) + "px");
                $(".DialogTable").css("width", (w - 8) + "px");
            }
            InitPurchaseTableHeight();

            column = [[
                { field: 'MaterialTypeName', title: '物资类别', width: 50, align: 'center', sortable: true },
                { field: 'MaterialName', title: '物资名称', width: 50, align: 'center', sortable: true },
                { field: 'UnitName', title: '单位名称', width: 50, align: 'center', sortable: true },
                { field: 'Brand', title: '品牌', align: 'center', width: 50, sortable: true },
                {
                    field: 'ProduceDate', title: '生产日期', align: 'center', width: 50, sortable: true, formatter: function (value, row, index) {
                        return value == "" ? "" : formatDate(value, "yyyy-MM-dd");
                    },
                    editor: {
                        type: 'datebox'
                    }
                },
                { field: 'Specification', title: '规格', align: 'center', width: 50, sortable: true },
                { field: 'ColorName', title: '颜色', align: 'center', width: 50, sortable: true },
                { field: 'CheckOut', title: '捡出数据', align: 'center', width: 50, sortable: true, hidden: true },
                {
                    field: 'PurchasePrice', title: '采购含税价', align: 'center', width: 50, sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.PurchasePrice, decimalPos);
                    }
                },

                {
                    field: 'Price', title: '含税单价', align: 'center', width: 50, sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.Price, decimalPos);
                    }
                },
                {
                    field: 'Taxes', title: '税率', align: 'center', width: 50, sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.Taxes, 2);
                    }
                },
                {
                    field: 'NoTaxPrice', title: '不含税单价', align: 'center', width: 50, sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.NoTaxPrice, decimalPos);
                    }
                },
                {
                    field: 'Quantity', title: '入库数量', align: 'center', width: 50, sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.Quantity, 3);
                    }
                },
                {
                    field: 'Amount', title: '含税金额', align: 'center', width: 50, sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.Amount, moneyPos);
                    }
                },
                {
                    field: 'NoTaxAmount', title: '不含税金额', align: 'center', width: 50, sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.NoTaxAmount, moneyPos);
                    }
                },
                {
                    field: 'DeliveryNum', title: '送货单号', align: 'center', width: 100, sortable: true
                },
                {
                    field: 'Memo', title: '备注', align: 'center', width: 80, sortable: true
                }
            ]];
            var toolbar;
            var toolbar_Start = [
                {
                    text: '选择物资',
                    iconCls: 'icon-add',
                    handler: function () {
                        PurchaseChiose();
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        var index = $("#TableContainer").datagrid("getRowIndex", row);
                        $('#TableContainer').datagrid('deleteRow', index);
                        UpdateAmount();
                    }
                }, '-',
                {
                    text: '提交',
                    iconCls: 'icon-save',
                    handler: function () {
                        //计算未提交的行数据
                        UpdateAmount();
                    }
                }
            ];
            var toolbar_Ing = [
                {
                    text: '提交',
                    iconCls: 'icon-save',
                    handler: function () {
                        //计算未提交的行数据
                        UpdateAmount();
                    }
                }
            ];
            if ($("#State").val() == "未启动") {
                toolbar = toolbar_Start;
            }
            else {
                if ($("#State").val() == "审核中") {
                    toolbar = toolbar_Ing;
                }
                if ($("#State").val() == "已审核") {
                    toolbar = "";
                }
                if ($("#State").val() == "审核不通过") {
                    toolbar = "";
                }
            }
            //计算合计金额及页脚合计金额
            function UpdateAmount() {
                if (editIndex != undefined) {
                    $("#TableContainer").datagrid('acceptChanges', editIndex);
                    var index = editIndex;
                    var rowData = $('#TableContainer').datagrid('getData').rows[index];

                    //检查申购价格是否允许调低及调高价格,如果违反规则,则申购价置为参考价
                    var PurchasePrice = parseFloat(rowData.PurchasePrice);//采购申请单价
                    var Price = parseFloat(rowData.Price);//含税单价

                    var Rule = 0;
                    //如果有供应商
                    
                    if (rowData.SupplierId != "" && rowData.SupplierId !=undefined)
                    {
                        if ($("#State").val() == "未启动")
                        {
                            
                            //采购申请时有供应商能否允许修改采购单价 大于0则可以修改,1调高，2调低，3所有
                            Rule = parseInt($("#Ture_Storage_UpdatePrice").val());
                           
                        }
                        if ($("#State").val() == "审核中") {
                            
                            //采购申请审核时有供应商能否允许修改采购单价,大于0则可以修改,1调高，2调低，3所有
                            Rule = parseInt($("#Ture_Storage_UpdatePrice").val());
                        }
                    }

                    //如果没有供应商
                    if (rowData.SupplierId == "" || rowData.SupplierId == undefined)
                    {
                        if ($("#State").val() == "未启动")
                        {
                           
                            //入库办理时没有供应商能否允许修改采购单价,大于0则可以修改,1调高，2调低，3所有
                            Rule = parseInt($("#False_Storage_UpdatePrice").val());
                        }
                        if ($("#State").val() == "审核中") {


                            //入库办理时没有供应商能否允许修改采购单价,大于0则可以修改,1调高，2调低，3所有
                            Rule = parseInt($("#False_Storage_UpdatePrice").val());
                        }
                    }

                    switch (Rule) {
                        //允许调高
                        case 1:
                            if (Price < PurchasePrice) {
                                Price = PurchasePrice;
                                HDialog.Info("价格不允许调低");
                            }
                            break;
                        //允许调低
                        case 2:
                            if (Price > PurchasePrice) {
                                Price = PurchasePrice;
                                HDialog.Info("价格不允许调高");
                            }
                            break;
                        //所有
                        case 3:
                            break;
                    }
                    //入库数量验证【非赠送入库】
                    //2016-9-5新加
                    if ($("#StorageType").val() != "赠送入库") {
                        if ($("#OpType").val() == "add") {//新增时,修改时的判断放置于后端
                            if (parseFloat(rowData.Quantity) > parseFloat(rowData.CheckOut)) {
                                rowData.Quantity = parseFloat(rowData.CheckOut);
                                HDialog.Info("入库数量不能大于采购数量");
                            }
                        }
                    }


                    $('#TableContainer').datagrid('updateRow',
                        {
                            index: index,
                            row: {
                                Price: ToDecimal(Price, decimalPos),
                                Amount: ToDecimal(parseFloat(Price) * parseFloat(rowData.Quantity), moneyPos),
                                NoTaxPrice: ToDecimal(Taxes.TaxPrice(Price, rowData.Taxes), decimalPos),
                                NoTaxAmount: ToDecimal(parseFloat(Taxes.TaxPrice(Price, rowData.Taxes)) * rowData.Quantity, moneyPos)
                                //,  TaxMoney: ToDecimal((parseFloat(Price) * parseFloat(rowData.Quantity)) - (parseFloat(Taxes.TaxPrice(Price, rowData.Taxes)) * rowData.Quantity), moneyPos)
                            }
                        });
                }
                //计算页脚合计
                $('#TableContainer').datagrid('reloadFooter', [
                    {
                        BuyMethod: "合计",
                        Amount: ComputeGridCol("Amount"),
                        NoTaxAmount: ComputeGridCol("NoTaxAmount")
                    }
                ]);
            };

            //选择物资判断
            function PurchaseChiose() {
                if ($("#WareHouseId").val() == "") {
                    HDialog.Info("请选择入库仓库");
                    return;
                }

                var _t = $("#StorageType").val();
                if (_t == "非计划采购") {
                    SelMaterial_Purchase();
                }
                if (_t == "计划采购") {
                    SelMaterial_PurchasePlan();
                }
                if (_t == "直接入库") {
                    GiveStorage();
                }
                if (_t == "赠送入库") {
                    GiveStorage();
                }
                if (_t == "退还入库") {
                    //alert();
                    SelMaterial_BackStorage();
                }
            }

            function SelMaterial_BackStorage() {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../Mt/StorageDialog/BackCheckOutSelFrame.aspx?WareHouseId=' + $("#WareHouseId").val(), '选择采购物资', true, function callback(_Data) {
                    //alert(_Data);
                    var rows = JSON.parse(_Data);
                    for (var i = 0; i < rows.length; i++) {
                        AddGiveRows(rows[i], 0);
                    }
                    ReCalc();
                    UpdateAmount();
                });
            }

            function SelMaterial_PurchasePlan() {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../Mt/StorageDialog/PurchasePlanSelFrame.aspx?WareHouseId=' + $("#WareHouseId").val() + '&SupplierId=' + $("#SupplierId").val(), '选择计划采购物资', true, function callback(_Data) {

                    var rows = JSON.parse(_Data);
                    for (var i = 0; i < rows.length; i++) {
                        AddRows(rows[i]);
                    }
                    UpdateAmount();
                });
            }

            function GiveStorage() {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../Mt/PurchaseDialog/MaterialSelFrame.aspx', '选择物资', true, function callback(_Data) {

                    var rows = JSON.parse(_Data);

                    for (var i = 0; i < rows.length; i++) {
                        AddGiveRows(rows[i], 1);
                    }
                    UpdateAmount();
                });
            }




            function SelMaterial_Purchase() {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../Mt/StorageDialog/PurchaseSelFrame.aspx?WareHouseId=' + $("#WareHouseId").val() + '&SupplierId=' + $("#SupplierId").val(), '选择采购物资', true, function callback(_Data) {
                    var rows = JSON.parse(_Data);
                    for (var i = 0; i < rows.length; i++) {
                        AddRows(rows[i]);
                    }
                    UpdateAmount();
                });
            }

            function IsRepeatData(n, v) {
                var rows = $('#TableContainer').datagrid('getRows');

                for (var i = 0; i < rows.length; i++) {
                    if (rows[i][n] == v) {
                        return 1;
                    }
                }

                return -1;
            }

            //选择赠送物资后增加行
            function AddGiveRows(row, num) {
                var _Data = $('#TableContainer').datagrid('getData');
                var row_index = _Data.rows.length;

                var str = "";
                var MaterialIdStr = "";
                var MaterialName = "";
                var selIndex;
                if (num <= 0) {//退还入库
                    str = row.Id;
                    MaterialIdStr = row.MaterialId;
                    MaterialName = row.MaterialName;
                    selIndex = IsRepeatData("MaterialId", row.MaterialId);
                } else {//赠送入库
                    MaterialIdStr = row.Id;
                    MaterialName = row.Name;
                    selIndex = IsRepeatData("MaterialId", row.Id);
                }

                //如果有相同的物资ID
                if (selIndex == 1) return;

                var strGuid = Guid();
                $('#TableContainer').datagrid('insertRow', {
                    index: row_index,
                    row: {
                        Id: strGuid,
                        PurchaseDetailId: "",
                        PurchasePlanDetailid: "",
                        CheckOutDetailId: str,
                        MaterialId: MaterialIdStr,
                        MaterialTypeName: row.MaterialTypeName,
                        MaterialName: MaterialName,
                        UnitName: row.UnitName,
                        Brand: row.Brand,
                        ProduceDate: "",
                        Specification: row.Specification,
                        ColorName: row.ColorName,
                        SupplierName: "",
                        PurchasePrice: ToDecimal("0", decimalPos),
                        Price: ToDecimal("0", decimalPos),
                        Quantity: ToDecimal(row.Quantity, 3),
                        Amount: ToDecimal("0", moneyPos),
                        Taxes: ToDecimal("0", 2),
                        NoTaxPrice: ToDecimal("0", decimalPos),
                        NoTaxAmount: ToDecimal("0", moneyPos),
                        DeliveryNum: "",
                        Memo: "",
                    }
                });
            }




            //选择采购申请物资后增加行
            function AddRows(row) {
                var _Data = $('#TableContainer').datagrid('getData');
                var row_index = _Data.rows.length;

                var selIndex = IsRepeatData("PurchaseDetailId", row.Id);
                //如果有相同的采购明细ID
                if (selIndex == 1) return;

                var strGuid = Guid();
                $('#TableContainer').datagrid('insertRow', {
                    index: row_index,
                    row: {
                        Id: strGuid,
                        PurchaseDetailId: row.PurchaseDetailId,
                        PurchasePlanDetailid: row.PurchasePlanDetailid,
                        MaterialId: row.MaterialId,
                        MaterialTypeName: row.MaterialTypeName,
                        MaterialName: row.MaterialName,
                        UnitName: row.UnitName,
                        Brand: row.Brand,
                        ProduceDate: "",
                        Specification: row.Specification,
                        ColorName: row.ColorName,
                        SupplierName: row.SupplierName,
                        PurchasePrice: ToDecimal(row.Price, decimalPos),//采购申请价
                        Price: ToDecimal(row.Price, decimalPos),//入库含税价
                        Quantity: ToDecimal(row.Quantity, 3),
                        Amount: ToDecimal(row.Amount, moneyPos),
                        Taxes: ToDecimal(row.Taxes, 2),
                        NoTaxPrice: ToDecimal(row.NoTaxPrice, decimalPos),
                        NoTaxAmount: ToDecimal(row.NoTaxAmount, moneyPos),
                        CheckOut: ToDecimal(row.Quantity, 3),//用于入库数量的对比判断值
                        DeliveryNum: "",
                        Memo: "",
                    }
                });
            }

            function ComputeGridCol(colName) {
                var rows = $('#TableContainer').datagrid('getRows');
                var total = 0;
                for (var i = 0; i < rows.length; i++) {
                    total += parseFloat(rows[i][colName]);
                }
                return ToDecimal(total, decimalPos);
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

            //给datagrid扩展方法
            $.extend($.fn.datagrid.methods, {
                addEditor: function (jq, param) {
                    if (param instanceof Array) {
                        $.each(param, function (index, item) {
                            var e = $(jq).datagrid('getColumnOption', item.field);
                            e.editor = item.editor;
                        });
                    } else {
                        var e = $(jq).datagrid('getColumnOption', param.field);
                        e.editor = param.editor;
                    }
                },
                removeEditor: function (jq, param) {
                    if (param instanceof Array) {
                        $.each(param, function (index, item) {
                            var e = $(jq).datagrid('getColumnOption', item);
                            e.editor = {};
                        });
                    } else {
                        var e = $(jq).datagrid('getColumnOption', param);
                        e.editor = {};
                    }
                }
            });

            $("#TableContainer").datagrid({
                idField: "Id",
                nowrap: true,
                pageSize: 50,
                pageList: [50, 150, 300],
                columns: column,
                fitColumns: true,
                singleSelect: true,
                pagination: false,
                rownumbers: true,
                border: false,
                showFooter: true,
                striped: true,
                view: myview,
                toolbar: toolbar,
                remoteSort: false,
                rowStyler: function (index, row) {
                    //如果是页脚
                    if (row.BuyMethod == '合计') {
                        return 'background-color:#F4F4F4;border:none;'; // return inline style
                    }
                },
                onLoadSuccess: function () {
                    //加载页脚
                    $('#TableContainer').datagrid('reloadFooter', [
                        {
                            BuyMethod: "合计",
                            Amount: ToDecimal("0.00", moneyPos),
                            NoTaxAmount: ToDecimal("0.00", moneyPos)
                        }
                    ]);
                },
                onClickRow: function (rowIndex, rowData) {
                    if ($("#State").val() == "已审核") return;
                    //计算未提交的行数据，计算金额
                    UpdateAmount();
                    //更改当前行号
                    editIndex = rowIndex;
                    //去除编辑器
                    $("#TableContainer").datagrid('removeEditor', 'Price');
                    $("#TableContainer").datagrid('removeEditor', 'Quantity');

                    if ($("#State").val() == "未启动" || $("#State").val() == "审核中") {

                        if (rowData.SupplierId != "") {
                            //有供应商能否允许修改单价 大于0则可以修改
                            if (parseInt($("#Ture_Storage_UpdatePrice").val()) > 0) {
                                $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                                    {
                                        field: 'Price',
                                        editor: {
                                            type: 'numberbox',
                                            options: {
                                                precision: decimalPos
                                            }
                                        }
                                    }]);
                                $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                                    {
                                        field: 'Taxes',
                                        editor: {
                                            type: 'numberbox',
                                            options: {
                                                precision: 2,
                                                min: 0,
                                                max: 1
                                            }
                                        }
                                    }]);
                                $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                                    {
                                        field: 'Quantity',
                                        editor: {
                                            type: 'numberbox',
                                            options: {
                                                precision: 3
                                            }
                                        }
                                    }]);
                            }
                        }
                        else {
                            //没有供应商时是否允许调整计划单价,大于0则可以修改
                            if (parseInt($("#False_Storage_UpdatePrice").val()) > 0) {
                                $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                                    {
                                        field: 'Price',
                                        editor: {
                                            type: 'numberbox',
                                            options: {
                                                precision: decimalPos
                                            }
                                        }
                                    }]);
                                $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                                    {
                                        field: 'Taxes',
                                        editor: {
                                            type: 'numberbox',
                                            options: {
                                                precision: 2,
                                                min: 0,
                                                max: 1
                                            }
                                        }
                                    }]);
                                $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                                    {
                                        field: 'Quantity',
                                        editor: {
                                            type: 'numberbox',
                                            options: {
                                                precision: 3
                                            }
                                        }
                                    }]);
                            }
                        }

                        if ($("#StorageType").val() == "赠送入库") {
                            $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                                {
                                    field: 'Quantity',
                                    editor: {
                                        type: 'numberbox',
                                        options: {
                                            precision: 3
                                        }
                                    }
                                }]);
                        }
                        $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                            {
                                field: 'DeliveryNum',
                                editor: {
                                    type: 'text'
                                }
                            }
                            ,
                            {
                                field: 'Memo',
                                editor: {
                                    type: 'text'
                                }
                            }
                        ]);
                    }

                    //开始编辑
                    $("#TableContainer").datagrid('beginEdit', rowIndex);

                },
                onClickCell: function (rowIndex, field, value) {
                    //获取点击的行记录
                    var rowData = $('#TableContainer').datagrid('getData').rows[rowIndex];
                    //如果点击的是供方单元格
                    if (field == 'SupplierName' && $("#StorageType").val() != "赠送入库") {
                        //如果参考价来源为供方报价
                        if (rowData.BasePriceFrom == '供方报价') {
                            if ($("#State").val() == "已审核" || $("#State").val() == "审核不通过") return;

                            var w = $(window).width();
                            var h = $(window).height();
                            HDialog.Open(w, h, '../DialogNew/SelSupplier.aspx?InWareHouseId=' + rowData.InWareHouseId + "&MaterialId=" + rowData.MaterialId, '分供方选择', true, function callback(_Data) {
                                var Obj = JSON.parse(_Data);
                                //对参考单价重新赋值
                                $('#TableContainer').datagrid('updateRow',
                                    {
                                        index: rowIndex,
                                        row: {
                                            Price: ToDecimal(Obj.Price, decimalPos),
                                            Amount: ToDecimal(parseFloat(Obj.Price) * parseFloat(rowData.Quantity), moneyPos),
                                        }
                                    });
                                //加载页脚
                                $('#TableContainer').datagrid('reloadFooter', [
                                    {
                                        BuyMethod: "合计",
                                        Amount: ComputeGridCol("Amount"),
                                        NoTaxAmount: ComputeGridCol("NoTaxAmount")
                                    }
                                ]);

                            });
                        }
                    }
                }
            });

            $("#WareHouseName").click(function (e) {
                HDialog.Open('500', '500', '../DialogNew/SelWareHouse.aspx', '选择入库仓库', true, function callback(_Data) {
                    if (_Data != '')
                    {

                        var arrRet = _Data.split(',');
                        //选择仓库后重新加载列表及供商
                        $('#TableContainer').datagrid('loadData', { total: 0, rows: [] });
                        $("#SupplierId").val("");
                        $("#SupplierName").val("");
                        $("#WareHouseId").val(arrRet[0]);
                        $("#WareHouseName").val(arrRet[1]);

                        var errstr = "";
                        //2016-10-21 增加盘点期间出入库限制
                        //zfyw
                        $.tool.DataPost('MtInventory', 'CheckInventorylList', "WareHouseId=" + arrRet[0],
                            function Init() {
                            },
                            function callback(_Data) {
                                errstr = _Data;
                                if (_Data == "false") {
                                    HDialog.Info("该仓库目前处于盘点期间，无法进行出、入库操作");
                                    //HDialog.Close('');
                                }
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                        
                        if (errstr != "false") {
                            //2019-9-4 增加强制盘点限制
                            $.tool.DataPost('MtInventory', 'CheckInventoryPandian', "WareHouseId=" + arrRet[0],
                                function Init() {
                                },
                                function callback(_Data) {

                                    if (_Data == "false") {
                                        HDialog.Info("该仓库本月或本季未进行盘点操作，无法进行出、入库操作");
                                        HDialog.Close('');
                                    }
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                        }


                        errstr = "";
                    }
                });
            });
            $("#SupplierName").click(function (e) {
                if ($("#WareHouseId").val() == "") {
                    HDialog.Info("请选择入库仓库");
                    return;
                }

                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../DialogNew/SearchSupplier.aspx?WareHouseId=' + $("#WareHouseId").val(), '选择供应商', true, function callback(_Data) {
                    if (_Data != '') {
                        var Obj = JSON.parse(_Data);
                        //选择仓库后重新加载列表及供商
                        $('#TableContainer').datagrid('loadData', { total: 0, rows: [] });
                        $("#SupplierId").val(Obj.Id);
                        $("#SupplierName").val(Obj.SupplierName);
                    }
                });
            });
            //初始化加载数据
            var Rows = JSON.parse($("#SearchResult").val());
            //加载数据
            $('#TableContainer').datagrid('loadData', Rows);
            //计算合计金额
            $('#TableContainer').datagrid('reloadFooter', [
                {
                    BuyMethod: "合计",
                    Amount: ComputeGridCol("Amount"),
                    NoTaxAmount: ComputeGridCol("NoTaxAmount")
                }
            ]);


            $("#BtnClose").click(function (e) {
                HDialog.Close('');
            });

            var IsSubmitFlag = true;
            $("input[type='submit']").click(function (e) {

                if (IsSubmitFlag == false) {
                    HDialog.Info("10秒内不要重复点击");
                    return false;
                }

                IsSubmitFlag = false;
                setTimeout('IsSubmitFlag=true', 10000);

                if (checkSubmit() == false) return false;

                var isValid = $("#frmForm").form('validate');
                if (isValid == true) {
                    if (document.all.WorkFlowManage_WorkFlowType.value == "") {
                        HDialog.Info("请选择审批流程");
                        return false;
                    }
                    var trlength = $("#WorkFlowNodeList tr").length;
                    if (trlength < 2) {
                        HDialog.Info("请给该流程设置处理人");
                        return false;
                    }
                    var rows = $("#TableContainer").datagrid("getRows");
                    if (JSON.stringify(rows).length <= 2) {
                        HDialog.Info("请给选择要入库的物资");
                        return false;
                    }
                    //将列表数据保存到文本框中,提交
                    $("#GridData").val(JSON.stringify(rows));
                    GetAttach();//得到附件的值

                    return true;
                }
                else {
                    return false;
                }
            });

            //采购申请单双击选择流程，如果有默认的绑定流程，则自动加载
            function SelWorkFlowType() {
                if ($("#State").val() == "未启动") {
                    var PurchaseMoney = ComputeGridCol("Amount");
                    $.tool.DataPost('Purchase', 'SelWorkFlow', "Filter=03&PurchaseMoney=" + PurchaseMoney,
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data.substring(0, 5) == "false") {
                                //如果没有绑定流程,则弹出窗口加载流程
                                var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&Filter=03&random=" + Math.random();
                                HDialog.Open('300', '500', strPage, '选择流程分类', false, function callback(_Data) {
                                    if (_Data != '') {
                                        var obj = JSON.parse(_Data);
                                        LoadTemplateData(obj[0].Trim(), obj[2].Trim());
                                        document.all.WorkFlowManage_WorkFlowType.value = obj[1].toString();
                                        document.all.WorkFlowManage_TxtWorkFlowType.value = obj[0].toString();
                                    }
                                });
                            }
                            else {
                                var obj = JSON.parse(_Data);
                                LoadTemplateData(obj[0].WorkFlowId, obj[0].IsUpdate);
                                document.all.WorkFlowManage_WorkFlowType.value = obj[0].FlowSortName;
                                document.all.WorkFlowManage_TxtWorkFlowType.value = obj[0].WorkFlowId;
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            }




            //如果流程节点不为0,流程已完结,发起人不等于当前处理人员
            if (document.all.WorkFlowManage_TxtFlowSort.value != "0" || document.all.WorkFlowManage_TxtWorkFlowIsComplete.value == "2" || document.all.WorkFlowManage_TxtStartUser.value != document.all.WorkFlowManage_LoginCode.value) {
            }

            if ($("#State").val() == "已审核") {
                $("#BtnSaveStartWorkFlow").css("display", "none");
                $("#BtnSave").css("display", "none");
                $("input[type='text']").prop("disabled", "true");
                $("SELECT").prop("disabled", "true");
                $("BUTTON").prop("disabled", "true");
            }

            //打印
            $("#BtnIsPrint").click(function (e) {
                if ($("#OpType").val() == "add") return;
                var InstanceId = document.all.WorkFlowManage_InfoId.value;
                var Attribute = "<Attribute><Id>" + $("#StorageId").val() + "</Id><InstanceId>" + InstanceId + "</InstanceId></Attribute>";
                $.tool.Print("Storage", Attribute);
            });

        </script>

    </form>
</body>
</html>
