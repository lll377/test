<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetRoomIncomeDetailed.aspx.cs" Inherits="M_Main.BudgetNew.BudgetRoomIncomeDetailed" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>交房收入详细</title>
    <link href="../css/base.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/color.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>

    <link href="../css/basebootstrap.css" rel="stylesheet" />

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script src="../jscript/help.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/uuid.js"></script>
    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
    <style type="text/css">
    </style>
</head>

<body>
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <input type="hidden" id="RoomIncomeID" name="RoomIncomeID" value="" />

    <script language="javascript" type="text/javascript">


        function InitControl() {
        }

        $(function () {
            PageInit();
        });
        function PageInit() {
            var ID = $.getUrlParam("ID");
            $("#RoomIncomeID").val(ID);
            InitControl();
            InitDataGrid();
        }

        var frozenColumns = [[//第一行
            { field: 'CostIDText', title: '费用项目', width: 160, align: 'center' },
            { field: 'TaxRate', title: '税率(%)', width: 60, align: 'center', halign: 'center' },
            { field: 'Standard', title: '收费标准(元/月)', width: 100, align: 'center' },
            { field: 'Num', title: '数量', width: 60, align: 'center' },
            { field: 'Area', title: '面积(平米)', width: 80, align: 'center' },
            { field: 'WayText', title: '计算方式', width: 160, align: 'center' },
            { field: 'PeriodText', title: '计费周期', width: 100, align: 'center' },
            { field: 'MonthText', title: '计费开始月份', width: 80, align: 'center' }
        ]
        ];

        var column = [[//第一行
            { title: '本年实收计划(元)', align: 'center', width: 200, colspan: 2 },
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
        [//第三行
            { field: 'MonthTotal', title: '含税', width: 100, align: 'center' },
            { field: 'MonthTotalWithOutTax', title: '不含税', width: 100, align: 'center' },
            { field: 'Month1', title: '含税', align: 'center', width: 100 },
            { field: 'MonthWithOutTax1', title: '不含税', align: 'center', width: 100 },
            { field: 'Month2', title: '含税', align: 'center', width: 100 },
            { field: 'MonthWithOutTax2', title: '不含税', align: 'center', width: 100 },
            { field: 'Month3', title: '含税', align: 'center', width: 100 },
            { field: 'MonthWithOutTax3', title: '不含税', align: 'center', width: 100 },
            { field: 'Month4', title: '含税', align: 'center', width: 100 },
            { field: 'MonthWithOutTax4', title: '不含税', align: 'center', width: 100 },
            { field: 'Month5', title: '含税', align: 'center', width: 100 },
            { field: 'MonthWithOutTax5', title: '不含税', align: 'center', width: 100 },
            { field: 'Month6', title: '含税', align: 'center', width: 100 },
            { field: 'MonthWithOutTax6', title: '不含税', align: 'center', width: 100 },
            { field: 'Month7', title: '含税', align: 'center', width: 100 },
            { field: 'MonthWithOutTax7', title: '不含税', align: 'center', width: 100 },
            { field: 'Month8', title: '含税', align: 'center', width: 100 },
            { field: 'MonthWithOutTax8', title: '不含税', align: 'center', width: 100 },
            { field: 'Month9', title: '含税', align: 'center', width: 100 },
            { field: 'MonthWithOutTax9', title: '不含税', align: 'center', width: 100 },
            { field: 'Month10', title: '含税', align: 'center', width: 100 },
            { field: 'MonthWithOutTax10', title: '不含税', align: 'center', width: 100 },
            { field: 'Month11', title: '含税', align: 'center', width: 100 },
            { field: 'MonthWithOutTax11', title: '不含税', align: 'center', width: 100 },
            { field: 'Month12', title: '含税', align: 'center', width: 100 },
            { field: 'MonthWithOutTax12', title: '不含税', align: 'center', width: 100 },
        ]
        ];
        function InitDataGrid() {
            $("#dg").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fit: true,
                idField: "ID",
                frozenColumns: frozenColumns,
                columns: column,
                rownumbers: true,
                checkbox: true,
                singleSelect: true,
                checkOnSelect: false,
                selectOnCheck: false,
                border: false,
                pagination: true,
                width: "100%",
                sortOrder: "desc",
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onDblClickRow: function (index, row) {

                },
                onBeforeLoad: function (param) {
                    param = $.getDataGridParam("Budget", "GetListRoomIncomeDetailed", param);
                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (data) {
                }
            });
            $('#dg').datagrid('clearSelections');
            $('#dg').datagrid('clearChecked');
        }
    </script>
</body>
</html>

