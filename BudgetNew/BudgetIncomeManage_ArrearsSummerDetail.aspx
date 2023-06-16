<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetIncomeManage_ArrearsSummerDetail.aspx.cs" Inherits="M_Main.BudgetNew.BudgetIncomeManage_ArrearsSummerDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>预算管理-欠费回收计划-编制清欠计划</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <form id="frmForm" runat="server">
        <input type="hidden" id="ArrearsRecoveryPlanID" name="ArrearsRecoveryPlanID" runat="server" />
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <div id="TableContainer"></div>
        <script type="text/javascript">
            //页面加载
            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }

            //***冻结列
            var frozenColumns = [[//第一行
                { field: 'CostName', title: '费用项目', align: 'center', width: 120, rowspan: 3 },
                { title: '往年欠费（元）', align: 'center', rowspan: 2, colspan: 2 },
                {
                    field: 'ThisYearPlanClearUpRate', title: '本年清欠率计划（%）', align: 'center', width: 160, rowspan: 3,
                    formatter: function (value, row, index) {
                        if (value != "") {
                            return value + "%";
                        }
                        return value;
                    }
                },
                { title: '本年清欠计划（元）', align: 'center', rowspan: 2, colspan: 2 },
                { title: '上年清欠（元）', align: 'center', rowspan: 2, colspan: 2 },
                {
                    field: 'ThisYearGrowthRate', title: '本年增长率（%）', align: 'center', width: 110, rowspan: 3,
                    formatter: function (value, row, index) {
                        if (value != "") {
                            return value + "%";
                        }
                        return value;
                    }
                }
            ], [], [
                //第三行
                { field: 'PreviousArrears', title: '含税', align: 'center', width: 100 },
                { field: 'PreviousArrearsWithOutTax', title: '不含税', align: 'center', width: 100 },
                { field: 'ThisYearPlanClearUpMoney', title: '含税', align: 'center', width: 100 },
                { field: 'ThisYearPlanClearUpMoneyWithOutTax', title: '不含税', align: 'center', width: 100 },
                { field: 'LastYearClearUpMoney', title: '含税', align: 'center', width: 100 },
                { field: 'LastYearClearUpMoneyWithOutTax', title: '不含税', align: 'center', width: 100 },
            ]];

            var column = [[//第一行
                { title: '1月', align: 'center', width: 100, colspan: 3 },
                { title: '2月', align: 'center', width: 100, colspan: 3 },
                { title: '3月', align: 'center', width: 100, colspan: 3 },
                { title: '4月', align: 'center', width: 100, colspan: 3 },
                { title: '5月', align: 'center', width: 100, colspan: 3 },
                { title: '6月', align: 'center', width: 100, colspan: 3 },
                { title: '7月', align: 'center', width: 100, colspan: 3 },
                { title: '8月', align: 'center', width: 100, colspan: 3 },
                { title: '9月', align: 'center', width: 100, colspan: 3 },
                { title: '10月', align: 'center', width: 100, colspan: 3 },
                { title: '11月', align: 'center', width: 100, colspan: 3 },
                { title: '12月', align: 'center', width: 100, colspan: 3 }
            ],
            [//第二行
                {
                    field: 'ClearUpRate1Y', title: '清欠率（%）', align: 'center', width: 100, rowspan: 2,
                    formatter: function (value, row, index) {
                        if (value != "") {
                            return value + "%";
                        }
                        return value;
                    }
                },
                { title: '金额（元）', align: 'center', width: 100, colspan: 2 },
                {
                    field: 'ClearUpRate2Y', title: '清欠率（%）', align: 'center', width: 100, rowspan: 2,
                    formatter: function (value, row, index) {
                        if (value != "") {
                            return value + "%";
                        }
                        return value;
                    }
                },
                { title: '金额（元）', align: 'center', width: 100, colspan: 2 },
                {
                    field: 'ClearUpRate3Y', title: '清欠率（%）', align: 'center', width: 100, rowspan: 2,
                    formatter: function (value, row, index) {
                        if (value != "") {
                            return value + "%";
                        }
                        return value;
                    }
                },
                { title: '金额（元）', align: 'center', width: 100, colspan: 2 },
                {
                    field: 'ClearUpRate4Y', title: '清欠率（%）', align: 'center', width: 100, rowspan: 2,
                    formatter: function (value, row, index) {
                        if (value != "") {
                            return value + "%";
                        }
                        return value;
                    }
                },
                { title: '金额（元）', align: 'center', width: 100, colspan: 2 },
                {
                    field: 'ClearUpRate5Y', title: '清欠率（%）', align: 'center', width: 100, rowspan: 2,
                    formatter: function (value, row, index) {
                        if (value != "") {
                            return value + "%";
                        }
                        return value;
                    }
                },
                { title: '金额（元）', align: 'center', width: 100, colspan: 2 },
                {
                    field: 'ClearUpRate6Y', title: '清欠率（%）', align: 'center', width: 100, rowspan: 2,
                    formatter: function (value, row, index) {
                        if (value != "") {
                            return value + "%";
                        }
                        return value;
                    }
                },
                { title: '金额（元）', align: 'center', width: 100, colspan: 2 },
                {
                    field: 'ClearUpRate7Y', title: '清欠率（%）', align: 'center', width: 100, rowspan: 2,
                    formatter: function (value, row, index) {
                        if (value != "") {
                            return value + "%";
                        }
                        return value;
                    }
                },
                { title: '金额（元）', align: 'center', width: 100, colspan: 2 },
                {
                    field: 'ClearUpRate8Y', title: '清欠率（%）', align: 'center', width: 100, rowspan: 2,
                    formatter: function (value, row, index) {
                        if (value != "") {
                            return value + "%";
                        }
                        return value;
                    }
                },
                { title: '金额（元）', align: 'center', width: 100, colspan: 2 },
                {
                    field: 'ClearUpRate9Y', title: '清欠率（%）', align: 'center', width: 100, rowspan: 2,
                    formatter: function (value, row, index) {
                        if (value != "") {
                            return value + "%";
                        }
                        return value;
                    }
                },
                { title: '金额（元）', align: 'center', width: 100, colspan: 2 },
                {
                    field: 'ClearUpRate10Y', title: '清欠率（%）', align: 'center', width: 100, rowspan: 2,
                    formatter: function (value, row, index) {
                        if (value != "") {
                            return value + "%";
                        }
                        return value;
                    }
                },
                { title: '金额（元）', align: 'center', width: 100, colspan: 2 },
                {
                    field: 'ClearUpRate11Y', title: '清欠率（%）', align: 'center', width: 100, rowspan: 2,
                    formatter: function (value, row, index) {
                        if (value != "") {
                            return value + "%";
                        }
                        return value;
                    }
                },
                { title: '金额（元）', align: 'center', width: 100, colspan: 2 },
                {
                    field: 'ClearUpRate12Y', title: '清欠率（%）', align: 'center', width: 100, rowspan: 2,
                    formatter: function (value, row, index) {
                        if (value != "") {
                            return value + "%";
                        }
                        return value;
                    }
                },
                { title: '金额（元）', align: 'center', width: 100, colspan: 2 },
            ], [//第三行
                { field: 'ClearUpMoney1Y', title: '含税', align: 'center', width: 100 },
                { field: 'ClearUpMoneyWithOutTax1Y', title: '不含税', align: 'center', width: 100 },
                { field: 'ClearUpMoney2Y', title: '含税', align: 'center', width: 100 },
                { field: 'ClearUpMoneyWithOutTax2Y', title: '不含税', align: 'center', width: 100 },
                { field: 'ClearUpMoney3Y', title: '含税', align: 'center', width: 100 },
                { field: 'ClearUpMoneyWithOutTax3Y', title: '不含税', align: 'center', width: 100 },
                { field: 'ClearUpMoney4Y', title: '含税', align: 'center', width: 100 },
                { field: 'ClearUpMoneyWithOutTax4Y', title: '不含税', align: 'center', width: 100 },
                { field: 'ClearUpMoney5Y', title: '含税', align: 'center', width: 100 },
                { field: 'ClearUpMoneyWithOutTax5Y', title: '不含税', align: 'center', width: 100 },
                { field: 'ClearUpMoney6Y', title: '含税', align: 'center', width: 100 },
                { field: 'ClearUpMoneyWithOutTax6Y', title: '不含税', align: 'center', width: 100 },
                { field: 'ClearUpMoney7Y', title: '含税', align: 'center', width: 100 },
                { field: 'ClearUpMoneyWithOutTax7Y', title: '不含税', align: 'center', width: 100 },
                { field: 'ClearUpMoney8Y', title: '含税', align: 'center', width: 100 },
                { field: 'ClearUpMoneyWithOutTax8Y', title: '不含税', align: 'center', width: 100 },
                { field: 'ClearUpMoney9Y', title: '含税', align: 'center', width: 100 },
                { field: 'ClearUpMoneyWithOutTax9Y', title: '不含税', align: 'center', width: 100 },
                { field: 'ClearUpMoney10Y', title: '含税', align: 'center', width: 100 },
                { field: 'ClearUpMoneyWithOutTax10Y', title: '不含税', align: 'center', width: 100 },
                { field: 'ClearUpMoney11Y', title: '含税', align: 'center', width: 100 },
                { field: 'ClearUpMoneyWithOutTax11Y', title: '不含税', align: 'center', width: 100 },
                { field: 'ClearUpMoney12Y', title: '含税', align: 'center', width: 100 },
                { field: 'ClearUpMoneyWithOutTax12Y', title: '不含税', align: 'center', width: 100 },
            ]];
            //工具栏
            var toolbar = [
                {
                    text: '设置清欠率计划',
                    iconCls: 'icon-add',
                    handler: function () {
                        Detail();
                    }
                }, '-',
                {
                    text: 'Excel导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        var Rows = $("#TableContainer").datagrid("getRows");
                        if (Rows.length == 0) {
                            HDialog.Info("没有数据导出!");
                            return;
                        }
                        window.open("BudgetIncomeManage_ArrearsSummerDetailExport.aspx?ArrearsRecoveryPlanID=" + $('#ArrearsRecoveryPlanID').val() + "&CommID=" + $('#CommID').val());
                    }
                }
            ];

            //设置清欠率计划
            function Detail() {
                var w = 400;
                var h = 580;

                var Rows = $('#TableContainer').datagrid("getRows");
                if (Rows.length == 0) {
                    HDialog.Info("没有清欠计划数据！");
                    return;
                }
                var CostItem = Rows.filter(function (e) {
                    return e.CostName != "合计";
                });
                var CostData = [];
                if (CostItem != null && CostItem.length > 0) {

                    for (var i = 0; i < CostItem.length; i++) {
                        var ItemCostData = {
                            CostID: CostItem[i].CostID,
                            CostName: CostItem[i].CostName
                        };
                        CostData.push(ItemCostData);
                    }
                } else {
                    HDialog.Info("没有清欠计划数据！");
                    return;
                }
                var FeesCostData = {
                    CostData: CostData
                };
                localStorage.setItem("FeesCostData", JSON.stringify(FeesCostData));
                HDialog.Open(w, h, '../BudgetNew/BudgetIncomeManage_ArrearsPlanClearUpRateSetting.aspx?CommID=' + $('#CommID').val() + '&ArrearsRecoveryPlanID=' + $('#ArrearsRecoveryPlanID').val(), '设置清欠率计划', true, function callback(_Data) {
                    if (_Data != '') {
                        LoadList();
                    }
                });
            }

            //加载列表
            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: true,
                    pageSize: 50,
                    pageList: [50, 100, 300],
                    frozenColumns: frozenColumns,
                    columns: column,
                    rownumbers: true,
                    fitColumns: false,
                    singleSelect: true,
                    pagination: false,
                    border: false,
                    width: "100%",
                    toolbar: toolbar,
                    onBeforeLoad: function (param) {
                        param.Method = "DataPost";
                        param.Class = "Budget";
                        param.Command = "IncomeManage_GetArrearsSummerDetailList";
                        param.CommID = $("#CommID").val();
                        param.ArrearsRecoveryPlanID = $("#ArrearsRecoveryPlanID").val();
                    },
                    onLoadSuccess: function () {
                    }
                });
            }

            //页面初始化
            $(function () {
                InitFunction();
                LoadList();

            })
        </script>
    </form>
</body>
</html>
