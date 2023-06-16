<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckOutDetail.aspx.cs" Inherits="M_Main.Mt.CheckOutDetail" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="../UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="~/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>出库单</title>
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
            24 padding:0px;
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
        <input type="hidden" id="CheckOutId" name="CheckOutId" runat="server" />
        <input type="hidden" id="WareHouseId" name="WareHouseId" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />

        <input type="hidden" id="SearchResult" name="SearchResult" value="" runat="server" />
        <input type="hidden" id="CalResult" name="CalResult" runat="server" />
        <input type="hidden" id="UseDepCode" name="UseDepCode" runat="server" />

        <input type="hidden" id="GridData" runat="server" />
        <input type="hidden" id="BussId" name="BussId" runat="server" />
        <input type="hidden" id="Originator" name="Originator" runat="server" />
        <input type="hidden" id="CheckOutMethod" name="CheckOutMethod" runat="server" />

        <input type="hidden" id="UseWay" name="UseWay" runat="server" />


        <input type="hidden" id="IncidentNums" name="IncidentNums" runat="server" value="" />

        <%--报事编号--%>
        <input type="hidden" id="IncidentID" name="IncidentID" runat="server" value="" />
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
            <input id="BtnsettlePrint" type="button" value="成本结算单" runat="server" />
            <input id="BtnSaveStartWorkFlow" type="submit" value="送审" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
            <input id="BtnSave" type="submit" value="保存" onserverclick="BtnSave_ServerClick" runat="server" />


        </div>
        <div style="height: 4px;"></div>
        <table class="DialogTable">
            <tr>
                <td class="DialogTdTitle">出库单号：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="ReceiptSign" readonly name="ReceiptSign" runat="server" />
                </td>
                <td class="DialogTdTitle">出库类型：
                </td>
                <td class="DialogTdContent">
                    <select id="CheckOutType" name="CheckOutType" runat="server">
                        <option value="领料出库">领料出库</option>
                        <option value="调拨出库">调拨出库</option>
                        <%--<option value="盘亏出库">盘亏出库</option>--%>
                        <option value="报损出库">报损出库</option>
                    </select>
                </td>
                <td class="DialogTdTitle">出库仓库
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" readonly id="WareHouseName" name="WareHouseName" value="" runat="server" />
                </td>
                <td class="DialogTdTitle">出库单状态：
                </td>
                <td class="DialogTdContent">
                    <input type="text" readonly id="State" name="State" value="未启动" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">派工单号：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:false" id="IncidentNum" name="IncidentNum" runat="server" />
                </td>
                <td class="DialogTdTitle">使用部门：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="UseDepName" name="UseDepName" runat="server" />
                </td>
                <td class="DialogTdTitle">使用人：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="UseUserName" name="UseUserName" runat="server" />
                </td>
                <td class="DialogTdTitle">领料用途：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="Purpose" name="Purpose" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">领料原因：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="UserReason" name="UserReason" runat="server" />
                </td>
                <td class="DialogTdTitle">使用位置：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:false" id="UsePosition" name="UsePosition" runat="server" />
                </td>
                <td class="DialogTdTitle">出库申请时间：
                </td>
                <td class="DialogTdContent">
                    <input id="ReceiptDate" name="ReceiptDate" class="easyui-validatebox" data-options="required:true" readonly runat="server" />
                </td>
                <td class="DialogTdTitle">制单人：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="OriginatorName" name="OriginatorName" runat="server" />
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
            if ($("#OpType").val() != "edit") {
                $("#CheckOutType").html('<option value="领料出库">领料出库</option><option value="报损出库">报损出库</option>');
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
                { field: 'Specification', title: '规格', align: 'center', width: 50, sortable: true },
                { field: 'ColorName', title: '颜色', align: 'center', width: 50, sortable: true },
                {
                    field: 'Price', title: '含税单价', align: 'center', width: 50, sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.Price, decimalPos);
                    }
                },
                {
                    field: 'Quantity', title: '出库数量', align: 'center', width: 50, sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.Quantity, 3);
                    }
                },
                {
                    field: 'Amount', title: '含税金额', align: 'center', width: 50, sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.Amount, moneyPos);
                    }
                },

                { field: 'Purpose', title: '出库用途', align: 'center', width: 50, sortable: true },
                { field: 'UseDepName', title: '使用部门', align: 'center', width: 50, sortable: true },
                { field: 'UseUserName', title: '使用人', align: 'center', width: 50, sortable: true },
                { field: 'UsePosition', title: '使用位置', align: 'center', width: 50, sortable: true },
                { field: 'CostCode', title: '成本科目', align: 'center', width: 50, sortable: true },
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
                        Chiose();
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        var index = $("#TableContainer").datagrid("getRowIndex", row);
                        if (CheckDelOrUpdate(index, row)) {
                            $('#TableContainer').datagrid('deleteRow', index);
                            UpdateAmount();
                        } else {
                            HDialog.Info("不能删除该条数据！");
                        }

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


                    var PurchasePrice = parseFloat(rowData.PurchasePrice);//采购申请单价
                    var Price = parseFloat(rowData.Price);//含税单价

                    $('#TableContainer').datagrid('updateRow',
                        {
                            index: index,
                            row: {
                                Price: Price,
                                Amount: ToDecimal(parseFloat(Price) * parseFloat(rowData.Quantity), decimalPos)
                            }
                        });
                }
                //计算页脚合计
                $('#TableContainer').datagrid('reloadFooter', [
                    {
                        BuyMethod: "合计",
                        Amount: ComputeGridCol("Amount")
                    }
                ]);
            };

            function Chiose() {
                if ($("#WareHouseId").val() == "") {
                    HDialog.Info("请选择出库仓库");
                    return;
                }
                if ($("#UseDepName").val() == "") {
                    HDialog.Info("请选择使用部门");
                    return;
                }
                if ($("#UseUserName").val() == "") {
                    HDialog.Info("请填写使用人");
                    return;
                }
                if ($("#Purpose").val() == "") {
                    HDialog.Info("请填写领料用途");
                    return;
                }
                if ($("#UserReason").val() == "") {
                    HDialog.Info("请填写领料原因");
                    return;
                }
                var _t = $("#CheckOutMethod").val();
                if (_t == "1000") {

                    //个别计价
                    MaterialChiose_1000();
                }
                if (_t == "1001")
                {
                    //2017-1-11 
                    //2种方式，1用户按先后顺序选择单据。2用户选择物资，系统自动按先入先出规则运算【二者只选其一】
                    //1：先入先出
                    //MaterialChiose_1001();
                    //2：自动按先入先规则运算
                    MaterialChiose_1001_Auto();
                }
                if (_t == "1002") {
                    //加权平均
                    MaterialChiose_1002();
                }
            }

            //个价计量法选择物资
            function MaterialChiose_1000() {
                if ($("#WareHouseId").val() == "") {
                    HDialog.Info("请选择入库仓库");
                    return;
                }
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../Mt/CheckOutDialog/PriceMeasurementSelFrame.aspx?WareHouseId=' + $("#WareHouseId").val(), '选择物资', true, function callback(_Data) {
                    //将选择的物资添加到行
                    var rows = JSON.parse(_Data);
                    for (var i = 0; i < rows.length; i++) {
                        AddRows(rows[i]);
                    }
                    UpdateAmount();
                });
            }

            //先入先出选择物资
            function MaterialChiose_1001() {
                if ($("#WareHouseId").val() == "") {
                    HDialog.Info("请选择入库仓库");
                    return;
                }

                var rows = $("#TableContainer").datagrid("getRows");

                var StorageDetailId = '';
                for (var i = 0; i < rows.length; i++) {
                    if (i == 0) {
                        StorageDetailId = rows[i].StorageDetailId;
                    }
                    else {
                        StorageDetailId = StorageDetailId + "," + rows[i].StorageDetailId;
                    }
                }

                Cache.SetData("CheckOutDetail_StorageDetailId", StorageDetailId);

                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../Mt/CheckOutDialog/FirstInOutSelFrame.aspx?WareHouseId=' + $("#WareHouseId").val() + '&StorageDetailId=' + StorageDetailId, '选择物资', true, function callback(_Data) {

                    var rows = JSON.parse(_Data);
                    for (var i = 0; i < rows.length; i++) {
                        AddRows(rows[i]);
                    }
                    UpdateAmount();

                    //预检查先入先出规则
                    CheckInOut1001();
                });
            }



            function CheckInOut1001() {
                var rows = $("#TableContainer").datagrid("getRows");
                //将列表数据保存到文本框中,提交
                $("#GridData").val(JSON.stringify(rows));

                $.tool.DataPost('CheckOut', 'Check1001InOut', $("#frmForm").serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        //如果先入先出检测有问题，进行提示报错
                        if (_Data.substring(0, 5) == "false") {
                            HDialog.Info(_Data.substring(6));
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //加权平均选择物资
            function MaterialChiose_1002() {
                if ($("#WareHouseId").val() == "") {
                    HDialog.Info("请选择入库仓库");
                    return;
                }
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../Mt/CheckOutDialog/MaterialSelFrame.aspx?WareHouseId=' + $("#WareHouseId").val(), '选择物资', true, function callback(_Data) {

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
                        WareHouseId: $("#WareHouseId").val(),
                        StorageDetailId: row.StorageDetailId,
                        MaterialId: row.MaterialId,
                        MaterialTypeName: row.MaterialTypeName,
                        MaterialName: row.Name,
                        UnitName: row.UnitName,
                        Brand: row.Brand,
                        Specification: row.Specification,
                        ColorName: row.ColorName,
                        Price: ToDecimal(row.Price, decimalPos),//单价
                        Quantity: ToDecimal(row.Quantity, 3),
                        Amount: ToDecimal(parseFloat(row.Price) * parseFloat(row.Quantity), moneyPos),
                        Purpose: $("#Purpose").val(),
                        UseDepName: $("#UseDepName").val(),
                        UseUserName: $("#UseUserName").val(),
                        UsePosition: $("#UsePosition").val(),
                        CostCode: row.CostCode,
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
                    $("#TableContainer").datagrid('removeEditor', 'Quantity');
                    $("#TableContainer").datagrid('removeEditor', 'Purpose');
                    $("#TableContainer").datagrid('removeEditor', 'UseDepName');
                    $("#TableContainer").datagrid('removeEditor', 'UseUserName');
                    $("#TableContainer").datagrid('removeEditor', 'UsePosition');
                    $("#TableContainer").datagrid('removeEditor', 'CostCode');

                    if ($("#State").val() == "未启动" || $("#State").val() == "审核中") {

                        if ($("#hidSelType").val() != "") {

                            if (CheckDelOrUpdate(rowIndex, rowData)) {

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


                        $("#TableContainer").datagrid('addEditor', {
                            field: 'Purpose',
                            editor: {
                                type: 'combobox',
                                options: {
                                    valueField: 'Name',
                                    textField: 'Name',
                                    data: eval($("#UseWay").val()),
                                    panelHeight: 'auto'
                                }
                            }
                        });

                        $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                            {
                                field: 'UseDepName',
                                editor: {
                                    type: 'text'
                                }
                            }]);
                        $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                            {
                                field: 'UseUserName',
                                editor: {
                                    type: 'text'
                                }
                            }]);
                        $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                            {
                                field: 'UsePosition',
                                editor: {
                                    type: 'text'
                                }
                            }]);
                        $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                            {
                                field: 'CostCode',
                                editor: {
                                    type: 'text'
                                }
                            }]);
                        $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
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

                    //绑定JS事件
                    var ed = $('#TableContainer').datagrid('getEditors', rowIndex);
                    for (var i = 0; i < ed.length; i++) {
                        var e = ed[i];

                        if (e.field == "UseDepName") {

                            $(e.target).bind("click", function () {
                                SelDepart($(this));
                            }).bind("change", function () {
                                //文本变化事件
                            });
                        }


                    }

                },
                onClickCell: function (rowIndex, field, value) {
                    //获取点击的行记录
                    var rowData = $('#TableContainer').datagrid('getData').rows[rowIndex];

                }
            });

            function SelDepart(obj) {
                HDialog.Open('500', '500', '../DialogNew/SelDepartSingle.aspx', '选择部门', true, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = _Data.split(',');
                        $(obj).val(arrRet[1]);
                    }
                });
            }
            $("#WareHouseName").click(function (e) {
                HDialog.Open('500', '500', '../DialogNew/SelWareHouse.aspx', '选择出库仓库', true, function callback(_Data) {
                    if (_Data != '') {

                        var arrRet = _Data.split(',');
                        $('#TableContainer').datagrid('loadData', { total: 0, rows: [] });
                      
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
            $("#UseDepName").click(function (e) {
                HDialog.Open('500', '500', '../DialogNew/SelDepartSingle.aspx', '选择部门', true, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = _Data.split(',');
                        console.log(arrRet[2]);
                        $("#UseDepName").val(arrRet[1]);
                        $("#UseDepCode").val(arrRet[2]);
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
                    Amount: ComputeGridCol("Amount")
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

                var isValid = $("#frmForm").form('validate');
                if (isValid == true) {
                    if ($("#IncidentID").val() != "" && $("#IncidentNum").val() == "") {
                        HDialog.Info("派工单号不能为空");
                        return false;
                    }
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
                        HDialog.Info("请给选择要出库的物资");
                        return false;
                    }
                    //将列表数据保存到文本框中,提交
                    $("#GridData").val(JSON.stringify(rows));

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
                    $.tool.DataPost('Purchase', 'SelWorkFlow', "Filter=04&PurchaseMoney=" + PurchaseMoney,
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data.substring(0, 5) == "false") {
                                //如果没有绑定流程,则弹出窗口加载流程
                                var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&Filter=04&random=" + Math.random();
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
                var Attribute = "<Attribute><Id>" + $("#CheckOutId").val() + "</Id><InstanceId>" + InstanceId + "</InstanceId></Attribute>";
                $.tool.Print("CheckOut", Attribute);
            });

            $("#BtnsettlePrint").click(function (e) {
                if ($("#OpType").val() == "add") return;
                var InstanceId = document.all.WorkFlowManage_InfoId.value;
                var Attribute = "<Attribute><Id>" + $("#CheckOutId").val() + "</Id><InstanceId>" + InstanceId + "</InstanceId></Attribute>";
                $.tool.Print("CheckOutAccount", Attribute);
            });
            

        </script>
        <script type="text/javascript">
            //选择采购申请物资后增加行【自动拆单】
            function AddRows_New(row) {
                var _Data = $('#TableContainer').datagrid('getData');
                var row_index = _Data.rows.length;
                var strGuid = Guid();
                $('#TableContainer').datagrid('insertRow', {
                    index: row_index,
                    row: {
                        Id: strGuid,
                        WareHouseId: $("#WareHouseId").val(),
                        StorageDetailId: row.StorageDetailId,
                        MaterialId: row.MaterialId,
                        MaterialTypeName: row.MaterialTypeName,
                        MaterialName: row.Name,
                        UnitName: row.UnitName,
                        Brand: row.Brand,
                        Specification: row.Specification,
                        ColorName: row.ColorName,
                        Price: ToDecimal(row.Price, decimalPos),//单价
                        Quantity: ToDecimal(row.Quantity, 3),
                        Amount: ToDecimal(parseFloat(row.Price) * parseFloat(row.Quantity), moneyPos),
                        Purpose: $("#Purpose").val(),
                        UseDepName: $("#UseDepName").val(),
                        UseUserName: $("#UseUserName").val(),
                        UsePosition: $("#UsePosition").val(),
                        CostCode: row.CostCode,
                        Memo: "",
                    }
                });
            }

            //自动按先入先规则运算
            function MaterialChiose_1001_Auto() {
                $("#hidSelType").val("5");
                if ($("#WareHouseId").val() == "") {
                    HDialog.Info("请选择入库仓库");
                    return;
                }

                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../Mt/CheckOutDialog/new_FirstInOutSelFrame.aspx?WareHouseId=' + $("#WareHouseId").val(), '选择物资', true, function callback(_DataBack) {
                    
                    //根据选择的物资进行自动 拆单并返回结果
                    //begin
                    var backRows = JSON.parse(_DataBack);
                    $("#hidWareHouseId").val($("#WareHouseId").val());//仓库
                    var str = "";
                    for (var i = 0; i < backRows.length; i++) {
                        if (i > 0) {
                            str += ",";
                        }
                        str += backRows[i].Id;//物资编号
                        str += ":";
                        str += backRows[i].Quantity;//数量
                    }
                    $("#hidvalues").val(str);
                    $.tool.DataPost('CheckOut', 'MaterialGetCheckOutDetail1001', $("#subForm").serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data.length > 0 && _Data.substring(0, 5) == "false") {
                                HDialog.Info(_Data.substring(6));
                            } else
                            {
                                //将拆单结果添加到行

                                var rows = JSON.parse(_Data);
                                for (var i = 0; i < rows.length; i++) {
                                    AddRows_New(rows[i]);
                                }
                                UpdateAmount();

                                //预检查先入先出规则
                                CheckInOut1001();
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });

                });
            }

            //删除、修改数量可操作性判断
            //先入先出在自动 拆单模式下，删除、修改数量 均只能操作最后一条数据。
            function CheckDelOrUpdate(rowIndex, rowData) {
                var newRowData = $('#TableContainer').datagrid('getData');

                var bool = true;
                for (var i = 0; i < newRowData.rows.length; i++) {
                    if (newRowData.rows[i].MaterialId == rowData.MaterialId) {
                        var Index = $('#TableContainer').datagrid('getRowIndex', newRowData.rows[i]);
                        if (Index > rowIndex) {
                            bool = false;
                            break;
                        }
                    }
                }
                return bool;
            }



        </script>



    </form>

    <!--自动拆单传参使用-->
    <form id="subForm">
        <input type="hidden" id="hidWareHouseId" name="hidWareHouseId" value="" />
        <input type="hidden" id="hidvalues" name="hidvalues" value="" />
        <!--先入先出操作模式类别 为空时：默认手动选择；有值时：自动拆单-->
        <input type="hidden" id="hidSelType" name="hidSelType" value="1" />
    </form>
</body>
</html>
