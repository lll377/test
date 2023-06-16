<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MerchantsAccountReportDetail.aspx.cs" Inherits="M_Main.DiversifiedManage.Report.MerchantsAccountReportDetail" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>客商台账明细</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/compatible.css" rel="stylesheet" />
    <%--<script src="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>
    <script src="/HM/M_Main/jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/help.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
</head>
<body>
    <input id="MerchantsID" name="MerchantsID" type="hidden" />
    <input id="MerchantsCategoryID" name="MerchantsCategoryID" type="hidden" />
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <div id="toolbar" class="datagrid-toolbar">
        <table cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-page_white_excel',plain:true,onClick:function(){Export();}">Excel导出</a></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 1000px; height: 510px;" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frm" class="form-horizontal" role="form">
            <fieldset class="frame-fieldset searchtool">
                <legend class="frame-legend">查询区域</legend>
            </fieldset>
        </form>
        <div style="height: 50px"></div>
        <div class="fixed-tool-search">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm').form('clear')">清空</a>
        </div>
    </div>
    <script language="javascript" type="text/javascript">

        $(function () {
            InitPage();
        });
        function InitPage() {
            $.setParam($.getUrlParam());
            InitControl();
            InitDataGrid();
        }
        function InitControl() {

        }

        var column = [[
            { field: '区域名称', title: '区域名称', rowspan: 2, align: 'center', width: 200 },
            { field: '项目名称', title: '项目名称', rowspan: 2, align: 'center', width: 200 },
            { field: '客商名称', title: '客商名称', rowspan: 2, align: 'center', width: 200 },
            { field: '客商类别', title: '客商类别', rowspan: 2, align: 'center', width: 150 },
            { field: '费用项目', title: '费用项目', rowspan: 2, align: 'center', width: 150 },
            { field: '费用信息', title: '费用信息', colspan: 5, align: 'center' },
            { field: '保证金信息', title: '保证金信息', colspan: 4, align: 'center' },
        ], [
            { field: '期初欠费金额', title: '期初欠费金额(元)', width: 150, align: 'center' },
            { field: '本期应收金额', title: '本期应收金额(元)', width: 150, align: 'center' },
            { field: '本期收到期初欠费_本期应收金额', title: '本期收到期初欠费<br>本期应收金额(元)', width: 150, align: 'center' },
            { field: '本期减免期初欠费_本期应收金额', title: '本期减免期初欠费<br>本期应收金额(元)', width: 150, align: 'center' },
            { field: '期末欠费金额', title: '期末欠费金额', width: 150, align: 'center' },
            { field: '期初未退金额', title: '期初未退金额(元)', width: 150, align: 'center' },
            { field: '本期收款金额', title: '本期收款金额(元)', width: 150, align: 'center' },
            { field: '本期退款金额', title: '本期退款金额(元)', width: 150, align: 'center' },
            { field: '期末未退金额', title: '期末未退金额(元)', width: 150, align: 'center' },

        ]];
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
                columns: column,
                rownumbers: true,
                checkbox: true,
                singleSelect: true,
                checkOnSelect: false,
                selectOnCheck: false,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: "#toolbar",
                sortOrder: "desc",
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onClickRow: function (index, row) {
                },
                onDblClickRow: function (index, row) {
                    Detailed($.param(row));
                },
                onBeforeLoad: function (param) {
                    param.SortField = "ID";
                    param.SortOrder = 1;
                    param.IsDelete = 0;
                    param = $.getDataGridParam("MerchantsAccount", "GetListDetail", param);
                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (data) {
                }
            });
            $('#dg').datagrid('clearSelections');
            $('#dg').datagrid('clearChecked');
            $("#dlg_search").dialog("close");
        }

        //function Detailed(urlParam) {
        //    LayerDialog.OpenWin('1000', '600', '/HM/M_Main/DiversifiedManage/MerchantsManage/Merchants/Tab.aspx?' + urlParam, "详情", true, function callback(data) {
        //        InitDataGrid();
        //    });
        //}


        function Export() {
            var param = $.getParam();
            param.PageSize = 5000;
            param.IsPagination = "否";
            param.IsZip = "否";
            param.TableName = "客商签约台账报表";
            param.TemplatePath = "/HM/M_Main/DiversifiedManage/Report/ExcelTemplate/MerchantsFeesDetail.xlsx";
            param.StartFillLines = "2";
            param.Class = "MerchantsAccount";
            param.Method = "GetListDetailSqlWhere";
            window.open("/HM/M_Main/HC/Export.aspx?" + $.param(param));
        }

    </script>
</body>
</html>
