<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmergencyUploadView.aspx.cs" Inherits="M_Main.Emergency.EmergencyUploadView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>应急预案查看附件</title>
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
    <script type="text/javascript" src="../jscript/help.js"></script>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="frmFrom" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <input type="hidden" name="KeyID" id="KeyID" runat="server" />
        <input type="hidden" name="Type_Name" id="Type_Name" runat="server" />
        <script type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            var column = [[
                {
                    field: 'FileCode', title: '附件编号', width: 100, align: 'left', sortable: false, formatter: function (value, row, index) {
                        var arr = value.split('.');
                        return arr[0];
                    }
                },
                {
                    field: 'FileName', title: '附件名称', width: 160, align: 'left', sortable: false, formatter: function (value, row, index) {
                        value = GetAHtml(row.FilePath, value);
                        return value;
                    }
                },
                { field: 'FileType', title: '附件类型', width: 40, align: 'center', sortable: false },
                { field: 'AddTime', title: '添加日期', width: 60, align: 'center', sortable: false }
            ]];

            function GetAHtml(url, fileName) {
                var html = "";
                if (url && url != "") {
                    var arr = url.split('/');
                    var name = arr[arr.length - 1];
                    arr = name.split('.');
                    var IdNew = arr[arr.length - 2];
                    html = "<a target=\"_blank\" id=\"11831617369\" href=\"" + url + "\" class=\"HrefStyle\" url=\"" + url + "\">" + fileName + "</a>";
                }
                return html;
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPost.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    rownumbers: true,
                    fitColumns: true,
                    checkbox: true,
                    singleSelect: true,
                    checkOnSelect: false,
                    selectOnCheck: false,
                    border: true,
                    pagination: true,
                    width: "100%",
                    sortOrder: "desc",
                    remoteSort: false,
                    onBeforeLoad: function (param) {
                        param = $.getDataGridParam("Emergency_File", "GetList", param);

                    },
                    onLoadSuccess: function (data) {
                    },
                    onLoadError: function (data) {

                    }
                });
            }
            LoadList();

        </script>
    </form>
</body>
</html>
