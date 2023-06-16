<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentFollowUpFrame.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentFollowUpFrame" %>

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
            var toolbar = [
                {
                    text: '刷新',
                    iconCls: 'icon-reload',
                    handler: function () {
                        LoadList();
                    }
                }
            ];
            var column = [[
                { field: 'ForwardType', title: '跟进类型', width: 150, align: 'left', sortable: true },
                { field: 'OverdueReason', title: '逾期原因', width: 150, align: 'left', sortable: true },
                { field: 'ForwardDateTime', title: '跟进时间', width: 150, align: 'left', sortable: true },
                { field: 'ForwardUser', title: '跟进人', width: 150, align: 'left', sortable: true },
                { field: 'ForwardReasons', title: '跟进情况', width: 200, align: 'left', sortable: true }
            ]];


            function LoadList() {

                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=IncidentAcceptNew_Search&Command=SelectForwardList&IncidentID=' + $('#IncidentID').val(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    toolbar: toolbar,
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
