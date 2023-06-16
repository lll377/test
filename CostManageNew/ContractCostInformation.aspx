<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractCostInformation.aspx.cs" Inherits="M_Main.CostManageNew.ContractCostInformation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同费用信息</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/demo/demo.css" />
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/CostDictionaryCanNull.js"></script>
    <script type="text/javascript" src="../jscript/DateFormat.js"></script>
    <style type="text/css">
        .combobox-item {
            height: 25px;
        }
    </style>
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="frmFrom" runat="server">

        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <input type="hidden" id="ReturnValue" name="ReturnValue" />
        <input type="hidden" name="CId" id="CId" runat="server" />
        <input type="hidden" name="changBS" id="changBS" value="" runat="server" />
        <input type="hidden" name="LimitedOperation" id="LimitedOperation" value="" runat="server" />
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <div id="DlgMemo" class="easyui-dialog" title="备注" data-options="iconCls1:'icon-search',closed: true,modal:true" style="width: 800px; height: 280px; padding: 10px;">
            <table cellpadding="0" cellspacing="0" border="0" width="100%" style='color: Red'>
                <tr>
                    <td style="color: red;">应付金额管控方式：</td>
                </tr>
                <tr>
                    <td>1、当期控制：
                    </td>
                </tr>
                <tr>
                    <td>业务发生额≤本签订主体、管控科目本月最终预算值（已审核）-本月合同的应付金额（审批中+已审批）-本月无合同的计划申报金额（审批中+已审批）-本月无合同无计划、
                        计入成本的报账付款金额（审批中+已审批）-本月摊销金额（审批中+已审批）
                    </td>
                </tr>
                <tr style="height: 6px;"></tr>
                <tr>
                    <td>2、累计控制：
                    </td>
                </tr>
                <tr>
                    <td>业务发生额≤本签订主体、管控科目1月至本月最终预算值之和（已审核）-1月至本月合同应付金额（审批中+已审批）-1月至上月无合同、
                        计入成本的报账付款金额（审批中+已审批）-本月无合同的资金计划金额（审批中+已审批）-本月无合同无计划、计入成本的报账付款金额（审批中+已审批）
                        -1月至本月摊销金额（审批中+已审批）

                    </td>
                </tr>
                <tr style="height: 6px;"></tr>
                <tr>
                    <td>3、总量控制：
                    </td>
                </tr>
                <tr>
                    <td>业务发生额≤本签订主体、管控科目本年最终预算值之和（已审核）-本年合同应付金额（审批中+已审批）-1月至上月无合同、计入成本的的报账付款金额（审批中+已审批）
                        -本月无合同的资金计划金额（审批中+已审批）-本月无合同无计划、、计入成本的报账付款金额（审批中+已审批）-本年摊销金额（审批中+已审批）
                    </td>
                </tr>

            </table>
        </div>
        <script type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            var column = [[
                { field: 'ChId', title: 'ChId', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'Sort', title: '序号', width: 30, align: 'left', sortable: true },
                {
                    field: 'CastName', title: '签订主体', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a style=\"color:blue\" onclick=\"OpenCostDataAdd('" + row.ChId + "')\">" + row.CastName + "</a>";
                        return str;
                    }
                },
                { field: 'SubjectName', title: '成本科目', width: 80, align: 'left', sortable: true },
                { field: 'Rate', title: '税率（%）', width: 80, align: 'left', sortable: true },
                { field: 'PayMonth', title: '应付年月', width: 80, align: 'left', sortable: true },
                { field: 'PayMoney', title: '应付金额（元）', width: 50, align: 'left', sortable: true },
                { field: 'PayedMoney', title: '已付金额（元）', width: 50, align: 'left', sortable: true },
                { field: 'Remark', title: '备注', width: 80, align: 'left', sortable: true },
                //{ field: 'BudgetPayMoney', title: '预算剩余金额（元）', width: 50, align: 'left', sortable: true }
            ]];

            function OpenCostDataAdd(ChId) {
                HDialog.Open('700', '500', '../CostManageNew/ContractCostInformation_xx.aspx?OpType=edit&CId=' + $("#CId").val() + "&ChId=" + ChId,
                    '修改合同费用信息', true, function callback(_Data) {
                        LoadList();
                    });
            }

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        HDialog.Open('700', '500', '../CostManageNew/ContractCostInformation_xx.aspx?OpType=insert&CId=' + $("#CId").val(), '新增合同费用信息', true, function callback(_Data) {
                            LoadList();
                        });
                    }
                }, '-',
                {
                    text: '批量新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        //传入的是合同id
                        HDialog.Open('700', '500', '../CostManageNew/ContractCostInformation_xxBatch.aspx?CId=' + $("#CId").val(), '批量新增合同费用信息', true, function callback(_Data) {
                            if (_Data != "") {
                                LoadList();
                            }
                        });
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row != null) {
                            DelRecord(row.ChId);
                        }
                        else {
                            HDialog.Info("请选择一行数据进行删除!");
                        }
                    }
                }, '-', {
                    text: '备注',
                    iconCls: 'icon-help',
                    handler: function () {
                        $('#DlgMemo').parent().appendTo($("form:first"))
                        $('#DlgMemo').dialog('open');
                    }
                }];

            function DelRecord(ChId) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('CsCost', 'DelContractCharge', 'ChId=' + ChId,
                            function Init() {
                            },
                            function callback(_Data) {
                                LoadList();
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            function LoadList() {
                if ($("#changBS").val() == 1) {
                    toolbar = null;
                } if ($("#CId").val() != "" && $("#CId").val() != null && $("#CId").val() != undefined && $("#CId").val() != "null") {
                    $("#TableContainer").datagrid({
                        url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsCost&Command=GetContractChargeList&' + $('#frmFrom').serialize(),
                        method: "get",
                        loadMsg: '数据加载中,请稍候...',
                        nowrap: false,
                        pageSize: top.ListPageSize,
                        pageList: top.ListPageList,
                        rownumbers: true,
                        columns: column,
                        fitColumns: true,
                        singleSelect: true,
                        pagination: true,
                        width: "100%",
                        border: false,
                        toolbar: toolbar,
                        sortOrder: "asc"
                    });
                    $("#SearchDlg").dialog("close");
                } else {
                    $("#TableContainer").datagrid({
                        url: null,
                        method: "get",
                        loadMsg: '数据加载中,请稍候...',
                        nowrap: false,
                        pageSize: top.ListPageSize,
                        pageList: top.ListPageList,
                        rownumbers: true,
                        columns: column,
                        fitColumns: true,
                        singleSelect: true,
                        pagination: true,
                        width: "100%",
                        border: false,
                        toolbar: null,
                        sortOrder: "asc"
                    });
                    $("#SearchDlg").dialog("close");
                } if ($("#LimitedOperation").val() == "LimitedOperation") {
                    $("#TableContainer").datagrid({
                        url: null,
                        method: "get",
                        loadMsg: '数据加载中,请稍候...',
                        nowrap: false,
                        pageSize: top.ListPageSize,
                        pageList: top.ListPageList,
                        rownumbers: true,
                        columns: column,
                        fitColumns: true,
                        singleSelect: true,
                        pagination: true,
                        width: "100%",
                        border: false,
                        toolbar: null,
                        sortOrder: "asc"
                    });
                    $("#SearchDlg").dialog("close");
                }
            }
            LoadList();

        </script>
    </form>
</body>
</html>

