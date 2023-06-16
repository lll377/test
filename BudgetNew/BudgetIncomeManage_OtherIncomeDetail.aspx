<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetIncomeManage_OtherIncomeDetail.aspx.cs" Inherits="M_Main.BudgetNew.BudgetIncomeManage_OtherIncomeDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>预算管理-预算计划-其他收入计划编辑页面</title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css">
    <link href="../css/editcss.css" type="text/css" rel="stylesheet">
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/PersonDictionary.js" type="text/javascript"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        .SearchTable {
            width: 100%;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable tr .TdTitle {
            width: 140px;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            width: 160px;
            text-align: left;
            background: #fff;
        }
    </style>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="frmForm" runat="server">
        <input type="hidden" name="CommID" id="CommID" runat="server" />
        <input type="hidden" id="OtherIncomeID" name="OtherIncomeID" runat="server" />
        <input type="hidden" id="DetailResult" name="DetailResult" runat="server" />
        <input type="hidden" id="BudgetState" name="BudgetState" runat="server" />
        <div id="BatchEditDialog" class="easyui-dialog" title="批量调整" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">费用项目:
                    </td>
                    <td class="TdContentSearch">
                        <input id="CostName" class="easyui-searchbox" data-options="editable:false" searcher="SelCost" name="CostName" runat="server">
                        <input type="hidden" id="CostID" name="CostID" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">调整月份:</td>
                    <td class="TdContentSearch">
                        <select id="BudgetChangeMonthBegin" name="BudgetChangeMonthBegin" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>月
                                -
                                <select id="BudgetChangeMonthEnd" name="BudgetChangeMonthEnd" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                </select>月
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">本年实收计划增减(元):</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-numberbox" id="ThisYearRealIncome" name="ThisYearRealIncome" data-options="precision:2" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="btnBatchEdit_Ok" onclick="btnBatchEdit_OkClick()">确定调整</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" id="btnBatchEdit_cacnel" onclick="btnBatchEdit_cacnelClick()">取消</a>
                    </td>
                </tr>
            </table>
        </div>
        <div id="TableContainer1"></div>
    </form>


    <script type="text/javascript">
        function InitTableHeight() {
            var h = $(window).height();
            $("#TableContainer1").css("height", h - 1 + "px");
        }
        //选择费用项目 单选
        function SelCost() {
            HDialog.Open('600', '400', '../BudgetNew/BudgetIncomeManage_SelCost.aspx?CommID=' + $('#CommID').val() + "&KeyID=" + $('#OtherIncomeID').val() + "&IsSingle=0&FlagTable=OtherIncomePlanDetail", '选择费用项目', false, function callback(data) {
                if (data != "") {
                    var ObjArr = data.split('|');
                    if (ObjArr.length > 0) {
                        $("#CostID").val(ObjArr[1]);
                        $("#CostName").searchbox("setValue", ObjArr[0]);
                    }
                }
            });
        }

        var frozenColumns = [[//第一行
            { field: 'CostName', title: '费用项目', width: 120, align: 'center', rowspan: 3 },
            { title: '上年实收(元)', align: 'center', rowspan: 2, colspan: 2 },
            { field: 'ThisYearRealIncome', title: '本年实收计划(元)', align: 'center', width: 120, rowspan: 3 },
            {
                field: 'ThisYearGrowthRate', title: '本年增长率(%)', width: 120, align: 'center', rowspan: 3,
                formatter: function (value, row, index) {
                    if (value != "") {
                        return value + "%";
                    }
                    return value;
                }
            }
        ], [//第二行
        ], [//第三行
            { field: 'LastYearPaidAmount', title: '含税', width: 100, align: 'center' },
            { field: 'LastYearPaidAmountWithOutTax', title: '不含税', width: 100, align: 'center' }
        ]
        ];

        var column = [[//第一行
            { title: '1月', align: 'center', colspan: 5 },
            { title: '2月', align: 'center', colspan: 5 },
            { title: '3月', align: 'center', colspan: 5 },
            { title: '4月', align: 'center', colspan: 5 },
            { title: '5月', align: 'center', colspan: 5 },
            { title: '6月', align: 'center', colspan: 5 },
            { title: '7月', align: 'center', colspan: 5 },
            { title: '8月', align: 'center', colspan: 5 },
            { title: '9月', align: 'center', colspan: 5 },
            { title: '10月', align: 'center', colspan: 5 },
            { title: '11月', align: 'center', colspan: 5 },
            { title: '12月', align: 'center', colspan: 5 }
        ],
        [//第二行
            { title: '上年实收（元）', align: 'center', colspan: 2 },
            { title: '本年应收(元)', align: 'center', colspan: 2 },
            {
                field: 'ThisYearRealIncome1Y', title: '本年实收计划(元)', align: 'center', width: 100, rowspan: 2, editor: {
                    type: 'numberbox',
                    options: {
                        precision: 2
                    }
                }
            },
            { title: '上年实收（元）', align: 'center', colspan: 2 },
            { title: '本年应收(元)', align: 'center', colspan: 2 },
            {
                field: 'ThisYearRealIncome2Y', title: '本年实收计划(元)', align: 'center', width: 100, rowspan: 2, editor: {
                    type: 'numberbox',
                    options: {
                        precision: 2
                    }
                }
            },
            { title: '上年实收（元）', align: 'center', colspan: 2 },
            { title: '本年应收(元)', align: 'center', colspan: 2 },
            {
                field: 'ThisYearRealIncome3Y', title: '本年实收计划(元)', align: 'center', width: 100, rowspan: 2, editor: {
                    type: 'numberbox',
                    options: {
                        precision: 2
                    }
                }
            },
            { title: '上年实收（元）', align: 'center', colspan: 2 },
            { title: '本年应收(元)', align: 'center', colspan: 2 },
            {
                field: 'ThisYearRealIncome4Y', title: '本年实收计划(元)', align: 'center', width: 100, rowspan: 2, editor: {
                    type: 'numberbox',
                    options: {
                        precision: 2
                    }
                }
            },
            { title: '上年实收（元）', align: 'center', colspan: 2 },
            { title: '本年应收(元)', align: 'center', colspan: 2 },
            {
                field: 'ThisYearRealIncome5Y', title: '本年实收计划(元)', align: 'center', width: 100, rowspan: 2, editor: {
                    type: 'numberbox',
                    options: {
                        precision: 2
                    }
                }
            },
            { title: '上年实收（元）', align: 'center', colspan: 2 },
            { title: '本年应收(元)', align: 'center', colspan: 2 },
            {
                field: 'ThisYearRealIncome6Y', title: '本年实收计划(元)', align: 'center', width: 100, rowspan: 2, editor: {
                    type: 'numberbox',
                    options: {
                        precision: 2
                    }
                }
            },
            { title: '上年实收（元）', align: 'center', colspan: 2 },
            { title: '本年应收(元)', align: 'center', colspan: 2 },
            {
                field: 'ThisYearRealIncome7Y', title: '本年实收计划(元)', align: 'center', width: 100, rowspan: 2, editor: {
                    type: 'numberbox',
                    options: {
                        precision: 2
                    }
                }
            },
            { title: '上年实收（元）', align: 'center', colspan: 2 },
            { title: '本年应收(元)', align: 'center', colspan: 2 },
            {
                field: 'ThisYearRealIncome8Y', title: '本年实收计划(元)', align: 'center', width: 100, rowspan: 2, editor: {
                    type: 'numberbox',
                    options: {
                        precision: 2
                    }
                }
            },
            { title: '上年实收（元）', align: 'center', colspan: 2 },
            { title: '本年应收(元)', align: 'center', colspan: 2 },
            {
                field: 'ThisYearRealIncome9Y', title: '本年实收计划(元)', align: 'center', width: 100, rowspan: 2, editor: {
                    type: 'numberbox',
                    options: {
                        precision: 2
                    }
                }
            },
            { title: '上年实收（元）', align: 'center', colspan: 2 },
            { title: '本年应收(元)', align: 'center', colspan: 2 },
            {
                field: 'ThisYearRealIncome10Y', title: '本年实收计划(元)', align: 'center', width: 100, rowspan: 2, editor: {
                    type: 'numberbox',
                    options: {
                        precision: 2
                    }
                }
            },
            { title: '上年实收（元）', align: 'center', colspan: 2 },
            { title: '本年应收(元)', align: 'center', colspan: 2 },
            {
                field: 'ThisYearRealIncome11Y', title: '本年实收计划(元)', align: 'center', width: 100, rowspan: 2, editor: {
                    type: 'numberbox',
                    options: {
                        precision: 2
                    }
                }
            },
            { title: '上年实收（元）', align: 'center', colspan: 2 },
            { title: '本年应收(元)', align: 'center', colspan: 2 },
            {
                field: 'ThisYearRealIncome12Y', title: '本年实收计划(元)', align: 'center', width: 100, rowspan: 2, editor: {
                    type: 'numberbox',
                    options: {
                        precision: 2
                    }
                }
            }
        ],
        [//第三行
            { field: 'LastYearPaidAmount1Y', title: '含税', align: 'center', width: 100 },
            { field: 'LastYearPaidAmountWithOutTax1Y', title: '不含税', align: 'center', width: 100 },
            { field: 'ThisYearDueAmount1Y', title: '含税', align: 'center', width: 100 },
            { field: 'ThisYearDueAmountWithOutTax1Y', title: '不含税', align: 'center', width: 100 },
            { field: 'LastYearPaidAmount2Y', title: '含税', align: 'center', width: 100 },
            { field: 'LastYearPaidAmountWithOutTax2Y', title: '不含税', align: 'center', width: 100 },
            { field: 'ThisYearDueAmount2Y', title: '含税', align: 'center', width: 100 },
            { field: 'ThisYearDueAmountWithOutTax2Y', title: '不含税', align: 'center', width: 100 },
            { field: 'LastYearPaidAmount3Y', title: '含税', align: 'center', width: 100 },
            { field: 'LastYearPaidAmountWithOutTax3Y', title: '不含税', align: 'center', width: 100 },
            { field: 'ThisYearDueAmount3Y', title: '含税', align: 'center', width: 100 },
            { field: 'ThisYearDueAmountWithOutTax3Y', title: '不含税', align: 'center', width: 100 },
            { field: 'LastYearPaidAmount4Y', title: '含税', align: 'center', width: 100 },
            { field: 'LastYearPaidAmountWithOutTax4Y', title: '不含税', align: 'center', width: 100 },
            { field: 'ThisYearDueAmount4Y', title: '含税', align: 'center', width: 100 },
            { field: 'ThisYearDueAmountWithOutTax4Y', title: '不含税', align: 'center', width: 100 },
            { field: 'LastYearPaidAmount5Y', title: '含税', align: 'center', width: 100 },
            { field: 'LastYearPaidAmountWithOutTax5Y', title: '不含税', align: 'center', width: 100 },
            { field: 'ThisYearDueAmount5Y', title: '含税', align: 'center', width: 100 },
            { field: 'ThisYearDueAmountWithOutTax5Y', title: '不含税', align: 'center', width: 100 },
            { field: 'LastYearPaidAmount6Y', title: '含税', align: 'center', width: 100 },
            { field: 'LastYearPaidAmountWithOutTax6Y', title: '不含税', align: 'center', width: 100 },
            { field: 'ThisYearDueAmount6Y', title: '含税', align: 'center', width: 100 },
            { field: 'ThisYearDueAmountWithOutTax6Y', title: '不含税', align: 'center', width: 100 },
            { field: 'LastYearPaidAmount7Y', title: '含税', align: 'center', width: 100 },
            { field: 'LastYearPaidAmountWithOutTax7Y', title: '不含税', align: 'center', width: 100 },
            { field: 'ThisYearDueAmount7Y', title: '含税', align: 'center', width: 100 },
            { field: 'ThisYearDueAmountWithOutTax7Y', title: '不含税', align: 'center', width: 100 },
            { field: 'LastYearPaidAmount8Y', title: '含税', align: 'center', width: 100 },
            { field: 'LastYearPaidAmountWithOutTax8Y', title: '不含税', align: 'center', width: 100 },
            { field: 'ThisYearDueAmount8Y', title: '含税', align: 'center', width: 100 },
            { field: 'ThisYearDueAmountWithOutTax8Y', title: '不含税', align: 'center', width: 100 },
            { field: 'LastYearPaidAmount9Y', title: '含税', align: 'center', width: 100 },
            { field: 'LastYearPaidAmountWithOutTax9Y', title: '不含税', align: 'center', width: 100 },
            { field: 'ThisYearDueAmount9Y', title: '含税', align: 'center', width: 100 },
            { field: 'ThisYearDueAmountWithOutTax9Y', title: '不含税', align: 'center', width: 100 },
            { field: 'LastYearPaidAmount10Y', title: '含税', align: 'center', width: 100 },
            { field: 'LastYearPaidAmountWithOutTax10Y', title: '不含税', align: 'center', width: 100 },
            { field: 'ThisYearDueAmount10Y', title: '含税', align: 'center', width: 100 },
            { field: 'ThisYearDueAmountWithOutTax10Y', title: '不含税', align: 'center', width: 100 },
            { field: 'LastYearPaidAmount11Y', title: '含税', align: 'center', width: 100 },
            { field: 'LastYearPaidAmountWithOutTax11Y', title: '不含税', align: 'center', width: 100 },
            { field: 'ThisYearDueAmount11Y', title: '含税', align: 'center', width: 100 },
            { field: 'ThisYearDueAmountWithOutTax11Y', title: '不含税', align: 'center', width: 100 },
            { field: 'LastYearPaidAmount12Y', title: '含税', align: 'center', width: 100 },
            { field: 'LastYearPaidAmountWithOutTax12Y', title: '不含税', align: 'center', width: 100 },
            { field: 'ThisYearDueAmount12Y', title: '含税', align: 'center', width: 100 },
            { field: 'ThisYearDueAmountWithOutTax12Y', title: '不含税', align: 'center', width: 100 },
        ]
        ];

        var toolBar = [
            {
                text: '批量调整',
                iconCls: 'icon-edit',
                handler: function () {
                    btnBatchEdit_Click();
                }
            }, '-', {
                text: '保存',
                iconCls: 'icon-save',
                handler: function () {
                    btnSave_Click()
                }
            }, '-', {
                text: '导出Excel',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    btnExport_Click()
                }
            }
        ];

        function LoadList() {
            var DataArr = [];
            if ($('#DetailResult').val() != "") {
                DataArr = eval("(" + $('#DetailResult').val() + ")");
            }
            $("#TableContainer1").datagrid({
                idField: 'ID',
                data: DataArr,
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                frozenColumns: frozenColumns,
                columns: column,
                fitColumns: false,
                rownumbers: true,
                singleSelect: true,
                pagination: false,
                border: false,
                width: "100%",
                toolbar: toolBar,
                onClickCell: onClickCellForDetail,
                onAfterEdit: onAfterEditForDetail,
                onLoadSuccess: function (data) {
                },
                onLoadError: function () {
                }
            });
        }

        //编辑的行号
        var editIndexForDetail = undefined;
        //*****编辑
        function endEditionForDetail() {
            if (editIndexForDetail == undefined) {
                return true
            }
            if ($('#TableContainer1').datagrid('validateRow', editIndexForDetail)) {
                $('#TableContainer1').datagrid('endEdit', editIndexForDetail);
                editIndexForDetail = undefined;
                return true;
            } else {
                return false;
            }
        }
        function onClickCellForDetail(Rowindex, field, value) {
            $('#TableContainer1').datagrid('selectRow', Rowindex);
            var SelecteRow = $('#TableContainer1').datagrid("getSelected");
            //判断哪些情况直接退出 不允许编辑
            if (SelecteRow.CostID == null || SelecteRow.CostID == "") {
                endEditionForDetail();
                return false;
            }
            if (endEditionForDetail()) {
                if (field == "ThisYearRealIncome1Y" || field == "ThisYearRealIncome2Y" || field == "ThisYearRealIncome3Y" ||
                    field == "ThisYearRealIncome4Y" || field == "ThisYearRealIncome5Y" || field == "ThisYearRealIncome6Y" ||
                    field == "ThisYearRealIncome7Y" || field == "ThisYearRealIncome8Y" || field == "ThisYearRealIncome9Y" ||
                    field == "ThisYearRealIncome10Y" || field == "ThisYearRealIncome11Y" || field == "ThisYearRealIncome12Y") {
                    $('#TableContainer1').datagrid('beginEdit', Rowindex);
                    //绑定JS事件
                }
                editIndexForDetail = Rowindex;
            }
        }
        function onAfterEditForDetail(rowIndex, row, changes) {
            var updated = $('#TableContainer1').datagrid('getChanges', 'updated');
            if (updated.length < 1) {
                $('#TableContainer1').datagrid('unselectAll');
                return;
            } else {
                if (editIndexForDetail != undefined) {
                    $("#TableContainer1").datagrid('acceptChanges', editIndexForDetail);
                    $('#TableContainer1').datagrid('endEdit', editIndexForDetail);
                }
                //编辑完成后更新 内容
                var Rows = $('#TableContainer1').datagrid("getRows");
                //1、更新当前编辑的行的本年实收计划
                var totalThisYearRealIncome = 0; // 行汇总的本年实收计划
                totalThisYearRealIncome = ConvertToFloat(row["ThisYearRealIncome1Y"]) + ConvertToFloat(row["ThisYearRealIncome2Y"]) + ConvertToFloat(row["ThisYearRealIncome3Y"]) +
                    ConvertToFloat(row["ThisYearRealIncome4Y"]) + ConvertToFloat(row["ThisYearRealIncome5Y"]) + ConvertToFloat(row["ThisYearRealIncome6Y"]) +
                    ConvertToFloat(row["ThisYearRealIncome7Y"]) + ConvertToFloat(row["ThisYearRealIncome8Y"]) + ConvertToFloat(row["ThisYearRealIncome9Y"]) +
                    ConvertToFloat(row["ThisYearRealIncome10Y"]) + ConvertToFloat(row["ThisYearRealIncome11Y"]) + ConvertToFloat(row["ThisYearRealIncome12Y"]);
                var ThisYearGrowthRateValue = 0.00;
                if ($('#BudgetState').val() == "0") {
                    //增长率 含税
                    ThisYearGrowthRateValue = ConvertToFloat(row["LastYearPaidAmount"]) == 0 ? 0.00 : ((ConvertToFloat(totalThisYearRealIncome) - ConvertToFloat(row["LastYearPaidAmount"])) / ConvertToFloat(row["LastYearPaidAmount"]) * 100.00).toFixed(2);
                } else {
                    //增长率 不含税
                    ThisYearGrowthRateValue = ConvertToFloat(row["LastYearPaidAmountWithOutTax"]) == 0 ? 0.00 : ((ConvertToFloat(totalThisYearRealIncome) - ConvertToFloat(row["LastYearPaidAmountWithOutTax"])) / ConvertToFloat(row["LastYearPaidAmountWithOutTax"]) * 100.00).toFixed(2);
                }

                $('#TableContainer1').datagrid('updateRow', {
                    index: rowIndex,
                    row: {
                        "ThisYearRealIncome": totalThisYearRealIncome.toFixed(2),
                        "ThisYearGrowthRate": ThisYearGrowthRateValue
                    }
                });

                //2、更新合计行的 每月本年实收计划
                var CostItemDataFilter = Rows.filter(function (e) {
                    return e.CostID > 0 && e.CostName != '合计';
                });

                //循环12个月汇总更新数据
                for (var i = 1; i < 13; i++) {
                    var ItemTotalRealIncomeValue = 0.00;
                    for (var k = 0; k < CostItemDataFilter.length; k++) {
                        ItemTotalRealIncomeValue = FloatAdd(ItemTotalRealIncomeValue, ConvertToFloat(CostItemDataFilter[k]["ThisYearRealIncome" + i + "Y"]));
                    }
                    //更新当前月份的合计值
                    $('#TableContainer1').datagrid('updateRow', {
                        index: 0,
                        row: {
                            ["ThisYearRealIncome" + i + "Y"]: ItemTotalRealIncomeValue.toFixed(2)
                        }
                    });
                }
                //3、更新合计上的 本年实收计划
                var TotalDataFilter = Rows.filter(function (e) {
                    return e.CostID == 0 && e.CostName == '合计';
                });
                if (TotalDataFilter.length > 0) {
                    var TotalValue = 0.00;
                    TotalValue = ConvertToFloat(TotalDataFilter[0].ThisYearRealIncome1Y) +
                        ConvertToFloat(TotalDataFilter[0].ThisYearRealIncome2Y) +
                        ConvertToFloat(TotalDataFilter[0].ThisYearRealIncome3Y) +
                        ConvertToFloat(TotalDataFilter[0].ThisYearRealIncome4Y) +
                        ConvertToFloat(TotalDataFilter[0].ThisYearRealIncome5Y) +
                        ConvertToFloat(TotalDataFilter[0].ThisYearRealIncome6Y) +
                        ConvertToFloat(TotalDataFilter[0].ThisYearRealIncome7Y) +
                        ConvertToFloat(TotalDataFilter[0].ThisYearRealIncome8Y) +
                        ConvertToFloat(TotalDataFilter[0].ThisYearRealIncome9Y) +
                        ConvertToFloat(TotalDataFilter[0].ThisYearRealIncome10Y) +
                        ConvertToFloat(TotalDataFilter[0].ThisYearRealIncome11Y) +
                        ConvertToFloat(TotalDataFilter[0].ThisYearRealIncome12Y);

                    var ThisYearGrowthRateYearValue = 0.00;
                    if ($('#BudgetState').val() == "0") {
                        //增长率 含税
                        ThisYearGrowthRateYearValue = ConvertToFloat(TotalDataFilter[0].LastYearPaidAmount) == 0 ? 0.00 : ((ConvertToFloat(TotalValue) - ConvertToFloat(TotalDataFilter[0].LastYearPaidAmount)) / ConvertToFloat(TotalDataFilter[0].LastYearPaidAmount) * 100.00).toFixed(2);
                    } else {
                        //增长率 不含税
                        ThisYearGrowthRateYearValue = ConvertToFloat(TotalDataFilter[0].LastYearPaidAmountWithOutTax) == 0 ? 0.00 : ((ConvertToFloat(TotalValue) - ConvertToFloat(TotalDataFilter[0].LastYearPaidAmountWithOutTax)) / ConvertToFloat(TotalDataFilter[0].LastYearPaidAmountWithOutTax) * 100.00).toFixed(2);
                    }

                    $('#TableContainer1').datagrid('updateRow', {
                        index: 0,
                        row: {
                            "ThisYearRealIncome": TotalValue.toFixed(2),
                            "ThisYearGrowthRate": ThisYearGrowthRateYearValue
                        }
                    });
                }
            }
        }



        //切换预算月份
        function BudgetMonthSelect(record) {
            LoadList();
        }

        //批量调整
        function btnBatchEdit_Click() {
            //设置默认初始值
            $('#CostName').searchbox("setValue", "");
            $('#CostID').val("");
            $('#BudgetChangeMonthBegin').combobox("setValue", "1");
            $('#BudgetChangeMonthEnd').combobox("setValue", "1");

            $('#ThisYearRealIncome').numberbox("setValue", "");
            $('#BatchEditDialog').parent().appendTo($("form:first"));
            $('#BatchEditDialog').dialog('open');
        }

        //确定调整
        function btnBatchEdit_OkClick() {
            var BudgetChangeMonthBegin = $('#BudgetChangeMonthBegin').combobox("getValue");
            var BudgetChangeMonthEnd = $('#BudgetChangeMonthEnd').combobox("getValue");
            //验证调整月份开始不能大于结束
            if (parseInt(BudgetChangeMonthBegin) > parseInt(BudgetChangeMonthEnd)) {
                HDialog.Info("调整结束月份不能小于开始月份！");
                return;
            }
            //获取条件
            var CostIDlist = $('#CostID').val();
            var ThisYearRealIncome = $('#ThisYearRealIncome').numberbox("getValue");
            if (ThisYearRealIncome == "") {
                HDialog.Info("请输入本年实收计划增减值");
                return;
            }
            $('#BatchEditDialog').dialog('close');
            $.tool.pageLoading();
            //获取所有行数据
            var Rows = $('#TableContainer1').datagrid("getRows");
            //过滤需要更新的费项数据 并且排除合计列
            var CostItemDataFilter = Rows.filter(function (e) {
                return (CostIDlist.indexOf(e.CostID) > -1 || CostIDlist == '') && e.CostID > 0 && e.CostName != '合计';
            });
            //1、循环更新那些费项 每月的本年实收计划 并更新费项上的本年实收计划合计
            for (var i = 0; i < CostItemDataFilter.length; i++) {
                //获取这个费项的RowIndex
                var CostItemIndex = $('#TableContainer1').datagrid("getRowIndex", CostItemDataFilter[i].ID);
                //循环开始月份到结束月份 只更新这部分月份数据
                for (var M = parseInt(BudgetChangeMonthBegin); M <= parseInt(BudgetChangeMonthEnd); M++) {
                    $('#TableContainer1').datagrid('updateRow', {
                        index: CostItemIndex,
                        row: {
                            ["ThisYearRealIncome" + M + "Y"]: FloatAdd(ConvertToFloat(CostItemDataFilter[i]["ThisYearRealIncome" + M + "Y"]), ConvertToFloat(ThisYearRealIncome)).toFixed(2)
                        }
                    });
                }
                var CostItemRow = Rows[CostItemIndex];
                //更新费项上面的 合计本年实收计划
                var ItemTotalValue = 0.00;
                ItemTotalValue = ConvertToFloat(CostItemRow.ThisYearRealIncome1Y) +
                    ConvertToFloat(CostItemRow.ThisYearRealIncome2Y) +
                    ConvertToFloat(CostItemRow.ThisYearRealIncome3Y) +
                    ConvertToFloat(CostItemRow.ThisYearRealIncome4Y) +
                    ConvertToFloat(CostItemRow.ThisYearRealIncome5Y) +
                    ConvertToFloat(CostItemRow.ThisYearRealIncome6Y) +
                    ConvertToFloat(CostItemRow.ThisYearRealIncome7Y) +
                    ConvertToFloat(CostItemRow.ThisYearRealIncome8Y) +
                    ConvertToFloat(CostItemRow.ThisYearRealIncome9Y) +
                    ConvertToFloat(CostItemRow.ThisYearRealIncome10Y) +
                    ConvertToFloat(CostItemRow.ThisYearRealIncome11Y) +
                    ConvertToFloat(CostItemRow.ThisYearRealIncome12Y);
                var ThisYearGrowthRateValue = 0.00;
                if ($('#BudgetState').val() == "0") {
                    //增长率 含税
                    ThisYearGrowthRateValue = ConvertToFloat(CostItemRow.LastYearPaidAmount) == 0 ? 0.00 : ((ConvertToFloat(ItemTotalValue) - ConvertToFloat(CostItemRow.LastYearPaidAmount)) / ConvertToFloat(CostItemRow.LastYearPaidAmount) * 100.00).toFixed(2)
                } else {
                    //增长率 不含税
                    ThisYearGrowthRateValue = ConvertToFloat(CostItemRow.LastYearPaidAmountWithOutTax) == 0 ? 0.00 : ((ConvertToFloat(ItemTotalValue) - ConvertToFloat(CostItemRow.LastYearPaidAmountWithOutTax)) / ConvertToFloat(CostItemRow.LastYearPaidAmountWithOutTax) * 100.00).toFixed(2)
                }
                $('#TableContainer1').datagrid('updateRow', {
                    index: CostItemIndex,
                    row: {
                        "ThisYearRealIncome": ItemTotalValue.toFixed(2),
                        "ThisYearGrowthRate": ThisYearGrowthRateValue
                    }
                });
            }

            //2、更新合计行的 每月本年实收计划
            var AllCostItemDataFilter = Rows.filter(function (e) {
                return e.CostID > 0 && e.CostName != '合计';
            });

            //循环12个月汇总更新数据
            for (var i = 1; i < 13; i++) {
                var ItemTotalRealIncomeValue = 0.00;
                for (var k = 0; k < AllCostItemDataFilter.length; k++) {
                    ItemTotalRealIncomeValue = FloatAdd(ItemTotalRealIncomeValue, ConvertToFloat(AllCostItemDataFilter[k]["ThisYearRealIncome" + i + "Y"]));
                }
                //更新当前月份的合计值
                $('#TableContainer1').datagrid('updateRow', {
                    index: 0,
                    row: {
                        ["ThisYearRealIncome" + i + "Y"]: ItemTotalRealIncomeValue.toFixed(2)
                    }
                });
            }
            //3、更新合计上的 本年实收计划
            var TotalDataFilter = Rows.filter(function (e) {
                return e.CostID == 0 && e.CostName == '合计';
            });
            if (TotalDataFilter.length > 0) {
                var TotalValue = 0.00;
                TotalValue = ConvertToFloat(TotalDataFilter[0].ThisYearRealIncome1Y) +
                    ConvertToFloat(TotalDataFilter[0].ThisYearRealIncome2Y) +
                    ConvertToFloat(TotalDataFilter[0].ThisYearRealIncome3Y) +
                    ConvertToFloat(TotalDataFilter[0].ThisYearRealIncome4Y) +
                    ConvertToFloat(TotalDataFilter[0].ThisYearRealIncome5Y) +
                    ConvertToFloat(TotalDataFilter[0].ThisYearRealIncome6Y) +
                    ConvertToFloat(TotalDataFilter[0].ThisYearRealIncome7Y) +
                    ConvertToFloat(TotalDataFilter[0].ThisYearRealIncome8Y) +
                    ConvertToFloat(TotalDataFilter[0].ThisYearRealIncome9Y) +
                    ConvertToFloat(TotalDataFilter[0].ThisYearRealIncome10Y) +
                    ConvertToFloat(TotalDataFilter[0].ThisYearRealIncome11Y) +
                    ConvertToFloat(TotalDataFilter[0].ThisYearRealIncome12Y);
                var ThisYearGrowthRateYearValue = 0.00;
                if ($('#BudgetState').val() == "0") {
                    //增长率 含税
                    ThisYearGrowthRateYearValue = ConvertToFloat(TotalDataFilter[0].LastYearPaidAmount) == 0 ? 0.00 : ((ConvertToFloat(TotalValue) - ConvertToFloat(TotalDataFilter[0].LastYearPaidAmount)) / ConvertToFloat(TotalDataFilter[0].LastYearPaidAmount) * 100.00).toFixed(2)
                } else {
                    //增长率 不含税
                    ThisYearGrowthRateYearValue = ConvertToFloat(TotalDataFilter[0].LastYearPaidAmountWithOutTax) == 0 ? 0.00 : ((ConvertToFloat(TotalValue) - ConvertToFloat(TotalDataFilter[0].LastYearPaidAmountWithOutTax)) / ConvertToFloat(TotalDataFilter[0].LastYearPaidAmountWithOutTax) * 100.00).toFixed(2)
                }
                $('#TableContainer1').datagrid('updateRow', {
                    index: 0,
                    row: {
                        "ThisYearRealIncome": TotalValue.toFixed(2),
                        "ThisYearGrowthRate": ThisYearGrowthRateYearValue
                    }
                });
            }
            $.tool.pageUnLoading();
        }
        //取消调整
        function btnBatchEdit_cacnelClick() {
            $('#BatchEditDialog').dialog('close');
        }
        //保存数据
        function btnSave_Click() {
            //先结束一次编辑
            endEditionForDetail();
            var Rows = $('#TableContainer1').datagrid("getRows");
            $('#DetailResult').val(JSON.stringify(Rows));
            $.tool.DataPost('Budget', "IncomeManage_SaveOtherIncomePlan", $('#frmForm').serialize(),
                function Init() {
                },
                function callback(_Data) {
                    if (_Data == "true") {
                        HDialog.Info("保存其他收入计划成功");
                        HDialog.Close("true");
                    } else {
                        HDialog.Info(_Data);
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {

                });
        }

        //导出Excel
        function btnExport_Click() {
            var Rows = $("#TableContainer1").datagrid("getRows");
            if (Rows.length == 0) {
                HDialog.Info("没有数据导出!");
                return;
            }
            window.open("BudgetIncomeManage_OtherIncomeDetailExport.aspx?OtherIncomeID=" + $('#OtherIncomeID').val() + "&CommID=" + $('#CommID').val());
        }


        function FloatAdd(arg1, arg2) {
            var r1, r2, m;
            try { r1 = arg1.toString().split(".")[1].length } catch (e) { r1 = 0 }
            try { r2 = arg2.toString().split(".")[1].length } catch (e) { r2 = 0 }
            m = Math.pow(10, Math.max(r1, r2));
            return (arg1 * m + arg2 * m) / m;
        }

        //浮点数减法运算
        function FloatSub(arg1, arg2) {
            var r1, r2, m, n;
            try { r1 = arg1.toString().split(".")[1].length } catch (e) { r1 = 0 }
            try { r2 = arg2.toString().split(".")[1].length } catch (e) { r2 = 0 }
            m = Math.pow(10, Math.max(r1, r2));
            //动态控制精度长度
            n = (r1 = r2) ? r1 : r2;
            return ((arg1 * m - arg2 * m) / m).toFixed(n);
        }

        function ConvertToFloat(value) {
            if (value == undefined || value == "" || value == "null") {
                return 0.00;
            }
            return ((parseFloat(value) == undefined || parseFloat(value) == "NaN") ? 0 : parseFloat(value));
        }

        //页面初始化
        $(function () {
            InitTableHeight();
            LoadList();
        })

    </script>
</body>
</html>
