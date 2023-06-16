<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractAccountDetailReport.aspx.cs" Inherits="M_Main.DiversifiedManage.Report.ContractAccountDetailReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同台账费用明细表</title>
    <link href="../../css/base.css" rel="stylesheet" />
    <link href="../../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="../../css/basebootstrap.css" rel="stylesheet" />
    <script src="../../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../../jscript/help.js"></script>
    <script src="../../jscript/Dialog.js" type="text/javascript"></script>
    <style type="text/css">
        .toolbartable {
            margin: 0px 10px;
            padding: 0;
        }

            .toolbartable tr {
            }

                .toolbartable tr td {
                    padding: 5px 3px;
                }
    </style>
</head>
<body>
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="padding: 5px; width: 600px" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="frmFrom">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>签约项目名称</span></td>
                    <td class="text">
                        <input id="CommName" name="CommName" class="easyui-textbox" data-options="
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </td>
                    <td class="title"><span>费用项目名称</span></td>
                    <td class="text">
                        <input id="BillCommName" name="BillCommName" class="easyui-textbox" data-options="
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>合同名称</span></td>
                    <td class="text">
                        <input id="ContractName" typ="text" name="ContractName" runat="server" class="easyui-textbox" data-options="
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </td>
                    <td class="title"><span>合同编号</span></td>
                    <td class="text">
                        <input id="ContractSign" typ="text" name="ContractSign" runat="server" class="easyui-textbox" data-options="
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>付款单位</span></td>
                    <td class="text">
                        <input id="BuyerCustName" name="BuyerCustName" class="easyui-textbox" data-options="
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </td>
                    <td class="title"><span>费用项目</span></td>
                    <td class="text">
                        <input id="CostName" name="CostName" class="easyui-textbox" data-options="
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>费用开始时间</span></td>
                    <td class="text">
                        <input type="text" id="FeesStartDateStart" name="FeesStartDateStart" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="FeesStartDateEnd" name="FeesStartDateEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>费用结束时间</span></td>
                    <td class="text">
                        <input type="text" id="FeesEndDateStart" name="FeesEndDateStart" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="FeesEndDateEnd" name="FeesEndDateEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                </tr>
                <tr>
                    <td class="btn" colspan="4">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmFrom').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <input type="hidden" id="DetailID" name="DetailID" runat="server" />
    <script language="javascript" type="text/javascript">
        $(function () {
            var DetailID = $.getUrlParam("DetailID");
            if (DetailID != null) {
                $("#DetailID").val(DetailID);
            }
            InitDataGrid();
        });

        var column = [[
            { field: 'OrganName', title: '区域名称', width: 120, align: 'center' },
            { field: 'CommName', title: '项目名称(签约主体)', width: 140, align: 'center' },
            { field: 'BillCommName', title: '项目名称(费用主体)', width: 140, align: 'center' },
            { field: 'ContractName', title: '合同名称', width: 160, align: 'left' },
            { field: 'ContractSign', title: '合同编号', width: 160, align: 'left' },
            { field: 'BuyerCustName', title: '付款单位', width: 180, align: 'left' },
            { field: 'CostName', title: '费用项目', width: 140, align: 'center' },
            { field: 'FeeDueYearMonth', title: '费用日期', width: 100, align: 'center' },
            {
                field: 'FeesDueDate', title: '应收日期', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'FeesStartDate', title: '开始日期', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'FeesEndDate', title: '结束日期', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'DueAmount', title: '应收金额(元)', width: 120, align: 'center' },
            { field: 'DueAcceptedAmount', title: '应收已收金额(元)', width: 120, align: 'center' },
            { field: 'DueReductionAmount', title: '应收减免金额(元)', width: 120, align: 'center' },
            { field: 'DueUncollectedAmount', title: '应收未收金额(元)', width: 120, align: 'center' },
            { field: 'BillSign', title: '票据号码', width: 120, align: 'center' },
            { field: 'RefundAmount', title: '退款金额(元)', width: 100, align: 'center' }
        ]];


        var toolbar = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search').dialog('open');
                }
            }, '-',
            {
                text: '关闭返回',
                iconCls: 'icon-cancel',
                handler: function () {
                    HDialog.Close("");
                }
            }]
        function InitDataGrid() {
            $("#dg").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                fit: true,
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                rownumbers: true,
                fitColumns: false,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: toolbar,
                onBeforeLoad: function (param) {
                    param.SortField = "OrganCode,CommID,BillCommID,BuyerCustID,CostID";
                    param.SortOrder = 1;
                    param = $.getDataGridParam("ContractAccount", "GetDataMiningList", param);
                },
                onLoadSuccess: function (data) {

                }
            });
            $('#dlg_search').dialog('close');
        }

    </script>
</body>
</html>
