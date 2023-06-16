<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MtAllocationDetailed.aspx.cs" Inherits="M_Main.Mt.MtAllocationDetailed" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="../UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="~/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>物资调拨</title>
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
        <div class="TopHead">
            <input type="hidden" id="OpType" name="OpType" runat="server" />
            <input type="hidden" id="GridData" name="GridData" runat="server" />
            <input type="hidden" id="BussId" name="BussId" runat="server" />
            <input type="hidden" id="AllocationId" name="AllocationId" runat="server" />
            <input type="hidden" id="SearchResult" name="SearchResult" value="" runat="server" />
            <input type="hidden" id="CheckOutModel" name="CheckOutModel" value="" runat="server" />
            <%--小数位数--%>
            <input type="hidden" id="DecimalNum" name="DecimalNum" runat="server" value="4" />
            <input type="hidden" id="MoneyNum" name="MoneyNum" runat="server" value="2" />
            <input type="button" id="BtnClose" onclick="btnClose();" value="关闭" />
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
                <td class="DialogTdTitle">调入仓库：
                </td>
                <td class="DialogTdContent">
                    <input type="hidden" id="InWareHouseId" name="InWareHouseId" runat="server" />
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="InWareHouse" onclick="WareHouseChoice('InWareHouse');" style="width: 90%;" name="InWareHouse" runat="server" />
                </td>
                <td class="DialogTdTitle">调出仓库：
                </td>
                <td class="DialogTdContent">
                    <input type="hidden" id="OutWareHouseId" name="OutWareHouseId" runat="server" />
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="OutWareHouse" onclick="WareHouseChoice('OutWareHouse');" style="width: 90%;" name="OutWareHouse" runat="server" />
                </td>
                <td class="DialogTdTitle">调拨单号：
                </td>
                <td class="DialogTdContent">

                    <input type="text" class="easyui-validatebox" disabled="disabled" id="ReceiptSign" style="width: 90%;" name="ReceiptSign" runat="server" />
                </td>
                <td class="DialogTdTitle">调拨日期：
                </td>
                <td class="DialogTdContent">
                    <input type="text" id="ReciptDate" style="width: 90%;" readonly="readonly" name="ReciptDate" runat="server" /><!---class="easyui-datebox"  data-options="required:true"---->
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">制 单 人：<!---当前用户--->
                </td>
                <td class="DialogTdContent">
                    <input type="hidden" id="Originator" name="Originator" runat="server" />
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="OriginatorName" style="width: 90%;" disabled="disabled" name="OriginatorName" runat="server" />
                </td>
                <td class="DialogTdTitle">调 拨 人：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="Allocationtor" style="width: 90%;" name="Allocationtor" runat="server" />
                </td>
                <td class="DialogTdTitle">调出部门：
                </td>
                <td class="DialogTdContent">
                    <input type="hidden" id="OutDepCode" name="OutDepCode" runat="server" />
                    <input type="text" class="easyui-validatebox" id="OutDepName" style="width: 90%;" onclick="DepChoice('OutDep');" name="OutDepName" runat="server" />
                </td>
                <td class="DialogTdTitle">调入部门：
                </td>
                <td class="DialogTdContent">
                    <input type="hidden" id="InDepCode" name="InDepCode" runat="server" />
                    <input type="text" class="easyui-validatebox" id="InDepName" style="width: 90%;" name="InDepName" onclick="DepChoice('InDep');" runat="server" />
                </td>
            </tr>

            <tr>
                <td class="DialogTdTitle">调拨部门：
                </td>
                <td class="DialogTdContent">
                    <input type="hidden" id="AllocationDepCode" name="AllocationDepCode" runat="server" />
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="AllocationDepName" style="width: 90%;" name="AllocationDepName" onclick="DepChoice('AllocationDep');" runat="server" />
                </td>
                <td class="DialogTdTitle">调拨状态：
                </td>
                <td class="DialogTdContent">
                    <input type="text" id="State" name="State" class="easyui-validatebox" readonly="readonly" value="未启动" runat="server" />
                </td>
                <td class="DialogTdTitle"></td>
                <td class="DialogTdContent"></td>
                <td class="DialogTdTitle"></td>
                <td class="DialogTdContent"></td>
            </tr>

            <tr>
                <td class="DialogTdTitle">备注：
                </td>
                <td class="DialogTdContent" colspan="7">
                    <input type="text" class="easyui-validatebox" maxlength="100" id="Memo" style="width: 98%;" name="Memo" runat="server" />
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
    </form>
    <script type="text/javascript">
        //计算小数位数
        var decimalPos = Number($("#DecimalNum").val());
        var moneyPos = Number($("#MoneyNum").val());
        //编辑的行号
        var editIndex = undefined;
        function btnClose() {
            HDialog.Close("");
        }

        //部门选择
        function DepChoice(str) {
            HDialog.Open('500', '500', '../DialogNew/SelDepartSingle.aspx', '选择部门', true, function callback(_Data) {
                if (_Data != '') {
                    var arrRet = _Data.split(',');
                    $("#" + str + "Code").val(arrRet[0]);
                    $("#" + str + "Name").val(arrRet[1]);
                }
            });
        }
        function WareHouseChoice(id) {

            HDialog.Open('500', '500', '../DialogNew/SelWareHouse.aspx', '选择仓库', true, function callback(_Data) {
                if (_Data != '') {
                    //选择仓库后重新加载列表及供商
                    var arrRet = _Data.split(',');
                    $("#" + id + "Id").val(arrRet[0]);
                    $("#" + id).val(arrRet[1]);
                    var errstr = "";
                    if ($("#InWareHouseId").val() != "") {
                        if ($("#InWareHouseId").val() == $("#OutWareHouseId").val()) {
                            $("#" + id + "Id").val("");
                            $("#" + id).val("");
                            HDialog.Info("不能在同一仓库中进行调拨操作!");
                        }
                    }
                    //2016-10-21 增加盘点期间出入库限制
                    //zfyw
                    $.tool.DataPost('MtInventory', 'CheckInventorylList', "WareHouseId=" + arrRet[0],
                        function Init() {
                        },
                        function callback(_Data) {
                            errstr = _Data;
                            if (_Data == "false") {
                                HDialog.Info("该仓库目前处于盘点期间，无法进行物资调拨操作");
                                
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
                                    HDialog.Info("该仓库本月或本季未进行盘点操作，无法进行调拨操作");
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
        }
        var column = [[
            { field: 'Id', title: 'Id', width: 50, align: 'left', sortable: true, hidden: true },
            { field: 'StorageDetailId', title: 'StorageDetailId', width: 50, align: 'left', sortable: true, hidden: true },
            { field: 'WareHouseId', title: 'WareHouseId', width: 50, align: 'left', sortable: true, hidden: true },
            { field: 'Color', title: 'Color', width: 50, align: 'left', sortable: true, hidden: true },
            { field: 'Unit', title: 'Unit', width: 50, align: 'left', sortable: true, hidden: true },
            { field: 'MaterialId', title: 'MaterialId', width: 50, align: 'left', sortable: true, hidden: true },
            { field: 'MaterialTypeName', title: '物资类别', width: 90, align: 'center', sortable: true },
            { field: 'MaterialName', title: '物资名称', width: 140, align: 'center', sortable: true },
            { field: 'UnitName', title: '单位名称', width: 70, align: 'center', sortable: true },
            { field: 'Brand', title: '品牌', align: 'center', width: 80, sortable: true },
            { field: 'Specification', title: '规格', align: 'center', width: 120, sortable: true },
            { field: 'ColorName', title: '颜色', align: 'center', width: 60, sortable: true },
            {
                field: 'BasePrice', title: '含税单价', align: 'center', width: 80, sortable: true, formatter: function (value, row, index) {
                    var str = ToDecimal(row.BasePrice, decimalPos);
                    return str;
                }, hidden: true
            },//这里用作含税金额单价
            { field: 'BaseQuantity', title: '基础数量', width: 50, align: 'left', sortable: true, hidden: true },
            {
                field: 'Quantity', title: '数量', align: 'center', width: 80, sortable: true, formatter: function (value, row, index) {
                    return ToDecimal(row.Quantity, 2);
                }
            },
            {
                field: 'Price', title: '含税金额', align: 'center', width: 80, sortable: true, formatter: function (value, row, index) {
                    return ToDecimal(row.Price, moneyPos);
                }
            }//这里用作含税金额总价

        ]];
        var toolbar;
        var toolbar_Start = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    //未加入计价规则
                    //MaterialChiose();
                    //加入计价规则
                    Chiose();
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row != null) {
                        var index = $("#TableContainer").datagrid("getRowIndex", row);

                        if (CheckDelOrUpdate(index, row)) {
                            $('#TableContainer').datagrid('deleteRow', index);
                            UpdateAmount(1);
                        } else {
                            HDialog.Info("不能删除该条数据！");
                        }
                    }
                    else {
                        HDialog.Info("请选中需要删除的数据！");
                    }
                }
            }
            , '-',
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

        //计算合计金额及页脚合计金额,不含税单价及含税单价
        function UpdateAmount(bools) {
            if (bools > 0) {

                $('#TableContainer').datagrid('reloadFooter', [
                    {
                        MaterialTypeName: "合计",

                        Price: ComputeGridCol("Price")
                    }
                ]);
            }
            else
                if (editIndex != undefined) {
                    $("#TableContainer").datagrid('acceptChanges', editIndex);
                    // row.Quantity
                    var index = editIndex;
                    var rowData = $('#TableContainer').datagrid('getData').rows[index];

                    var Quantity = 0;
                    var BaseQuantity = 0;
                    var Price = 0;
                    var BasePrice = 0;
                    if (rowData.BaseQuantity != "" && rowData.BaseQuantity != 0 && rowData.Quantity != "" && rowData.Quantity != 0) {//超过最大值时候触发
                        BasePrice = ToDecimal(rowData.BasePrice, decimalPos);

                        Quantity = parseFloat(rowData.Quantity);
                        BaseQuantity = parseFloat(rowData.BaseQuantity);
                        if (Quantity > BaseQuantity) {
                            Quantity = BaseQuantity;
                        }
                        Price = parseFloat(BasePrice) * Quantity;
                    }
                    $('#TableContainer').datagrid('updateRow',
                        {
                            index: index,
                            row: {
                                Quantity: ToDecimal(Quantity, 2),
                                Price: ToDecimal(Price, decimalPos)
                            }
                        });
                    //
                    //计算页脚合计
                    $('#TableContainer').datagrid('reloadFooter', [
                        {
                            MaterialTypeName: "合计",
                            Quantity: ToDecimal(ComputeGridCol("Quantity"), 2),
                            Price: ToDecimal(ComputeGridCol("Price"), moneyPos)
                        }
                    ]);
                }
        };

        function MaterialChiose() {
            if ($("#OutWareHouseId").val() == "") {
                HDialog.Info("请选择调出仓库");
                return;
            }
            var w = $(window).width();
            var h = $(window).height();
            HDialog.Open(w, h, '../Mt/AllocationDialog/MaterialSelFrame.aspx?WareHouseId=' + $("#OutWareHouseId").val(), '选择物资', true, function callback(_Data) {
                //将选择的物资添加到行,先添加统购,再添加自购

                var rows = JSON.parse(_Data);
                for (var i = 0; i < rows.length; i++) {
                    AddRows(rows[i]);
                }
                $('#TableContainer').datagrid('reloadFooter', [
                    {
                        MaterialTypeName: "合计",
                        Quantity: ToDecimal(ComputeGridCol("Quantity"), 2),
                        Price: ToDecimal(ComputeGridCol("Price"), moneyPos)

                    }
                ]);
            });
        }


        //指定列求和
        function ComputeGridCol(colName) {
            var rows = $('#TableContainer').datagrid('getRows');
            var total = 0;
            for (var i = 0; i < rows.length; i++) {
                total += parseFloat(rows[i][colName]);
            }
            return ToDecimal(total, decimalPos);
        }

        $("input[type='submit']").click(function (e) {
            var IsSubmitFlag = true;

            if (IsSubmitFlag == false) {
                HDialog.Info("10秒内不要重复点击");
                return false;
            }
            if (checkSubmit() == false) return false;
            IsSubmitFlag = false;
            setTimeout('IsSubmitFlag=true', 10000);
            UpdateAmount(0);
            var isValid = $("#frmForm").form('validate');
            if (isValid == true) {
                if (document.all.WorkFlowManage_WorkFlowType.value == "") {
                    HDialog.Info("请选择审批流程");
                    return false;
                }
                var rows = $("#TableContainer").datagrid("getRows");
                if (rows.length < 1) {
                    HDialog.Info("请选择添加需要调拨的物资!");
                    return false;
                }
                var trlength = $("#WorkFlowNodeList tr").length;
                if (trlength < 2) {
                    HDialog.Info("请给该流程设置处理人");
                    return false;
                }
                if (JSON.stringify(rows).length <= 2) {
                    HDialog.Info("请给选择要调拨的物资");
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
                if (row.MaterialTypeName == '合计') {
                    return 'background-color:#F4F4F4;border:none;'; // return inline style
                }
            },
            onClickRow: function (rowIndex, rowData) {
                if ($("#State").val() == "已审核") return;
                if ($("#State").val() == "未启动" || $("#State").val() == "" || $("#State").val() == "审核中") {
                    //计算未提交的行数据，计算金额
                    UpdateAmount(0);
                    //更改当前行号
                    editIndex = rowIndex;
                    //去除编辑器
                    $("#TableContainer").datagrid('removeEditor', 'Quantity');

                    if ($("#hidSelType").val() != "") {
                        if (CheckDelOrUpdate(rowIndex, rowData)) {
                            $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                                {
                                    field: 'Quantity',
                                    editor: {
                                        type: 'numberbox',
                                        options: {
                                            precision: 2
                                        }
                                    }
                                }]);
                        }

                    }
                    //开始编辑
                    $("#TableContainer").datagrid('beginEdit', rowIndex);
                }
            },
            onLoadSuccess: function () {
                //加载页脚
                $('#TableContainer').datagrid('reloadFooter', [
                    {
                        MaterialTypeName: "合计",
                        Quantity: ToDecimal(ComputeGridCol("Quantity"), 2),
                        Price: ToDecimal(ComputeGridCol("Price"), moneyPos)

                    }
                ]);
            }
        });
        LoadRowsAgin();

        //初始化加载数据
        var Rows = JSON.parse($("#SearchResult").val());
        //加载数据
        $('#TableContainer').datagrid('loadData', Rows);

        function LoadRowsAgin() {

            if ($("#GridData").val() != "") {
                var Rows = JSON.parse($("#GridData").val());
                //加载数据
                $('#TableContainer').datagrid('loadData', Rows);
            }
        }
        ////计算合计
        $('#TableContainer').datagrid('reloadFooter', [
            {
                MaterialTypeName: "合计",
                Quantity: ToDecimal(ComputeGridCol("Quantity"), 2),
                Price: ToDecimal(ComputeGridCol("Price"), moneyPos)
            }
        ]);



        //采购申请单双击选择流程，如果有默认的绑定流程，则自动加载
        function SelWorkFlowType() {
            if ($("#OutWareHouseId").val() == "") {
                HDialog.Info("请选择调出仓库"); return;
            }
            if ($("#InWareHouseId").val() == "") {
                HDialog.Info("请选择调入仓库");
                return;
            }
            var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&Filter=06&random=" + Math.random();

            HDialog.Open('300', '500', strPage, '选择流程分类', false, function callback(_Data) {
                if (_Data != '') {
                    var obj = JSON.parse(_Data);
                    LoadTemplateData(obj[0].Trim(), obj[2].Trim());
                    document.all.WorkFlowManage_WorkFlowType.value = obj[1].toString();
                    document.all.WorkFlowManage_TxtWorkFlowType.value = obj[0].toString();
                }
            });
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
            var Attribute = "<Attribute><Id>" + $("#AllocationId").val() + "</Id><InstanceId>" + InstanceId + "</InstanceId></Attribute>";
            $.tool.Print("Allocation", Attribute);
        });
    </script>

    <!--选择物资，增加三种计价方式的判定-->
    <script type="text/javascript">

        //选择物资，增加三种计价方式的判定
        //yfzw 2017-2-7
        function Chiose() {

            if ($("#OutWareHouseId").val() == "") {
                HDialog.Info("请选择调出仓库");
                return;
            }
            var _t = $("#CheckOutModel").val();
            if (_t == "1000") {
                //个别计价
                MaterialChiose_1000();
            }
            if (_t == "1001") {
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
            if ($("#OutWareHouseId").val() == "") {
                HDialog.Info("请选择调出仓库");
                return;
            }
            var w = $(window).width();
            var h = $(window).height();
            HDialog.Open(w, h, '../Mt/CheckOutDialog/PriceMeasurementSelFrame.aspx?WareHouseId=' + $("#OutWareHouseId").val(), '选择物资', true, function callback(_Data) {
                var rows = JSON.parse(_Data);
                for (var i = 0; i < rows.length; i++) {
                    AddRows(rows[i]);
                }
                UpdateAmount();
            });
        }

        //加权平均选择物资
        function MaterialChiose_1002() {
            if ($("#OutWareHouseId").val() == "") {
                HDialog.Info("请选择调出仓库");
                return;
            }
            var w = $(window).width();
            var h = $(window).height();
            HDialog.Open(w, h, '../Mt/CheckOutDialog/MaterialSelFrame.aspx?WareHouseId=' + $("#OutWareHouseId").val(), '选择物资', true, function callback(_Data) {
                //将选择的物资添加到行,先添加统购,再添加自购
                var rows = JSON.parse(_Data);
                for (var i = 0; i < rows.length; i++) {
                    AddRows(rows[i]);
                }
                UpdateAmount();
            });
        }

        //自动按先入先规则运算
        function MaterialChiose_1001_Auto() {
            $("#hidSelType").val("5");
            if ($("#OutWareHouseId").val() == "") {
                HDialog.Info("请选择调出仓库");
                return;
            }

            var w = $(window).width();
            var h = $(window).height();
            HDialog.Open(w, h, '../Mt/CheckOutDialog/new_FirstInOutSelFrame.aspx?WareHouseId=' + $("#OutWareHouseId").val(), '选择物资', true, function callback(_DataBack) {

                //根据选择的物资进行自动 拆单并返回结果
                //begin
                var backRows = JSON.parse(_DataBack);
                $("#hidWareHouseId").val($("#OutWareHouseId").val());//仓库
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
                        } else {
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
                // end

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




        //选择采购申请物资后增加行
        function AddRows(row) {

            var _Data = $('#TableContainer').datagrid('getData');
            var row_index = _Data.rows.length;

            var selIndex = IsRepeatData("MaterialId", row.MaterialId);
            //如果有相同的采购明细ID
            if (selIndex == 1) return;
            var strGuid = Guid();
            $('#TableContainer').datagrid('insertRow', {
                index: row_index,
                row: {
                    Id: strGuid,
                    WareHouseId: $("#OutWareHouseId").val(),
                    StorageDetailId: row.StorageDetailId,
                    MaterialId: row.MaterialId,
                    AllocationId: "",
                    Color: "",
                    Num: "",
                    MaterialTypeName: row.MaterialTypeName,
                    MaterialName: row.Name,
                    UnitName: row.UnitName,
                    Brand: row.Brand,
                    Specification: row.Specification,
                    ColorName: row.ColorName,
                    BasePrice: ToDecimal(row.Price, decimalPos),//这里用作含税金额单价                    
                    Quantity: ToDecimal(row.Quantity, 2),
                    Amount: ToDecimal(parseFloat(row.Price) * parseFloat(row.Quantity), moneyPos),
                    Price: ToDecimal(parseFloat(row.Price) * parseFloat(row.Quantity), moneyPos),//总价
                    BaseQuantity: ToDecimal(row.Quantity, 2)//最大数量 Amount
                }
            });
        }

        //选择采购申请物资后增加行【自动拆单】
        function AddRows_New(row) {
            var _Data = $('#TableContainer').datagrid('getData');
            var row_index = _Data.rows.length;

            var strGuid = Guid();
            $('#TableContainer').datagrid('insertRow', {
                index: row_index,
                row: {
                    Id: strGuid,
                    WareHouseId: $("#OutWareHouseId").val(),
                    StorageDetailId: row.StorageDetailId,
                    MaterialId: row.MaterialId,
                    MaterialTypeName: row.MaterialTypeName,
                    MaterialName: row.Name,
                    UnitName: row.UnitName,
                    Brand: row.Brand,
                    Specification: row.Specification,
                    ColorName: row.ColorName,
                    BasePrice: ToDecimal(row.Price, decimalPos),//这里用作含税金额单价                   
                    Quantity: ToDecimal(row.Quantity, 2),
                    Amount: ToDecimal(parseFloat(row.Price) * parseFloat(row.Quantity), moneyPos),
                    Price: ToDecimal(parseFloat(row.Price) * parseFloat(row.Quantity), moneyPos),//总价
                    BaseQuantity: ToDecimal(row.Quantity, 2)//最大数量 Amount
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

    <!--自动拆单传参使用-->
    <form id="subForm">
        <input type="hidden" id="hidWareHouseId" name="hidWareHouseId" value="" />
        <input type="hidden" id="hidvalues" name="hidvalues" value="" />
        <!--先入先出操作模式类别 为空时：默认手动选择；有值时：自动拆单-->
        <input type="hidden" id="hidSelType" name="hidSelType" value="1" />
    </form>

</body>
</html>
