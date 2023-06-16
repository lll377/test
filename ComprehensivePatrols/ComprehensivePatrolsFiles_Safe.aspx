<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ComprehensivePatrolsFiles_Safe.aspx.cs" Inherits="M_Main.ComprehensivePatrols.ComprehensivePatrolsFiles_Safe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>点位附件信息</title>
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
        <input type="hidden" id="CommId" name="CommId" />
        <input type="hidden" id="TaskId" name="TaskId" runat="server" />
        <input type="hidden" id="TaskPointId" name="TaskPointId" runat="server" />
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            var column = [[
                { field: 'FileId', title: 'FileId', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'Type', title: '附件类型', width: 80, align: 'left', sortable: true },
                {
                    field: 'FileName', title: '附件名称', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                        return value;
                    }
                },
                { field: 'Fix', title: '文件格式', width: 120, align: 'left', sortable: true },
                //{ field: 'Remark', title: '附件说明', width: 80, align: 'left', sortable: true },
                {
                    field: 'FilePath', title: '查看', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a style=\"color:blue\" href=\"" + row.FilePath + "\" target=\"_blank\">查看附件</a>";
                        return str;
                    }
                }
            ]];

            var toolbar = [
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row != null) {
                            DelRecord(row.FileId);
                        }
                        else {
                            HDialog.Info("请选择一行数据进行删除!");
                        }
                    }
                }];

            function DelRecord(FileId) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('CpComPatrols', 'DelCpFile_Safe', 'FileId=' + FileId + '&CommId=' + $("#CommId").val(),
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
                $("#CommId").val(localStorage.getItem('CpCommId'));
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CpComPatrols&Command=GetCpPlanTaskFilesList_Safe&' + $('#frmFrom').serialize(),
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
            }
            LoadList();

        </script>
    </form>
</body>
</html>
