<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseDetail.aspx.cs" Inherits="M_Main.Mt.PurchaseDetail" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="../UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="~/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>采购单详情</title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script type="text/javascript" src="../Jscript/Guid.js"></script>
    <script type="text/javascript" src="../Jscript/Taxes.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
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
    <script type="text/javascript" src="../jscript/BuyType.json"></script>
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
        <input type="hidden" id="PurchaseId" name="PurchaseId" runat="server" value="" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />
        <input type="hidden" id="DepCode" name="DepCode" runat="server" />

        <input type="hidden" id="StorageId" name="StorageId" runat="server" />
        <input type="hidden" id="PurchaseWarehouseId" name="PurchaseWarehouseId" runat="server" />
        <%--入库编号--%>
        <input type="hidden" id="InWareHouseId" name="InWareHouseId" runat="server" />


        <input type="hidden" id="SearchResult" name="SearchResult" value="" runat="server" />
        <input type="hidden" id="CalResult" name="CalResult" runat="server" />

        <input type="hidden" id="Ture_Purchase_UpdatePrice" name="Ture_Purchase_UpdatePrice" runat="server" />
        <input type="hidden" id="Ture_Purchase_Check_UpdatePrice" name="Ture_Purchase_Check_UpdatePrice" runat="server" />
        <input type="hidden" id="False_Purchase_UpdatePrice" name="False_Purchase_UpdatePrice" runat="server" />
        <input type="hidden" id="False_Purchase_Check_UpdatePrice" name="False_Purchase_Check_UpdatePrice" runat="server" />

        <input type="hidden" id="PlanState" name="PlanState" value="未启动" runat="server" />
        <input type="hidden" id="GridData" runat="server" />
        <input type="hidden" id="BussId" name="BussId" runat="server" />
        <input type="hidden" id="PurchaseUserCode" name="PurchaseUserCode" runat="server" />
        <%--不含税总金额--%>
        <input type="hidden" id="NoTaxAmountMoney" name="NoTaxAmountMoney" runat="server" value="" />
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
            <input id="BtnSaveStartWorkFlow" type="submit" value="送审" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
            <input id="BtnSave" type="submit" value="保存" onserverclick="BtnSave_ServerClick" runat="server" />
            <input id="BtnIsPrint" type="button" value="打印" runat="server" />
            <input id="BtnIsPrint_1862" type="button" value="打印采购计划表" runat="server" visible="false" />
        </div>
        <div style="height: 4px;"></div>
        <table class="DialogTable">
            <tr>
                <td class="DialogTdTitle">采购申请单号：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="PurchaseNum" readonly name="PurchaseNum" runat="server" />
                </td>
                <td class="DialogTdTitle"></td>
                <td class="DialogTdContent"></td>
                <td class="DialogTdTitle"></td>
                <td class="DialogTdContent"></td>
                <td class="DialogTdTitle"></td>
                <td class="DialogTdContent"></td>
            </tr>
            <tr>
                <td class="DialogTdTitle">申购仓库：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="PurchaseWarehouseName" name="PurchaseWarehouseName" runat="server" />
                </td>
                <td class="DialogTdTitle">入库仓库：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="InWareHouseName" name="InWareHouseName" runat="server" />
                </td>
                <td class="DialogTdTitle">申购类型：
                </td>
                <td class="DialogTdContent">
                    <select id="PurchaseType" runat="server">
                        <option value="计划采购">计划采购</option>
                        <option value="零星采购">零星采购</option>
                        <option value="紧急采购">紧急采购</option>
                        <option value="专项采购">专项采购</option>
                        <option value="集中采购">集中采购</option>
                    </select>
                </td>
                <td class="DialogTdTitle">计划年月：
                </td>
                <td class="DialogTdContent">
                    <input id="PlanDate" name="PlanDate" class="easyui-validatebox" data-options="required:true" onclick="WdatePicker({ dateFmt: 'yyyy-MM', isShowToday: false, isShowClear: false })" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">申购日期：
                </td>
                <td class="DialogTdContent">
                    <input id="PurchaseDate" name="PurchaseDate" class="easyui-validatebox" data-options="required:true" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" runat="server" />
                </td>
                <td class="DialogTdTitle">申购部门：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="DepName" name="DepName" runat="server" />
                </td>
                <td class="DialogTdTitle">制单人：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="Originator" name="Originator" runat="server" />
                </td>
                <td class="DialogTdTitle">采购单状态
                </td>
                <td class="DialogTdContent">
                    <input type="text" readonly id="State" name="State" value="未启动" runat="server" />
                </td>
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

            $("#BtnReturnPrevious").click(function () {
                var value = document.all.WorkFlowManage_TxtDealResult.value;
                if (value == "") {
                    HDialog.Info("请填写驳回意见");
                    return false;
                }
                else {
                    return true;
                }

            });

            function InitPurchaseTableHeight() {
                var w = $(window).width();
                $("#Container").css("width", (w - 8) + "px");
                $("#OAFlow").css("width", (w - 8) + "px");
                $(".DialogTable").css("width", (w - 8) + "px");
            }
            InitPurchaseTableHeight();
            var frozenColumns = [[{ field: 'BuyMethod', title: '采购方式', width: 50, align: 'center', sortable: true },
            { field: 'MaterialTypeName', title: '物资类别', width: 50, align: 'center', sortable: true },
            { field: 'Num', title: '物资编码', width: 50, align: 'center', sortable: true },
            { field: 'MaterialName', title: '物资名称', width: 50, align: 'center', sortable: true }
            ]]
            column = [[


                { field: 'Specification', title: '规格', align: 'center', width: 50, sortable: true },
                { field: 'UnitName', title: '单位名称', width: 50, align: 'center', sortable: true },
                { field: 'Brand', title: '品牌', align: 'center', width: 150, sortable: true },
                { field: 'ColorName', title: '颜色', align: 'center', width: 50, sortable: true },
                { field: 'SupplierName', title: '分供方名称', align: 'center', width: 250, sortable: true, hidden: true },
                {
                    field: 'BasePrice', title: '含税参考价', align: 'center', width: 100, sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.BasePrice, decimalPos);
                    }
                },
                {
                    field: 'Price', title: '含税单价', align: 'center', width: 89, sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.Price, decimalPos);
                    }
                },
                { field: 'Taxes', title: '税率', align: 'center', width: 89, sortable: true },
                {
                    field: 'NoTaxPrice', title: '不含税单价', align: 'center', width: 100, sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.NoTaxPrice, decimalPos);
                    }
                },
                {
                    field: 'SafeCount', title: '安全库存', align: 'center', width: 50, sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.SafeCount, 2);
                    }
                },
                {
                    field: 'StoreCount', title: '当前库存', align: 'center', width: 50, sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.StoreCount, 2);
                    }
                },
                {
                    field: 'Quantity', title: '申购数量', align: 'center', width: 100, sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.Quantity, 3);
                    }
                },
                {
                    field: 'Amount', title: '含税金额', align: 'center', width: 100, sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.Amount, moneyPos);
                    }
                },
                {
                    field: 'TaxMoney', title: '税款', align: 'center', width: 100, sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.TaxMoney, moneyPos);
                    }
                },
                {
                    field: 'NoTaxAmount', title: '不含税金额', align: 'center', width: 100, sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.NoTaxAmount, moneyPos);
                    }
                },
                {
                    field: 'ArrivalDate', title: '申请到货日期', align: 'center', width: 100, sortable: true, formatter: function (value, row, index) {
                        return value == "" ? "" : formatDate(value, "yyyy-MM-dd");
                    },
                    editor: {
                        type: 'datebox'
                    }
                },
                {
                    field: 'Memo', title: '备注', align: 'center', width: 100, sortable: true
                }
            ]];
            var toolbar;
            var toolbar_Start = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        MaterialChiose();
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
                , '-',
                {
                    text: '采购明细导入',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        if ($("#InWareHouseId").val() == "") {
                            HDialog.Info("请选择入库仓库");
                            return;
                        }
                        BatchImportPurchase();
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
            //计算合计金额及页脚合计金额,不含税单价及含税单价
            function UpdateAmount() {
                if (editIndex != undefined) {
                    $("#TableContainer").datagrid('acceptChanges', editIndex);
                    var index = editIndex;
                    var rowData = $('#TableContainer').datagrid('getData').rows[index];

                    //检查申购价格是否允许调低及调高价格,如果违反规则,则申购价置为参考价

                    if (rowData == undefined) return;

                    var BasePrice = parseFloat(rowData.BasePrice);
                    var Price = parseFloat(rowData.Price);
                    var Quantity = parseFloat(rowData.Quantity);

                    var Rule = 0;
                    //如果有供应商
                    if (rowData.SupplierId != "") {
                        if ($("#State").val() == "未启动") {
                            //采购申请时有供应商能否允许修改采购单价 大于0则可以修改,1调高，2调低，3所有
                            Rule = parseInt($("#Ture_Purchase_UpdatePrice").val());
                        }
                        if ($("#State").val() == "审核中") {
                            //采购申请审核时有供应商能否允许修改采购单价,大于0则可以修改,1调高，2调低，3所有
                            Rule = parseInt($("#Ture_Purchase_Check_UpdatePrice").val());
                        }
                    }

                    //如果没有供应商
                    if (rowData.SupplierId == "") {
                        if ($("#State").val() == "未启动") {
                            //采购申请时没有供应商能否允许修改采购单价,大于0则可以修改,1调高，2调低，3所有
                            Rule = parseInt($("#False_Purchase_UpdatePrice").val());
                        }
                        if ($("#State").val() == "审核中") {
                            //采购申请审核时没有供应商能否允许修改采购单价,大于0则可以修改,1调高，2调低，3所有
                            Rule = parseInt($("#False_Purchase_Check_UpdatePrice").val());
                        }
                    }

                    switch (Rule) {
                        //允许调高
                        case 1:
                            if (Price < BasePrice) {
                                Price = BasePrice;
                                HDialog.Info("价格不允许调低");
                            }
                            break;
                        //允许调低
                        case 2:
                            if (Price > BasePrice) {
                                Price = BasePrice;
                                HDialog.Info("价格不允许调高");
                            }
                            break;
                        //所有
                        case 3:
                            break;
                    }

                    $('#TableContainer').datagrid('updateRow',
                        {
                            index: index,
                            row: {
                                Price: ToDecimal(Price, decimalPos),
                                Quantity: ToDecimal(Quantity, 3),
                                Amount: ToDecimal(parseFloat(Price) * parseFloat(rowData.Quantity), moneyPos),
                                NoTaxPrice: ToDecimal(Taxes.TaxPrice(Price, rowData.Taxes), decimalPos),
                                NoTaxAmount: ToDecimal(parseFloat(Taxes.TaxPrice(Price, rowData.Taxes)) * rowData.Quantity, moneyPos),
                                TaxMoney: ToDecimal((parseFloat(Price) * parseFloat(rowData.Quantity)) - (parseFloat(Taxes.TaxPrice(Price, rowData.Taxes)) * rowData.Quantity), moneyPos)
                            }
                        });
                }
                //计算页脚合计
                $('#TableContainer').datagrid('reloadFooter', [
                    {
                        BuyMethod: "合计",
                        Quantity: ComputeGridCol("Quantity"),
                        Amount: ComputeGridCol("Amount"),
                        TaxMoney: ComputeGridCol("TaxMoney"),
                        NoTaxAmount: ComputeGridCol("NoTaxAmount")
                    }
                ]);
            };


            function BatchImportPurchase() {
                HDialog.Open(770, 270, '../Mt/BatchImportPurchase.aspx', '批量导入采购明细信息', false, function callback(_Data) {

                    var rows = JSON.parse(_Data);
                    var obj = eval('(' + rows + ')');
                    for (var i = 0; i < obj.data.length; i++) {
                        ImportMaterial(obj.data[i]);
                    }
                    Calculation();
                });
            }
            function ImportMaterial(row) {

                console.log(row);
                var _Data = $('#TableContainer').datagrid('getData');
                var row_index = _Data.rows.length;
                var selIndex = IsRepeatData("MaterialId", row.Id);
                //如果有相同的物资ID
                if (selIndex == 1) return;
                var strGuid = Guid();
                $('#TableContainer').datagrid('insertRow', {
                    index: row_index,
                    row: {
                        Id: strGuid,
                        PurchaseId: "",
                        MaterialId: row.Id,
                        SupplierId: "",
                        BasePrice: ToDecimal("0", decimalPos),
                        SafeCount: ToDecimal("0", 2),
                        StoreCount: ToDecimal("0", 2),
                        Price: ToDecimal("0", decimalPos),
                        Quantity: row.Quantity,
                        Amount: ToDecimal("0", moneyPos),
                        InCount: "0",
                        InMoney: "0",
                        BuyMethod: "",
                        Memo: "",
                        BuyMethodFrom: "",
                        BasePriceFrom: "",
                        Taxes: "0.00",
                        NoTaxPrice: ToDecimal("0", decimalPos),
                        NoTaxAmount: ToDecimal("0", moneyPos),
                        TaxMoney: ToDecimal("0", moneyPos),
                        Sort: "",
                        ArrivalDate: "",
                        MaterialTypeName: row.MaterialTypeName,
                        MaterialName: row.Name,
                        Num: row.Number,
                        Spell: "",
                        Property: "",
                        UnitName: row.UnitName,
                        Brand: row.Brand,
                        Specification: row.Specification,
                        ColorName: row.ColorName,
                        SafeCount1: "0",
                        StoreCount1: "0",
                        SupplierName: ""

                    }
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
            function MaterialChiose() {
                if ($("#InWareHouseId").val() == "") {
                    HDialog.Info("请选择入库仓库");
                    return;
                }
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../Mt/PurchaseDialog/MaterialSelFrame.aspx', '选择物资', true, function callback(_Data) {
                    var rows = JSON.parse(_Data);

                    for (var i = 0; i < rows.length; i++) {
                        AddRows(rows[i]);
                    }
                    //按照规则计算每一行的值
                    Calculation();

                });
            }

            function ReCalc() {
                var _Data = $('#TableContainer').datagrid('getData');
                var rows = _Data.rows;
                var newrows = new Array();//新建table数据源数组
                for (var i = 0; i < rows.length; i++) {
                    var flag = false;//新增是否重复标识
                    var newnum = parseFloat(rows[i].Quantity);//设置物质初始数量
                    for (var j = 0; j < rows.length; j++) {
                        if (j > i) {
                            if ((rows[i].MaterialId == rows[j].MaterialId) && (rows[i].SupplierId == rows[j].SupplierId)) {//物资id和供货商id相等时
                                flag = true;
                                newnum = newnum + parseFloat(rows[j].Quantity);//累加物资数量
                                rows[j]["have"] = 0;//新增标识数组已存在
                            }
                        }
                    }
                    if (rows[i].have == 0) {//若此物资已做过重复处理则不再处理

                    }
                    else {

                        //判断设置默认采购方式
                        if (rows[i].SupplierId == "") {
                            rows[i].BuyMethod = "自购";
                        }
                        else {
                            rows[i].BuyMethod = "统购";
                        }
                        if (flag) {
                            var rowobj = rows[i];
                            rowobj.Quantity = ToDecimal(newnum, 3);
                            newrows.push(rowobj);
                        }
                        else {
                            newrows.push(rows[i]);
                        }
                    }

                }
                var tableheight = "auto";
                if (rows.length >= 8) {
                    tableheight = "380";
                }
                $("#TableContainer").datagrid({
                    data: newrows,
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    height: tableheight,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc"
                });
            }
            //选择物资后增加行
            function AddRows(row) {
                var _Data = $('#TableContainer').datagrid('getData');
                var row_index = _Data.rows.length;
                var strGuid = Guid();
                $('#TableContainer').datagrid('insertRow', {
                    index: row_index,
                    row: {
                        Id: strGuid,
                        PurchaseId: "",
                        MaterialId: row.Id,
                        SupplierId: "",
                        BasePrice: ToDecimal("0", decimalPos),
                        SafeCount: ToDecimal("0", 2),
                        StoreCount: ToDecimal("0", 2),
                        Price: ToDecimal("0", decimalPos),
                        Quantity: "1.00",
                        Amount: ToDecimal("0", moneyPos),
                        InCount: "0",
                        InMoney: "0",
                        BuyMethod: "",
                        Memo: "",
                        BuyMethodFrom: "",
                        BasePriceFrom: "",
                        Taxes: "0.00",
                        NoTaxPrice: ToDecimal("0", decimalPos),
                        NoTaxAmount: ToDecimal("0", moneyPos),
                        TaxMoney: ToDecimal("0", moneyPos),
                        Sort: "",
                        ArrivalDate: "",
                        MaterialTypeName: row.MaterialTypeName,
                        MaterialName: row.Name,
                        Num: row.Number,
                        Spell: "",
                        Property: "",
                        UnitName: row.UnitName,
                        Brand: row.Brand,
                        Specification: row.Specification,
                        ColorName: row.ColorName,
                        SafeCount1: "0",
                        StoreCount1: "0",
                        SupplierName: ""

                    }
                });
            }
            /*
                参考价格：
                1、新增物资 选择物资后根据入库仓库计算当前库存、安全库存   
                2、参考价如果有分供方，则按照分供方报价(如果有多个供应商，则默认能够供应仓库的价格最低的那个供应商，并且允许选择)，如果没有分供方则按照最近入库价报价、
                如果没有最近入库价则按照设置的参考价
                3、申购价默认等于参考价,根据公司层级设置的参数是否允许对申购价的价格进行调整
                4、根据采购申请时是否允许修改价格的参数进行控制是否允许对单价进行调整

                5、最后计算合计金额列
                6、入库仓库变更时，需要对价格进行重新计算，以前选择的结果全部清除
                7、供应商变化后，重新计算参考单价(BasePrice)和申购价(Price)

                采购方式
                首选默认仓库管理模块设置的采购方式，如果设置的有，不允许修改；
                如果没有设置：如果有分供方，默认统购，可修改；如果没有分供方，默认自购，也可修改；

                采购数量
                采购购量 默认当前库存与安全库存的差额；

                申购价格：
                根据总公司设置的采购申请是否允许修改和采购申核时是否充许修改作控制
            */

            function Calculation() {
                var rows = $("#TableContainer").datagrid("getRows");
                $("#CalResult").val(JSON.stringify(rows));
                $.tool.DataPost('Purchase', 'CalculationRows', $("#frmForm").serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data.substring(0, 5) == "false") {
                            //HDialog.Info(_Data.substring(6));
                        }
                        else {

                            //计算完成
                            //重新更新列表里面的数据
                            var Obj = JSON.parse(_Data);
                            for (var i = 0; i < Obj.length; i++) {
                                var index = $('#TableContainer').datagrid("getRowIndex", Obj[i].Id);

                                var rowData = $('#TableContainer').datagrid('getData').rows[index];

                                $('#TableContainer').datagrid('endEdit', index);
                                if (rowData == null) {
                                    break;
                                }
                                //如果单价大于0，则不需要进行更改
                                if (parseFloat(rowData.Price) == 0 && parseFloat(rowData.NoTaxPrice) == 0) {

                                    $('#TableContainer').datagrid('updateRow',
                                        {
                                            index: index,
                                            row: {
                                                BuyMethodFrom: Obj[i].BuyMethodFrom,
                                                BasePriceFrom: Obj[i].BasePriceFrom,
                                                BuyMethod: Obj[i].BuyMethod,
                                                SafeCount: Obj[i].SafeCount,
                                                StoreCount: Obj[i].StoreCount,
                                                SupplierName: Obj[i].SupplierName,
                                                SupplierId: Obj[i].SupplierId,
                                                BasePrice: ToDecimal(Obj[i].BasePrice, decimalPos),
                                                Taxes: ToDecimal(Obj[i].Taxes, 2),
                                                Price: ToDecimal(Obj[i].Price, decimalPos),
                                                Quantity: $("#PurchaseId").val() == "" ? ToDecimal(Obj[i].SafeCount, 3) - ToDecimal(Obj[i].StoreCount, 3) : rowData.Quantity,
                                                Amount: ToDecimal(parseFloat(Obj[i].Price) * parseFloat(Obj[i].Quantity), moneyPos),
                                                NoTaxPrice: ToDecimal(Taxes.TaxPrice(Obj[i].Price, Obj[i].Taxes), decimalPos),
                                                NoTaxAmount: ToDecimal(parseFloat(Taxes.TaxPrice(Obj[i].Price, Obj[i].Taxes)) * Obj[i].Quantity, moneyPos),
                                                TaxMoney: ToDecimal((parseFloat(Obj[i].Price) * parseFloat(Obj[i].Quantity)) - (parseFloat(Taxes.TaxPrice(Obj[i].Price, Obj[i].Taxes)) * Obj[i].Quantity), moneyPos)
                                            }
                                        });
                                }
                            }
                            //物资id和供货商id相等处理
                            ReCalc();
                            //加载页脚
                            $('#TableContainer').datagrid('reloadFooter', [
                                {
                                    BuyMethod: "合计",
                                    Quantity: ComputeGridCol("Quantity"),
                                    Amount: ComputeGridCol("Amount"),
                                    TaxMoney: ComputeGridCol("TaxMoney"),
                                    NoTaxAmount: ComputeGridCol("NoTaxAmount"),

                                }
                            ]);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //指定列求和
            function ComputeGridCol(colName) {
                var rows = $('#TableContainer').datagrid('getRows');
                var total = 0;
                for (var i = 0; i < rows.length; i++) {
                    total += parseFloat(rows[i][colName]);
                }
                return ToDecimal(total, moneyPos);
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
                frozenColumns: frozenColumns,
                fitColumns: false,
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
                            Quantity: ToDecimal("0.00", 2),
                            Amount: ToDecimal("0.00", moneyPos),
                            TaxMoney: ToDecimal("0.00", moneyPos),
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
                    $("#TableContainer").datagrid('removeEditor', 'BuyMethod');
                    $("#TableContainer").datagrid('removeEditor', 'BasePrice');
                    $("#TableContainer").datagrid('removeEditor', 'SupplierName');
                    $("#TableContainer").datagrid('removeEditor', 'Price');
                    $("#TableContainer").datagrid('removeEditor', 'Quantity');
                    $("#TableContainer").datagrid('removeEditor', 'Taxes');
                    $("#TableContainer").datagrid('removeEditor', 'Memo');

                    //发起时允许编辑,审核中不允许编辑
                    if ($("#State").val() == "未启动") {

                        //数量可以编辑
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

                        //如果仓库物资没有绑定采购方式，则采购方式可以编辑
                        if (rowData.BuyMethodFrom == '') {
                            //采购方式可以编辑
                            $("#TableContainer").datagrid('addEditor', {
                                field: 'BuyMethod',
                                editor: {
                                    type: 'combobox',
                                    options: {
                                        valueField: 'BuyType',
                                        textField: 'BuyTypeId',
                                        method: 'get',
                                        url: 'BuyType.json',
                                        required: true,
                                        panelHeight: 'auto'
                                    }
                                }
                            });
                        }
                        //如果没有供商没有历史入库价没有绑定参考价测允许编辑参考价
                        if (rowData.BasePriceFrom == "未设置") {

                            $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                                {
                                    field: 'BasePrice',
                                    editor: {
                                        type: 'numberbox',
                                        options: {
                                            precision: decimalPos
                                        }
                                    }
                                }]);

                        }

                        $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                            {
                                field: 'Memo',
                                editor: {
                                    type: 'text'
                                }
                            }]);
                    }

                    //如果有供应商
                    if (rowData.SupplierId != "") {
                        if ($("#State").val() == "未启动") {
                            //采购申请时有供应商能否允许修改采购单价 大于0则可以修改
                            if (parseInt($("#Ture_Purchase_UpdatePrice").val()) > 0) {
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
                                                precision: 2
                                            }
                                        }
                                    }]);
                            }
                        }
                        if ($("#State").val() == "审核中") {
                            //采购申请审核时有供应商能否允许修改采购单价,大于0则可以修改
                            if (parseInt($("#Ture_Purchase_Check_UpdatePrice").val()) > 0) {
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
                            }
                        }
                    }

                    //如果没有供应商
                    if (rowData.SupplierId == "") {
                        if ($("#State").val() == "未启动") {

                            //采购申请时没有供应商能否允许修改采购单价,大于0可以修改
                            if (parseInt($("#False_Purchase_UpdatePrice").val()) > 0) {
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
                            }
                        }
                        if ($("#State").val() == "审核中") {
                            //采购申请审核时没有供应商能否允许修改采购单价,大于0可以修改
                            if (parseInt($("#False_Purchase_Check_UpdatePrice").val()) > 0) {
                                $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                                    {
                                        field: 'Price',
                                        editor: {
                                            type: 'numberbox',
                                            options: {
                                                precision: decimalPos,
                                                min: 0
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
                            }
                        }
                    }

                    //开始编辑
                    $("#TableContainer").datagrid('beginEdit', rowIndex);

                },
                onClickCell: function (rowIndex, field, value) {
                    //获取点击的行记录
                    var rowData = $('#TableContainer').datagrid('getData').rows[rowIndex];
                    //如果点击的是不含税金额
                    if (field == "NoTaxAmount") {
                        PriceSearch(rowData.MaterialId);
                    }
                    if (field == 'SupplierName') {
                        //如果参考价来源为供方报价
                        if (rowData.BasePriceFrom == '供方报价') {
                            if ($("#State").val() == "已审核" || $("#State").val() == "审核不通过") return;
                            var w = $(window).width();
                            var h = $(window).height();
                            HDialog.Open(w, h, '../DialogNew/SelSupplier.aspx?InWareHouseId=' + $("#InWareHouseId").val() + "&MaterialId=" + rowData.MaterialId + "&ExamineState=1", '分供方选择', true, function callback(_Data) {

                                var Obj = JSON.parse(_Data);
                                //对参考单价重新赋值
                                $('#TableContainer').datagrid('updateRow',
                                    {
                                        index: rowIndex,
                                        row: {
                                            SupplierName: Obj.SupplierName,
                                            SupplierId: Obj.SupplierId,
                                            BasePrice: ToDecimal(Obj.Price, decimalPos),
                                            Price: ToDecimal(Obj.Price, decimalPos),
                                            Amount: ToDecimal(parseFloat(Obj.Price) * parseFloat(rowData.Quantity), moneyPos),
                                            Taxes: ToDecimal(Obj.Taxes, 2),
                                            NoTaxPrice: ToDecimal(Taxes.TaxPrice(Obj.Price, Obj.Taxes), decimalPos),
                                            NoTaxAmount: ToDecimal(parseFloat(Taxes.TaxPrice(Obj.Price, Obj.Taxes)) * Obj.Quantity, moneyPos),
                                            TaxMoney: ToDecimal(parseFloat(Obj.Price) * parseFloat(rowData.Quantity), moneyPos) - ToDecimal(parseFloat(Taxes.TaxPrice(Obj.Price, Obj.Taxes)) * Obj.Quantity, moneyPos)
                                        }
                                    });
                                //加载页脚
                                $('#TableContainer').datagrid('reloadFooter', [
                                    {
                                        BuyMethod: "合计",
                                        Quantity: ComputeGridCol("Quantity"),
                                        Amount: ComputeGridCol("Amount"),
                                        TaxMoney: ToDecimal("TaxMoney"),
                                        NoTaxAmount: ComputeGridCol("NoTaxAmount")
                                    }
                                ]);

                            });
                        }
                    }

                }
            });

            //初始化加载数据
            var Rows = JSON.parse($("#SearchResult").val());

            //加载数据
            $('#TableContainer').datagrid('loadData', Rows);
            //计算合计金额
            $('#TableContainer').datagrid('reloadFooter', [
                {
                    BuyMethod: "合计",
                    Quantity: ComputeGridCol("Quantity"),
                    Amount: ComputeGridCol("Amount"),
                    TaxMoney: ComputeGridCol("TaxMoney"),
                    NoTaxAmount: ComputeGridCol("NoTaxAmount")
                }
            ]);

            $("#DepName").click(function (e) {
                HDialog.Open('500', '500', '../DialogNew/SelDepartSingle.aspx', '选择部门', true, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = _Data.split(',');
                        $("#DepCode").val(arrRet[0]);
                        $("#DepName").val(arrRet[1]);
                    }
                });
            });

            $("#InWareHouseName").click(function (e) {
                HDialog.Open('500', '500', '../DialogNew/SelWareHouseNotjurisdiction.aspx', '选择入库仓库', true, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = _Data.split(',');
                        $("#InWareHouseId").val(arrRet[0]);
                        $("#InWareHouseName").val(arrRet[1]);
                        //重新初始化行列数据
                        // Calculation();
                    }
                });
            });
            //2016-07-21
            //最低价、最高价查询
            function PriceSearch(material) {
                HDialog.Open('400', '200', '../Mt/PurchaseDialog/PurchaseShouPrice.aspx?materialId=' + material, '查询最低最高价', true, function callback(_Data) {
                    if (_Data != '') {
                    }
                });
            }




            $("#PurchaseWarehouseName").click(function (e) {
                HDialog.Open('500', '500', '../DialogNew/SelWareHouse.aspx', '选择申购仓库', true, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = _Data.split(',');
                        $("#PurchaseWarehouseId").val(arrRet[0]);
                        $("#PurchaseWarehouseName").val(arrRet[1]);
                        //入库仓库默认审购仓库,当入库仓库为空时
                        if ($("#InWareHouseId").val() == "") {
                            $("#InWareHouseId").val(arrRet[0]);
                            $("#InWareHouseName").val(arrRet[1]);
                        }

                    }
                });
            });

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
                    //将列表数据保存到文本框中,提交
                    $("#GridData").val(JSON.stringify(rows));

                    if ($("#PurchaseType").val() == "零星采购") {
                        //此仓库，计划月份内零星采购总额
                        return CheckSporadicPrice();
                    }
                    return true;
                }
                else {
                    return false;
                }
            });


            //采购申请单双击选择流程，如果有默认的绑定流程，则自动加载
            function SelWorkFlowType() {
                if ($("#PurchaseWareHouseId").val() == "") {
                    HDialog.Info("请选择申购仓库");
                    return;
                }
                if ($("#InWareHouseId").val() == "") {
                    HDialog.Info("请选择入库仓库");
                    return;
                }
                if ($("#State").val() == "未启动") {
                    //如果没有绑定流程,则弹出窗口加载流程
                    var Filter = $("#PurchaseType").val();
                    if (Filter == "计划采购") Filter = "0101";
                    if (Filter == "零星采购") Filter = "0102";
                    if (Filter == "紧急采购") Filter = "0103";
                    if (Filter == "专项采购") Filter = "0104";
                    if (Filter == "集中采购") Filter = "0105";

                    var PurchaseMoney = ComputeGridCol("Amount");
                    $.tool.DataPost('Purchase', 'SelWorkFlow', "Filter=" + Filter + "&PurchaseMoney=" + PurchaseMoney,
                        function Init() {
                        },
                        function callback(_Data) {

                            if (_Data.substring(0, 5) == "false") {

                                var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&biaoshi=1&Filter=" + Filter + "&random=" + Math.random();
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

            if ($("#State").val() == "已审核") {
                $("#BtnSaveStartWorkFlow").css("display", "none");
                $("#BtnSave").css("display", "none");
                $("input[type='text']").prop("disabled", "true");
                $("SELECT").prop("disabled", "true");
                $("BUTTON").prop("disabled", "true");
            }


            $("#BtnIsPrint").click(function (e) {
                if ($("#OpType").val() == "add") return;
                var InstanceId = document.all.WorkFlowManage_InfoId.value;
                var Attribute = "<Attribute><Id>" + $("#PurchaseId").val() + "</Id><InstanceId>" + InstanceId + "</InstanceId></Attribute>";
                $.tool.Print("Purchase", Attribute);
            });
            //采购计划单打印
            $("#BtnIsPrint_1862").click(function (e) {
                if ($("#OpType").val() == "add") return;
                var InstanceId = document.all.WorkFlowManage_InfoId.value;
                var Attribute = "<Attribute><Id>" + $("#PurchaseId").val() + "</Id><InstanceId>" + InstanceId + "</InstanceId></Attribute>";
                $.tool.Print("ProcurementPlan", Attribute);
            });

            //20160630
            //yfzw
            //零星采购申请限额判断
            function CheckSporadicPrice() {
                //不含税总金额
                var NoTaxAmountMoney = ComputeGridCol("NoTaxAmount");
                $("#NoTaxAmountMoney").val(NoTaxAmountMoney);
                //判断当前仓库在该月份是否超过此仓库的零星采购限额
                $.tool.DataPostChk('frmForm', 'Purchase', 'CheckSporadicPrice', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data.substring(0, 5) == "false") {
                            HDialog.Info(_Data.substring(5, _Data.length - 1));
                            return false;
                        } else {
                            return true;
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

        </script>

    </form>
</body>
</html>
