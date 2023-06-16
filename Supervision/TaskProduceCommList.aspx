<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskProduceCommList.aspx.cs" Inherits="M_Main.Supervision.TaskProduceCommList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>任务批次项目列表</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.extend.js"></script>
    <link href="../css/basebootstrap.css" rel="stylesheet" />
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <style type="text/css">
        td {
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div style="background-color: #cccccc;" id="TableContainer"></div>
        <input type="hidden" id="TaskProduceId" name="TaskProduceId" />
        <input type="hidden" id="CanDel" name="CanDel" />
        <script type="text/javascript">
            var h = $(window).height();
            var w = $(window).width();

            function InitTableHeight() {
                $("#TableContainer").css("width", w + "px");
                $("#TableContainer").css("height", h + "px");
            }

            var column = [[
                { field: 'CommName', title: '项目', width: 300, align: 'left', sortable: true },
                {
                    field: 'TaskNum', title: '任务数量', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"TaskList('" + row.TaskProduceId + "','" + row.TPCId + "','" + row.CommId + "')\">" + row.TaskNum + "</a>";
                        return str;
                    }
                }
            ]];

            function TaskList(TaskProduceId, TPCId, CommId) {
                HDialog.Open(w, h, '../Supervision/TaskProduceTaskList.aspx?TaskProduceId=' + TaskProduceId + '&TPCId=' + TPCId + '&CommId=' + CommId + '&CanDel=' + $("#CanDel").val(), '任务列表', true, function callback(_Data) {
                    LoadList();
                });
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=TaskProduce_CommList&' + $('#frmForm').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    columns: column,
                    rownumbers: true,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: false,
                    remoteSort: false,
                    width: "100%",
                    toolbar: null,
                    sortOrder: "asc",
                    border: 0
                });
            }

            $(function () {
                $("#TaskProduceId").val(GetQueryString('TaskProduceId'));
                $("#CanDel").val(GetQueryString('CanDel'));
                InitTableHeight();
                LoadList();
            });

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>
