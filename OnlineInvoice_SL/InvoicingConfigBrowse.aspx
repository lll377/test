<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvoicingConfigBrowse.aspx.cs" Inherits="M_Main.OnlineInvoice_SL.InvoicingConfigBrowse" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>开票配置</title>
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
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/export.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />

</head>
<body>
    <form id="frmFrom" runat="server">
        <div id="TableContainer" style="width: 100%;"></div>
    </form>

    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            InitFunction();
            LoadData();
        });

        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    var rows = $("#TableContainer").datagrid("getRows");
                    if (rows == null || rows == '') {
                        HDialog.Open(480, 260, "../OnlineInvoice_SL/InvoicingConfigEdit.aspx", "编辑开票信息", false, function (_data) { LoadData(); });
                    }
                    else {
                        HDialog.Info('当前项目已配置开票信息，如需修改请点击修改按钮！');
                        return;
                    }
                }
            }, '-',
            {
                text: '修改',
                iconCls: 'icon-edit',
                handler: function () {
                    var rows = $("#TableContainer").datagrid("getRows");
                    if (rows == null || rows == '') {
                        HDialog.Info('当前项目未配置开票信息，请新增！');
                        return;
                    }
                    HDialog.Open(480, 260, "../OnlineInvoice_SL/InvoicingConfigEdit.aspx?InvoicingConfigId=" + rows[0].Id, "编辑开票信息", false, function (_data) { LoadData(); });
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-remove',
                handler: function () {
                    $.messager.confirm('提示', '是否删除当前项目的开票信息配置？', function (r) {
                        if (r) {
                            $.tool.DataPost('InvoicingConfig', 'Delete', "",
                                function Init() { },
                                function callback(_Data) {
                                    var obj = _Data.split('|');
                                    HDialog.Info(obj[1]);
                                    if (obj[0] == "true") {
                                        LoadData();
                                    }
                                },
                                function completeCallback() { },
                                function errorCallback() { }
                            );
                        }
                    });
                }
            }
        ];

        //网格初始化
        function InitFunction() {
            var h = $(window).height();
            var w = $(window).width();
            $("#TableContainer").css("height", h + "px");
            $("#TableContainer").css("width", w + "px");
        }

        var column = [
            [
                { field: 'Payee', title: '收款人', align: 'center', sortable: true, width: 150 },
                { field: 'Invoicer', title: '开票人', align: 'center', sortable: true, width: 150 },
                { field: 'Reviewer', title: '复核人', align: 'center', sortable: true, width: 150 },
                { field: 'CreateDate', title: '创建时间', align: 'center', sortable: true, width: 150 },
                { field: 'ModifyDate', title: '修改时间', align: 'center', sortable: true, width: 150 },
                { field: 'ModifyUserName', title: '修改人', align: 'center', sortable: true, width: 150 }
            ]
        ];

        //加载数据
        function LoadData() {
            //加载已经统计了的数据
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                fitColumns: true,
                nowrap: true,
                pageSize: [50],
                pageList: [50, 100, 200],
                columns: column,
                singleSelect: true,
                pagination: true,
                remoteSort: false,
                rownumbers: true,
                toolbar: toolbar,
                border: false,
                sortOrder: "asc",
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("InvoicingConfig", "GetInvoicingConfigs", "TableContainer", param);
                },
                onLoadSuccess: function (data) { }
            });
        }
    </script>
</body>
</html>

