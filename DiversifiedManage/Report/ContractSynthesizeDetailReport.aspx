<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractSynthesizeDetailReport.aspx.cs" Inherits="M_Main.DiversifiedManage.Report.ContractSynthesizeDetailReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>多经综合费用明细表</title>
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
                    <td class="title"><span>项目名称</span></td>
                    <td class="text">
                        <input id="CommName" name="CommName" class="easyui-textbox" data-options="
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </td>
                    <td class="title"><span>服务类别</span></td>
                    <td class="text">
                        <input id="BusinessType" name="BusinessType" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',multiple:false,
                                    valueField:'id',textField:'text',
                                    data: [{id: '房屋租赁',text: '房屋租赁'},{id: '车位租赁',text: '车位租赁'},{id: '广告租赁',text: '广告租赁'},{id: '场地租赁',text: '场地租赁'},
                                    {id: '物业有偿服务',text: '物业有偿服务'},{id: '美居服务',text: '美居服务'},{id: '社区新零售',text: '社区新零售'}]"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>费用项目</span></td>
                    <td class="text">
                        <input id="CostName" name="CostName" class="easyui-textbox" data-options="
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </td>
                    <td class="title"><span></span></td>
                    <td class="text"></td>
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
            { field: 'OrganName', title: '区域名称', width: 120, align: 'center', rowspan: 2 },
            { field: 'CommName', title: '项目名称', width: 140, align: 'center', rowspan: 2 },
            { field: 'BusinessType', title: '服务类别', width: 120, align: 'center', rowspan: 2 },
            { field: 'CostName', title: '费用项目', width: 140, align: 'center', rowspan: 2 },
            { title: '费用信息', align: 'center', colspan: 6 },
            { title: '保证金信息', align: 'center', colspan: 4 },
        ], [
            { field: 'CurrentDueAmount', title: '本期应收金额(元)', width: 120, align: 'center' },
            { field: 'CurrentReceivedBeforeArrears', title: '本期收到期初欠费(元)', width: 150, align: 'center' },
            { field: 'CurrentReceivedCurrentAueAmount', title: '本期收到本期应收(元)', width: 150, align: 'center' },
            { field: 'CurrentReductionBeforeArrears', title: '本期减免期初欠费(元)', width: 150, align: 'center' },
            { field: 'CurrentReductionCurrentAueAmount', title: '本期减免本期应收(元)', width: 150, align: 'center' },
            { field: 'EndArrearsAmount', title: '期末欠费金额(元)', width: 120, align: 'center' },

            { field: 'BeforeNotRefoundAmount', title: '期初未退金额(元)', width: 120, align: 'center' },
            { field: 'CurrentReceivedAmount', title: '本期收款金额(元)', width: 120, align: 'center' },
            { field: 'CurrentRefoundAmount', title: '本期退款金额(元)', width: 120, align: 'center' },
            { field: 'EndNotRefoundAmount', title: '期末未退金额(元)', width: 120, align: 'center' }
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
                loadMsg: '明细数据统计查询中，请稍候...',
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
                    param.SortField = "OrganCode,CommID,Sort,CostID";
                    param.SortOrder = 1;
                    param = $.getDataGridParam("ContractSynthesize", "GetDataMiningList", param);
                },
                onLoadSuccess: function (data) {

                }
            });
            $('#dlg_search').dialog('close');
        }

    </script>
</body>
</html>
