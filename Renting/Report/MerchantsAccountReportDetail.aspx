<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MerchantsAccountReportDetail.aspx.cs" Inherits="M_Main.Renting.Report.MerchantsAccountReportDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>客户台账报表-费用明细（数据挖掘）</title>
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
    <input type="hidden" id="TenantryCustID" name="TenantryCustID" runat="server" />
    <div id="TableContainer" style="width: 100%; height: 100%; background-color: #cccccc;"></div>
    <script language="javascript" type="text/javascript">
        //页面初始化
        $(function () {
            let param = $.getUrlParam();
            if (!!param.TenantryCustID) {
                $("#TenantryCustID").val(param.TenantryCustID);
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
                    param.TemplatePath = "/HM/M_Main/Renting/Report/ExcelTemplate/MerchantsAccountReportDetail.xlsx";
                    param.StartFillLines = "2";
                    param.TableName = "客户台账明细数据(数据挖掘)";
                    param.Class = 'Renting_MerchantsAccountReport';
                    param.Method = "GetDataMiningSqlWhere";
                    window.open("/HM/M_Main/HC/Export.aspx?" + $.param(param));
                }
            }
        ];

        var column = [[
            { field: 'OrganName', title: '区域名称', width: 120, align: 'center', rowspan: 2 },
            { field: 'CommName', title: '项目名称', width: 140, align: 'center', rowspan: 2 },
            { field: 'TenantryCustName', title: '客户名称', width: 200, align: 'center', rowspan: 2 },
            { field: 'CustTypeName', title: '客户类别', width: 100, align: 'center', rowspan: 2 },
            { field: 'CostName', title: '费用项目', width: 140, align: 'center', rowspan: 2 },
            { title: '费用信息', align: 'center', colspan: 5 },
            { title: '保证金信息', align: 'center', colspan: 4 }
        ],[
            { field: 'BeforeArrearsAmount', title: '期初欠费金额(元)', width: 100, align: 'center' },
            { field: 'CurrentDueAmount', title: '本期应收金额(元)', width: 100, align: 'center' },
            { field: 'CurrentReceivedBeforeArrearsAndAueAmount', title: '本期收到期初欠费<br/>本期应收金额(元)', width: 120, align: 'center' },
            { field: 'CurrentReductionBeforeArrearsAndAueAmount', title: '本期减免期初欠费<br/>本期应收金额(元)', width: 120, align: 'center' },
            { field: 'EndArrearsAmount', title: '期末欠费金额(元)', width: 120, align: 'center' },

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
                    param.SortField = "OrganCode,CommID,TenantryCustID,CostID";
                    param.SortOrder = 1;
                    param = $.getDataGridParam("Renting_MerchantsAccountReport", "GetDataMiningList", param);
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
