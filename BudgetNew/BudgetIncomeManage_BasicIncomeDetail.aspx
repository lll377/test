<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetIncomeManage_BasicIncomeDetail.aspx.cs" Inherits="M_Main.BudgetNew.BudgetIncomeManage_BasicIncomeDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>预算管理-预算计划-基础收入计划编辑页面</title>
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
        <input type="hidden" id="BasicIncomeID" name="BasicIncomeID" runat="server" />
        <input type="hidden" id="DetailResult" name="DetailResult" runat="server" />
        <input type="hidden" id="ChargeRateType" name="ChargeRateType" runat="server" />
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
                    <td class="TdTitle">收费标准:
                    </td>
                    <td class="TdContentSearch">
                        <input id="StandardNames" class="easyui-searchbox" data-options="editable:false" searcher="SelStand" name="StandardNames" runat="server">
                        <input type="hidden" id="StandardIDs" name="StandardIDs" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">全部数量:
                    </td>
                    <td class="TdContentSearch">
                        <input id="TotalQuality" class="easyui-numberbox" data-options="min:0" name="TotalQuality" runat="server">
                    </td>
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
                    <td class="TdTitle">本年应收计算值增减(元):</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-numberbox" id="ThisYearReceivableCalculationValue" name="ThisYearReceivableCalculationValue" data-options="precision:2" />
                    </td>
                    <td class="TdTitle">本年收缴率计划(%):</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-numberbox" id="ThisYearCollectionRatePlan" name="ThisYearCollectionRatePlan" data-options="precision:2,min:0,max:100" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="btnBatchEdit_Ok" onclick="btnBatchEdit_OkClick()">确定调整</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" id="btnBatchEdit_cacnel" onclick="btnBatchEdit_cacnelClick()">取消</a>
                    </td>
                </tr>
            </table>
        </div>
        <div id="ToolDiv">
            <table>
                <tr>
                    <td>选择月份</td>
                    <td>
                        <select id="BudgetMonth" name="BudgetMonth" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto',onSelect:BudgetMonthSelect" style="width: 40px">
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
                        </select></td>
                    <td><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id="btnBatchEdit" onclick="btnBatchEdit_Click()">批量调整</a></td>
                    <td><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" id="btnSave" onclick="btnSave_Click()">保存</a></td>
                    <td><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-page_white_excel'" id="btnExport" onclick="btnExport_Click()">导出Excel</a></td>
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
            HDialog.Open('600', '400', '../BudgetNew/BudgetIncomeManage_SelCost.aspx?CommID=' + $('#CommID').val() + "&KeyID=" + $('#BasicIncomeID').val() + "&IsSingle=1&FlagTable=BasicIncomePlanDetail", '选择费用项目', false, function callback(data) {
                if (data != "") {
                    var ObjArr = data.split('|');
                    if (ObjArr.length > 0) {
                        $("#CostID").val(ObjArr[1]);
                        $("#CostName").searchbox("setValue", ObjArr[0]);
                        $('#StandardNames').searchbox("setValue", "");
                        $('#StandardIDs').val();
                    }
                }
            });
        }
        //选择费用项目下的收费标准 多选
        function SelStand() {
            if ($("#CostID").val() == "") {
                HDialog.Info("请先选择费用项目");
                return;
            }
            HDialog.Open('600', '400', '../BudgetNew/BudgetIncomeManage_SelStandard.aspx?CommID=' + $('#CommID').val() + "&KeyID=" + $('#BasicIncomeID').val() + "&CostID=" + $("#CostID").val() + "&FlagTable=BasicIncomePlanDetail", '选择费用标准', false, function callback(data) {
                if (data != "") {
                    var ObjArr = data.split('|');
                    if (ObjArr.length > 0) {
                        $('#StandardNames').searchbox("setValue", ObjArr[0]);
                        $('#StandardIDs').val(ObjArr[1]);
                    }
                }
            });
        }
        var frozenColumns = [[//第一行
            { field: 'CostName', title: '费用项目', width: 120, align: 'center', rowspan: 2 }
        ],
        [//第二行
        ]];

        var column = [[//第一行
            { field: 'StandardName', title: '标准名称', width: 180, align: 'center', rowspan: 2 },
            { field: 'TaxRate', title: '税率', width: 70, align: 'center', rowspan: 2 },
            { field: 'StandardUnitPrice', title: '标准单价', width: 70, align: 'center', rowspan: 2 },
            {
                field: 'TotalQuality', title: '全部数量', width: 80, align: 'center', rowspan: 2, editor: {
                    type: 'numberbox',
                    options: {
                        min: 0,
                        precision: 0
                    }
                }
            },
            { field: 'BillingQuantity', title: '计费数量', width: 70, align: 'center', rowspan: 2 },
            { field: 'BillingArea', title: '计费面积', width: 90, align: 'center', rowspan: 2 },
            { title: '上年应收（元）', align: 'center', colspan: 2 },
            { title: '上年实收（元）', align: 'center', colspan: 2 },
            {
                field: 'LastYearCollectionRate', title: '上年收缴率（%）', width: 100, align: 'center', rowspan: 2,
                formatter: function (value, row, index) {
                    if (value != "") {
                        return value + "%";
                    }
                    return value;
                }
            },
            { title: '本年应收计算值（元）', align: 'center', colspan: 2 },
            {
                field: 'ThisYearReceivableChangeValue', title: '本年应收调整值（元）', width: 120, align: 'center', rowspan: 2, editor: {
                    type: 'numberbox',
                    options: {
                        precision: 2
                    }
                }
            },
            {
                field: 'ThisYearCollectionRatePlan', title: '本年收缴率计划（%）', width: 120, align: 'center', rowspan: 2, editor: {
                    type: 'numberbox',
                    options: {
                        min: 0,
                        precision: 2,
                        max: 100
                    }
                }
            },
            { field: 'ThisYearRealIncome', title: '本年实收计划（元）', width: 120, align: 'center', rowspan: 2 },
            {
                field: 'ThisYearGrowthRate', title: '本年增长率（%）', width: 100, align: 'center', rowspan: 2,
                formatter: function (value, row, index) {
                    if (value != "") {
                        return value + "%";
                    }
                    return value;
                }
            }
        ],
        [//第二行
            { field: 'LastYearDueAmount', title: '含税', width: 100, align: 'center' },
            { field: 'LastYearDueAmountWithOutTax', title: '不含税', width: 100, align: 'center' },
            { field: 'LastYearPaidAmount', title: '含税', width: 100, align: 'center' },
            { field: 'LastYearPaidAmountWithOutTax', title: '不含税', width: 100, align: 'center' },
            { field: 'ThisYearReceivableCalculationValue', title: '含税', width: 100, align: 'center' },
            { field: 'ThisYearReceivableCalculationValueWithOutTax', title: '不含税', width: 100, align: 'center' }
        ]
        ];



        function LoadList() {
            $.tool.pageLoading();
            //过滤页面数据 
            var DataArr = [];
            if ($('#DetailResult').val() != "") {
                //获取当前选中的月份
                var SelectMonth = $("#BudgetMonth").combobox("getValue");
                var DetailData = eval("(" + $('#DetailResult').val() + ")");
                DataArr = DetailData.filter(function (e) {
                    return e.BudgetMonth == parseInt(SelectMonth) || (e.CostName == '年度合计');
                });
            }
            $("#TableContainer1").datagrid({
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
                toolbar: "#ToolDiv",
                onClickCell: onClickCellForDetail,
                onAfterEdit: onAfterEditForDetail,
                onLoadSuccess: function (data) {
                    $.tool.pageUnLoading();
                    $("#TableContainer1").datagrid("autoMergeCells", ['CostName']);
                },
                onLoadError: function () {
                    $.tool.pageUnLoading();
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

            if (SelecteRow.CostID == null || SelecteRow.CostID == "" || SelecteRow.StandardID == null || SelecteRow.StandardID == "") {
                endEditionForDetail();
                return false;
            }

            if (endEditionForDetail()) {
                if (field == "ThisYearReceivableChangeValue" || field == "ThisYearCollectionRatePlan" || field == "TotalQuality") {
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
                $.tool.pageLoading();
                //编辑完成后进行数据 计划、汇总   【标准上的值】
                var DetailData = eval("(" + $('#DetailResult').val() + ")");
                var Rows = $("#TableContainer1").datagrid("getRows");
                var CurrentRow = Rows[rowIndex]; //当前修改行
                var CurrentMonth = $('#BudgetMonth').combobox("getValue"); // 当前月份
                //1、更新行内计算值 【本年实收计划、本年增长率】
                var StandDataFilterData = DetailData.filter(function (e) {
                    return e.ID == CurrentRow.ID;
                });
                if (StandDataFilterData.length > 0) {
                    StandDataFilterData[0].TotalQuality = (CurrentRow.TotalQuality == null || CurrentRow.TotalQuality == "" ? 0 : CurrentRow.TotalQuality);//全部数量
                    StandDataFilterData[0].ThisYearReceivableChangeValue = ConvertToFloat(CurrentRow.ThisYearReceivableChangeValue).toFixed(2);//本年应收调整值
                    StandDataFilterData[0].ThisYearCollectionRatePlan = ConvertToFloat(CurrentRow.ThisYearCollectionRatePlan).toFixed(2);//本年收缴率计划
                    var ItemThisYearRealIncome = 0.00; //本年实收计划
                    var ItemThisYearGrowthRate = 0.00; //本年增长率
                    //计算 并更新
                    if ($('#ChargeRateType').val() == "本月收费率") {
                        // 本年实收计划：计算公式【X月收费标准上的“本年应收调整值” *收费标准上的“本年收缴率计划”】
                        ItemThisYearRealIncome = (ConvertToFloat(CurrentRow.ThisYearReceivableChangeValue) * ConvertToFloat(CurrentRow.ThisYearCollectionRatePlan) / 100.00).toFixed(2);
                    } else {
                        // 本年实收计划：计算公式【（1月至X月收费标准上的“本年应收调整值”之和）*（收费标准上的“本年收缴率计划”）- （1月至上月“本年实收计划”之和）】
                        //获取 1月至X月收费标准上的“本年应收调整值”之和
                        var TotalThisYearReceivableChangeValue = 0.00;
                        var FilterMonthThisYearReceivableChangeValueData = DetailData.filter(function (e) {
                            return e.BudgetMonth <= parseInt(CurrentMonth) && e.StandardID == CurrentRow.StandardID;
                        });
                        for (var i = 0; i < FilterMonthThisYearReceivableChangeValueData.length; i++) {
                            TotalThisYearReceivableChangeValue = FloatAdd(TotalThisYearReceivableChangeValue, ConvertToFloat(FilterMonthThisYearReceivableChangeValueData[i]["ThisYearReceivableChangeValue"])).toFixed(2);
                        }
                        //获取 1月至上月“本年实收计划”之和
                        var TotalThisYearRealIncome = 0.00;
                        var FilterMonthThisYearRealIncomeData = DetailData.filter(function (e) {
                            return e.BudgetMonth < parseInt(CurrentMonth) && e.StandardID == CurrentRow.StandardID;
                        });
                        for (var i = 0; i < FilterMonthThisYearRealIncomeData.length; i++) {
                            TotalThisYearRealIncome = FloatAdd(TotalThisYearRealIncome, ConvertToFloat(FilterMonthThisYearRealIncomeData[i]["ThisYearRealIncome"])).toFixed(2);
                        }
                        ItemThisYearRealIncome = ((TotalThisYearReceivableChangeValue * ConvertToFloat(CurrentRow.ThisYearCollectionRatePlan) / 100.00) - TotalThisYearRealIncome).toFixed(2)
                    }
                    if ($('#BudgetState').val() == "0") {
                        //本年增长率 ：计算公式【【（收费标准上的“本年实收计划”-收费标准上的“上年实收”）/收费标准上的“上年实收”】*100%；】 含税
                        ItemThisYearGrowthRate = ConvertToFloat(CurrentRow.LastYearPaidAmount) == 0.00 ? 0.00 : (((ItemThisYearRealIncome - ConvertToFloat(CurrentRow.LastYearPaidAmount)) / ConvertToFloat(CurrentRow.LastYearPaidAmount)) * 100.00);
                    } else {
                        //本年增长率 ：计算公式【【（收费标准上的“本年实收计划”-收费标准上的“上年实收”）/收费标准上的“上年实收”】*100%；】 不含税
                        ItemThisYearGrowthRate = ConvertToFloat(CurrentRow.LastYearPaidAmountWithOutTax) == 0.00 ? 0.00 : (((ItemThisYearRealIncome - ConvertToFloat(CurrentRow.LastYearPaidAmountWithOutTax)) / ConvertToFloat(CurrentRow.LastYearPaidAmountWithOutTax)) * 100.00);
                    }


                    StandDataFilterData[0].ThisYearRealIncome = ItemThisYearRealIncome; //本年实收计划
                    StandDataFilterData[0].ThisYearGrowthRate = ItemThisYearGrowthRate.toFixed(2); //本年增长率
                }
                //2、更新小计
                var CostDataFilterData = DetailData.filter(function (e) {
                    return e.BudgetMonth == parseInt(CurrentMonth) && e.CostID == CurrentRow.CostID && e.StandardID == 0;
                });
                if (CostDataFilterData.length > 0) {
                    //获取当前编辑的行的所有同级节点【同月、同费项、标准不为空】的数据
                    var CurrentCostFilter = DetailData.filter(function (e) {
                        return e.BudgetMonth == parseInt(CurrentMonth) && e.CostID == CurrentRow.CostID && e.StandardID != 0;
                    });
                    var TotalQuality = 0.00;
                    var ThisYearReceivableChangeValue = 0.00;
                    var ThisYearRealIncome = 0.00
                    for (var i = 0; i < CurrentCostFilter.length; i++) {
                        TotalQuality = FloatAdd(TotalQuality, ConvertToFloat(CurrentCostFilter[i].TotalQuality));
                        ThisYearReceivableChangeValue = FloatAdd(ThisYearReceivableChangeValue, ConvertToFloat(CurrentCostFilter[i].ThisYearReceivableChangeValue));
                        ThisYearRealIncome = FloatAdd(ThisYearRealIncome, ConvertToFloat(CurrentCostFilter[i].ThisYearRealIncome));
                    }
                    CostDataFilterData[0].TotalQuality = TotalQuality;//全部数量
                    CostDataFilterData[0].ThisYearReceivableChangeValue = ThisYearReceivableChangeValue.toFixed(2);//本年应收调整值
                    CostDataFilterData[0].ThisYearRealIncome = ThisYearRealIncome.toFixed(2);//本年实收计划

                    //获取 1月至X月费项上的“本年应收调整值”之和
                    var TotalThisYearReceivableChangeValue = 0.00;
                    var FilterCostThisYearReceivableChangeValueData = DetailData.filter(function (e) {
                        return e.BudgetMonth <= parseInt(CurrentMonth) && e.CostID == CostDataFilterData[0].CostID && e.StandardID == 0;
                    });
                    for (var i = 0; i < FilterCostThisYearReceivableChangeValueData.length; i++) {
                        TotalThisYearReceivableChangeValue = FloatAdd(TotalThisYearReceivableChangeValue, ConvertToFloat(FilterCostThisYearReceivableChangeValueData[i]["ThisYearReceivableChangeValue"])).toFixed(2);
                    }
                    //计算小计上的本年收缴率计划
                    if ($('#ChargeRateType').val() == "本月收费率") {
                        //（费用项目上的“本年实收计划”/ 1月至X月费用项目上的“本年应收调整值”之和）*100%；
                        if (TotalThisYearReceivableChangeValue == 0) {
                            CostDataFilterData[0].ThisYearCollectionRatePlan = 0.00;//本年收缴率计划
                        } else {
                            CostDataFilterData[0].ThisYearCollectionRatePlan = (CostDataFilterData[0].ThisYearRealIncome / TotalThisYearReceivableChangeValue * 100.00).toFixed(2);//本年收缴率计划
                        }
                    } else {
                        //（1月至X月费用项目上的“本年实收计划”之和/ 1月至X月费用项目上的“本年应收调整值”之和）*100%；
                        if (TotalThisYearReceivableChangeValue == 0) {
                            CostDataFilterData[0].ThisYearCollectionRatePlan = 0.00;//本年收缴率计划
                        } else {
                            //获取 1月至X月费用项目上的“本年实收计划”之和
                            var TotalThisYearRealIncome = 0.00;
                            //获取费项上的小计之和【同费项、标准空】的数据
                            var FilterMonthThisYearRealIncomeData = DetailData.filter(function (e) {
                                return e.BudgetMonth <= parseInt(CurrentMonth) && e.CostID == CurrentRow.CostID && e.StandardID == 0;
                            });
                            for (var i = 0; i < FilterMonthThisYearRealIncomeData.length; i++) {
                                TotalThisYearRealIncome = FloatAdd(TotalThisYearRealIncome, ConvertToFloat(FilterMonthThisYearRealIncomeData[i]["ThisYearRealIncome"])).toFixed(2);
                            }
                            CostDataFilterData[0].ThisYearCollectionRatePlan = (TotalThisYearRealIncome / TotalThisYearReceivableChangeValue * 100.00).toFixed(2);//本年收缴率计划
                        }
                    }
                    var CostThisYearGrowthRate = 0.00;
                    if ($('#BudgetState').val() == "0") {
                        //本年增长率 ：计算公式【【（费用项目上的“本年实收计划”-费用项目上的“上年实收”）/费用项目上的“上年实收”】*100%；】 含税
                        CostThisYearGrowthRate = ConvertToFloat(CostDataFilterData[0].LastYearPaidAmount) == 0.00 ? 0.00 : (((CostDataFilterData[0].ThisYearRealIncome - ConvertToFloat(CostDataFilterData[0].LastYearPaidAmount)) / ConvertToFloat(CostDataFilterData[0].LastYearPaidAmount)) * 100.00);
                    } else {
                        //本年增长率 ：计算公式【【（费用项目上的“本年实收计划”-费用项目上的“上年实收”）/费用项目上的“上年实收”】*100%；】 不含税
                        CostThisYearGrowthRate = ConvertToFloat(CostDataFilterData[0].LastYearPaidAmountWithOutTax) == 0.00 ? 0.00 : (((CostDataFilterData[0].ThisYearRealIncome - ConvertToFloat(CostDataFilterData[0].LastYearPaidAmountWithOutTax)) / ConvertToFloat(CostDataFilterData[0].LastYearPaidAmountWithOutTax)) * 100.00);
                    }

                    CostDataFilterData[0].ThisYearGrowthRate = CostThisYearGrowthRate.toFixed(2);
                }

                //循环更新当前月以后的月份的小计 的【本年收缴率计划】
                var UpdateMonth = parseInt(CurrentMonth) + 1;
                for (var i = UpdateMonth; i < 13; i++) {
                    var LaterMonthFilterData = DetailData.filter(function (e) {
                        return e.BudgetMonth == parseInt(i) && e.CostID == CurrentRow.CostID && e.StandardID == 0;
                    });
                    if (LaterMonthFilterData.length > 0) {
                        //获取 1月至i月费项上的“本年应收调整值”之和
                        var TotalThisYearReceivableChangeValue = 0.00;
                        var FilterCostThisYearReceivableChangeValueData = DetailData.filter(function (e) {
                            return e.BudgetMonth <= parseInt(i) && e.CostID == LaterMonthFilterData[0].CostID && e.StandardID == 0;
                        });
                        for (var i = 0; i < FilterCostThisYearReceivableChangeValueData.length; i++) {
                            TotalThisYearReceivableChangeValue = FloatAdd(TotalThisYearReceivableChangeValue, ConvertToFloat(FilterCostThisYearReceivableChangeValueData[i]["ThisYearReceivableChangeValue"])).toFixed(2);
                        }
                        //计算小计上的本年收缴率计划
                        if ($('#ChargeRateType').val() == "本月收费率") {
                            //（费用项目上的“本年实收计划”/ 1月至X月费用项目上的“本年应收调整值”之和）*100%；
                            if (TotalThisYearReceivableChangeValue == 0) {
                                LaterMonthFilterData[0].ThisYearCollectionRatePlan = 0.00;//本年收缴率计划
                            } else {
                                LaterMonthFilterData[0].ThisYearCollectionRatePlan = (LaterMonthFilterData[0].ThisYearRealIncome / TotalThisYearReceivableChangeValue * 100.00).toFixed(2);//本年收缴率计划
                            }
                        } else {
                            //（1月至i月费用项目上的“本年实收计划”之和/ 1月至i月费用项目上的“本年应收调整值”之和）*100%；
                            if (TotalThisYearReceivableChangeValue == 0) {
                                LaterMonthFilterData[0].ThisYearCollectionRatePlan = 0.00;//本年收缴率计划
                            } else {
                                //获取 1月至i月费用项目上的“本年实收计划”之和
                                var TotalThisYearRealIncome = 0.00;
                                //获取费项上的小计之和【同费项、标准空】的数据
                                var FilterMonthThisYearRealIncomeData = DetailData.filter(function (e) {
                                    return e.BudgetMonth <= parseInt(i) && e.CostID == CurrentRow.CostID && e.StandardID == 0;
                                });
                                for (var i = 0; i < FilterMonthThisYearRealIncomeData.length; i++) {
                                    TotalThisYearRealIncome = FloatAdd(TotalThisYearRealIncome, ConvertToFloat(FilterMonthThisYearRealIncomeData[i]["ThisYearRealIncome"])).toFixed(2);
                                }
                                LaterMonthFilterData[0].ThisYearCollectionRatePlan = (TotalThisYearRealIncome / TotalThisYearReceivableChangeValue * 100.00).toFixed(2);//本年收缴率计划
                            }
                        }
                    }
                }

                //3、更新月度合计
                var MonthDataFilterData = DetailData.filter(function (e) {
                    return e.BudgetMonth == parseInt(CurrentMonth) && e.CostName == "月度合计";
                });
                if (MonthDataFilterData.length > 0) {
                    //获取当月所有费项的集合
                    var CurrentSumFilter = DetailData.filter(function (e) {
                        return e.BudgetMonth == parseInt(CurrentMonth) && e.StandardName == '小计';
                    });
                    var TotalQuality = 0.00;
                    var ThisYearReceivableChangeValue = 0.00;
                    var ThisYearRealIncome = 0.00
                    for (var i = 0; i < CurrentSumFilter.length; i++) {
                        TotalQuality = FloatAdd(TotalQuality, ConvertToFloat(CurrentSumFilter[i].TotalQuality));
                        ThisYearReceivableChangeValue = FloatAdd(ThisYearReceivableChangeValue, ConvertToFloat(CurrentSumFilter[i].ThisYearReceivableChangeValue));
                        ThisYearRealIncome = FloatAdd(ThisYearRealIncome, ConvertToFloat(CurrentSumFilter[i].ThisYearRealIncome));
                    }
                    MonthDataFilterData[0].TotalQuality = TotalQuality;//全部数量
                    MonthDataFilterData[0].ThisYearReceivableChangeValue = ThisYearReceivableChangeValue.toFixed(2);//本年应收调整值
                    MonthDataFilterData[0].ThisYearRealIncome = ThisYearRealIncome.toFixed(2);//本年实收计划

                    //获取 1月至X月月度上的“本年应收调整值”之和
                    var TotalThisYearReceivableChangeValue = 0.00;
                    var FilterMonthThisYearReceivableChangeValueData = DetailData.filter(function (e) {
                        return e.BudgetMonth <= parseInt(CurrentMonth) && e.CostName == "月度合计";
                    });
                    for (var i = 0; i < FilterMonthThisYearReceivableChangeValueData.length; i++) {
                        TotalThisYearReceivableChangeValue = FloatAdd(TotalThisYearReceivableChangeValue, ConvertToFloat(FilterMonthThisYearReceivableChangeValueData[i]["ThisYearReceivableChangeValue"])).toFixed(2);
                    }

                    //计算月度上的本年收缴率计划
                    if ($('#ChargeRateType').val() == "本月收费率") {
                        //（月度合计上的“本年实收计划”/ 1月至X月月度合计上的“本年应收调整值”之和）*100%；
                        if (TotalThisYearReceivableChangeValue == 0) {
                            MonthDataFilterData[0].ThisYearCollectionRatePlan = 0.00;//本年收缴率计划
                        } else {
                            MonthDataFilterData[0].ThisYearCollectionRatePlan = (MonthDataFilterData[0].ThisYearRealIncome / TotalThisYearReceivableChangeValue * 100.00).toFixed(2);//本年收缴率计划
                        }
                    } else {
                        //（1月至X月月度合计上的“本年实收计划”之和/ 1月至X月月度合计上的“本年应收调整值”之和）
                        if (TotalThisYearReceivableChangeValue == 0) {
                            MonthDataFilterData[0].ThisYearCollectionRatePlan = 0.00;//本年收缴率计划
                        } else {
                            //获取 1月至X月月度合计上的“本年实收计划”之和
                            var TotalThisYearRealIncome = 0.00;

                            var FilterMonthThisYearRealIncomeData = DetailData.filter(function (e) {
                                return e.BudgetMonth <= parseInt(CurrentMonth) && e.CostName == "月度合计";
                            });
                            for (var i = 0; i < FilterMonthThisYearRealIncomeData.length; i++) {
                                TotalThisYearRealIncome = FloatAdd(TotalThisYearRealIncome, ConvertToFloat(FilterMonthThisYearRealIncomeData[i]["ThisYearRealIncome"])).toFixed(2);
                            }
                            MonthDataFilterData[0].ThisYearCollectionRatePlan = (TotalThisYearRealIncome / TotalThisYearReceivableChangeValue * 100.00).toFixed(2);//本年收缴率计划
                        }
                    }

                    var MonthThisYearGrowthRate = 0.00;
                    if ($('#BudgetState').val() == "0") {
                        //本年增长率 ：计算公式【【（费用项目上的“本年实收计划”-费用项目上的“上年实收”）/费用项目上的“上年实收”】*100%；】 含税
                        MonthThisYearGrowthRate = ConvertToFloat(MonthDataFilterData[0].LastYearPaidAmount) == 0.00 ? 0.00 : (((MonthDataFilterData[0].ThisYearRealIncome - ConvertToFloat(MonthDataFilterData[0].LastYearPaidAmount)) / ConvertToFloat(MonthDataFilterData[0].LastYearPaidAmount)) * 100.00);
                    } else {
                        //本年增长率 ：计算公式【【（费用项目上的“本年实收计划”-费用项目上的“上年实收”）/费用项目上的“上年实收”】*100%；】 不含税
                        MonthThisYearGrowthRate = ConvertToFloat(MonthDataFilterData[0].LastYearPaidAmountWithOutTax) == 0.00 ? 0.00 : (((MonthDataFilterData[0].ThisYearRealIncome - ConvertToFloat(MonthDataFilterData[0].LastYearPaidAmountWithOutTax)) / ConvertToFloat(MonthDataFilterData[0].LastYearPaidAmountWithOutTax)) * 100.00);
                    }

                    MonthDataFilterData[0].ThisYearGrowthRate = MonthThisYearGrowthRate.toFixed(2);
                }

                //循环更新当前月以后的月份的月度合计 的【本年收缴率计划】
                for (var i = UpdateMonth; i < 13; i++) {
                    var LaterMonthFilterData = DetailData.filter(function (e) {
                        return e.BudgetMonth == parseInt(i) && e.CostName == "月度合计";
                    });
                    if (LaterMonthFilterData.length > 0) {
                        //获取 1月至i月月度上的“本年应收调整值”之和
                        var TotalThisYearReceivableChangeValue = 0.00;
                        var FilterMonthThisYearReceivableChangeValueData = DetailData.filter(function (e) {
                            return e.BudgetMonth <= parseInt(i) && e.CostName == "月度合计";
                        });
                        for (var i = 0; i < FilterMonthThisYearReceivableChangeValueData.length; i++) {
                            TotalThisYearReceivableChangeValue = FloatAdd(TotalThisYearReceivableChangeValue, ConvertToFloat(FilterMonthThisYearReceivableChangeValueData[i]["ThisYearReceivableChangeValue"])).toFixed(2);
                        }

                        //计算月度上的本年收缴率计划
                        if ($('#ChargeRateType').val() == "本月收费率") {
                            //（月度合计上的“本年实收计划”/ 1月至i月月度合计上的“本年应收调整值”之和）*100%；
                            if (TotalThisYearReceivableChangeValue == 0) {
                                LaterMonthFilterData[0].ThisYearCollectionRatePlan = 0.00;//本年收缴率计划
                            } else {
                                LaterMonthFilterData[0].ThisYearCollectionRatePlan = (LaterMonthFilterData[0].ThisYearRealIncome / TotalThisYearReceivableChangeValue * 100.00).toFixed(2);//本年收缴率计划
                            }
                        } else {
                            //（1月至i月月度合计上的“本年实收计划”之和/ 1月至i月月度合计上的“本年应收调整值”之和）
                            if (TotalThisYearReceivableChangeValue == 0) {
                                LaterMonthFilterData[0].ThisYearCollectionRatePlan = 0.00;//本年收缴率计划
                            } else {
                                //获取 1月至i月月度合计上的“本年实收计划”之和
                                var TotalThisYearRealIncome = 0.00;

                                var FilterMonthThisYearRealIncomeData = DetailData.filter(function (e) {
                                    return e.BudgetMonth <= parseInt(i) && e.CostName == "月度合计";
                                });
                                for (var i = 0; i < FilterMonthThisYearRealIncomeData.length; i++) {
                                    TotalThisYearRealIncome = FloatAdd(TotalThisYearRealIncome, ConvertToFloat(FilterMonthThisYearRealIncomeData[i]["ThisYearRealIncome"])).toFixed(2);
                                }
                                LaterMonthFilterData[0].ThisYearCollectionRatePlan = (TotalThisYearRealIncome / TotalThisYearReceivableChangeValue * 100.00).toFixed(2);//本年收缴率计划
                            }
                        }
                    }
                }

                //4、更新年度合计
                var YearDataFilterData = DetailData.filter(function (e) {
                    return e.CostName == "年度合计";
                });
                if (YearDataFilterData.length > 0) {
                    var CurrentMonthDataFilterData = DetailData.filter(function (e) {
                        return e.CostName == "月度合计";
                    });
                    if (CurrentMonthDataFilterData.length > 0) {
                        var MaxTotalQuality = 0;
                        var ThisYearReceivableChangeValue = 0.00;
                        var ThisYearRealIncome = 0.00;
                        for (var i = 0; i < CurrentMonthDataFilterData.length; i++) {
                            //获取最大的【全部数量】
                            if (CurrentMonthDataFilterData[i].TotalQuality > MaxTotalQuality) {
                                MaxTotalQuality = CurrentMonthDataFilterData[i].TotalQuality;
                            }
                            ThisYearReceivableChangeValue = FloatAdd(ThisYearReceivableChangeValue, ConvertToFloat(CurrentMonthDataFilterData[i].ThisYearReceivableChangeValue));
                            ThisYearRealIncome = FloatAdd(ThisYearRealIncome, ConvertToFloat(CurrentMonthDataFilterData[i].ThisYearRealIncome));
                        }
                        YearDataFilterData[0].TotalQuality = MaxTotalQuality; // 全部数量
                        YearDataFilterData[0].ThisYearReceivableChangeValue = ThisYearReceivableChangeValue.toFixed(2);//本年应收调整值
                        YearDataFilterData[0].ThisYearRealIncome = ThisYearRealIncome.toFixed(2);//本年实收计划
                        // 更新 本年收缴率计划：计算公式【（年度合计上的“本年实收计划”/年度合计上的“本年应收调整值”）*100%；】
                        if (ThisYearReceivableChangeValue == 0) {
                            YearDataFilterData[0].ThisYearCollectionRatePlan = 0.00;//本年收缴率计划
                        } else {
                            YearDataFilterData[0].ThisYearCollectionRatePlan = (ThisYearRealIncome / ThisYearReceivableChangeValue * 100.00).toFixed(2);//本年收缴率计划
                        }

                        var YearThisYearGrowthRate = 0.00;

                        if ($('#BudgetState').val() == "0") {
                            //本年增长率 ：计算公式【【（年度合计上的“本年实收计划”-年度合计上的“上年实收”）/年度合计上的“上年实收”】*100%】 含税
                            YearThisYearGrowthRate = ConvertToFloat(YearDataFilterData[0].LastYearPaidAmount) == 0.00 ? 0.00 : (((YearDataFilterData[0].ThisYearRealIncome - ConvertToFloat(YearDataFilterData[0].LastYearPaidAmount)) / ConvertToFloat(YearDataFilterData[0].LastYearPaidAmount)) * 100.00);
                        } else {
                            //本年增长率 ：计算公式【【（年度合计上的“本年实收计划”-年度合计上的“上年实收”）/年度合计上的“上年实收”】*100%】 不含税
                            YearThisYearGrowthRate = ConvertToFloat(YearDataFilterData[0].LastYearPaidAmountWithOutTax) == 0.00 ? 0.00 : (((YearDataFilterData[0].ThisYearRealIncome - ConvertToFloat(YearDataFilterData[0].LastYearPaidAmountWithOutTax)) / ConvertToFloat(YearDataFilterData[0].LastYearPaidAmountWithOutTax)) * 100.00);
                        }

                        YearDataFilterData[0].ThisYearGrowthRate = YearThisYearGrowthRate.toFixed(2);
                    }
                }
                $.tool.pageUnLoading();
                $('#DetailResult').val(JSON.stringify(DetailData));
                LoadList();
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
            $('#StandardNames').searchbox("setValue", "");
            $('#StandardIDs').val("");
            $('#TotalQuality').numberbox("setValue", "");
            $('#BudgetChangeMonthBegin').combobox("setValue", "1");
            $('#BudgetChangeMonthEnd').combobox("setValue", "1");

            $('#ThisYearReceivableCalculationValue').numberbox("setValue", "");
            $('#ThisYearCollectionRatePlan').numberbox("setValue", "");

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
            var StandardIdList = $('#StandardIDs').val();
            var TotalQuality = $('#TotalQuality').numberbox("getValue");

            var ThisYearReceivableCalculationValue = $('#ThisYearReceivableCalculationValue').numberbox("getValue");
            var ThisYearCollectionRatePlan = $('#ThisYearCollectionRatePlan').numberbox("getValue");
            //判断  如果是 【全部数量、本年应收计算值增减、本年收缴率计划】 都为空的情况就不能够确定调整（至少需要更新一个值  为0都是可以的）
            if (TotalQuality == "" && ThisYearReceivableCalculationValue == "" && ThisYearCollectionRatePlan == "") {
                HDialog.Info("请输入调整值,【全部数量、本年应收计算值增减、本年收缴率计划】至少需要调整一个值");
                return;
            }
            $('#BatchEditDialog').dialog('close');
            $.tool.pageLoading();
            var DetailData = eval("(" + $('#DetailResult').val() + ")");
            //将填入的数据更新入基础数据中
            var BaseAllDataFilter = DetailData.filter(function (e) {
                if ((CostIDlist.indexOf(e.CostID) > -1 || CostIDlist == '') && e.CostName != '年度合计' && e.CostName != '月度合计' && e.StandardName != '小计'
                    && (StandardIdList.indexOf(e.StandardID) > -1 || StandardIdList == "") && e.BudgetMonth >= parseInt(BudgetChangeMonthBegin) && e.BudgetMonth <= parseInt(BudgetChangeMonthEnd)) {
                    return true;
                }
                return false;
            });
            for (var i = 0; i < BaseAllDataFilter.length; i++) {
                if (TotalQuality != "") {
                    BaseAllDataFilter[i].TotalQuality = TotalQuality;
                }
                if (ThisYearReceivableCalculationValue != "") {
                    BaseAllDataFilter[i].ThisYearReceivableChangeValue = FloatAdd(ConvertToFloat(BaseAllDataFilter[i].ThisYearReceivableCalculationValue), ConvertToFloat(ThisYearReceivableCalculationValue)).toFixed(2);
                }
                if (ThisYearCollectionRatePlan != "") {
                    BaseAllDataFilter[i].ThisYearCollectionRatePlan = ConvertToFloat(ThisYearCollectionRatePlan).toFixed(2);
                }
            }

            //1、 循环需要更新的月份【从开始月到结束月 都需要更新】 先更新基础数据和小计
            for (var M = parseInt(BudgetChangeMonthBegin); M <= parseInt(BudgetChangeMonthEnd); M++) {
                //过滤需要更新的 标准行数据 
                var FilterStandardData = DetailData.filter(function (e) {
                    if ((CostIDlist.indexOf(e.CostID) > -1 || CostIDlist == '') && e.BudgetMonth == parseInt(M) && (StandardIdList.indexOf(e.StandardID) > -1 || StandardIdList == '') &&
                        e.StandardID > 0 && e.CostID > 0) {
                        return true;
                    }
                    return false;
                });
                //循环 标准行 更新【本年实收计划、本年增长率】
                for (var k = 0; k < FilterStandardData.length; k++) {
                    //更新标准上的
                    var ItemThisYearRealIncome = 0.00; //本年实收计划
                    var ItemThisYearGrowthRate = 0.00; //本年增长率
                    if ($('#ChargeRateType').val() == "本月收费率") {
                        // 本年实收计划：计算公式【X月收费标准上的“本年应收调整值” *收费标准上的“本年收缴率计划”】
                        ItemThisYearRealIncome = (ConvertToFloat(FilterStandardData[k].ThisYearReceivableChangeValue) * ConvertToFloat(FilterStandardData[k].ThisYearCollectionRatePlan) / 100.00).toFixed(2);
                    } else {
                        // 本年实收计划：计算公式【（1月至X月收费标准上的“本年应收调整值”之和）*（收费标准上的“本年收缴率计划”）- （1月至上月“本年实收计划”之和）】
                        //获取 1月至X月收费标准上的“本年应收调整值”之和
                        var TotalThisYearReceivableChangeValue = 0.00;
                        var FilterMonthThisYearReceivableChangeValueData = DetailData.filter(function (e) {
                            return e.BudgetMonth <= parseInt(M) && e.StandardID == FilterStandardData[k].StandardID;
                        });
                        for (var i = 0; i < FilterMonthThisYearReceivableChangeValueData.length; i++) {
                            TotalThisYearReceivableChangeValue = FloatAdd(TotalThisYearReceivableChangeValue, ConvertToFloat(FilterMonthThisYearReceivableChangeValueData[i]["ThisYearReceivableChangeValue"])).toFixed(2);
                        }
                        //获取 1月至上月“本年实收计划”之和
                        var TotalThisYearRealIncome = 0.00;
                        var FilterMonthThisYearRealIncomeData = DetailData.filter(function (e) {
                            return e.BudgetMonth < parseInt(M) && e.StandardID == FilterStandardData[k].StandardID;
                        });
                        for (var i = 0; i < FilterMonthThisYearRealIncomeData.length; i++) {
                            TotalThisYearRealIncome = FloatAdd(TotalThisYearRealIncome, ConvertToFloat(FilterMonthThisYearRealIncomeData[i]["ThisYearRealIncome"])).toFixed(2);
                        }
                        ItemThisYearRealIncome = ((TotalThisYearReceivableChangeValue * ConvertToFloat(FilterStandardData[k].ThisYearCollectionRatePlan) / 100.00) - TotalThisYearRealIncome).toFixed(2)
                    }

                    if ($('#BudgetState').val() == "0") {
                        //本年增长率 ：计算公式【【（收费标准上的“本年实收计划”-收费标准上的“上年实收”）/收费标准上的“上年实收”】*100%；】含税
                        ItemThisYearGrowthRate = ConvertToFloat(FilterStandardData[k].LastYearPaidAmount) == 0.00 ? 0.00 : (((ItemThisYearRealIncome - ConvertToFloat(FilterStandardData[k].LastYearPaidAmount)) / ConvertToFloat(FilterStandardData[k].LastYearPaidAmount)) * 100.00);
                    } else {
                        //本年增长率 ：计算公式【【（收费标准上的“本年实收计划”-收费标准上的“上年实收”）/收费标准上的“上年实收”】*100%；】 不含税
                        ItemThisYearGrowthRate = ConvertToFloat(FilterStandardData[k].LastYearPaidAmount) == 0.00 ? 0.00 : (((ItemThisYearRealIncome - ConvertToFloat(FilterStandardData[k].LastYearPaidAmountWithOutTax)) / ConvertToFloat(FilterStandardData[k].LastYearPaidAmountWithOutTax)) * 100.00);
                    }
                    FilterStandardData[k].ThisYearRealIncome = ItemThisYearRealIncome; //本年实收计划
                    FilterStandardData[k].ThisYearGrowthRate = ItemThisYearGrowthRate.toFixed(2); //本年增长率
                }

                //过滤需要更新的 小计行数据
                var CostDataFilterData = DetailData.filter(function (e) {
                    if ((CostIDlist.indexOf(e.CostID) > -1 || CostIDlist == '') && e.BudgetMonth == parseInt(M) && e.CostID > 0 && e.StandardID == 0 && e.StandardName == '小计') {
                        return true;
                    }
                    return false;
                });
                //循环 小计行 更新值
                for (var k = 0; k < CostDataFilterData.length; k++) {
                    //获取当前编辑的行的所有同级节点【同月、同费项、标准不为空】的数据
                    var CurrentCostFilter = DetailData.filter(function (e) {
                        return e.BudgetMonth == parseInt(M) && e.CostID == CostDataFilterData[k].CostID && e.StandardID != 0;
                    });
                    var TotalQuality = 0.00;
                    var ThisYearReceivableChangeValue = 0.00;
                    var ThisYearRealIncome = 0.00
                    for (var i = 0; i < CurrentCostFilter.length; i++) {
                        TotalQuality = FloatAdd(TotalQuality, ConvertToFloat(CurrentCostFilter[i].TotalQuality));
                        ThisYearReceivableChangeValue = FloatAdd(ThisYearReceivableChangeValue, ConvertToFloat(CurrentCostFilter[i].ThisYearReceivableChangeValue));
                        ThisYearRealIncome = FloatAdd(ThisYearRealIncome, ConvertToFloat(CurrentCostFilter[i].ThisYearRealIncome));
                    }
                    CostDataFilterData[k].TotalQuality = TotalQuality;//全部数量
                    CostDataFilterData[k].ThisYearReceivableChangeValue = ThisYearReceivableChangeValue.toFixed(2);//本年应收调整值
                    CostDataFilterData[k].ThisYearRealIncome = ThisYearRealIncome.toFixed(2);//本年实收计划

                    //获取 1月至X月费项上的“本年应收调整值”之和
                    var TotalThisYearReceivableChangeValue = 0.00;
                    var FilterCostThisYearReceivableChangeValueData = DetailData.filter(function (e) {
                        return e.BudgetMonth <= parseInt(M) && e.CostID == CostDataFilterData[k].CostID && e.StandardID == 0;
                    });
                    for (var i = 0; i < FilterCostThisYearReceivableChangeValueData.length; i++) {
                        TotalThisYearReceivableChangeValue = FloatAdd(TotalThisYearReceivableChangeValue, ConvertToFloat(FilterCostThisYearReceivableChangeValueData[i]["ThisYearReceivableChangeValue"])).toFixed(2);
                    }
                    //计算小计上的本年收缴率计划
                    if ($('#ChargeRateType').val() == "本月收费率") {
                        //（费用项目上的“本年实收计划”/ 1月至X月费用项目上的“本年应收调整值”之和）*100%；
                        if (TotalThisYearReceivableChangeValue == 0) {
                            CostDataFilterData[k].ThisYearCollectionRatePlan = 0.00;//本年收缴率计划
                        } else {
                            CostDataFilterData[k].ThisYearCollectionRatePlan = (CostDataFilterData[k].ThisYearRealIncome / TotalThisYearReceivableChangeValue * 100.00).toFixed(2);//本年收缴率计划
                        }
                    } else {
                        //（1月至X月费用项目上的“本年实收计划”之和/ 1月至X月费用项目上的“本年应收调整值”之和）*100%；
                        if (TotalThisYearReceivableChangeValue == 0) {
                            CostDataFilterData[k].ThisYearCollectionRatePlan = 0.00;//本年收缴率计划
                        } else {
                            //获取 1月至X月费用项目上的“本年实收计划”之和
                            var TotalThisYearRealIncome = 0.00;
                            //获取费项上的小计之和【同费项、标准空】的数据
                            var FilterMonthThisYearRealIncomeData = DetailData.filter(function (e) {
                                return e.BudgetMonth <= parseInt(M) && e.CostID == CostDataFilterData[k].CostID && e.StandardID == 0;
                            });
                            for (var i = 0; i < FilterMonthThisYearRealIncomeData.length; i++) {
                                TotalThisYearRealIncome = FloatAdd(TotalThisYearRealIncome, ConvertToFloat(FilterMonthThisYearRealIncomeData[i]["ThisYearRealIncome"])).toFixed(2);
                            }
                            CostDataFilterData[k].ThisYearCollectionRatePlan = (TotalThisYearRealIncome / TotalThisYearReceivableChangeValue * 100.00).toFixed(2);//本年收缴率计划
                        }
                    }

                    var CostThisYearGrowthRate = 0.00;
                    if ($('#BudgetState').val() == "0") {
                        //本年增长率 ：计算公式【【（费用项目上的“本年实收计划”-费用项目上的“上年实收”）/费用项目上的“上年实收”】*100%；】 含税
                        CostThisYearGrowthRate = ConvertToFloat(CostDataFilterData[k].LastYearPaidAmount) == 0.00 ? 0.00 : (((CostDataFilterData[k].ThisYearRealIncome - ConvertToFloat(CostDataFilterData[k].LastYearPaidAmount)) / ConvertToFloat(CostDataFilterData[k].LastYearPaidAmount)) * 100.00);
                    } else {
                        //本年增长率 ：计算公式【【（费用项目上的“本年实收计划”-费用项目上的“上年实收”）/费用项目上的“上年实收”】*100%；】 不含税
                        CostThisYearGrowthRate = ConvertToFloat(CostDataFilterData[k].LastYearPaidAmountWithOutTax) == 0.00 ? 0.00 : (((CostDataFilterData[k].ThisYearRealIncome - ConvertToFloat(CostDataFilterData[k].LastYearPaidAmountWithOutTax)) / ConvertToFloat(CostDataFilterData[k].LastYearPaidAmountWithOutTax)) * 100.00);
                    }

                    CostDataFilterData[k].ThisYearGrowthRate = CostThisYearGrowthRate.toFixed(2);
                }
            }

            //2、更新结束月之后的小计 避免数据计算错误
            //循环更新当前月以后的月份的小计 的【本年收缴率计划】
            var UpdateMonth = parseInt(BudgetChangeMonthEnd) + 1;
            for (var i = UpdateMonth; i < 13; i++) {
                var LaterMonthFilterData = DetailData.filter(function (e) {
                    if (e.BudgetMonth == parseInt(i) && (CostIDlist.indexOf(e.CostID) > -1 || CostIDlist == '') && e.CostID > 0 && e.StandardID == 0 && e.StandardName == '小计') {
                        return true;
                    }
                    return false;
                });
                if (LaterMonthFilterData.length > 0) {
                    //获取 1月至i月费项上的“本年应收调整值”之和
                    var TotalThisYearReceivableChangeValue = 0.00;
                    var FilterCostThisYearReceivableChangeValueData = DetailData.filter(function (e) {
                        return e.BudgetMonth <= parseInt(i) && e.CostID == LaterMonthFilterData[0].CostID && e.StandardID == 0;
                    });
                    for (var i = 0; i < FilterCostThisYearReceivableChangeValueData.length; i++) {
                        TotalThisYearReceivableChangeValue = FloatAdd(TotalThisYearReceivableChangeValue, ConvertToFloat(FilterCostThisYearReceivableChangeValueData[i]["ThisYearReceivableChangeValue"])).toFixed(2);
                    }
                    //计算小计上的本年收缴率计划
                    if ($('#ChargeRateType').val() == "本月收费率") {
                        //（费用项目上的“本年实收计划”/ 1月至X月费用项目上的“本年应收调整值”之和）*100%；
                        if (TotalThisYearReceivableChangeValue == 0) {
                            LaterMonthFilterData[0].ThisYearCollectionRatePlan = 0.00;//本年收缴率计划
                        } else {
                            LaterMonthFilterData[0].ThisYearCollectionRatePlan = (LaterMonthFilterData[0].ThisYearRealIncome / TotalThisYearReceivableChangeValue * 100.00).toFixed(2);//本年收缴率计划
                        }
                    } else {
                        //（1月至i月费用项目上的“本年实收计划”之和/ 1月至i月费用项目上的“本年应收调整值”之和）*100%；
                        if (TotalThisYearReceivableChangeValue == 0) {
                            LaterMonthFilterData[0].ThisYearCollectionRatePlan = 0.00;//本年收缴率计划
                        } else {
                            //获取 1月至i月费用项目上的“本年实收计划”之和
                            var TotalThisYearRealIncome = 0.00;
                            //获取费项上的小计之和【同费项、标准空】的数据
                            var FilterMonthThisYearRealIncomeData = DetailData.filter(function (e) {
                                return e.BudgetMonth <= parseInt(i) && e.CostID == CurrentRow.CostID && e.StandardID == 0;
                            });
                            for (var i = 0; i < FilterMonthThisYearRealIncomeData.length; i++) {
                                TotalThisYearRealIncome = FloatAdd(TotalThisYearRealIncome, ConvertToFloat(FilterMonthThisYearRealIncomeData[i]["ThisYearRealIncome"])).toFixed(2);
                            }
                            LaterMonthFilterData[0].ThisYearCollectionRatePlan = (TotalThisYearRealIncome / TotalThisYearReceivableChangeValue * 100.00).toFixed(2);//本年收缴率计划
                        }
                    }
                }
            }

            //3、更新月度合计
            for (var M = parseInt(BudgetChangeMonthBegin); M <= parseInt(BudgetChangeMonthEnd); M++) {
                //过滤需要更新的 月度合计行
                var MonthDataFilterData = DetailData.filter(function (e) {
                    if (e.BudgetMonth == parseInt(M) && e.CostID == 0 && e.StandardID == 0 && e.CostName == '月度合计') {
                        return true;
                    }
                    return false;
                });

                //循环更新月度合计值
                for (var k = 0; k < MonthDataFilterData.length; k++) {
                    //获取当月所有费项的集合
                    var CurrentSumFilter = DetailData.filter(function (e) {
                        return e.BudgetMonth == parseInt(M) && e.StandardName == '小计';
                    });
                    var TotalQuality = 0.00;
                    var ThisYearReceivableChangeValue = 0.00;
                    var ThisYearRealIncome = 0.00
                    for (var i = 0; i < CurrentSumFilter.length; i++) {
                        TotalQuality = FloatAdd(TotalQuality, ConvertToFloat(CurrentSumFilter[i].TotalQuality));
                        ThisYearReceivableChangeValue = FloatAdd(ThisYearReceivableChangeValue, ConvertToFloat(CurrentSumFilter[i].ThisYearReceivableChangeValue));
                        ThisYearRealIncome = FloatAdd(ThisYearRealIncome, ConvertToFloat(CurrentSumFilter[i].ThisYearRealIncome));
                    }
                    MonthDataFilterData[k].TotalQuality = TotalQuality;//全部数量
                    MonthDataFilterData[k].ThisYearReceivableChangeValue = ThisYearReceivableChangeValue.toFixed(2);//本年应收调整值
                    MonthDataFilterData[k].ThisYearRealIncome = ThisYearRealIncome.toFixed(2);//本年实收计划

                    //获取 1月至X月月度上的“本年应收调整值”之和
                    var TotalThisYearReceivableChangeValue = 0.00;
                    var FilterMonthThisYearReceivableChangeValueData = DetailData.filter(function (e) {
                        return e.BudgetMonth <= parseInt(M) && e.CostName == "月度合计";
                    });
                    for (var i = 0; i < FilterMonthThisYearReceivableChangeValueData.length; i++) {
                        TotalThisYearReceivableChangeValue = FloatAdd(TotalThisYearReceivableChangeValue, ConvertToFloat(FilterMonthThisYearReceivableChangeValueData[i]["ThisYearReceivableChangeValue"])).toFixed(2);
                    }

                    //计算月度上的本年收缴率计划
                    if ($('#ChargeRateType').val() == "本月收费率") {
                        //（月度合计上的“本年实收计划”/ 1月至X月月度合计上的“本年应收调整值”之和）*100%；
                        if (TotalThisYearReceivableChangeValue == 0) {
                            MonthDataFilterData[k].ThisYearCollectionRatePlan = 0.00;//本年收缴率计划
                        } else {
                            MonthDataFilterData[k].ThisYearCollectionRatePlan = (MonthDataFilterData[k].ThisYearRealIncome / TotalThisYearReceivableChangeValue * 100.00).toFixed(2);//本年收缴率计划
                        }
                    } else {
                        //（1月至X月月度合计上的“本年实收计划”之和/ 1月至X月月度合计上的“本年应收调整值”之和）
                        if (TotalThisYearReceivableChangeValue == 0) {
                            MonthDataFilterData[k].ThisYearCollectionRatePlan = 0.00;//本年收缴率计划
                        } else {
                            //获取 1月至X月月度合计上的“本年实收计划”之和
                            var TotalThisYearRealIncome = 0.00;

                            var FilterMonthThisYearRealIncomeData = DetailData.filter(function (e) {
                                return e.BudgetMonth <= parseInt(M) && e.CostName == "月度合计";
                            });
                            for (var i = 0; i < FilterMonthThisYearRealIncomeData.length; i++) {
                                TotalThisYearRealIncome = FloatAdd(TotalThisYearRealIncome, ConvertToFloat(FilterMonthThisYearRealIncomeData[i]["ThisYearRealIncome"])).toFixed(2);
                            }
                            MonthDataFilterData[k].ThisYearCollectionRatePlan = (TotalThisYearRealIncome / TotalThisYearReceivableChangeValue * 100.00).toFixed(2);//本年收缴率计划
                        }
                    }

                    var MonthThisYearGrowthRate = 0.00;
                    if ($('#BudgetState').val() == "0") {
                        //本年增长率 ：计算公式【【（费用项目上的“本年实收计划”-费用项目上的“上年实收”）/费用项目上的“上年实收”】*100%；】 含税
                        MonthThisYearGrowthRate = ConvertToFloat(MonthDataFilterData[k].LastYearPaidAmount) == 0.00 ? 0.00 : (((MonthDataFilterData[k].ThisYearRealIncome - ConvertToFloat(MonthDataFilterData[k].LastYearPaidAmount)) / ConvertToFloat(MonthDataFilterData[k].LastYearPaidAmount)) * 100.00);
                    } else {
                        //本年增长率 ：计算公式【【（费用项目上的“本年实收计划”-费用项目上的“上年实收”）/费用项目上的“上年实收”】*100%；】 不含税
                        MonthThisYearGrowthRate = ConvertToFloat(MonthDataFilterData[k].LastYearPaidAmountWithOutTax) == 0.00 ? 0.00 : (((MonthDataFilterData[k].ThisYearRealIncome - ConvertToFloat(MonthDataFilterData[k].LastYearPaidAmountWithOutTax)) / ConvertToFloat(MonthDataFilterData[k].LastYearPaidAmountWithOutTax)) * 100.00);
                    }

                    MonthDataFilterData[k].ThisYearGrowthRate = MonthThisYearGrowthRate.toFixed(2);
                }
            }
            //4、更新结束月后的月度合计 避免数据计算错误
            //循环更新结束月以后的月份的月度合计 的【本年收缴率计划】
            for (var i = UpdateMonth; i < 13; i++) {
                var LaterMonthFilterData = DetailData.filter(function (e) {
                    return e.BudgetMonth == parseInt(i) && e.CostName == "月度合计";
                });
                if (LaterMonthFilterData.length > 0) {
                    //获取 1月至i月月度上的“本年应收调整值”之和
                    var TotalThisYearReceivableChangeValue = 0.00;
                    var FilterMonthThisYearReceivableChangeValueData = DetailData.filter(function (e) {
                        return e.BudgetMonth <= parseInt(i) && e.CostName == "月度合计";
                    });
                    for (var i = 0; i < FilterMonthThisYearReceivableChangeValueData.length; i++) {
                        TotalThisYearReceivableChangeValue = FloatAdd(TotalThisYearReceivableChangeValue, ConvertToFloat(FilterMonthThisYearReceivableChangeValueData[i]["ThisYearReceivableChangeValue"])).toFixed(2);
                    }
                    //计算月度上的本年收缴率计划
                    if ($('#ChargeRateType').val() == "本月收费率") {
                        //（月度合计上的“本年实收计划”/ 1月至i月月度合计上的“本年应收调整值”之和）*100%；
                        if (TotalThisYearReceivableChangeValue == 0) {
                            LaterMonthFilterData[0].ThisYearCollectionRatePlan = 0.00;//本年收缴率计划
                        } else {
                            LaterMonthFilterData[0].ThisYearCollectionRatePlan = (LaterMonthFilterData[0].ThisYearRealIncome / TotalThisYearReceivableChangeValue * 100.00).toFixed(2);//本年收缴率计划
                        }
                    } else {
                        //（1月至i月月度合计上的“本年实收计划”之和/ 1月至i月月度合计上的“本年应收调整值”之和）
                        if (TotalThisYearReceivableChangeValue == 0) {
                            LaterMonthFilterData[0].ThisYearCollectionRatePlan = 0.00;//本年收缴率计划
                        } else {
                            //获取 1月至i月月度合计上的“本年实收计划”之和
                            var TotalThisYearRealIncome = 0.00;

                            var FilterMonthThisYearRealIncomeData = DetailData.filter(function (e) {
                                return e.BudgetMonth <= parseInt(i) && e.CostName == "月度合计";
                            });
                            for (var i = 0; i < FilterMonthThisYearRealIncomeData.length; i++) {
                                TotalThisYearRealIncome = FloatAdd(TotalThisYearRealIncome, ConvertToFloat(FilterMonthThisYearRealIncomeData[i]["ThisYearRealIncome"])).toFixed(2);
                            }
                            LaterMonthFilterData[0].ThisYearCollectionRatePlan = (TotalThisYearRealIncome / TotalThisYearReceivableChangeValue * 100.00).toFixed(2);//本年收缴率计划
                        }
                    }
                }
            }
            //5、更新年度合计
            var YearDataFilterData = DetailData.filter(function (e) {
                return e.CostName == "年度合计";
            });
            if (YearDataFilterData.length > 0) {
                var CurrentMonthDataFilterData = DetailData.filter(function (e) {
                    return e.CostName == "月度合计";
                });
                if (CurrentMonthDataFilterData.length > 0) {
                    var MaxTotalQuality = 0;
                    var ThisYearReceivableChangeValue = 0.00;
                    var ThisYearRealIncome = 0.00;
                    for (var i = 0; i < CurrentMonthDataFilterData.length; i++) {
                        //获取最大的【全部数量】
                        if (CurrentMonthDataFilterData[i].TotalQuality > MaxTotalQuality) {
                            MaxTotalQuality = CurrentMonthDataFilterData[i].TotalQuality;
                        }
                        ThisYearReceivableChangeValue = FloatAdd(ThisYearReceivableChangeValue, ConvertToFloat(CurrentMonthDataFilterData[i].ThisYearReceivableChangeValue));
                        ThisYearRealIncome = FloatAdd(ThisYearRealIncome, ConvertToFloat(CurrentMonthDataFilterData[i].ThisYearRealIncome));
                    }
                    YearDataFilterData[0].TotalQuality = MaxTotalQuality; // 全部数量
                    YearDataFilterData[0].ThisYearReceivableChangeValue = ThisYearReceivableChangeValue.toFixed(2);//本年应收调整值
                    YearDataFilterData[0].ThisYearRealIncome = ThisYearRealIncome.toFixed(2);//本年实收计划
                    // 更新 本年收缴率计划：计算公式【（年度合计上的“本年实收计划”/年度合计上的“本年应收调整值”）*100%；】
                    if (ThisYearReceivableChangeValue == 0) {
                        YearDataFilterData[0].ThisYearCollectionRatePlan = 0.00;//本年收缴率计划
                    } else {
                        YearDataFilterData[0].ThisYearCollectionRatePlan = (ThisYearRealIncome / ThisYearReceivableChangeValue * 100.00).toFixed(2);//本年收缴率计划
                    }

                    var YearThisYearGrowthRate = 0.00;
                    if ($('#BudgetState').val() == "0") {
                        //本年增长率 ：计算公式【【（年度合计上的“本年实收计划”-年度合计上的“上年实收”）/年度合计上的“上年实收”】*100%】 含税
                        YearThisYearGrowthRate = ConvertToFloat(YearDataFilterData[0].LastYearPaidAmount) == 0.00 ? 0.00 : (((YearDataFilterData[0].ThisYearRealIncome - ConvertToFloat(YearDataFilterData[0].LastYearPaidAmount)) / ConvertToFloat(YearDataFilterData[0].LastYearPaidAmount)) * 100.00);
                    } else {
                        //本年增长率 ：计算公式【【（年度合计上的“本年实收计划”-年度合计上的“上年实收”）/年度合计上的“上年实收”】*100%】 不含税
                        YearThisYearGrowthRate = ConvertToFloat(YearDataFilterData[0].LastYearPaidAmountWithOutTax) == 0.00 ? 0.00 : (((YearDataFilterData[0].ThisYearRealIncome - ConvertToFloat(YearDataFilterData[0].LastYearPaidAmountWithOutTax)) / ConvertToFloat(YearDataFilterData[0].LastYearPaidAmountWithOutTax)) * 100.00);
                    }
                    YearDataFilterData[0].ThisYearGrowthRate = YearThisYearGrowthRate.toFixed(2);
                }
            }

            $.tool.pageUnLoading();
            $('#DetailResult').val(JSON.stringify(DetailData));
            LoadList();
        }
        //取消调整
        function btnBatchEdit_cacnelClick() {
            $('#BatchEditDialog').dialog('close');
        }
        //保存数据
        function btnSave_Click() {
            //先结束一次编辑
            endEditionForDetail();
            $.tool.DataPost('Budget', "IncomeManage_SaveBasicIncomePlan", $('#frmForm').serialize(),
                function Init() {
                },
                function callback(_Data) {
                    if (_Data == "true") {
                        HDialog.Info("保存基础收入计划成功");
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

        }

        $.extend($.fn.datagrid.methods, {
            autoMergeCells: function (jq, fields) {
                return jq.each(function () {
                    var target = $(this);
                    if (!fields) {
                        fields = target.datagrid("getColumnFields");
                    }
                    var rows = target.datagrid("getRows");
                    var i = 0,
                        j = 0,
                        temp = {};
                    for (i; i < rows.length; i++) {
                        var row = rows[i];
                        j = 0;
                        for (j; j < fields.length; j++) {
                            var field = fields[j];
                            var tf = temp[field];
                            if (!tf) {
                                tf = temp[field] = {};
                                tf[row[field]] = [i];
                            } else {
                                var tfv = tf[row[field]];
                                if (tfv) {
                                    tfv.push(i);
                                } else {
                                    tfv = tf[row[field]] = [i];
                                }
                            }
                        }
                    }
                    $.each(temp, function (field, colunm) {
                        $.each(colunm, function () {
                            var group = this;
                            if (group.length > 1) {
                                var before,
                                    after,
                                    megerIndex = group[0];
                                for (var i = 0; i < group.length; i++) {
                                    before = group[i];
                                    after = group[i + 1];
                                    if (after && (after - before) == 1) {
                                        continue;
                                    }
                                    var rowspan = before - megerIndex + 1;
                                    if (rowspan > 1) {
                                        target.datagrid('mergeCells', {
                                            index: megerIndex,
                                            field: field,
                                            rowspan: rowspan
                                        });
                                    }
                                    if (after && (after - before) != 1) {
                                        megerIndex = after;
                                    }
                                }
                            }
                        });
                    });
                });
            }
        });

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
