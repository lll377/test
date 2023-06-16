<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RentingSynthesizeReportDetail.aspx.cs" Inherits="M_Main.Renting.Report.RentingSynthesizeReportDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁综合报表-费用明细（数据挖掘）</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/SystemBase/compatible.css" rel="stylesheet" />
    <script type="text/javascript" src="/HM/M_Main/jscript/self-vilidate.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/Guid.js"></script>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <input type="hidden" id="OrganCode" name="OrganCode" runat="server" />
    <input type="hidden" id="CommID" name="CommID" runat="server" />
    <div id="TableContainer" style="width: 100%; height: 100%; background-color: #cccccc;"></div>
    <script language="javascript" type="text/javascript">
        //页面初始化
        $(function () {

            let param = $.getUrlParam();
            if (!!param.OrganCode) {
                $("#OrganCode").val(param.OrganCode);
            }
            if (!!param.CommID) {
                $("#CommID").val(param.CommID);
            }
            InitDataGrid();
        });

        //加载 列表
        var toolbar = [
            {
                text: 'Excel导出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    //判断当前页面是否存在数据
                    let Rows = $("#TableContainer").datagrid("getRows");
                    if (Rows.length == 0) {
                        $.messager.alert('温馨提示', "没有可导出的数据，请确认！");
                        return;
                    }
                    var dataFields = $('#TableContainer').datagrid('getColumnFields');
                    var dataColumnFields = [];

                    dataFields.forEach((item, index) => {
                        dataColumnFields += "," + item + " '" + $('#TableContainer').datagrid("getColumnOption", item).title.replace("<br/>", "") + "'";
                    });
                    if (dataColumnFields.startsWith(',')) {
                        dataColumnFields = dataColumnFields.slice(1);
                    }
                    var param = $.getParam();
                    param.DataColumnFields = dataColumnFields;
                    param.PageSize = 5000;
                    param.IsPagination = "否";
                    param.IsZip = "否";
                    param.TemplatePath = "/HM/M_Main/Renting/Report/ExcelTemplate/RentingSynthesizeReportDetail.xlsx";
                    param.StartFillLines = "2";
                    param.TableName = "租赁综合报表明细数据(数据挖掘)";
                    param.Class = 'Renting_RentingSynthesizeReport';
                    param.Method = "GetDataMiningSqlWhere";
                    window.open("/HM/M_Main/HC/Export.aspx?" + $.param(param));
                }
            }
        ];

        var column = [[
            { field: 'OrganName', title: '区域名称', width: 120, align: 'center', rowspan: 2 },
            { field: 'CommName', title: '项目名称', width: 140, align: 'center', rowspan: 2 },
            { field: 'CostName', title: '费用项目', width: 140, align: 'center', rowspan: 2 },
            { title: '费用信息', align: 'center', colspan: 6 },
            { title: '保证金信息', align: 'center', colspan: 4 }
        ], [
            { field: 'CurrentDueAmount', title: '本期应收金额(元)', width: 110, align: 'center' },
            { field: 'CurrentReceivedBeforeArrears', title: '本期收到期初欠费(元)', width: 130, align: 'center' },
            { field: 'CurrentReceivedCurrentAueAmount', title: '本期收到本期应收(元)', width: 130, align: 'center' },
            { field: 'CurrentReductionBeforeArrears', title: '本期减免期初欠费(元)', width: 130, align: 'center' },
            { field: 'CurrentReductionCurrentAueAmount', title: '本期减免本期应收(元)', width: 130, align: 'center' },
            { field: 'EndArrearsAmount', title: '期末欠费金额(元)', width: 130, align: 'center' },

            { field: 'BeforeNotRefoundAmount', title: '期初未退金额(元)', width: 120, align: 'center' },
            { field: 'CurrentReceivedAmount', title: '本期收款金额(元)', width: 120, align: 'center' },
            { field: 'CurrentRefoundAmount', title: '本期退款金额(元)', width: 120, align: 'center' },
            { field: 'EndNotRefoundAmount', title: '期末未退金额(元)', width: 120, align: 'center' }
        ]];

        function InitDataGrid() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fit: true,
                columns: column,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: toolbar,
                remoteSort: false,
                onBeforeLoad: function (param) {
                    param.SortField = "OrganCode,CommID,CostID";
                    param.SortOrder = 0;
                    param = $.getDataGridParam("Renting_RentingSynthesizeReport", "GetDataMiningList", param);
                },
                onLoadSuccess: function (data) {
                    $(this).datagrid("autoMergeCells", ['OrganName', 'CommName']);
                },
                onLoadError: function (data) {

                }
            });
        }
    </script>
</body>
</html>
