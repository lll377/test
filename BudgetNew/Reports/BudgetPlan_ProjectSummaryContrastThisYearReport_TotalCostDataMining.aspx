<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetPlan_ProjectSummaryContrastThisYearReport_TotalCostDataMining.aspx.cs" Inherits="M_Main.BudgetNew.Reports.BudgetPlan_ProjectSummaryContrastThisYearReport_TotalCostDataMining" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>项目预算与本年实际发生汇总对比表-累计成本费用数据挖掘</title>
    <script type="text/javascript" src="../../jscript/jquery-1.11.3.min.js"></script>
    <script src="../../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/JQForm/JQForm.js"></script>
    <link href="../../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 800px;
            height: 160px;
        }

        .SearchTable {
            width: 800px;
            height: auto;
        }

            .SearchTable .TdTitle {
                width: 120px;
            }


        .TdContent input, select {
            border: 1px #cccccc solid;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="CostID" name="CostID" runat="server" />
        <input type="hidden" id="BudgetYear" name="BudgetYear" runat="server" />
        <div id="TableContainer"></div>
        <script type="text/javascript">

            //页面加载
            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }

            var column = [[
                { field: 'DataType', title: '数据来源', align: 'center', width: 100, sortable: true },
                { field: 'DataNumber', title: '单号', align: 'left', width: 100, sortable: true },
                { field: 'BudgetName', title: '预算科目', align: 'center', width: 100, sortable: true },
                { field: 'BudgetYearMonth', title: '预算年月', align: 'center', width: 60, sortable: true },
                { field: 'BudgetMoney', title: '预算金额', align: 'center', width: 60, sortable: true },
                { field: 'CreateUserName', title: '发起人', width: 100, align: 'center', sortable: true },
                {
                    field: 'CreateDate', title: '发起时间', width: 100, align: 'center', sortable: true,
                    formatter: function (value, row, index) {
                        var str = formatDate(row.CreateDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'AuditingState', title: '审核状态', width: 80, align: 'center', sortable: true }
            ]];
            //加载列表
            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Budget&Command=BudgetPlan_ProjectSummaryContrastThisYearReport_TotalCostDataMining&' + $("#frmForm").serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: true,
                    pageSize: 50,
                    pageList: [50, 100, 300],
                    columns: column,
                    rownumbers: true,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    border: false,
                    width: "100%"
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
