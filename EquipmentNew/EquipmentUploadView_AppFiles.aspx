<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EquipmentUploadView_AppFiles.aspx.cs" Inherits="M_Main.EquipmentNew.EquipmentUploadView_AppFiles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>查看设备app上传的附件</title>
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
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="frmFrom" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <input type="hidden" name="EquipmentId" value="" id="EquipmentId" runat="server" />
        <input type="hidden" name="TaskId" value="" id="TaskId" runat="server" />
        <input type="hidden" name="CommID" value="" id="CommID" runat="server" />
        <script type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            var column = [[
                { field: 'FileName', title: '附件名称', width: 80, align: 'left', sortable: true },
                {
                    field: 'FilePath', title: '查看附件', width: 20, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a style=\"color:blue\" href=\"" + row.FilePath + "\" target=\"_blank\">查看附件</a>";
                        return str;
                    }
                },
                { field: 'PhotoTime', title: '添加时间', width: 40, align: 'left', sortable: true }
            ]];

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsEquipment&Command=GetEquipmentFileList_App&' + $('#frmFrom').serialize(),
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
            }
            LoadList();

        </script>
    </form>
</body>
</html>
