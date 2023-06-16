<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetIncomeManage_TotalIncomeDetail.aspx.cs" Inherits="M_Main.BudgetNew.BudgetIncomeManage_TotalIncomeDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>预算管理-预算计划-汇总收入计划编辑页面</title>
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
        <input type="hidden" id="TotalIncomeID" name="TotalIncomeID" runat="server" />
        <input type="hidden" id="DetailResult" name="DetailResult" runat="server" />
        <div id="TableContainer1"></div>
    </form>


    <script type="text/javascript">
        function InitTableHeight() {
            var h = $(window).height();
            $("#TableContainer1").css("height", h + "px");
        }


        var frozenColumns = [[//第一行
            { field: 'text', title: '预算科目', width: 200, align: 'left', rowspan: 2 },
            { field: 'FeesCostNames', title: '对应收费科目', width: 220, align: 'left', rowspan: 2 },
            { title: '上年完成值（元）', align: 'center', colspan: 2 },
            { title: '本年计划值（元）', align: 'center', colspan: 2 },
            { title: '本年增长率(%)', align: 'center', colspan: 2 }
        ], [//第二行
            { field: 'LastYearCompleteValue', title: '含税', width: 100, align: 'center' },
            { field: 'LastYearCompleteValueWithOutTax', title: '不含税', width: 100, align: 'center' },
            { field: 'ThisYearPlanValue', title: '含税', width: 100, align: 'center' },
            { field: 'ThisYearPlanValueWithOutTax', title: '不含税', width: 100, align: 'center' },
            {
                field: 'ThisYearGrowthRate', title: '含税', width: 100, align: 'center',
                formatter: function (value, row, index) {
                    if (value != "") {
                        return value + "%";
                    }
                    return value;
                }
            },
            {
                field: 'ThisYearGrowthRateWithOutTax', title: '不含税', width: 100, align: 'center',
                formatter: function (value, row, index) {
                    if (value != "") {
                        return value + "%";
                    }
                    return value;
                }
            }
        ]];

        var column = [[//第一行
            { title: '1月', align: 'center', colspan: 2 },
            { title: '2月', align: 'center', colspan: 2 },
            { title: '3月', align: 'center', colspan: 2 },
            { title: '4月', align: 'center', colspan: 2 },
            { title: '5月', align: 'center', colspan: 2 },
            { title: '6月', align: 'center', colspan: 2 },
            { title: '7月', align: 'center', colspan: 2 },
            { title: '8月', align: 'center', colspan: 2 },
            { title: '9月', align: 'center', colspan: 2 },
            { title: '10月', align: 'center', colspan: 2 },
            { title: '11月', align: 'center', colspan: 2 },
            { title: '12月', align: 'center', colspan: 2 }
        ],
        [//第二行
            { field: 'PlanValue1Y', title: '含税', align: 'center', width: 100 },
            { field: 'PlanValue1YWithOutTax', title: '不含税', align: 'center', width: 100 },
            { field: 'PlanValue2Y', title: '含税', align: 'center', width: 100 },
            { field: 'PlanValue2YWithOutTax', title: '不含税', align: 'center', width: 100 },
            { field: 'PlanValue3Y', title: '含税', align: 'center', width: 100 },
            { field: 'PlanValue3YWithOutTax', title: '不含税', align: 'center', width: 100 },
            { field: 'PlanValue4Y', title: '含税', align: 'center', width: 100 },
            { field: 'PlanValue4YWithOutTax', title: '不含税', align: 'center', width: 100 },
            { field: 'PlanValue5Y', title: '含税', align: 'center', width: 100 },
            { field: 'PlanValue5YWithOutTax', title: '不含税', align: 'center', width: 100 },
            { field: 'PlanValue6Y', title: '含税', align: 'center', width: 100 },
            { field: 'PlanValue6YWithOutTax', title: '不含税', align: 'center', width: 100 },
            { field: 'PlanValue7Y', title: '含税', align: 'center', width: 100 },
            { field: 'PlanValue7YWithOutTax', title: '不含税', align: 'center', width: 100 },
            { field: 'PlanValue8Y', title: '含税', align: 'center', width: 100 },
            { field: 'PlanValue8YWithOutTax', title: '不含税', align: 'center', width: 100 },
            { field: 'PlanValue9Y', title: '含税', align: 'center', width: 100 },
            { field: 'PlanValue9YWithOutTax', title: '不含税', align: 'center', width: 100 },
            { field: 'PlanValue10Y', title: '含税', align: 'center', width: 100 },
            { field: 'PlanValue10YWithOutTax', title: '不含税', align: 'center', width: 100 },
            { field: 'PlanValue11Y', title: '含税', align: 'center', width: 100 },
            { field: 'PlanValue11YWithOutTax', title: '不含税', align: 'center', width: 100 },
            { field: 'PlanValue12Y', title: '含税', align: 'center', width: 100 },
            { field: 'PlanValue12YWithOutTax', title: '不含税', align: 'center', width: 100 },
        ]];

        var toolBar = [
            {
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
            $("#TableContainer1").treegrid({
                treeField: 'text',
                idField: 'id',
                method: "get",
                nowrap: true,
                data: DataArr,
                frozenColumns: frozenColumns,
                columns: column,
                fitColumns: false,
                rownumbers: true,
                singleSelect: true,
                pagination: false,
                border: false,
                width: '100%',
                toolbar: toolBar,
                onLoadSuccess: function (data) {
                }
            });
        }

        //导出Excel
        function btnExport_Click() {
            var Rows = $("#TableContainer1").treegrid("getData");
            if (Rows.length == 0) {
                HDialog.Info("没有数据导出!");
                return;
            }
            window.open("BudgetIncomeManage_TotalIncomeDetailExport.aspx?TotalIncomeID=" + $('#TotalIncomeID').val() + "&CommID=" + $('#CommID').val());
        }

        //页面初始化
        $(function () {
            InitTableHeight();
            LoadList();
        })

    </script>
</body>
</html>
