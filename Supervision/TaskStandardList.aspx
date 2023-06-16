<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskStandardList.aspx.cs" Inherits="M_Main.Supervision.TaskStandardList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>任务标准列表</title>
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
        <div style="width: 100%">
            <div style="float: left; width: 30%; border-right: 1px solid #cccccc;" class="menuDiv">
                <div style="background-color: #cccccc;" id="TreeGrid"></div>
            </div>
            <div style="float: left; width: 70%">
                <div style="background-color: #cccccc;" id="TableContainer"></div>
            </div>
        </div>
        <input type="hidden" id="TaskId" name="TaskId" />
        <input type="hidden" id="ItemId" name="ItemId" />
        <input type="hidden" id="CommId" name="CommId" />
        <input type="hidden" id="NeedEdit" name="NeedEdit" />
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                var w = $(window).width();
                $("#TreeGrid").css("height", h + "px");
                $("#TableContainer").css("height", h + "px");
            }

            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'ItemNameAll', title: '检查项目', width: 200, align: 'left', sortable: true },
                { field: 'StandardCode', title: '标准编号', width: 100, align: 'left', sortable: true },
                { field: 'Content', title: '标准内容', width: 300, align: 'left', sortable: true },
                { field: 'CheckScenario', title: '检查场景', width: 300, align: 'left', sortable: true },
                { field: 'CheckMethod', title: '检查方法', width: 300, align: 'left', sortable: true },
                { field: 'SamplingStandard', title: '抽样标准', width: 300, align: 'left', sortable: true },
                { field: 'MarkStandard', title: '评分标准', width: 300, align: 'left', sortable: true },
                { field: 'StandardScore', title: '标准分值', width: 80, align: 'left', sortable: true },
                { field: 'DeductionNatureName', title: '加扣性质', width: 80, align: 'left', sortable: true },
                { field: 'DeductionScore', title: '加扣分数', width: 100, align: 'left', sortable: true },
                {
                    field: 'jkfx', title: '加扣分项', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"DeductionList('" + row.TaskStandardId + "','" + row.StandardScore + "','" + row.IsAllowFloat + "','" + row.MaximumFloatingScore + "','" + row.DeductionNature + "')\">查看</a>";
                        return str;
                    }
                },
                { field: 'CheckUserName', title: '检查人', width: 100, align: 'left', sortable: true },
                { field: 'CheckDate', title: '检查时间', width: 100, align: 'left', sortable: true }
            ]];

            function DeductionList(TaskStandardId, StandardScore, IsAllowFloat, MaximumFloatingScore,DeductionNature) {
                HDialog.Open('1000', '700', '../Supervision/TaskDeductionList.aspx?NeedEdit=' + $("#NeedEdit").val() + '&TaskStandardId=' + TaskStandardId + '&StandardScore=' + StandardScore + '&IsAllowFloat=' + IsAllowFloat + '&MaximumFloatingScore=' + MaximumFloatingScore + '&CommId=' + $("#CommId").val() + '&TaskId=' + $("#TaskId").val() + '&DeductionNature=' + DeductionNature, '加扣分项列表', true, function callback(_Data) {
                    LoadList();
                });
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=TaskStandardList&' + $('#frmForm').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    rownumbers: true,
                    fitColumns: false,
                    singleSelect: false,
                    pagination: true,
                    remoteSort: false,
                    width: "100%",
                    toolbar: null,
                    sortOrder: "asc",
                    border: 0
                });
            }

            function LoadTree() {
                $("#TreeGrid").treegrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=TaskItemTree&' + $('#frmForm').serialize(),
                    treeField: 'text',
                    idField: 'id',
                    method: "get",
                    nowrap: false,
                    animate: false,
                    columns: [[{ title: '检查项目', field: 'text', width: 100 }]],
                    fitColumns: true,
                    singleSelect: true,
                    pagination: false,
                    rownumbers: true,
                    width: "100%",
                    toolbar: null,
                    border: false,
                    sortOrder: "asc",
                    onClickRow: function (rowData) {
                        $("#ItemId").val(rowData.id);
                        LoadList();
                    }
                });
            }

            $(function () {
                $("#TaskId").val(GetQueryString('TaskId'));
                $("#CommId").val(GetQueryString('CommId'));
                $("#NeedEdit").val(GetQueryString('NeedEdit'));
                InitTableHeight();
                LoadTree();
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
