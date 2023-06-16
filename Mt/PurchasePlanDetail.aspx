<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchasePlanDetail.aspx.cs" Inherits="M_Main.Mt.PurchasePlanDetail" %>
<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="../UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="~/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>采购计划详情</title>
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

        .TopHead {
            background-color:#f5f5f5;width:100%;height:40px;font-size:12px;border-bottom:1px solid #cccccc;
        }
        .TopHead input {
            float:left;border:none;border-right:1px solid #cccccc;text-align:center;width:84px;height:40px;line-height:40px;
            background-color:#f5f5f5;
            cursor:pointer;
        }
        .TopHead input:hover{
          background-color:#ffffff;
        }

</style>
</head>
<body>
    <form id="frmForm" runat="server">
    <input type="hidden" id="PurchasePlanId" name="PurchasePlanId" runat="server" />
    <input type="hidden" id="OpType" name="OpType" runat="server" />
    <input type="hidden" id="DepCode" name="DepCode" runat="server" />
    
     <input type="hidden" id="SearchResult" name="SearchResult" value="" runat="server" />
     <input type="hidden" id="CalResult" name="CalResult" runat="server" />

    <input type="hidden" id="Ture_Plan_Check_UpdatePrice" name="Ture_Plan_Check_UpdatePrice" runat="server" />
    <input type="hidden" id="False_Plan_Check_UpdatePrice" name="False_Plan_Check_UpdatePrice" runat="server" />
    
    <input type="hidden" id="GridData" runat="server" />
    <input type="hidden" id="BussId" name="BussId" runat="server" />
    <input type="hidden" id="UserCode" name="UserCode" runat="server" />
    <input type="hidden" id="FileList" name="FileList" runat="server" />
    <input type="hidden" id="PlanOrganCode" name="PlanOrganCode"  runat="server" />
        <%--小数位数--%>
    <input type="hidden" id="DecimalNum" name="DecimalNum" runat="server" value="4" />
    <input type="hidden" id="MoneyNum" name="MoneyNum" runat="server" value="2" />

     <div class="TopHead">
         <input type="button"  id="BtnClose"  value="关闭" />
         <input id="btnRemind"  type="submit" onserverclick="btnRemind_ServerClick" value="催办"  runat="server" />
         <input id="btnJump" type="submit" onserverclick="btnJump_ServerClick" value="跳过" runat="server" />
         <input id="BtnDealInfo"  style="display:none;" onserverclick="BtnDealInfo_ServerClick" value="会签意见" type="submit"  runat="server" />
         <input id="BtnCompleteCheckLevel" style="display:none;" onserverclick="BtnCompleteCheckLevel_ServerClick" value="批转结束" type="submit" runat="server" />
         <input id="BtnReadOver" type="submit" value="会签结束" onserverclick="BtnReadOver_ServerClick" runat="server" />
         <input id="BtnReturnPrevious"  type="submit" value="驳回" onserverclick="BtnReturnPrevious_ServerClick" runat="server" />
         <input id="BtnCheckNoPass" type="submit"  value="审批不通过" onserverclick="BtnCheckNoPass_ServerClick" runat="server" />
         <input id="BtnCheckPass" type="submit" value="审批通过" onserverclick="BtnCheckPass_ServerClick" runat="server" />
         <input id="BtnSaveStartWorkFlow"  type="submit"  value="送审" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
         <input id="BtnSave"  type="submit"  value="保存" onserverclick="BtnSave_ServerClick" runat="server" />
         <input id="BtnIsPrint_1" type="button" value="分类汇总"   runat="server" />
         <input id="BtnIsPrint_2" type="button" value="采购明细"   runat="server" />
     </div>
    <div style="height:4px;"></div>
    <table class="DialogTable">
        <tr>
            <td class="DialogTdTitle">
                计划单号：
            </td>
            <td class="DialogTdContent">
                <input type="text"  class="easyui-validatebox" data-options="required:true"  id="PlanNum" readonly name="PlanNum" runat="server" />
            </td>
            <td class="DialogTdTitle">
                计划单位：
            </td>
            <td class="DialogTdContent">
                <input type="text" readonly id="PlanOrganName" name="PlanOrganName" class="easyui-validatebox" data-options="required:true" value="" runat="server" />
            </td>
            <td class="DialogTdTitle">
            </td>
            <td class="DialogTdContent">
            </td>
            <td class="DialogTdTitle">
                计划单状态：
            </td>
            <td class="DialogTdContent">
                <input type="text" readonly id="State" name="State" value="未启动" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="DialogTdTitle">
                编制日期：
            </td>
            <td class="DialogTdContent">
                <input id="PlanDate" name="PlanDate" class="easyui-validatebox" data-options="required:true"  onclick="WdatePicker()"  runat="server" />
            </td>
            <td class="DialogTdTitle">
                编制部门：
            </td>
            <td class="DialogTdContent">
                <input type="text" class="easyui-validatebox" data-options="required:true" id="DepName" name="DepName" runat="server" />
            </td>
            <td class="DialogTdTitle">
                编制人：
            </td>
            <td class="DialogTdContent">
                <input type="text" class="easyui-validatebox" data-options="required:true"  id="UserName" name="UserName" runat="server" />
            </td>
            <td class="DialogTdTitle">
                计划年月：
            </td>
            <td class="DialogTdContent">
                <input id="PlanYearMonth" name="PlanYearMonth" class="easyui-validatebox" data-options="required:true"  onclick="WdatePicker({ dateFmt: 'yyyy-MM', isShowToday: false, isShowClear: false })"  runat="server" />
            </td>
        </tr>
         <tr>
             <td class="DialogTdTitle">
                备注：
            </td>
             <td class="DialogTdMemoContent" colspan="7">
                 <input type="text" class="easyui-validatebox"  id="Memo" name="Memo" runat="server" />
            </td>
         </tr>
        <tr id="AttachFileTr">
             <td class="DialogTdTitle">
                上传附件：
            </td>
             <td class="DialogTdMemoContent" colspan="7">
                 <iframe src="../UploadFileName.aspx" frameborder="0" width="100%" height="25px" scrolling="no"></iframe>
            </td>
         </tr>
        <tr>
             <td class="DialogTdTitle">
                附件列表：
            </td>
             <td class="DialogTdMemoContent" colspan="7">
                 <span id="List" runat="server" />
            </td>
         </tr>
        </table>
    <div id="Container" style="border:1px solid #cccccc;height:auto;margin:0px auto;">
                <div id="TableContainer" style="height:auto;"></div>
    </div>
    <div id="OAFlow" style="height:auto;margin:0px auto;">
          <uc1:BussListWorkFlow id="WorkFlowManage" runat="server"></uc1:BussListWorkFlow>
          <uc1:BussApproved runat="server" ID="CheckLevelInfo" />
    </div>

    <script type="text/javascript">
            //计算小数位数
        var decimalPos = Number($("#DecimalNum").val());
        var moneyPos = Number($("#MoneyNum").val());
            //编辑的行号
            var editIndex = undefined;

            function InitPurchaseTableHeight() {
                var w = $(window).width();
                $("#Container").css("width", (w - 8) + "px");
                $("#OAFlow").css("width", (w - 8) + "px");
                $(".DialogTable").css("width", (w - 8) + "px");
            }
            InitPurchaseTableHeight();
            var frozenColumns = [[{ field: 'InWareHouseName', title: '入库仓库', width: 70, align: 'center', sortable: true },
                    { field: 'PurchaseWareHouseName', title: '申购仓库', width: 70, align: 'center', sortable: true },
                    { field: 'BuyMethod', title: '采购方式', width: 80, align: 'center', sortable: true },
                    { field: 'MaterialTypeName', title: '物资类别', width: 80, align: 'center', sortable: true },
                    { field: 'MaterialName', title: '物资名称', width: 80, align: 'center', sortable: true }]]
            column = [[
                   
                    { field: 'UnitName', title: '单位名称', width: 50, align: 'center', sortable: true },
                    { field: 'Brand', title: '品牌', align: 'center', width: 50, sortable: true },
                    { field: 'Specification', title: '规格', align: 'center', width: 50, sortable: true },
                    { field: 'ColorName', title: '颜色', align: 'center', width: 50, sortable: true },
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
                    { field: 'SupplierName', title: '分供方名称', align: 'center', width: 70, sortable: true },
                    {
                        field: 'BasePrice', title: '含税参考价', align: 'center', width: 50, sortable: true, formatter: function (value, row, index) {
                            return ToDecimal(row.BasePrice, decimalPos);
                        }
                    },
                    
                    {
                        field: 'Price', title: '申购含税单价', align: 'center', width: 70, sortable: true, formatter: function (value, row, index) {
                            return ToDecimal(row.Price, decimalPos);
                        }
                    },
                    {
                        field: 'Taxes', title: '申购税率', align: 'center', width: 50, sortable: true, formatter: function (value, row, index) {
                            return ToDecimal(row.Taxes, 2);
                        }
                    },
                    {
                        field: 'NoTaxPrice', title: '申购不含税单价', align: 'center', width: 70, sortable: true, formatter: function (value, row, index) {
                            return ToDecimal(row.NoTaxPrice, decimalPos);
                        }
                    },
                    {
                        field: 'Quantity', title: '数量', align: 'center', width: 50, sortable: true, formatter: function (value, row, index) {
                            return ToDecimal(row.Quantity, 2);
                        }
                    },
                    {
                        field: 'Amount', title: '申购含税金额', align: 'center', width: 70, sortable: true, formatter: function (value, row, index) {
                            return ToDecimal(row.Amount, moneyPos);
                        }
                    },
                    {
                        field: 'NoTaxAmount', title: '申购不含税金额', align: 'center', width: 70, sortable: true, formatter: function (value, row, index) {
                            return ToDecimal(row.NoTaxAmount, moneyPos);
                        }
                    },

                    
                    {
                        field: 'PlanPrice', title: '计划含税单价', align: 'center', width: 70, sortable: true, formatter: function (value, row, index) {
                            return ToDecimal(row.PlanPrice, decimalPos);
                        }
                    },
                    {
                        field: 'PlanTaxes', title: '计划税率', align: 'center', width: 50, sortable: true, formatter: function (value, row, index) {
                            return ToDecimal(row.PlanTaxes, 2);
                        }
                    },
                    {
                        field: 'PlanNoTaxPrice', title: '计划不含税单价', align: 'center', width: 70, sortable: true, formatter: function (value, row, index) {
                            return ToDecimal(row.PlanNoTaxPrice, decimalPos);
                        }
                    },
                    {
                        field: 'PlanQuantity', title: '计划数量', align: 'center', width: 50, sortable: true, formatter: function (value, row, index) {
                            return ToDecimal(row.PlanQuantity, 2);
                        }
                    },
                    {
                        field: 'PlanAmount', title: '计划含税金额', align: 'center', width: 70, sortable: true, formatter: function (value, row, index) {
                            return ToDecimal(row.PlanAmount, moneyPos);
                        }
                    },
                    {
                        field: 'PlanTaxMoney', title: '税款', align: 'center', width: 50, sortable: true, formatter: function (value, row, index) {
                            return ToDecimal(row.PlanTaxMoney, moneyPos);
                        }
                    },
                    {
                        field: 'PlanNoTaxAmount', title: '计划不含税金额', align: 'center', width: 50, sortable: true, formatter: function (value, row, index) {
                            return ToDecimal(row.PlanNoTaxAmount, moneyPos);
                        }
                    },
                    {
                        field: 'PurchaseDepName', title: '申购部门', align: 'center', width: 80, sortable: true
                    }

            ]];
            var toolbar;
            var toolbar_Start = [
                {
                    text: '选择采购单',
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

                    var Price = parseFloat(rowData.Price);//采购单价
                    var PlanPrice = parseFloat(rowData.PlanPrice);//计划单价
                    var Rule = 0;
                    //如果有供应商
                    if (rowData.SupplierId != "") {
                        if ($("#State").val() == "未启动") {
                            //采购申请时有供应商能否允许修改采购单价 大于0则可以修改,1调高，2调低，3所有
                            Rule = parseInt($("#Ture_Plan_Check_UpdatePrice").val());
                        }
                        if ($("#State").val() == "审核中") {
                            //采购申请审核时有供应商能否允许修改采购单价,大于0则可以修改,1调高，2调低，3所有
                            Rule = parseInt($("#Ture_Plan_Check_UpdatePrice").val());
                        }
                    }

                    //如果没有供应商
                    if (rowData.SupplierId == "") {
                        if ($("#State").val() == "未启动") {
                            //采购计划申请时没有供应商能否允许修改采购单价,大于0则可以修改,1调高，2调低，3所有
                            Rule = parseInt($("#False_Plan_Check_UpdatePrice").val());
                        }
                        if ($("#State").val() == "审核中") {
                            //采购计划申请审核时没有供应商能否允许修改采购单价,大于0则可以修改,1调高，2调低，3所有
                            Rule = parseInt($("#False_Plan_Check_UpdatePrice").val());
                        }
                    }

                    switch (Rule) {
                        //允许调高
                        case 1:
                            if (PlanPrice < Price) {
                                PlanPrice = Price;
                                HDialog.Info("价格不允许调低");
                            }
                            break;
                            //允许调低
                        case 2:
                            if (PlanPrice > Price) {
                                PlanPrice = Price;
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
                               PlanPrice: ToDecimal(PlanPrice, decimalPos),
                               PlanAmount: ToDecimal(parseFloat(PlanPrice) * parseFloat(rowData.PlanQuantity), moneyPos),
                               PlanNoTaxPrice: ToDecimal(Taxes.TaxPrice(PlanPrice, rowData.PlanTaxes), decimalPos),
                               PlanNoTaxAmount: ToDecimal(parseFloat(Taxes.TaxPrice(PlanPrice, rowData.PlanTaxes)) * rowData.PlanQuantity, moneyPos),
                               PlanTaxMoney: ToDecimal((parseFloat(PlanPrice) * parseFloat(rowData.PlanQuantity)) - (parseFloat(Taxes.TaxPrice(PlanPrice, rowData.PlanTaxes)) * rowData.PlanQuantity), moneyPos)
                           }
                    });
                }
                //计算页脚合计
                $('#TableContainer').datagrid('reloadFooter', [
                        {
                            BuyMethod: "合计",
                            PlanAmount: ComputeGridCol("PlanAmount"),
                            PlanNoTaxAmount: ComputeGridCol("PlanNoTaxAmount")
                        }
                ]);
            };

            function PurchaseChiose() {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../Mt/PurchasePlanDialog/PurchaseSel.aspx', '选择采购单', true, function callback(_Data) {
                    $('#TableContainer').datagrid('loadData', { total: 0, rows: [] });
                    var PurchaseId = '';
                    var rows = JSON.parse(_Data);
                    for (var i = 0; i < rows.length; i++) {
                        //加载选择的采购单
                        PurchaseId = PurchaseId + rows[i].Id + ",";
                    }
                    if (PurchaseId != '') PurchaseId = PurchaseId.substr(0, PurchaseId.length - 1);
                    
                    $.tool.DataPost('PurchasePlan', 'GetPurchaseDetailLists', "PurchaseId=" + PurchaseId,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data.substring(0, 5) == "false") {
                        }
                        else {
                            var _rows = JSON.parse(_Data);
                            for (var i = 0; i < _rows.length; i++) {
                                //添加一行
                                AddRows(_rows[i]);
                            }
                            //计算页脚合计
                            $('#TableContainer').datagrid('reloadFooter', [
                                    {
                                        BuyMethod: "合计",
                                        PlanAmount: ComputeGridCol("PlanAmount"),
                                        PlanNoTaxAmount: ComputeGridCol("PlanNoTaxAmount")
                                    }
                            ]);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });

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
                        BuyMethodFrom: row.BuyMethodFrom,
                        BasePriceFrom: row.BasePriceFrom,
                        PurchaseDetailId: row.PurchaseDetailId,
                        MaterialId:row.MaterialId,
                        BuyMethod: row.BuyMethod,
                        MaterialTypeName: row.MaterialTypeName,
                        MaterialName: row.MaterialName,
                        UnitName: row.UnitName,
                        Brand: row.Brand,
                        Specification: row.Specification,
                        ColorName: row.ColorName,
                        StoreCount: ToDecimal(row.StoreCount, 2),
                        SafeCount: ToDecimal(row.SafeCount, 2),
                        SupplierName: row.SupplierName,
                        BasePrice: ToDecimal(row.BasePrice, decimalPos),
                        Price: ToDecimal(row.Price, decimalPos),
                        SupplierId: row.SupplierId,
                        InWareHouseId: row.InWareHouseId,
                        PurchaseWareHouseId: row.PurchaseWareHouseId,
                        InWareHouseName: row.InWareHouseName,
                        PurchaseWareHouseName:row.PurchaseWareHouseName,
                        Quantity: ToDecimal(row.Quantity,2),
                        Amount: ToDecimal(row.Amount, moneyPos),

                        Taxes: ToDecimal(row.Taxes, 2),
                        NoTaxPrice: ToDecimal(row.NoTaxPrice, decimalPos),
                        NoTaxAmount: ToDecimal(row.NoTaxAmount, moneyPos),

                        PlanTaxes: ToDecimal(row.Taxes, 2),
                        PlanPrice: ToDecimal(row.Price, decimalPos),
                        PlanQuantity: ToDecimal(row.Quantity, moneyPos),
                        PlanAmount: ToDecimal(row.Amount, moneyPos),

                        PlanNoTaxPrice: ToDecimal(Taxes.TaxPrice(row.Price, row.Taxes), decimalPos),
                        PlanNoTaxAmount: ToDecimal(Taxes.TaxPrice(row.Amount, row.Taxes), moneyPos),
                        PlanTaxMoney: ToDecimal(row.Amount - Taxes.TaxPrice(row.Amount, row.Taxes), moneyPos),
                        PurchaseDepName: row.PurchaseDepName
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
                idField:"Id",
                nowrap: true,
                pageSize: 50,
                pageList: [50, 150, 300],
                columns: column,
                frozenColumns: frozenColumns,
                fitColumns: false,
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
                                PlanAmount: ToDecimal("0.00", moneyPos),
                                PlanNoTaxAmount: ToDecimal("0.00", moneyPos)
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
                    $("#TableContainer").datagrid('removeEditor', 'PlanPrice');
                    $("#TableContainer").datagrid('removeEditor', 'PlanQuantity');

                    if ($("#State").val() == "未启动" || $("#State").val() == "审核中") {

                        if (rowData.SupplierId != "") {
                            //有供应商能否允许修改单价 大于0则可以修改
                            if (parseInt($("#Ture_Plan_Check_UpdatePrice").val()) > 0) {
                                $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                                {
                                    field: 'PlanPrice',
                                    editor: {
                                        type: 'numberbox',
                                        options: {
                                            precision: decimalPos
                                        }
                                    }
                                }]);
                                $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                                {
                                    field: 'PlanTaxes',
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
                                    field: 'PlanQuantity',
                                    editor: {
                                        type: 'numberbox',
                                        options: {
                                            precision: moneyPos
                                        }
                                    }
                                }]);
                            }
                        }
                        else {
                            //没有供应商时是否允许调整计划单价,大于0则可以修改
                            if (parseInt($("#False_Plan_Check_UpdatePrice").val()) > 0) {
                                $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                                {
                                    field: 'PlanPrice',
                                    editor: {
                                        type: 'numberbox',
                                        options: {
                                            precision: decimalPos
                                        }
                                    }
                                }]);
                                $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                                {
                                    field: 'PlanTaxes',
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
                                    field: 'PlanQuantity',
                                    editor: {
                                        type: 'numberbox',
                                        options: {
                                            precision: moneyPos
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
                    //如果点击的是供方单元格
                    if (field == 'SupplierName') {
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
                                        PlanPrice: ToDecimal(Obj.Price,decimalPos),
                                        PlanAmount: ToDecimal(parseFloat(Obj.Price) * parseFloat(rowData.PlanQuantity), moneyPos),

                                    }
                                });
                                //加载页脚
                                $('#TableContainer').datagrid('reloadFooter', [
                                        {
                                            BuyMethod: "合计",
                                            PlanAmount: ComputeGridCol("PlanAmount"),
                                            PlanNoTaxAmount: ComputeGridCol("PlanNoTaxAmount")
                                        }
                                ]);

                            });
                        }
                    }
                }
            });

            //初始化加载数据
            var Rows = JSON.parse($("#SearchResult").val());


            $("#TableContainer").datagrid({
                idField: "Id",
                nowrap: true,
                pageSize: 150,
                pageList: [150, 300, 450],
                columns: column,
                frozenColumns: frozenColumns,
                fitColumns: false,
                singleSelect: true,
                pagination: true,
                rownumbers: true,
                border: false,
                showFooter: true,
                striped: true,
                view: myview,
                toolbar: toolbar,
                remoteSort: false,
                sortOrder: "asc"
            });
            $('#TableContainer').datagrid({ loadFilter: pagerFilter }).datagrid({
                data: Rows     //加载数据  
            });

            function pagerFilter(data) {
                if (typeof data.length == 'number' && typeof data.splice == 'function') {   // is array  
                    data = {
                        total: data.length,
                        rows: data
                    }
                }
                var dg = $(this);
                var opts = dg.datagrid('options');
                var pager = dg.datagrid('getPager');
                pager.pagination({
                    onSelectPage: function (pageNum, pageSize) {
                        opts.pageNumber = pageNum;
                        opts.pageSize = pageSize;
                        pager.pagination('refresh', {
                            pageNumber: pageNum,
                            pageSize: pageSize
                        });
                        dg.datagrid('loadData', data);
                    }
                });
                if (!data.originalRows) {
                    data.originalRows = (data.rows);
                }
                var start = (opts.pageNumber - 1) * parseInt(opts.pageSize);
                var end = start + parseInt(opts.pageSize);
                data.rows = (data.originalRows.slice(start, end));
                return data;
            }

            //加载数据
            //$('#TableContainer').datagrid('loadData', Rows);
            //计算合计金额
            $('#TableContainer').datagrid('reloadFooter', [
                    {
                        BuyMethod: "合计",
                        PlanAmount: ComputeGridCol("PlanAmount"),
                        PlanNoTaxAmount: ComputeGridCol("PlanNoTaxAmount")
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

            $("#PlanOrganName").click(function (e) {
                HDialog.Open('500', '500', '../DialogNew/SelOrganComm.aspx', '选择公司', true, function callback(_Data) {
                    var Obj = JSON.parse(_Data);
                    $("#PlanOrganName").val(Obj.text);
                    $("#PlanOrganCode").val(Obj.attributes.OrganCode);
                });
            });

            $("#BtnClose").click(function (e) {
                HDialog.Close('');
            });

            //文件上传
            //上传文件相关js
            function UploadCallBack(addr, Name) {
                var Id = Getid();
                var v = "<a target=\"_blank\" id=\"" + Id + "\" href=\"" + addr + "\" class=List url=\"" + addr + "\">" + Name + "</a><span  style='cursor:hand' onclick=\"Delete(this);\">&nbsp;删除&nbsp;</span>"
                $("#List").append(v);
                GetAttach();
            }

            function Delete(obj) {

                //如果流程节点不为0,流程已完结,发起人不等于当前处理人员
                if (document.all.WorkFlowManage_TxtFlowSort.value != "0" || document.all.WorkFlowManage_TxtWorkFlowIsComplete.value == "2" || document.all.WorkFlowManage_TxtStartUser.value != document.all.WorkFlowManage_LoginCode.value) {
                    return;
                }
                $(obj).prev().remove();
                $(obj).remove();
                GetAttach();
            }

            function GetAttach() {
                var v = $("#List").html();
                re = /\"/g;
                var mi = v.replace(re, "'");
                $("#FileList").val(mi);
            }

            function Getid() {
                d = new Date();
                var s = "";
                s += d.getYear();
                s += (d.getMonth() + 1);
                s += d.getDate();
                s += d.getHours();
                s += d.getMinutes();
                s += (d.getSeconds());
                return s;
            }

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
                    $.tool.DataPost('Purchase', 'SelWorkFlow', "Filter=02&PurchaseMoney=" + PurchaseMoney,
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data.substring(0, 5) == "false") {
                                //如果没有绑定流程,则弹出窗口加载流程
                                var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&Filter=02&random=" + Math.random();
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
                $("#AttachFileTr").css("display", "none");
            }

            //分类汇总
            $("#BtnIsPrint_1").click(function (e) {
                if ($("#OpType").val() == "add") return;
                var InstanceId = document.all.WorkFlowManage_InfoId.value;
                var Attribute = "<Attribute><Id>" + $("#PurchasePlanId").val() + "</Id><InstanceId>" + InstanceId + "</InstanceId></Attribute>";
                $.tool.Print("PurchasePlanStat", Attribute);
            });
            //采购明细
            $("#BtnIsPrint_2").click(function (e) {
                if ($("#OpType").val() == "add") return;
                var InstanceId = document.all.WorkFlowManage_InfoId.value;
                var Attribute = "<Attribute><Id>" + $("#PurchasePlanId").val() + "</Id><InstanceId>" + InstanceId + "</InstanceId></Attribute>";
                $.tool.Print("PurchasePlanDetail", Attribute);
            });

            if ($("#State").val() == "已审核") {
                $("#BtnSaveStartWorkFlow").css("display", "none");
                $("#BtnSave").css("display", "none");
                $("input[type='text']").prop("disabled", "true");
                $("SELECT").prop("disabled", "true");
                $("BUTTON").prop("disabled", "true");
            }

    </script>

    </form>
</body>
</html>

