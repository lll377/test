<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentReplyBackFrame.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentReplyBackFrame" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/demo/demo.css">
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
</head>
<body style="padding: 0px; margin: 0px;">
    <form id="frmForm" runat="server">
        <input id="IncidentID" size="1" type="hidden" name="IncidentID" runat="server">
        <div id="TableContainer">
        </div>
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();
            var column = [[
                {
                    field: 'LastCloseTime', title: '上次关闭时间', width: 150, align: 'left', sortable: true, formatter: function (value) {
                        var date = new Date(value);
                        var year = date.getFullYear().toString();
                        var month = (date.getMonth() + 1);
                        var day = date.getDate().toString();
                        var hour = date.getHours().toString();
                        var minutes = date.getMinutes().toString();
                        var seconds = date.getSeconds().toString();
                        if (month < 10) {
                            month = "0" + month;
                        }
                        if (day < 10) {
                            day = "0" + day;
                        }
                        if (hour < 10) {
                            hour = "0" + hour;
                        }
                        if (minutes < 10) {
                            minutes = "0" + minutes;
                        }
                        if (seconds < 10) {
                            seconds = "0" + seconds;
                        }
                        return year + "-" + month + "-" + day + " " + hour + ":" + minutes + ":" + seconds;
                    }
                },
                { field: 'LastCloseUser', title: '上次关闭人', width: 150, align: 'left', sortable: true },
                { field: 'LastCloseSituation', title: '上次关闭情况', width: 150, align: 'left', sortable: true },
                { field: 'ReplyGoBackReasons', title: '退回原因', width: 150, align: 'left', sortable: true },
                {
                    field: 'ReplyGoBackTime', title: '退回时间', width: 150, align: 'left', sortable: true, formatter: function (value) {
                        var date = new Date(value);
                        var year = date.getFullYear().toString();
                        var month = (date.getMonth() + 1);
                        var day = date.getDate().toString();
                        var hour = date.getHours().toString();
                        var minutes = date.getMinutes().toString();
                        var seconds = date.getSeconds().toString();
                        if (month < 10) {
                            month = "0" + month;
                        }
                        if (day < 10) {
                            day = "0" + day;
                        }
                        if (hour < 10) {
                            hour = "0" + hour;
                        }
                        if (minutes < 10) {
                            minutes = "0" + minutes;
                        }
                        if (seconds < 10) {
                            seconds = "0" + seconds;
                        }
                        return year + "-" + month + "-" + day + " " + hour + ":" + minutes + ":" + seconds;
                    }
                },
                { field: 'ReplyGoBackUser', title: '退回人', width: 200, align: 'left', sortable: true }
            ]];

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=IncidentAcceptNew_Search&Command=SelectReplyBackList&IncidentID=' + $('#IncidentID').val(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    border: false,
                    remoteSort: false,
                    width: "100%",
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                    }
                });
            }
            LoadList();
        </script>
    </form>
</body>
</html>
