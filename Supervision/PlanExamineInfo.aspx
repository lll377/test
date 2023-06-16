<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanExamineInfo.aspx.cs" Inherits="M_Main.Supervision.PlanExamineInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>模板审核进程</title>
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
        <div style="background-color: #cccccc;" id="TableContainerExamine"></div>
        <input type="hidden" id="Id" name="Id" />
        <script type="text/javascript">
            var h = $(window).height();
            var w = $(window).width();

            function InitTableHeight() {
                $("#TableContainerExamine").css("height", h + "px");
                $("#TableContainerExamine").css("width", w + "px");
            }

            var columnExamine = [[
                { field: 'Sort', title: '审核序号', width: 200, align: 'left', sortable: true },
                { field: 'RoleName', title: '审核岗位', width: 300, align: 'left', sortable: true },
                { field: 'IsPassName', title: '审核情况', width: 200, align: 'left', sortable: true },
                { field: 'UserName', title: '审核人', width: 300, align: 'left', sortable: true },
                { field: 'ExamineDate', title: '审核时间', width: 300, align: 'left', sortable: true }
            ]];

            function LoadListExamine() {
                $("#TableContainerExamine").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=Plan_GetExamineInfo&' + $('#frmForm').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    columns: columnExamine,
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
                $("#Id").val(GetQueryString('Id'));
                InitTableHeight();
                LoadListExamine();
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
